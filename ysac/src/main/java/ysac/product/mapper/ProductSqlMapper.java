package ysac.product.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.InsertProvider;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.UpdateProvider;

import ysac.manager_board.domain.Manager_BoardVO;
import ysac.product.domain.ProductVO;

public interface ProductSqlMapper {

	@Select("select * from product where product_code = #{product_code}")
	public ProductVO proCodeSelectOne(String product_code);
	
	@Select("select * from product where product_code = #{product_code}")
	public ProductVO proCodeSelectOne2(int product_code);
	
	
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
		@Select(proList1) // 메인  첫번째 상품 리스트  1~4번째
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
			@Select(proList2) // 메인  첫번째 상품 리스트  1~4번째
			public List<ProductVO> proList2();
		
		
		
		
	
	

	String allList = """
			select * from (
		    select rownum as recNum, product_code, category, pro_name, pro_info, pro_price, pro_img
		    from (
		        select product_code, category, pro_name, pro_info, pro_price, pro_img from product
		        order by product_code
		    )
		) where recNum between (#{section}-1)*100+(#{pageNum}-1)*10+1 and (#{section}-1)*100+(#{pageNum})*10


			""";
	
	@Select(allList)
	public List<ProductVO> proAllList(Map<String, Integer> pageingMap);
	
	String nameList = """
			select * from (
					select rownum as recNum, product_code, category, pro_name, pro_info, pro_price, pro_img
					from (
					        select product_code, category, pro_name, pro_info, pro_price, pro_img from product
					        where pro_name LIKE '%' || #{pro_name} || '%'
					        order  by pro_name
					        )
					    ) where recNum between (#{section}-1)*100+(#{pageNum}-1)*10+1 and (#{section}-1)*100+(#{pageNum})*10
			""";
	
	@Select(nameList)
	public List<ProductVO> proNameSelectList(String pro_name, Map<String, Integer> pageingMap);
	
	@InsertProvider(type = ProductSQL.class, method = "productAdd")
	public void productAdd(ProductVO vo);
	
	@UpdateProvider(type = ProductSQL.class, method = "productModify")
	public void productModify(ProductVO vo);
	
	@Delete("delete product where product_code = #{product_code}")
	public void productDelete(String product_code);
	
	@Select("select count(product_code) from product")
	public int proTotNum();
}
