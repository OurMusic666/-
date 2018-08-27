package com.music.Team.biz;

import java.util.List;

import com.music.Team.bean.Music;

public interface MusicBiz{

	void insert(Music t);

	void delete(Music t);

	void update(Music t);

	List<Music> select();
	
}
