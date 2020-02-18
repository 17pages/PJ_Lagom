package com.lagom.persistence;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import com.lagom.domain.ProductDTO;

public interface ProductDAO {
	
//	@Select("SELECT COUNT(*) FROM tbl_pdt") // 간단한거 할때 복잡할때는 mapper를 씀
//	public int getCount();
//	
//	public int getCount2(); // 경로없을때 productmapper로 감 (이름이 같았던 mapper)
	
	public List<ProductDTO> bestPdtList();
	
	//4. @관련 sql이 없으면 mapper.xml에 가서
	// id가 newPdtList와 같은 sql문을 찾아 실행
	public List<ProductDTO> newPdtList();

}
