package com.music.Team.dao;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Select;

import com.music.Team.bean.Album;

public interface AlbumDao extends BaseDao<Album>{

	@Insert("insert into album values(null,#{album_name},#{singer_id})")
	@Options(useGeneratedKeys=true,keyProperty="album_id",keyColumn="album_id")
	void insert(Album t);
	
	

	void delete(Album t);

	void update(Album t);
	
	@Select("Select * from album")
	List<Album> select();
	
}
