package com.board.test;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.After;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.modelmapper.ModelMapper;


import com.ex01.dao.MapperUtil;
import com.ex01.domain.ManagerVO;
import com.ex01.domain.Manager_BoardVO;
import com.ex01.domain.ProductVO;
import com.ex01.domain.UsersVO;
import com.ex01.util.ConnectionUtil;
import com.mapper.mybatis.ManagerMapper;
import com.mapper.mybatis.ProductMapper;
import com.mapper.mybatis.UsersMapper;

import lombok.Builder;



public class ProductMapperTest {

	
	
	private SqlSessionFactory factor;
	private ManagerMapper memberMapper;
	private ProductMapper productMapper;
	private ModelMapper modelMapper;
	private SqlSession session;
	
	
	
	@BeforeEach
	public void read() {

		modelMapper = MapperUtil.INSTANCE.get();
		factor = ConnectionUtil.INSTANCE.getSqlSessionFactorty();
		session = factor.openSession();
		memberMapper = session.getMapper(ManagerMapper.class);
		productMapper = session.getMapper(ProductMapper.class);
		
	}
	@After
	public void close() {
		session.close();
	}
	
	@Test
	public void userFindlsit() { // 상품 상세 조회 테스트 
		try {
			SqlSessionFactory factor = ConnectionUtil.INSTANCE.getSqlSessionFactorty();
			SqlSession session = factor.openSession();
			
			productMapper = session.getMapper(ProductMapper.class);
			
			
			ProductVO list = productMapper.prodctCodeList(2);
			
			System.out.println(list);
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@Test
	public void testupdate() { // 상품 수정 테스트
		SqlSessionFactory factor = ConnectionUtil.INSTANCE.getSqlSessionFactorty();
		SqlSession session = factor.openSession();
		
		productMapper = session.getMapper(ProductMapper.class);
		try {
			ProductVO vo = ProductVO.builder()
					
					.product_code(3)
					.category(2)
					.pro_name("아무튼 향수임")
					.pro_info("디올")
					.pro_price("30000")
					.pro_qty(1)
					.pro_img(".jpg")
					.build();
			
				int result =productMapper.productupdate(vo);
			
				System.out.println(result);
				session.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

		
	}
	@Test
	public void testdelete() { // 상품 삭제 테스트 
		int product = 5;
		int r = productMapper.productdelete(product);
		session.commit();
		
		System.out.println(r);
	}
	
	
	@Test
	public void testinsrt() { // 상품  등록 테스트 
		SqlSessionFactory factor = ConnectionUtil.INSTANCE.getSqlSessionFactorty();
		SqlSession session = factor.openSession();
		
		productMapper = session.getMapper(ProductMapper.class);
		try {
			ProductVO vo = ProductVO.builder()
					
					.product_code(6)
					.category(2)
					.pro_name("아무튼 향수임")
					.pro_info("디올")
					.pro_price("30000")
					.pro_qty(1)
					.pro_img(".jpg")
					.build();
			
				System.out.println(vo);
				int result =productMapper.productInsert(vo);
			
				System.out.println(result);
				session.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

	}
	
	
	
	
	
	
	
	@Test
	public void userListTest() { // 상품 전체 정보 테스트 
		try {
			SqlSessionFactory factor = ConnectionUtil.INSTANCE.getSqlSessionFactorty();
			SqlSession session = factor.openSession();
			
			productMapper = session.getMapper(ProductMapper.class);
			
			List<ProductVO> memberVO = productMapper.productAllList();
			System.out.println(memberVO);
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	
	}
	

	
	
	@Test
	public void managerTest22() {
		try {
			SqlSessionFactory factor = ConnectionUtil.INSTANCE.getSqlSessionFactorty();
			SqlSession session = factor.openSession();
			
			memberMapper = session.getMapper(ManagerMapper.class);
			
			List<ManagerVO> memberVO = memberMapper.selectAll();
			System.out.println(memberVO);
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	@Test
	public void managerTests() {
		try {
			SqlSessionFactory factor = ConnectionUtil.INSTANCE.getSqlSessionFactorty();
			SqlSession session = factor.openSession();
			
			memberMapper = session.getMapper(ManagerMapper.class);
			
			
			Manager_BoardVO memberVO = memberMapper.boardfind(1);
			System.out.println(memberVO);
			
			
			
		} catch (Exception e) {e.printStackTrace();}
				
		
	}
	
		
	
	
	
	
	
	
	
	
}
