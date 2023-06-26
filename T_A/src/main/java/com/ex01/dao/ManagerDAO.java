package com.ex01.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.ex01.domain.ManagerVO;
import com.ex01.util.ConnectionUtil;

import lombok.Cleanup;

public class ManagerDAO {

	
	// 관리자 로그인 체크 
	// 데이터 일치 확인 
		public ManagerVO getIdPwd(String id) { 
			ManagerVO orcVO = null;
			String sql = "SELECT * FROM t_manager WHERE id=?";
			try {
				@Cleanup Connection conn = ConnectionUtil.INSTANCE.getConnection();
				@Cleanup PreparedStatement pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, id);
//				pstmt.setString(2, pwd);
				
				@Cleanup ResultSet rs = pstmt.executeQuery();
				
				rs.next();
				orcVO = ManagerVO.builder()
						.id(rs.getString(1)) // ID
						.pwd(rs.getString(2)) // pw
						.name(rs.getString(3))// name
						.build();
				
			} catch (Exception e) {
				// TODO: handle exception
			}

			
			return orcVO;
		}
	
	// 관리자 정보 조회 
	
	
	
	//관리자 답글 
	
	
	
	
}
