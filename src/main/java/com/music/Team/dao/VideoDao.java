package com.music.Team.dao;

import java.util.List;

import com.music.Team.bean.Video;

public interface VideoDao extends BaseDao<Video>{

	void insert(Video t);

	void delete(Video t);

	void update(Video t);

	List<Video> select();
	
}
