package com.lagom.util;

import java.awt.image.BufferedImage;
import java.io.File;
import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.UUID;

import javax.imageio.ImageIO;

import org.imgscalr.Scalr;
import org.springframework.util.FileCopyUtils;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class UploadFileUtils {
	public static String uploadFile(String uploadPath, String originalName, byte[] fileData) throws Exception{
		//uuid 발급
		UUID uid = UUID.randomUUID(); // 중복된 이름을 방지하기 위해서 
		String savedName = uid.toString() + "_" + originalName;
		//업로드할 디렉토리 생성
		String savedPath = calcPath(uploadPath); //업로드 디렉토리안에 오늘 날짜의 파일을 만듦. 당일 첨부파일은 해당월일파일에 넣음 
		File target = new File(uploadPath + savedPath, savedName); // 파일 껍데기 만드는것 
		//디렉토리는 d드라이브/developer/... 까지 밖에 없음. 아무튼 savedpath랑 target은 합쳐야 완벽한 경로가 됨. 
		//임시 디렉토리에 업로드된 파일을 지정된 디렉토리로 복사
		FileCopyUtils.copy(fileData, target);//( 올려야할 첨부파일, '어디에 어떤이름으로' 세팅값) 
		//파일의 확장자 검사 // 일단 저장후, 이미지인지 확인하기 
		//a.jpg / aaa.bbb.ccc.jpg ==> 이름안에 .이 있을수도 있음. 
		String formatName = originalName.substring(originalName.lastIndexOf(".") + 1); //끝에서부터 .을 찾음. , formatname에는 확장자가 들어옴
		String uploadedFileName = null;
		//이미지 파일은 썸네일 사용
		if(MediaUtils.getMediaType(formatName) != null) { //확장자판단 // null이 아니면 이미지, 
			//썸네일 생성
			uploadedFileName = makeThumbnail(uploadPath, savedPath, savedName);
		}else {
			uploadedFileName = makeIcon(uploadPath, savedPath, savedName);
		}
		return uploadedFileName;
		//풀네임을 리턴... ajaxuploadcontroller로... 
	
		
	}
	
	private static String calcPath(String uploadPath) {
		Calendar cal = Calendar.getInstance(); // 달력값가져오기
		String yearPath = File.separator + cal.get(Calendar.YEAR); // separator구분자 "/", /2020
		String monthPath = yearPath + File.separator + new DecimalFormat("00").format(cal.get(Calendar.MONTH)+1); // /2020/04
		String datePath = monthPath + File.separator + new DecimalFormat("00").format(cal.get(Calendar.DATE));// 2020/04/08
		makeDir(uploadPath, yearPath, monthPath, datePath); // 매서드
		log.info(datePath);
		return datePath; // /2020/04/08
	}
	private static void  makeDir(String uploadPath, String... paths) { // ... 동일한 타입의 매개변수를 여러개 받을때 ... 씀 (동일한것만!!) 배열로 만들어서 넣어줌, 동적으로 매개변수갯수가 바뀌어야 할때 
		                                           // ... paths에는 지금 yearpath, monthpath, datepath 이런거 들어감 
		//디렉토리가 존재하면 skip
		if(new File(paths[paths.length - 1]).exists()) {//[] 인덱스 설정하겠음. 0,1,2 // 마지막값을 꺼내와라. (존재여부확인)// 그 폴더가 있으면 return
			return;
		}
		for(String path : paths) { // 없으면 만듦 
			File dirPath = new File(uploadPath + path);
			if(!dirPath.exists()) {// 있으면 안만듦. 없으면 만들고 // 최초로 올려질때 파일 한번 만들어지고 계속 거기에 추가
				dirPath.mkdir(); // 디렉토리 생성 // 돌면서 하위폴더를 만듦
			}
		}
	}
		
	private static String makeIcon(String uploadPath, String path, String fileName ) throws Exception {
		//아이콘의 이름
		String iconName = uploadPath + path + File.separator + fileName;
		//아이콘 이름을 리턴
		//File.separatorChar : 디렉토리구분자
		//윈도우 \, 유닉스(리눅스)/
		return iconName.substring(uploadPath.length()).replace(File.separatorChar, '/');
		//replace는 치환하라는 뜻 => /로 
	}
	private static String makeThumbnail(String uploadPath, String path, String fileName) throws Exception {
		//이미지를 읽기 위한 버퍼
		BufferedImage sourceImg = ImageIO.read(new File(uploadPath + path, fileName)); // 앞에꺼 가서, 파일이름인거 읽어오기
		//100픽셀 단위의 썸네일 생성
		BufferedImage destImg = Scalr.resize(sourceImg, Scalr.Method.AUTOMATIC, Scalr.Mode.FIT_TO_HEIGHT, 100);
		//sorceImg = 원본이미지, Scalr = 화소수를 줄여서 만들어줌 FIT_TO_HEIGHT=비율에 맞춰서 줄여라? height를 100
		//썸네일의 이름
		String thumbnailName = uploadPath + path + File.separator + "s_" + fileName; 
		// 기존이름(원본)이랑 똑같이 만들면 중복 되어버리니까 s_를 넣어줌
		File newFile = new File(thumbnailName);
		String formatName = fileName.substring(fileName.lastIndexOf(".") + +1); // 확장자 자름
		//썸네일 생성
		ImageIO.write(destImg, formatName.toUpperCase(), newFile);
		//
		//썸네일의 이름을 리턴함
		return thumbnailName.substring(uploadPath.length()).replace(File.separatorChar, '/');
		//역슬러시를 슬러시로 바꾸는거..
	}
	

}
