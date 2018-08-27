package com.music.Team.dao;

import java.util.List;

public interface BaseDao<T> {
	//增
	void insert(T t);
	//删
	void delete(T t);
	//改
	void update(T t);
	//查
	List<T> select();
}
