package com.lagom.util;

import java.util.HashMap;
import java.util.Map;

import org.springframework.http.MediaType;

public class MediaUtils {
	private static Map<String, MediaType> mediaMap; //변수만 만들어짐
	//클래스를 로딩할때 제일 먼저 실행되는 코드
	static {
		mediaMap = new HashMap<>(); //객체생성함
		mediaMap.put("JPG", MediaType.IMAGE_JPEG); // put데이터 집어넣겠음. 
		mediaMap.put("GIF", MediaType.IMAGE_GIF); 
		mediaMap.put("PNG", MediaType.IMAGE_PNG);//png타입의 그림입니다. 알려줌
	}
	public static MediaType getMediaType(String type) {
		//toUpperCase() 대문자로 변경
		return mediaMap.get(type.toUpperCase());
		//mediaMap에 있는 값을 가져와라
	}
}
