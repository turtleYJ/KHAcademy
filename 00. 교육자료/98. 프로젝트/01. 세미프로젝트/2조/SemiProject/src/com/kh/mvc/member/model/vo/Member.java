package com.kh.mvc.member.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Member {
	private int no;
	
	private String id;
	
	private String password;
	
	private String role;
	
	private String name;
	
	private String phone;
	
	private String email;
	
	private String address;
	
	private String status;
	
	private Date enrollDate;
	
}
