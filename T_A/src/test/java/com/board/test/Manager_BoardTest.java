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

import com.ex01.util.ConnectionUtil;
import com.mapper.mybatis.ManagerMapper;
import com.mapper.mybatis.UsersMapper;

import lombok.Builder;



public class Manager_BoardTest {

	
	
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
	public void twests() {
		try {
			SqlSessionFactory factor = ConnectionUtil.INSTANCE.getSqlSessionFactorty();
			SqlSession session = factor.openSession();
			
			memberMapper = session.getMapper(ManagerMapper.class);
			int m_board = 1;
			
			Manager_BoardVO list = memberMapper.boardfind(m_board);
			
			System.out.println(list);
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@Test
	public void testinsrt() {
		SqlSessionFactory factor = ConnectionUtil.INSTANCE.getSqlSessionFactorty();
		SqlSession session = factor.openSession();
		
		memberMapper = session.getMapper(ManagerMapper.class);
		
		Manager_BoardVO vo = Manager_BoardVO.builder()
				.m_board(4)
				.id("dobi1")
//				.title("테스트4")
//				.content("테스트 내용4")
//				.img_name("jss123")
//				.name("관리자1")
				.build();
		
			int result =memberMapper.insertboard(vo);
		
			System.out.println(result);
	}
	
	@Test
	public void testboard() {
		SqlSessionFactory factor = ConnectionUtil.INSTANCE.getSqlSessionFactorty();
		SqlSession session = factor.openSession();
		
		memberMapper = session.getMapper(ManagerMapper.class);
		try {
			Manager_BoardVO vo = Manager_BoardVO.builder()
					.m_board(memberMapper.getmanager_board())
					.id("dobi1")
					.title("테스트4")				
					.content("테스트 내용4")
					.img_name("jss123")
					.name("관리자1")
					.build();
			System.out.println(vo);
				int result =memberMapper.insertboard2(vo);
			
				System.out.println(result);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	
	@Test
	public void boardTestsssss() {
		try {
			SqlSessionFactory factor = ConnectionUtil.INSTANCE.getSqlSessionFactorty();
			SqlSession session = factor.openSession();
			
			memberMapper = session.getMapper(ManagerMapper.class);
			
			List<Manager_BoardVO> memberVO = memberMapper.boardList();
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
