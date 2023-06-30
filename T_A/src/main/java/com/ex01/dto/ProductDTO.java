package com.ex01.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@Builder
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class ProductDTO {
	private int	recNum;
	private Number product_code; 	// 상품 번호 
	private Number category ;   	// 카테고리 번호
	private String pro_name; 	// 상품 이름
	private String pro_info; 	// 상품 정보 
	private String pro_price;	// 상품 가격 
	private Number pro_qty;		// 판매 수량
	private String pro_img; 
}
