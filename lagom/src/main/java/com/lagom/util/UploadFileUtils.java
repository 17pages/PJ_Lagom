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
public class UploadFileUtils {		//파일저장할 디렉토리 경로            //배열
	public static String uploadFile(String uploadPath, String originalName, byte[] fileData) throws Exception{
									//("c:developer/upload", "파일이름", 파일크기)
		//예외처리
		
		
		// uuid를 사용하는 이유 : 첨부파일의 이름이 중복된 경우를 대비하여 랜덤값을 생성하고 
		// 						첨부파일 이름앞에 '랜덤값_첨부파일'을 통해 중복값 식별 목적
		//uuid 발급 : 랜덤한 값이 만들어지게 함. 
		UUID uid = UUID.randomUUID(); // 랜덤한 값 만들어지게 하는 이유 : 중복된 이름을 방지하기 위해서 
		String savedName = uid.toString() + "_" + originalName; //임의의값_파일이름
		//업로드할 디렉토리 생성
		String savedPath = calcPath(uploadPath); //업로드 디렉토리안에 오늘 날짜의 파일을 만듦. 당일 첨부파일은 해당월일파일에 넣음
				// savedpath = \2020\05\20
		
		// c:/developer/upload\2020\05\20 , 임의의 파일명
		File target = new File(uploadPath + savedPath, savedName); // 파일 껍데기(객체) 만드는것 
		//첨부파일을 쓸수있게 만드는 설정값이 들어감. 
		//디렉토리는 d드라이브/developer/... 까지 밖에 없음. 아무튼 savedpath랑 target은 합쳐야 완벽한 경로가 됨. 
		
		//임시 디렉토리에 업로드된 파일을 지정된 디렉토리로 복사
		FileCopyUtils.copy(fileData, target); //이때 실제로 들어가게됨
		//( 지정해둔 경로에 파일을 넣어줌(저장). 올려야할 첨부파일, '어디에 어떤이름으로' 세팅값) 
		
		
		//파일의 확장자 검사 // 일단 저장후, 이미지인지 확인하기 
		//이때 로컬로 들어가는 것..
		//a.jpg / aaa.bbb.ccc.jpg  
		//substring
		String formatName = originalName.substring(originalName.lastIndexOf(".") + 1); 
		//끝에서부터 .을 찾음. 그뒤에 한칸뒤로 jpg이렇게만옮 , formatname에는 확장자가 들어옴
		String uploadedFileName = null;
		//이미지 파일은 썸네일 사용
									//jpg
		if(MediaUtils.getMediaType(formatName) != null) { //확장자판단 // null이 아니면 이미지,  // MediaType.IMAGE_JPEG !=null
			//static
			//썸네일 생성					//(c:/developer/upload, \2020\05\20, 임의의 파일명)
			uploadedFileName = makeThumbnail(uploadPath, savedPath, savedName); // 이미지면 썸네일 생성
		}else {
			uploadedFileName = makeIcon(uploadPath, savedPath, savedName); // 이미지가 아니면 아이콘 생성
		}	//
		return uploadedFileName;
		//풀네임을 리턴... ajaxuploadcontroller로... 
	
		
	}
	
	private static String calcPath(String uploadPath) {//uploadPath : 경로가 담겨있음
		Calendar cal = Calendar.getInstance(); // 달력값가져오기 //오늘 날짜를 만들어서 cal에 담음 
		String yearPath = File.separator + cal.get(Calendar.YEAR); // separator구분자 "/", //\ + 2020
		String monthPath = yearPath + File.separator + new DecimalFormat("00").format(cal.get(Calendar.MONTH)+1); // \2020+ \+ 04
		String datePath = monthPath + File.separator + new DecimalFormat("00").format(cal.get(Calendar.DATE));// 2020\04 +\+ 08
		
		//2020년도 디렉토리 생성
		// ㄴ 하위에 056월 디렉토리 생성
		//   ㄴ 하위에 20일 디렉토리 생성
		makeDir(uploadPath, yearPath, monthPath, datePath); // 매서드, 디렉토리 만들어랑 // 같은 클래스내에 있으니까 객체생성할필요가 없음
		//객체생성은 다른클래스에 있을때 쓰기위해서 만드는거.
		log.info(datePath);
		return datePath; // \2020\04\08
	}
	
