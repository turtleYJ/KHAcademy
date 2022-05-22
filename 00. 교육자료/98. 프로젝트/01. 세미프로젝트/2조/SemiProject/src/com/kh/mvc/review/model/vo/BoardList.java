package com.kh.mvc.review.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class BoardList {
	private int no;
	private String type;
	private String title;
	private String date;
	private String imgPath;
	private String content;
	private String comment;
	private String hits;
	private String no2;

}

