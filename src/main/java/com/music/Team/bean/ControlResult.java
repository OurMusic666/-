package com.music.Team.bean;

import java.util.List;

import lombok.Data;

@Data
public class ControlResult<T> {
	private int code;
	private String msg;
	private int count;
	private List<T> data;

}
