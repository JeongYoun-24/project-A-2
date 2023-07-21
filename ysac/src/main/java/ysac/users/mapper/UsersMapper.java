package ysac.users.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import ysac.manager_board.domain.Manager_BoardVO;
import ysac.product.domain.ProductVO;
import ysac.rev.domain.RevVO;
import ysac.users.domain.UsersVO;
import ysac.users.domain.UsersVO2;

@Mapper
public interface UsersMapper {
	
	
	@Select("select sysdate from dual")
	public String getTime();
	// 회원 정보 전체 조회 SQL
	@Select("select * from users")
	public List<UsersVO> selectAll();
	
	// 회원가입 SQL 
	String insertform = """
			insert into users (user_id, user_pwd, user_name, user_email , phone) 
			values(#{user_id},#{user_pwd},#{user_name},#{user_email},#{phone})
			""";
	//매개변수와 #{} 의 값이 일치해야함
	@Insert(insertform)
	@Options(useGeneratedKeys = true,keyProperty = "user_id")
	public int userinsert(UsersVO vo);
	
	
	
	// 회원가입  성공한 SQL 
		@Insert("insert into users (user_id, user_pwd, user_name, user_email, phone)"
				+ "values(#{user_id},#{user_pwd},#{user_name},#{user_email},#{phone})")
		@Options(useGeneratedKeys = true,keyProperty = "user_id")
		public int userinsert2(UsersVO2 vo);
	
	// 아이디 조회 SQL
	@Select("select * from users where user_id = #{user_id}")
	public UsersVO SelectOne(String user_id);
	
	// 로그인  SQL
	@Select("select * from users where user_id = #{user_id}")
	public UsersVO login(String user_id);
	
	
	String update_sql = """
			update users set user_pwd=#{user_pwd}, user_name=#{user_name},
			 user_email=#{user_email},address=#{address} ,phone =#{phone}, birthdate=#{birthdate}
			where user_id = #{user_id}
			""";
	 // 수정 SQL
	@Update(update_sql) 
	public int userUpdate(UsersVO vo);
	
	// 삭제 SQL 
	@Delete("delete from users where user_id = #{user_id}")
	public int userDelete(@Param("user_id") String user_id);
//	public int userDelete(String user_id);
	
	
	String checkId = """
			select decode( count(*),1,'true','false')as result from users where id =#{id}
			""";
	// 아이디 중복 체크 SQL
	@Select(checkId)
	public Boolean checkID(@Param("id") String id);
	
	// 아이디 찾기 
//	@Select("SELECT user_id  FROM  users  WHERE  user_email=#{user_email}")
//	public String findID(String user_email);
	
	// 비밀번호 찾기 
//	@Select("SELECT user_pwd  FROM  users  WHERE user_id =#{user_id} and user_email=#{user_email}")
//	public String findPwd(String user_id ,String user_email);
	
	// 자동 로그인 체크시 수행하는 메서드
	@Update("update users set uuid=#{uuid} where user_id=#{user_id}")
	public void updateUuid(String id, String uuid);
	
	// 쿠키값으로 db정보 추출하는 메서드
	@Select("SELECT * FROM users WHERE UUID=#{uuid}")
	public UsersVO selectUUID(String uuid) ;
		
	// 로그인 아이디 찾기 
	@Select("select user_id from users where user_name =#{user_name} and user_email=#{user_email}")
	public String loginId(UsersVO vo);
	
	// 로그인 비밀번호 찾기 
	@Select("select user_pwd from users where user_email=#{user_email} and user_id =#{user_id}")
	public String loginPwd(UsersVO vo);
	
	
	
	// 리뷰 등록 
	@Insert("insert into product_rev (rev_code,user_id,product_code,rev_title,rev_content,rev_img)"
			+ "values (#{rev_code},#{user_id},#{product_code},#{rev_title},#{rev_content},#{rev_img})")
//	@Options(useGeneratedKeys = true,keyProperty = "rev_code")
	public int revinsert(RevVO vo);
	
	
	
	
	
	
	@Insert("insert into product_rev (rev_code ,user_id ,product_code , rev_title, rev_content,rev_img)"
			+ "	values (#{rev_code},#{user_id},#{product_code},#{rev_title},#{rev_content},#{rev_img})")
	public int revinsert2(RevVO vo);
	
	
	@Select("select max(rev_code)+1 from product_rev") // 리뷰 글 번호 생성
	public int getproduct_rev();
		
	
	
	
//	@Insert("insert into manager_board (m_board, id, title, content, img_name,name,hitcount)"
//			+ "values(#{m_board},#{id},#{title},#{content},#{img_name},#{name},#{hitcount})")
//	@Options(useGeneratedKeys = true,keyProperty = "m_board")
//	public int insertboard2(Manager_BoardVO vo);
	
	
	
	
	
	
	String idList = """
			select * from(
			 select 
              ROWNUM as recNum,
              id, pwd,name,email,joinDate
				from (
				select 
               id, pwd,name,email, joinDate
               from t_member 
		)WHERE id LIKE '%'||#{id}||'%'
	)  where recNum between (#{section}-1)*100 + (#{pageNum}-1)*10+1 and (#{section}-1) *100 + (#{pageNum})*10
			""";
	@Select(idList) // 아이디로 검색 조회
	public List<UsersVO> idList(Map<String,String> pageingMap);
	
