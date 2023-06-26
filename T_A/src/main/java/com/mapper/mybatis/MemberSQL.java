package com.mapper.mybatis;

import org.apache.ibatis.jdbc.SQL;

public class MemberSQL {

	//1 회원 목록 
	public static final String LIST_MEMBERS =
			
		"""
			select *from t_member
		""";
	
	
	//1-2 회원목록
	public String listmember() {
		
		return new SQL() {{
			SELECT("*");
			FROM("t_member");
			
			
		}}.toString();
	}
	
	//2. 회원 등록 
	public String insertMember() {
		  String sql = new SQL()
		    .INSERT_INTO("t_member")
    .VALUES("id, pwd, name ", "#{id}, #{pwd},#{name}")
		    .VALUES("enail", "#{email}")
		    .toString();
		  return sql;
		}
	
	//2-1 
	public static final String INSERT_MEMBER = 
			"""
			INSERT INTO t_member(id,pwd,name,email )		   
				VALUES( #{id}, #{pwd},#{name} ,#{email})
			""";
	
	
	
	// 조건 검색 
	public String findMembersName(String memberName) {
		StringBuilder query =new StringBuilder();
		
		query.append("select *from t_member");
		
		if(memberName != null && memberName.length() > 0) {
			query.append(" where ");
			query.append("name like "+ memberName);
			
		}
			
		return query.toString();
	}
	
	
}
