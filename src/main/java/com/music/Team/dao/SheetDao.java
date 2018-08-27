package com.music.Team.dao;

import java.util.List;

import com.music.Team.bean.Sheet;

public interface SheetDao extends BaseDao<Sheet> {

	void insert(Sheet t);

	void delete(Sheet t);

	void update(Sheet t);

	List<Sheet> select();
	
}
