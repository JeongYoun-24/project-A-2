package ysac.rev.domain;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Getter
@Builder
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class RevVO {

	private int	rev_code; // 리뷰 번호 
	private String	user_id; // 비뷰 작성자
 	private int	product_code; // 상품 번호 
	private String	rev_title; // 리뷰 제목
	private String	rev_content; // 리뷰 내용 
	private String	rev_img;  // 리뷰 이미지 
	private Date rev_date;    // 작성 일자 
	
	
	
	
}
