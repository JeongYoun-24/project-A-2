package ysac.users.domain;

import java.time.LocalDate;
import java.util.Date;

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
public class UsersVO { // 회원 정보 vo
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
