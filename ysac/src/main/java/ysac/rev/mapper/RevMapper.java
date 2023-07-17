package ysac.rev.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import ysac.product.domain.ProductVO;
import ysac.rev.domain.RevVO;


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
