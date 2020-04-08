package com.lagom.controller;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.lagom.service.board.BoardService;
import com.lagom.util.UploadFileUtils;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class AjaxUploadController {
	
	@Autowired
	BoardService bService;
	
	//업로드 디렉토리 servlet-context.xml에 설정되어 있음
	@Resource(name = "uploadPath") //의존성주입 비슷... resource는 이름으로 가져온다. 
	String uploadPath;
	
	//파일첨부 페이지로 이동
	@GetMapping("/upload/uploadAjax")
	public String uploadAjax() {
		return "/upload/uploadAjax";
	}
	
	//upload file 멀티파트파일에 Save
	@ResponseBody
	@PostMapping(value="/upload/uploadAjax", produces="text/plain;charset=utf-8")
	public ResponseEntity<String> uploadAjax(MultipartFile file) throws Exception{ // 첨부파일 하나 들어옴 // 예외처리해주는거. 나를 호출한 거에 던지기함
		//ResponseEntity = success에 respose를 해줘야함. 그때 좀더 다듬어서 보내는거..
		//<> <--제네릭, 들어오는 값들을 체크함. (여기서는 string타입만 들어올 수 있다는 뜻), 타입을 강하게 check해줌
		
		//업로드한 파일 정보와 http 상태 코드를 함께 리턴 // 객체생성하면 바로 보내버리기, file은 첨부파일 하나
		return new ResponseEntity<String>(UploadFileUtils.uploadFile(uploadPath, file.getOriginalFilename(), file.getBytes()), HttpStatus.OK);
						//ajax끝나고 다시 view단으로 갈때 같이 보냄       경로     순수하게 파일 이름만       첨부파일의 크기     성공:200
		//c:/developer/upload/2020/04/08/s_1kdjfoiwjlgoi_ddsun.png",200 이 들어옴
	}
}
