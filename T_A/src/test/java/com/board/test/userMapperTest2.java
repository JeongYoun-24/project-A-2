package com.board.test;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.After;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.modelmapper.ModelMapper;


import com.ex01.dao.MapperUtil;
import com.ex01.domain.ManagerVO;
import com.ex01.domain.Manager_BoardVO;
import com.ex01.domain.UsersVO;
import com.ex01.domain.UsersVO2;
import com.ex01.util.ConnectionUtil;
import com.mapper.mybatis.ManagerMapper;
import com.mapper.mybatis.UsersMapper;

import lombok.Builder;



public class userMapperTest2 {

	
	
	private SqlSessionFactory factor;
	private ManagerMapper memberMapper;
	private UsersMapper userMapper;
	private ModelMapper modelMapper;
	private SqlSession session;
	
	
	
	@BeforeEach
	public void read() {

		modelMapper = MapperUtil.INSTANCE.get();
		factor = ConnectionUtil.INSTANCE.getSqlSessionFactorty();
		session = factor.openSession();
		memberMapper = session.getMapper(ManagerMapper.class);
		userMapper = session.getMapper(UsersMapper.class);
		
	}
	@AfterEach
	public void close() {
		session.close();
	}
	
	@Test
	public void userFindlsit() { // 회원 조회 테스트 
		try {
			SqlSessionFactory factor = ConnectionUtil.INSTANCE.getSqlSessionFactorty();
			SqlSession session = factor.openSession();
			
			userMapper = session.getMapper(UsersMapper.class);
			
			
			UsersVO list = userMapper.login("aaa");
			
			System.out.println(list);
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@Test
	public void testinsrt() { // 회원 등록 테스트 
		SqlSessionFactory factor = ConnectionUtil.INSTANCE.getSqlSessionFactorty();
		SqlSession session = factor.openSession();
		
		userMapper = session.getMapper(UsersMapper.class);
		
		UsersVO2 vo = UsersVO2.builder()
				
				.user_id("fff")
				.user_pwd("1234")
				.user_name("프라잇")
				.user_email("ddd@naver.com")
				.phone("010-4887-4444")
				.build();
		
			int result =userMapper.userinsert2(vo);
		
			System.out.println(result);
			session.close();
	}
	
	
	
	
	@Test
	public void userListTest() { // 회원 전체 정보 테스트 
		try {
			SqlSessionFactory factor = ConnectionUtil.INSTANCE.getSqlSessionFactorty();
			SqlSession session = factor.openSession();
			
			userMapper = session.getMapper(UsersMapper.class);
			
			List<UsersVO> memberVO = userMapper.selectAll();
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
	@Test
	public void deleteuser() {
		try {
			SqlSessionFactory factor = ConnectionUtil.INSTANCE.getSqlSessionFactorty();
			SqlSession session = factor.openSession();
			
			userMapper = session.getMapper(UsersMapper.class);
			
			
			int memberVO = userMapper.userDelete("test24");
			System.out.println(memberVO);
			session.close();
			
			
		} catch (Exception e) {e.printStackTrace();}
				
		
	}
		
	
	
	
	
	
	
	
	
}