	String nameList = """
			select * from(
			 select 
              ROWNUM as recNum,
              id, pwd,name,email,joinDate
				from (
				select 
               id, pwd,name,email, joinDate
               from t_member 
		)WHERE name LIKE '%'||#{name}||'%'
)  where recNum between (#{section}-1)*100 + (#{pageNum}-1)*10+1 and (#{section}-1) *100 + (#{pageNum})*10
			""";
	@Select(nameList) // 이름으로 검색 조회
	public List<UsersVO> nameList(Map<String,String> pageingMap);
	
	
	String emailList = """
			select * from(
			 select 
              ROWNUM as recNum,
              id, pwd,name,email,joinDate
				from (
				select 
               id, pwd,name,email, joinDate
               from t_member 
		)WHERE email LIKE '%'||#{email}||'%'
)  where recNum between (#{section}-1)*100 + (#{pageNum}-1)*10+1 and (#{section}-1) *100 + (#{pageNum})*10
		
			""";
	@Select(emailList) // 이메일로 검색 조회
	public List<UsersVO> emailList(Map<String,String> pageingMap);
	
	
	String numList = """
			select * from(
				 select 
                   ROWNUM as recNum,
                   id, pwd,name,email,joinDate
					from (
					select 
                    id, pwd,name,email, joinDate
                    from t_member 
			)
	 )  where recNum between (#{section}-1)*100 + (#{pageNum}-1)*10+1 and (#{section}-1) *100 + (#{pageNum})*10
			""";
	@Select(numList)
	public List<UsersVO> numList(Map<String,Integer> pageingMap);
	
	@Select("select count(*) from t_member")
	public int recNum();
	

	String usersList = """
			select * from(
			 select 
              ROWNUM as recNum,
              user_id,user_name,user_email,phone,regdate
				from (
				select 
               user_id,user_name,user_email,phone,regdate
               from users
               )
 )where recNum between (#{section}-1)*100 + (#{pageNum}-1)*10+1 and (#{section}-1) *100 + (#{pageNum})*10
			""";
	// 회원 전체 리스트 
	@Select(usersList)
	public List<UsersVO> usersList(Map<String,Integer> pageingMap);
	
	String phoneList = """
			select * from(
			 select 
              ROWNUM as recNum,
              user_id,user_name,user_email,phone,regdate
				from (
				select 
               user_id,user_name,user_email,phone,regdate
               from users 
		)WHERE phone LIKE '%'||#{phone}||'%'
	)  where recNum between (#{section}-1)*100 + (#{pageNum}-1)*100+1 and (#{section}-1) *10 + (#{pageNum})*10
		
			""";
	@Select(phoneList) // 이메일로 검색 조회
	public List<UsersVO> phoneList(Map<String,String> pageingMap);
	
	
	// 상품 상세조회 리뷰 
		@Select("select *from product_rev where product_code=#{product_code}")
		public List<RevVO> revList(String product_code);
		
		// 상품 상세 조회
		@Select("select * from product where product_code = #{product_code}")
		public ProductVO findProductlist(String product_code);
		
		// 상품 전체 리스트 조회
		@Select("select *from product ")
		public List<ProductVO> productAllList();
		
		
		// 리뷰 전체 조회 
		@Select("select *from product_rev ")
		public List<RevVO> revAllList();
		
		
		
		String proList1 ="""
				select *from (
		        select 
		        ROWNUM as recNum,
		        product_code, category,pro_name,pro_info, pro_price,pro_img
		        from (
		        select 
		        product_code, category,pro_name,pro_info, pro_price,pro_img
		        from product
		        )  

		)where recNum BETWEEN  1 and 4
					""";
			@Select(proList1) // 첫번째 상품 리스트 
			public List<ProductVO> proList();
			
			
			
			
		String proList2 ="""
				select *from (
	        select 
	        ROWNUM as recNum,
	        product_code, category,pro_name,pro_info, pro_price,pro_img
	        from (
	        select 
	        product_code, category,pro_name,pro_info, pro_price,pro_img
	        from product
	        )  

	)where recNum BETWEEN  5 and 8
				""";
		@Select(proList2) // 첫번째 리스트 
		public List<ProductVO> proList2();
		
		
		
		String proList3 ="""
				select *from (
	        select 
	        ROWNUM as recNum,
	        product_code, category,pro_name,pro_info, pro_price,pro_img
	        from (
	        select 
	        product_code, category,pro_name,pro_info, pro_price,pro_img
	        from product
	        )  

	)where recNum BETWEEN  9 and 12
				""";
		@Select(proList3) // 첫번째 리스트 
		public List<ProductVO> proList3();

	
	
	
}
//마이바티스 프레임워크특징
//sql 실행결과를 자바 빈즈 또는 map 객체에 매핑해주는 persitence솔루션으로 관리
//(sql을 소스코드가 아닌 xml(mapper 인터페이스 자바코드)로 분리)
//
//sql문과 프로그램이 코드를 분리해서 구현
//데이터소스기능과 트랜젝션 처리기느 제공

