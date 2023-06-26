package com.ex01.dto;

import com.ex01.domain.ManagerVO;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;


@Data
@ToString
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class ManagerDTO {

	private String id ;
	private String pwd;
	private String name;
	
	
	
	
	
}
