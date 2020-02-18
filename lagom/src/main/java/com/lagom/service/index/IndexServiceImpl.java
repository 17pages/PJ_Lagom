package com.lagom.service.index;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lagom.domain.ProductDTO;
import com.lagom.persistence.ProductDAO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class IndexServiceImpl implements IndexService {
	
	//기존에 DAO -> Mybatis -> DB(oracle)  순차적으로 동작해서
	//비효율적이던 실행방법을 다음과 같이
	//DAO+Mapper를 결합해서 사용하는 방식을 사용
	
	
	// SqlSession을 사용하기 위한 의존성 주입
	// : root-context.xml에서 생성된 sqlSession 빈즈를 주입 받음!
	@Autowired
	private SqlSession sqlSession;
	
	ProductDAO pDao; // 전역변수, 값이 없으면 null
	@Autowired
	public void newProductDAO() {
		pDao = sqlSession.getMapper(ProductDAO.class);
	} //여기 pDao는 sqlSession 실행할 것을 담음(ProductDAO.class에 있는)
	
	@Override
	public List<ProductDTO> bestPdtList() {

		//log.info("@을 사용한 방법 : " + pDao.getCount()); //여기에 일하고 돌아온 sqlSession의 결과물이 들어있음
		//log.info("xml을 사용한 방법 : " + pDao.getCount2()); //sql이 없으면 productMapper로 감
		
		// 비즈니스로직
		// : best상품 5건을 조회해서 View(메인)단에 출력
		//List<ProductDTO> list = pDao.bestPdtList();
		//                          5개담아서 list에 담음
//		for(ProductDTO productDTO : list) {
//			log.info(productDTO.toString());
//		}//db에서 서비스단으로 보내는것
		
		return pDao.bestPdtList();
	}

	@Override
	public List<ProductDTO> newPdtList() {
		//3. 비즈니스로직을 처리
		//신상품 5건을 출력 => DB작업
		//DB작업은 model단에 시킴
		
		//DB작업을 위해 Model단으로 이동 
		//Model(ProductDAO+Mapper) 인터페이스의 newPdtList()메서드를 실행하고 
		//return을 받음
				
		return pDao.newPdtList();
	}

}
