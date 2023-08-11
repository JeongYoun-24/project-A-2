package ysac.cart.domain;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Getter
@AllArgsConstructor
@NoArgsConstructor
@ToString
@Builder
public class CartVO {

	private int cart;
	private String user_id;
	private String product_code;
	private int pro_qty;
	
}
