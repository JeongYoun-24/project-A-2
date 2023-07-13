package ysac.product.mapper;

import org.apache.ibatis.jdbc.SQL;

public class ProductSQL {

	
	public String productAdd() {
		return new SQL() {{
			INSERT_INTO("product");
			INTO_COLUMNS("product_code", "category", "pro_name", "pro_info", "pro_price", "pro_stock", "pro_img");
			INTO_VALUES("#{product_code}", "#{category}", "#{pro_name}", "#{pro_info}", "#{pro_price}", "#{pro_stock}", "#{pro_img}");
		}}.toString();
	}
	
	public String productModify() {
		return new SQL() {{
			UPDATE("product");
			SET("category = #{category}", "pro_name = #{pro_name}", "pro_info = #{pro_info}", "pro_price = #{pro_price}", "pro_qty = #{pro_stock}", "pro_img = #{pro_img}");
			WHERE("product_code = #{product_code}");
		}}.toString();
	}
	
}
