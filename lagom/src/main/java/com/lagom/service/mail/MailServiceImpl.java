package com.lagom.service.mail;

import java.util.Random;


import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;
import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.lagom.persistence.MemberDAO;

@Service
public class MailServiceImpl implements MailService{
	@Autowired
	JavaMailSender mailSender;
	
	@Autowired
	private SqlSession sqlSession;
	
	private MemberDAO mDao;
	@Autowired
	public void newMemberDAO() {
		mDao = sqlSession.getMapper(MemberDAO.class);
	}
	
	//이메일 난수 생성 메서드
	private String init() {
		Random ran = new Random(); //난수를 만들 수 있는 객체
		StringBuffer sb = new StringBuffer(); //왜 stringbuffer 쓰냐 => 문자열처리 효율성때문에 
		int num = 0;
		
		do {//난수만드는 거
			num = ran.nextInt(75) + 48;
			if((num>=48 && num <=57)|| (num >=65 && num <=90)|| (num>=97 && num <=122)) {
				sb.append((char)num); //char는 아스키값으로 인식함. append=>기존값 밑에 추가
				
			}else {
				continue;
			}
		}while(sb.length() < size);
		if(lowerCheck){
					return sb.toString().toLowerCase();
				}
				return sb.toString();
	}
	//난수를 이용한 키 생성
	private boolean lowerCheck;
	private int size;
	
	public String getKey(boolean lowerCheck, int size) {
		this.lowerCheck = lowerCheck; //내 안에 있는 전역변수
		this.size = size; //20들어감
		return init();
	}
	
	//회원가입 발송 이메일(인증키 발송)
	@Override
	public void mailSendUser(String email, String id, HttpServletRequest request) {
		String key = getKey(false, 20); // 길이 20의 난수 생성
		mDao.getKey(id, key);
		//메일구조 만듬(내용은 X) 
		// mime type => 사진, 음성, 동영상 등을 자동으로 변환시켜주는 거
		MimeMessage mail = mailSender.createMimeMessage();
		//문자열 변수 만들고 거기에 집어 넣음(model1방식과 흡사)
		String htmlTxt = "<h2>안녕하세요. LAGOM입니다:)</h2><br><br>"
						+"<h3>" + id + "님</h3>" + "<p>인증하기 버튼을 누르시면 LAGOM사이트 활동이 가능합니다. </p>"
						+"<a href = 'http://localhost:8081" + request.getContextPath() + "/member/keyauth?id=" + id + "&key=" + key +"'>인증하기</a></p>"
						+"(LAGOM에 가입한 적이 없다면 무시하셔도 됩니다.)";
						
						try {
							mail.setSubject("[본인인증] LAGOM님의 인증메일입니다,"); //메일의 제목
							mail.setText(htmlTxt, "utf-8", "html"); // 메일 내용(본문)
							mail.addRecipient(RecipientType.TO, new InternetAddress(email));//메일 수신자 email=>사용자가 입력한 이메일
							mailSender.send(mail);//메일발송
							
						} catch (MessagingException e) {
							e.printStackTrace();
						}
						}

	@Override
	public int keyAuth(String id, String key) {
		return mDao.alterKey(id, key);
	}
	

}
