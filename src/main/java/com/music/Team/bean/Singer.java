package com.music.Team.bean;

import org.springframework.stereotype.Component;

public class Singer {
	//歌手id
	private Integer singer_id;
	//歌手名字
	private String singer_name;
	//歌手照片
	private String singer_pic;
	//歌手详情
	private String singer_desc;
	
	public Integer getSinger_id() {
		return singer_id;
	}
	public void setSinger_id(Integer singer_id) {
		this.singer_id = singer_id;
	}
	public String getSinger_name() {
		return singer_name;
	}
	public void setSinger_name(String singer_name) {
		this.singer_name = singer_name;
	}
	public String getSinger_pic() {
		return singer_pic;
	}
	public void setSinger_pic(String singer_pic) {
		this.singer_pic = singer_pic;
	}
	public String getSinger_desc() {
		return singer_desc;
	}
	public void setSinger_desc(String singer_desc) {
		this.singer_desc = singer_desc;
	}
	
	
}
