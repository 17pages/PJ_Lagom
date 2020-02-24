package com.lagom.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.lagom.domain.MemberDTO;
import com.lagom.service.member.MemberService;

import lombok.extern.slf4j.Slf4j;
/*
 *SessionAttribute로 설정된 변수(객체)는 
 *response를 하기전에 서버의 기억장소 어딘가에 임시로 보관을 해둔다
 *web browser와 server간에 한번이라도 연결이 이루어졌으면
 *SessionAttribute에 등록된 변수는 서버가 중단될때까지 그 값이 그대로 유지된다.
 *web은 클라이언트의 req를 서버가 받아서
 *res를 수행하고 나면 모든 정보가 사라지는 특성이 있다. 
 *이런 특성과는 달리 Spring기반의 web은 일부데이터들을
 *메모리에 보관했다가 재사용하는 기법이 있다. 
 *그중 SessionAttributes라는 기능이 있다.
 *
 * SessionAttributes()에 설정하는 문자열(이름)은 
 * 클래스이 표준 객체생성 패턴에 의해 만들어진 이름
 * MemoDTO memoDTO
 * 
 * 이름을 표준 패턴이 아닌 임의의 이름으로 바꾸고 싶다. 
 * 
 * */
@Slf4j
@SessionAttributes({"memberDTO"})
@RequestMapping("/member")
@Controller
public class MemberController {
	@Autowired
	MemberService mService;
	
	/*SessionAttributes를 사용하기 위해서는
	 * 반드시 해당 변수를 생성하는 method가 controller에 있어야 하고 
	 * 해당 메서드에는 @ModelAttribute(변수명)가 있어야 한다.
	 * 
	 *  
	 * 초기화하는 작업, 반드시 해줘야 함
	 * */
@ModelAttribute("memberDTO")

public MemberDTO newMember() {
	return new MemberDTO();
}
	
	
	@GetMapping("/constract")
	public String viewConstract() {
		log.info(">> MEMBER/CONSTRACT PAGE 출력");
		return "member/constract";
		//폴더 경로 때문에 member/constract임..
	}
	/*
	 * constract에서 보낸 정보 이리로 옴
	 * 
	 * SessionAttributes에서 설정한 변수(객체)에는
	 * @ModelAttribute를 설정해 두어야 한다. 
	 * 단, 5.x이하에서는 필수 5.x이상에서는 선택
	 * 
	 * 만약 Attributes의 이름을 표준패턴이 아닌 임의의 이름으로 사용할 경우
	 * @ModelAttribute("객체이름")을 필수로 지정해주어야 한다.
	 * 
	 * constract 페이지를 통해 왔을때는 1이 들어오고 아닐때는 0?
	 * */
	@GetMapping("/join")
	public String join(@ModelAttribute("memberDTO") MemberDTO mDto, @RequestParam(value="flag", defaultValue="0") String flag, Model model) {
		log.info(">>> MEMBER/JOIN PAGE GET 출력");
		log.info(mDto.toString());
		model.addAttribute("flag", flag);
	
		return "member/join";
	}
	/*
	 * join POST가 mDto를 수신할때
	 * 입력 form에서 사용자가 입력한 값들이 있으면
	 * 그 값들을 mDto의 필드 변수에 setting을 하고
	 * 
	 * 만약에 없으면
	 * 메모리 어딘가에 보관중인 SessionAttributes로 설정된 mDto변수에서
	 * 값을 가져와서 비어있는 필드변수를 채워서 매개변수에 주입한다.
	 * 
	 * 따라서 form에서 보이지 않아도 되는 값들은
	 * 별도의 코딩을 하지 않아도 
	 * 자동으로 join POST로 전송되는 효과를 낸다.
	 * 단, 이 기능을 효율적으로 사용하려면
	 * jsp코드에서 Spring-form tag로 input을 코딩해야 한다.*/
	
	
	/*처음 mDto에는 8개 값밖에 없는데 @NodelAttributs가 memberDTO를 돌면서 값있으면 mDto에 더 담음*/
	@PostMapping("/join")
	public String join(@ModelAttribute("memberDTO") MemberDTO mDto, SessionStatus sessionStatus) {
		log.info(">>>>> MEMBER/JOIN POST DB에 회원정보 저장");
		log.info(mDto.toString());
		
		//2.DB에 회원등록
		int result = mService.memInsert(mDto);
		
		//3. 회원 등록 결과
		if(result > 0 ){
			log.info(">>>>> " + mDto.getId() + "님 회원가입되셨습니다.");
			
		}
		
		//SessionAttributes를 사용할때 insert, update가 완료되고
		//view로 보내기전 반드시 setComplet()을 실행하여
		//session에 담긴 값을 clear해주어야 한다.
		//반납하는 작업! 반드시!!!!!
		sessionStatus.setComplete();
		return "";
		
		
	}
	
	//회원가입 ID 중복체크
	@ResponseBody
	@PostMapping("/idoverlap")
	public String idOverlap(String id) {
		log.info(">>> ID OVERLAP CHECK");
		log.info("아이디: " + id);
		
		int cnt= mService.idOverlap(id);
		
		String flag = "1";
		if(cnt==0) {
			flag = "0";
		}
		return flag;
	}

}