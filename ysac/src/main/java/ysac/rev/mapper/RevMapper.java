package ysac.rev.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import ysac.product.domain.ProductVO;
import ysac.rev.domain.RevVO;
import ysac.users.domain.UsersVO;
import ysac.users.domain.UsersVO2;

@Mapper
public interface RevMapper {
	
	
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
	
	// 리뷰 전체 조회 
	@Select("select *from product_rev where rev_code=#{rev_code} ")
	public RevVO revFindList(String rev_code);
	
	@Delete("delete from product_rev where rev_code=#{rev_code}")
	public int revDelete(int rev_code);
	
	
	// 리뷰 등록 
	@Insert("insert into product_rev (rev_code ,user_id ,product_code , rev_title, rev_content,rev_img)"
			+ "values (#{rev_code} ,#{user_id},#{product_code},#{rev_title},#{rev_content},#{rev_img})")
	public int revinsert(RevVO vo);
	
	
	
	// 리뷰 수정 
	String update_sql = """
			update product_rev set rev_title=#{rev_title}, rev_content=#{rev_content},
			 rev_img=#{rev_img} where rev_code = #{rev_code}
			""";
	 // 수정 SQL
	@Update(update_sql) 
	public int revupdate(RevVO vo);
	
	
	
	
	
	// 회원가입  성공한 SQL 
		@Insert("insert into users (user_id, user_pwd, user_name, user_email, phone)"
				+ "values(#{user_id},#{user_pwd},#{user_name},#{user_email},#{phone})")
		@Options(useGeneratedKeys = true,keyProperty = "user_id")
		public int userinsert2(UsersVO2 vo);
	
		
	@Select("select max(rev_code)+1 from product_rev") // 공지사항 글 번호 생성
	public int getproduct_rev();
		
		
	
	
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

)where recNum BETWEEN  5 and 9
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

)where recNum BETWEEN  10 and 14
			""";
	@Select(proList3) // 첫번째 리스트 
	public List<ProductVO> proList3();
	
	
	
	
}