	//"c:developer/upload",         string[] paths = [\2020, \2020\05, \2020\05\20]
	private static void  makeDir(String uploadPath, String... paths) { // ... 동일한 타입의 매개변수를 여러개 받을때 ... 씀 (동일한것만!!) 배열로 만들어서 넣어줌, 동적으로 매개변수갯수가 바뀌어야 할때
													// 동적으로 매개변수 개수 변경 가능				
		                                           // ... paths에는 지금 yearpath, monthpath, datepath 이런거 들어감 
		//디렉토리가 존재하면 skip
		//             paths[3-1].exists() => paths[2] = \2020\05\20
		//'\2020\05\20' 디렉토리 경로가 있으면 여기서 메서드 종료 // 있으면 true
		if(new File(paths[paths.length - 1]).exists()) {//[] 인덱스 설정하겠음. 0,1,2 // 마지막값을 꺼내와라. (존재여부확인 존재하면 true, 안하면 false)// 그 폴더가 있으면 return
			return;
		}
		// 첫번째반복 \2020
		// 두번째반복 \2020\05
		// 세번째 반복 \2020\05\20
		
		for(String path : paths) { // 없으면 만듦, 포이치문, 배열의 크기만큼 돎 
			// ex) 1번반복 : c:/developer/upload\2020
			// ex) 2번반복 : c:/developer/upload\2020\05
			// ex) 3번반복 : c:/developer/upload\2020\05\20
			File dirPath = new File(uploadPath + path);
			if(!dirPath.exists()) {// 있으면 안만듦. 없으면 만들고 // 최초로 올려질때 파일 한번 만들어지고 계속 거기에 추가
				// exists() => 있으면 true => !ture => false
				dirPath.mkdir(); // true면 디렉토리 생성 // 돌면서 하위폴더를 만듦
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
	
										//(c:/developer/upload, \2020\05\20, 임의의 파일명)
	private static String makeThumbnail(String uploadPath, String path, String fileName) throws Exception {
		//이미지를 읽기 위한 버퍼				//(c:/developer/upload\2020\05\20, 임의의 파일명) 경로로가서 이미지를 읽어옴. 
		BufferedImage sourceImg = ImageIO.read(new File(uploadPath + path, fileName)); // 앞에꺼 가서, 파일이름인거 읽어오기//이미지를 읽어들이는것. 이미지 이미 한번 저장한거 불러오는거
		//100픽셀 단위의 썸네일 생성
		BufferedImage destImg = Scalr.resize(sourceImg, Scalr.Method.AUTOMATIC, Scalr.Mode.FIT_TO_HEIGHT, 75);
		//sorceImg = 원본이미지, Scalr = 화소수를 줄여서 만들어줌 FIT_TO_HEIGHT=비율에 맞춰서 줄여라? height를 100
		//아직 로컬에 저장안함. 만들기만 해둠 
		//scalr 라이브러리.. 
		
		// 현재 => 임시저장소 : sourceImg(원본), destImg(썸네일)
		
		//썸네일의 이름
		//thumbnailName = c:developer/upload\2020\05\20\s_임의의 이름.jpg
		String thumbnailName = uploadPath + path + File.separator + "s_" + fileName; 
		// 기존이름(원본)이랑 똑같이 만들면 중복 되어버리니까 s_를 넣어줌
		File newFile = new File(thumbnailName); // 설정값이 들어가있음. 
		// 임의의 이름.jpg.subString() => jpg = formatname
		String formatName = fileName.substring(fileName.lastIndexOf(".") + +1); // 확장자 자름
		//썸네일 생성
					//실제 썸네일 이미지, JPG, c:developer/upload\2020\05\20\s_임의의 이름.jpg
		ImageIO.write(destImg, formatName.toUpperCase(), newFile);
		//정말로 로컬에 저장함. 확장자.대문자로 
		//썸네일의 이름을 리턴함
		return thumbnailName.substring(uploadPath.length()).replace(File.separatorChar, '/');
		// 체이닝 기법 : 여러개 차례로 실행하겠다는 거~
								//  c:developer/upload\2020\05\20\s_임의의 이름.jpg
								//- c:developer/upload
		//============================================================================
		//                   결과 : \2020\05\20\s_임의의 이름.jpg => replace, 역슬러시를 슬러시로 바꾸는거..
		//					결과 : /2020/05/20/s_임의의 이름.jpg <= RETURN
	}
	

}
