package com.ex01.dao;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.platform.commons.annotation.Testable;
import org.modelmapper.ModelMapper;


import com.ex01.dao.MapperUtil;
import com.ex01.domain.UsersVO;

@Testable
public class TestDB {

	private UsersDAO boardDAO;
	private ModelMapper modelMapper;
	
	
	@BeforeEach
	public void read2() {
		
		boardDAO =new UsersDAO();
		modelMapper =MapperUtil.INSTANCE.get();
		
	}
//	@Test
//	public void testboardinsert() throws Exception {
//		//새글 등록하기위해 새글 번호 생성 
////		int newArticleNO = boardDAO.getNewArticleNO();
////		System.out.println(newArticleNO);
//		
//		UsersVO VO = UsersVO.builder()
//					.id("aaa")
//					.pwd("1234")
//					.name("에이스")
//					.email("a@naver.com")
//					.zip_code("11232")
//					.address("오봉로111")
//					.phone("01044441233")
//					.build();
//			
//			boardDAO.addOrc(VO);
//			System.out.println(VO);
//			
//		
//		
//	}
	
	
	
	
	
}
