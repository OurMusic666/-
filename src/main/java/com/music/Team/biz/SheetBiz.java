package com.music.Team.biz;

import java.util.List;

import com.music.Team.bean.Sheet;

public interface SheetBiz {

	void insert(Sheet t);

	void delete(Sheet t);

	void update(Sheet t);

	List<Sheet> select();
	
}
