package ysac.order.domain;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Getter
@AllArgsConstructor
@NoArgsConstructor
@Builder
@ToString
public class UorderVO {

	private String order_code;
	private String user_id;
	private String product_code;
	private int pro_price;
	private String order_img;
	private String order_comment;
	private Date order_join;
	private String name;
	private String address;
	private String phone;
	private String pro_name;
	private int order_status;
	private String pro_qty;
	
}
