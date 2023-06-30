package com.mapper.mybatis;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.ex01.domain.RevVO;

@Mapper
public interface RevMapper {

	
	@Select("select *from product_rev")
	public List<RevVO> revList();
	
	// 상품 조회 리뷰 리스트 
	@Select("select *from product_rev where product_code=#{product_code} ")
	public List<RevVO> product_revList(String product_code);
	
	
}
