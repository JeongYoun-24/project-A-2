package com.ex01.domain;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Getter
@ToString
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class ProductVO {

	
	private int product_code; 	// 상품 번호 
	private int category ;   	// 카테고리 번호
	private String pro_name; 	// 상품 이름
	private String pro_info; 	// 상품 정보 
	private String pro_price;	// 상품 가격 
	private int pro_qty;		// 판매 수량
	private String pro_img; 	// 상품 이미지 
	
}
