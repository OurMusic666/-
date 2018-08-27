package com.music.Team.biz;

import java.util.List;

import com.music.Team.bean.Video;

public interface VideoBiz {

	void insert(Video t);

	void delete(Video t);

	void update(Video t);

	List<Video> select();
	
}
