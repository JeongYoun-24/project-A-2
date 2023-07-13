package ysac.category.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import ysac.category.domain.CategoryVO;

public interface CategorySqlMapper {

	
//	카테고리 종류 리스트
	@Select("SELECT * FROM CATEGORY")
    public List<CategoryVO> categoryList();
    
//	카테고리 별로 조회
	String categoryTypeList = """
			SELECT *
			FROM (
			    SELECT ROWNUM AS recNum, product_code, category, pro_name, pro_info, pro_price, pro_img
			    FROM (
			        SELECT product_code, category, pro_name, pro_info, pro_price, pro_img
			        FROM PRODUCT
			        WHERE CATEGORY IN (
			            SELECT CATEGORY
			            FROM CATEGORY
			            WHERE CATEGORY_NAME LIKE '%' || #{category_name} || '%'
			        )
			        ORDER BY pro_name 
			    )
			)
			WHERE recNum BETWEEN (#{section}-1)*100+(#{pageNum}-1)*10+1 AND (#{section}-1)*100+(#{pageNum})*10
			""";
	
    @Select(categoryTypeList)
    public CategoryVO categoryTypeList(@Param("categoryName") String category_name, @Param("section") int section, @Param("pageNum") int pageNum);
    
    @Insert("INSERT INTO CATEGORY (CATEGORY, CATEGORY_NAME) VALUES (#{category}, #{category_name})")
    public void insertCategory(CategoryVO vo);
    
    @Update("UPDATE CATEGORY SET CATEGORY_NAME = #{category_name} WHERE CATEGORY = #{category}")
    public void updateCategory(CategoryVO vo);
    
    @Delete("DELETE FROM CATEGORY WHERE CATEGORY = #{category}")
    public void deleteCategory(@Param("category") int category);
}
