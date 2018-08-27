package com.music.Team.dao;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Options;

import com.music.Team.bean.Music;

public interface MusicDao extends BaseDao<Music>{

	@Insert("insert into music values(null,#{music_name},#{singer_id},#{album_id},#{music_lrc},#{music_isMember})")
	@Options(useGeneratedKeys=true,keyProperty="music_id",keyColumn="music_id")
	void insert(Music t);

	void delete(Music t);

	void update(Music t);

	List<Music> select();
	
	
	
}
