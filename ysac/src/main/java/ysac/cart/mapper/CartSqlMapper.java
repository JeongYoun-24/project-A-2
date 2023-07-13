package ysac.cart.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import ysac.cart.domain.CartVO;

public interface CartSqlMapper {

	@Select("SELECT * FROM CART")
    public List<CartVO> getAllCarts();
    
	String userCartList = """
				SELECT c.CART, c.USER_ID, c.PRODUCT_CODE, p.PRO_IMG, p.PRO_NAME, p.PRO_PRICE, c.CART_QTY
				FROM CART c
				JOIN PRODUCT p ON c.PRODUCT_CODE = p.PRODUCT_CODE
				WHERE c.USER_ID = '#{user_id}'
			""";
	
    @Select(userCartList)
    public CartVO getCartById(@Param("cart") int cartId, @Param("userId") String userId);
    
    String userCartInsert = """
    			INSERT INTO CART (CART, USER_ID, PRODUCT_CODE, CART_QTY)
    		    VALUES (#{cart}, #{user_id}, #{product_code}, #{cart_qty})
    		""";
    
    @Insert(userCartInsert)
    public void insertCart(CartVO vo);
    
    @Update("UPDATE CART SET CART_QTY = #{cart_qty} WHERE USER_ID = #{user_id} and PRODUCT_CODE = #{product_code}")
    public void updateCart(CartVO vo);
    
    @Delete("DELETE FROM CART WHERE PRODUCT_CODE = #{product_code} AND USER_ID = #{user_id}")
    public void deleteCart(@Param("cart") int cart, @Param("user_id") String user_id);

	
}
