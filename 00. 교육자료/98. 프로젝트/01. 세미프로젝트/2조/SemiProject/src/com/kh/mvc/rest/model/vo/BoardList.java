package com.kh.mvc.rest.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class BoardList {
	private int no;
	private String type;
	private String name;
	private String menu;
	private String imgPath;
	private String addr;
	private String phone;
	private String price;
	private String offday;
	private String content;
	private String xlat;
	private String xlong;
	private String local;
}
