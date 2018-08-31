package com.music.Team.biz;

import java.util.List;

import com.music.Team.bean.Singer;

public interface SingerBiz {

	void insert(Singer t);

	void delete(Singer t);

	void update(Singer t);

	List<Singer> select();
	
	int insertSinger(Singer t);
}
