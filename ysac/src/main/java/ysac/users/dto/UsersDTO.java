package ysac.users.dto;

import java.time.LocalDate;
import java.util.Date;

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
public class UsersDTO { // 회원 정보 dto
	
	private int recNum;
	private String user_id ;
	private String user_pwd;
	private String user_name;
	private String user_email;
//	private String zip_code;
	private String address;
	private String phone;
	private Date regdate;
	private int user_point;
	private int tier;
	private String birthdate;
	private String uuid;
	
}
