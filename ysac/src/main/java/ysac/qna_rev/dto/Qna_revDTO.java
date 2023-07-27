package ysac.qna_rev.dto;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@Builder
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class Qna_revDTO {

	private int re_code;
	private String user_id;
	private int Qna_code;
	private String content;
	private Date re_date;
	
	
	
}
