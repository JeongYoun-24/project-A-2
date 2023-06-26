package com.mapper.mybatis;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.ex01.domain.ProductVO;
import com.ex01.domain.UsersVO;
import com.ex01.dto.ProductDTO;

@Mapper
public interface ProductMapper { // 상품 테이블 

	// 상품 등록 
	String insert = """
			insert into PRODUCT (product_code,CATEGORY,PRO_NAME,
				PRO_INFO,PRO_PRICE,PRO_QTY,PRO_IMG)
				VALUES (#{product_code},#{category},#{pro_name},
				#{pro_info},#{pro_price},#{pro_qty},#{pro_img});
			""";
	String insert2 = """
			insert into PRODUCT (PRODUCT_CODE,CATEGORY,PRO_NAME,
				PRO_INFO,PRO_PRICE,PRO_QTY,PRO_IMG)
				VALUES (?,?,? ,
				?,?,?,?);
			""";
	
	@Insert(insert2)
	@Options(useGeneratedKeys = true,keyProperty = "#{product_code}")
	public int productInsert(ProductVO vo);
	
	
	
	
	// 상품 전체 조회 
	@Select("select *from product")
	public List<ProductVO> productAllList();

	// 상품 수정
	String update = """
			update product set category =#{category}, pro_name=#{pro_name} , 
			pro_info =#{pro_info}, pro_price=#{pro_price} , 
			pro_qty=#{pro_qty}, pro_img=#{pro_img} 
			 where product_code =product_code}"
			""";
	
	@Update(update)
	public int productupdate(ProductVO vo);
	
	// 상품 삭제 
	@Select("delete product where  product_code = #{product_code}")
	public int productdelete(@Param("product_code") int product_code);
	
	
	// 상품 번호로 상세조회 
	@Select("select *from product WHERE product_code = #{product_code} ")
	public ProductVO prodctCodeList(int product_code);
	
	
	
	
	// 상품 이름으로 검색 
	String prodcutInfolist = """
			select *from ( -- 상품 브랜드  조회 
		select  
        product_code , category ,pro_name ,pro_info ,pro_price, pro_qty , pro_img
     FROM  (
		select 
       product_code , category ,pro_name ,pro_info ,pro_price, pro_qty , pro_img
		from  product
)WHERE pro_info LIKE '%'||#{pro_info}||'%'

);
			""";
	@Select(prodcutInfolist)
	public void prodctName();
	
	// 상품 카테고리로 검색 
	String prodcutCategory = """
			select *from ( -- 상품 브랜드  조회 
		select  
        product_code , category ,pro_name ,pro_info ,pro_price, pro_qty , pro_img
     FROM  (
		select 
       product_code , category ,pro_name ,pro_info ,pro_price, pro_qty , pro_img
		from  product
)WHERE category LIKE '%'||#{category}||'%'

);
			""";
	@Select(prodcutCategory)
	public void prodctCategory();
	
	
	
	// 카테고리 로 상품  검색  
	String P_C_list ="""
			select *from ( -- 상품 카테고리 상세 조회  
        select rownum as numno,
        category
        from (
          select 
          category
        from product
        )where category =#{category}

);
	""";
	@Select(P_C_list)
	public void productCagegort();
	
}
