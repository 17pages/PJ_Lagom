package com.lagom.scheduler;

import java.io.File;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.lagom.domain.AttachDTO;
import com.lagom.persistence.BoardDAO;
import com.lagom.util.MediaUtils;

import lombok.extern.slf4j.Slf4j;

//게시글 첨부파일 사용시 로컬에 저장된 첨부파일과 DB에 저장된 첨부파일 
//이름이 매칭이 안되는 경우 아무도 사용하지 않는 파일
//고로 로컬에서 삭제
//하루에 한번씩 새벽시간에 전날 로컬 첨부파일 폴더를 대상으로 

@Slf4j
@Component
public class SyncFileScheduler {
		
	@Autowired
	private SqlSession sqlSession;
	private BoardDAO bDao;
	
	@Autowired
	public void newBoardDAO() {
		bDao = sqlSession.getMapper(BoardDAO.class);
	}
	
	
	String uploadPath = "C:/developer/upload";
	
	//하루 전날 파일 목록 가져오기
	private String getFolderYesterday() {
		//format 형식 생성
		SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
		
		//오늘 날짜 가져오기 ex) 2020-04-16
	    Calendar cal = Calendar.getInstance();
				
		//오늘 날짜에서 -1 해서 어제로 설정
		cal.add(Calendar.DATE, -1);
		
		//어제날짜 yyyy-MM-dd로 설정 ex)2020-04-15
		String str = sf.format(cal.getTime());
		
		//File.separator은 \또는 /로 파일 경로를 분리
		// 2020-04-16을 2020\04\16으로 변경
		return str.replace("-", File.separator);
		
	}
	
	//매일 새벽 2시에 첨부파일 목록과 DB를 비교해서 DB에 없는 첨부파일을 로컬 디렉토리에서 삭제
	@Scheduled(cron = "0 0 2 * * *")
	public void checkFiles() throws Exception{
		log.info("File Check Task run.......................");
		log.warn("" + new Date());
			
		SimpleDateFormat sf = new SimpleDateFormat("yyyyMMdd");
		//오늘 날짜 가져오기 ex) 2020-04-16
	    Calendar cal = Calendar.getInstance();
		//DB에 등록되어 있는 첨부파일 목록 불러오기
		cal.add(Calendar.DATE, -1);
		log.info("어제날짜 : " + sf.format(cal.getTime()));
		List<AttachDTO> fileList = bDao.getOldFiles(sf.format(cal.getTime()));
		
//		for(AttachDTO one : fileList){
//		log.info(one.toString());
//		}
		//fileList에 담긴 이름
		//fullname=/2020/04/16/s_3bc10d92-b576-4267-b7e3-bbd4bceafc31_꼴깍몬.png
		// 이 이름을 가지고 폴더에 가서 검색함. 존재유무 판별할거임. 
		//stream과 [람다식 (함수지향코드) 단순반복작업할때 좋음.] 
		//fullname과 path를 합쳐서 다시 리스트에 넣는 작업.
		//stream => fileList에서 값을 하나씩 꺼내옴
		//.map : stream으로 꺼내온 data에 전처리 작업함
		//.collect : 전처리한 산출물을 저장. =save
		List<Path> fileListPaths = fileList.stream()
				.map(dto -> Paths.get(uploadPath+dto.getFullname()))
				// 매개변수 -> 함수
				.collect(Collectors.toList()); //fileListPaths에 집어넣음.  = 여기에 full경로가 잡혀있ㅇ므. 
		
		//이미지 파일이면 DB에 썸네일 이미지파일이 등록돼있기 때문에 파일목록에 원본이미지 파일도 등록
		for(AttachDTO avo : fileList) {
			String fileName = avo.getFullname();
			String formatName = fileName.substring(fileName.lastIndexOf(".")+1);
			MediaType mType = MediaUtils.getMediaType(formatName);
			
			if(mType != null) {
				String front = fileName.substring(0, 12);
				String end=fileName.substring(14);
				//file.separatorChar : 유닉스 / 윈도우즈 \
				fileListPaths.add(Paths.get(uploadPath+(front+end).replace('/', File.separatorChar)));
				//원본파일 지움
			}
		}
		//파일목록 :  파일, 원본이미지, 썸네일 이미지
		fileListPaths.forEach(p -> log.info("" + p)); //->DB꺼
		
		//하루 전날 첨부파일 저장 폴더 지정
		File targetDir = Paths.get(uploadPath, getFolderYesterday()).toFile();
		// toFile = 모든 파일 목록 //targetDir =>로컬꺼
		
		//디렉토리의 파일목록(디렉토리 포함)을 File배열로 반환
		//DB첨부파일 목록과 하루전폴더의 첨부파일과 매칭!
		//->DB에 없는 첨부파일 목록 = 삭제 목록 생성
		File[] removeFiles = targetDir.listFiles(file -> fileListPaths.contains(file.toPath()) == false);
		//file => 로컬에 있는 것들 //fileListPaths =DB의 꺼
		//정상이니까 하지말라고 false반환
		//포함하지 않고 있다면 true 로 removeFiles에 들어감 
		//contain은 in을 파악하는것. 들어있냐 없냐 
		
		//DB에 등록되지 않은 첨부파일 삭제 시작!
		log.warn("=====================================================================");
		for(File file : removeFiles) {
			log.warn(file.getAbsolutePath());
			file.delete();
		}
	}
}
