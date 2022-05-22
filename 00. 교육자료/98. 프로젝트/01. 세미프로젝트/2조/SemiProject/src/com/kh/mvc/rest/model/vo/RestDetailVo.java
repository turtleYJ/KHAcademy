package com.kh.mvc.rest.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class RestDetailVo {

	private int no;
	private String type;
	
	// title 대신 name으로 변경됨
	private String name;
	// 맛집이기 떄문에 menu 추가
	private String menu;
	
	private String imgPath;
	private String addr;
	private String phone;
	private String price;
	private String offday;
	private String content;
	private String xlat;
	private String ylong;
	private String local;
	
}
