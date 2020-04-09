package com.lagom.controller;

import java.io.FileInputStream;
import java.io.InputStream;

import javax.annotation.Resource;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.lagom.service.board.BoardService;
import com.lagom.util.MediaUtils;
import com.lagom.util.UploadFileUtils;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class AjaxUploadController {
	
	@Autowired // 타입으로 읽음
	BoardService bService; //BoardService는 인터페이스, 인터페이스는 객체가 아님 beans생성안됨. 
	//boardserviceimpl은 클래스... 
	
	//업로드 디렉토리 servlet-context.xml에 설정되어 있음
	@Resource(name = "uploadPath") //의존성주입함. 이름으로 함. 보편적으로 많이 쓰는애들은 이름으로 꺼내다 써야함.   
	String uploadPath;
		
	//upload file 멀티파트파일에 Save
	@ResponseBody
	@RequestMapping(value="/upload/uploadAjax", produces="text/plain;charset=utf-8") // requestmapping은  method생략하면 get, post둘다 받음
		public ResponseEntity<String> uploadAjax(MultipartFile file) throws Exception{ // 첨부파일 하나 들어옴 // 예외처리해주는거. 나를 호출한 거에 던지기함
		//ResponseEntity = success에 respose를 해줘야함. 그때 좀더 다듬어서 보내는거..
		//<> <--제네릭, 들어오는 값들을 체크함. (여기서는 string타입만 들어올 수 있다는 뜻), 타입을 강하게 check해줌
		log.info("POST  : uploadAjax");
		//업로드한 파일 정보와 http 상태 코드를 함께 리턴 // 객체생성하면 바로 보내버리기, file은 첨부파일 하나
		return new ResponseEntity<String>(UploadFileUtils.uploadFile(uploadPath, file.getOriginalFilename(), file.getBytes()), HttpStatus.OK);
						//ajax끝나고 다시 view단으로 갈때 같이 보냄       경로     순수하게 파일 이름만       첨부파일의 크기     성공:200
		//c:/developer/upload/2020/04/08/s_1kdjfoiwjlgoi_ddsun.png",200 이 들어옴
		//썸네일 경로..
		//확장자가 붙어있으면 파일. 
	}
	
	//이미지 표시 기능
	@ResponseBody // view가 아닌 data리턴
	@RequestMapping("/upload/displayFile")
	public ResponseEntity<byte[]> displayFile(String fileName) throws Exception{
	 // 서버의 파일을 다운로드 하기 위한 스트림
		InputStream in = null;	 // java.io
		ResponseEntity<byte[]> entity = null;
		try {
			// 확장자 검사
			String formatName = fileName.substring(fileName.lastIndexOf(".")+1);
			MediaType mType = MediaUtils.getMediaType(formatName);
			//해더 구성 객체
			HttpHeaders headers = new HttpHeaders();
			//Inputstream 생성
			in = new FileInputStream(uploadPath + fileName);
			//if (mType != null){//이미지 파일이면
			// headers.setContentType(mType);
			//}else{// 이미지가 아니면
			fileName = fileName.substring(fileName.indexOf("_")+1);
			//다운로드용 컨텐트 타입
			headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
			//큰 다옴표 내부에 "\"
			//바이트배열을 스트링으로
			//iso-8859-1 서유럽언어
			//new String(fileName.getBytes("utf-8"), "iso-8859-1")
			headers.add("Content-Disposition", "attachment; filename=\"" +new String(fileName.getBytes("utf-8"), "iso-8859-1")+"\"");
			
			//headers.add("Content-Disposition"
			//,"attachment; filename='"+fileName+"'");
			//}
			//바이트 배열, 헤더
			entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), headers, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
		} finally {
			if (in != null)
				in.close();// 스트림 닫기
		}
		return entity;
	}
}
