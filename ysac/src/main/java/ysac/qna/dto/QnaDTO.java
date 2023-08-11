package ysac.qna.dto;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;
import ysac.qna.domain.QnaVO;
@Getter
@Setter
@ToString
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class QnaDTO {

	private int qna_code;
	private String user_id;
	private int product_code;
	private String qna_title;
	private String qna_content;
	private Date qna_date;
	private String qna_img;
	
}
