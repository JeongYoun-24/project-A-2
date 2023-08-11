package ysac.cart.dto;

import org.modelmapper.ModelMapper;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;
import ysac.cart.domain.CartJoinVO;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
@Builder
public class CartJoinDTO {

	private int cart;
	private String user_id;
	private String product_code;
	private String pro_img;
	private String pro_name;
	private String pro_price;
	private int pro_QTY;
	private int count;
	
	
	
	
	
	private static ModelMapper modelMapper = new ModelMapper();
	  public static CartJoinDTO of(CartJoinVO vo){
	        // entity -> dto
	        return modelMapper.map(vo, CartJoinDTO.class);
	  }
	
}
