package com.lagom.service.index;

import java.util.List;

import com.lagom.domain.ProductDTO;

public interface IndexService {
	//베스트상품을 5건 출력
	public List<ProductDTO> bestPdtList();

}
