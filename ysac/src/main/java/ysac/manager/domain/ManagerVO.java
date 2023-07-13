package ysac.manager.domain;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Getter
@ToString
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class ManagerVO {

	private String id ;
	private String pwd;
	private String name;
	
	
	
	
}
