package ysac.cart.domain;

import org.modelmapper.ModelMapper;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;
import ysac.cart.dto.CartDTO;
import ysac.cart.dto.CartJoinDTO;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
@Builder
public class CartJoinVO {

	private int cart;
	private String user_id;
	private String product_code;
	private String pro_img;
	private String pro_name;
	private String pro_price;
	private int pro_qty;
	private int count;
	
	
	
	private static ModelMapper modelMapper = new ModelMapper();
	  public static CartJoinVO of(CartJoinDTO dto){
	        // entity -> dto
	        return modelMapper.map(dto, CartJoinVO.class);
	  }
	
}
