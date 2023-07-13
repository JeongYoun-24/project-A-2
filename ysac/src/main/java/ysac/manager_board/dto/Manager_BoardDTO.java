package ysac.manager_board.dto;


import java.time.LocalDate;
import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.ToString;


@Data
@ToString
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class Manager_BoardDTO {

	
	private int m_board; // 공지번호
	private String id;  // 관리자 아이디
	private String title;  // 글제목 
	private String content; // 글 내용
	private String img_name ; // 이미지 파일 
	private String name; 	// 관리자 이름
	private Date writedate; // 작성일 
	private int hitcount; 	// 조회수
	
	
	
	
}
