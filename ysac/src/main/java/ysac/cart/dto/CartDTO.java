package ysac.cart.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class CartDTO {

	private int cart;
	private String user_id;
	private String product_code;
	private int pro_qty;
	
}
