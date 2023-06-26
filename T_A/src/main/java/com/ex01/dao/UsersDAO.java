package com.ex01.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;


import com.ex01.domain.UsersVO;
import com.ex01.util.ConnectionUtil;


import lombok.Cleanup;

public class UsersDAO {
	
	/*
	
	public List<UsersVO> usersList(){// 회원 전체 조회
		String sql = "select *from T_Users";
		List<UsersVO> userVO = new ArrayList<>();
		try {
			@Cleanup Connection conn = ConnectionUtil.INSTANCE.getConnection();
			@Cleanup PreparedStatement pstmt = conn.prepareStatement(sql);
			@Cleanup ResultSet rs = pstmt.executeQuery();
			
			
			while(rs.next()) {
				UsersVO vo = UsersVO.builder()
						.id(rs.getString("id"))
						.pwd(rs.getString("pwd"))
						.name(rs.getString("name"))
						.email(rs.getString("email"))
						.zip_code(rs.getString("zip_code"))
						.address(rs.getString("address"))
						.phone(rs.getString("phone"))
						.regdate(rs.getDate("regdate").toLocalDate())
						.build();
					
				
				userVO.add(vo);
			}
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		
		
		return userVO;
	}
	
	public UsersVO findList(String id ) {// 회원 정보 하나 조회
		String sql="";
		UsersVO vo = null;
		try {
			@Cleanup Connection conn = ConnectionUtil.INSTANCE.getConnection();
			@Cleanup PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			@Cleanup ResultSet rs = pstmt.executeQuery();
			
			rs.next();
			vo = UsersVO.builder()
						.id(rs.getString("id"))
						.pwd(rs.getString("pwd"))
						.name(rs.getString("name"))
						.email(rs.getString("email"))
						.zip_code(rs.getString("zip_code"))
						.address(rs.getString("address"))
						.phone(rs.getString("phone"))
						.regdate(rs.getDate("regdate").toLocalDate())
						.build();
			
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		
		
		return vo;
	}
	
	
	
	public void insert() { // 회원 등록 
		
		
	}
	// 데이터 등록
		public int addOrc(UsersVO vo) {
			int result=0;
			String sql = " insert INTO t_users (id,pwd,name,email,zip_code,address,phone) "
					+ " values (?,?,?,?,?,?,?)";
			try {
				System.out.println("a");
				System.out.println("b");
				@Cleanup Connection conn = ConnectionUtil.INSTANCE.getConnection();
				System.out.println("c");
				@Cleanup PreparedStatement pstmt = conn.prepareStatement(sql);
				System.out.println("d");
				pstmt.setString(1, vo.getId());
				pstmt.setString(2, vo.getPwd());
				pstmt.setString(3, vo.getName());
				pstmt.setString(4, vo.getEmail());
				pstmt.setString(5, vo.getZip_code());
				pstmt.setString(6, vo.getAddress());
				pstmt.setString(7, vo.getPhone());
				System.out.println("e");
				//0을 반환: 쿼리문 실행 실패, 1: 쿼리문 정상 실행
				pstmt.executeUpdate();
				System.out.println("f");
				System.out.println(result);
			} catch (Exception e) {}

			return result;
			
		}
	
	
	
	// 회원 수정 
	public void update() {
		
	}
	// 회원 삭제 
	public void delete() {
		
	}
	// 로그인 아이디 비번 일치 
	// 데이터 일치 확인 
			public UsersVO getIdPwd(String id) { 
				UsersVO orcVO = null;
				String sql = "SELECT * FROM t_users WHERE id=?";
				try {
					@Cleanup Connection conn = ConnectionUtil.INSTANCE.getConnection();
					@Cleanup PreparedStatement pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, id);
//					pstmt.setString(2, pwd);
					
					@Cleanup ResultSet rs = pstmt.executeQuery();
					
					rs.next();
					orcVO = UsersVO.builder()
							.id(rs.getString(1)) // rs.getString("id")
							.pwd(rs.getString(2)) // pw
							.name(rs.getString(3))// name
							.email(rs.getString(4))
							.build();
					
				} catch (Exception e) {
					// TODO: handle exception
				}

				
				return orcVO;
			}
	
	
	
	*/
	
}
