package cn.hncj.hotel.service;

import java.util.List;

import cn.hncj.hotel.entity.User;
import cn.hncj.hotel.utils.PageInfo;

public interface BaseService<T> {
	
	public List<T> list();
	public List<T> listByPageInfo(PageInfo pageInfo);
	public List<T> listByPageInfo(PageInfo pageInfo, Object...objects);
	public T getById(int id);
	public T getById(Class<T> clazz, int id);
	public T getByName(String name);
	public T getByParameters(Object...objects);
	public Integer save(Object clazz);
	public void delete(Object clazz);
	public void update(Object clazz);
	public int total(User user);
	public int total(int wtf, Object...objects);
	public T findEntity(Object clazz, PageInfo pageInfo);
}
