package cn.hncj.hotel.service;

import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Service;

import cn.hncj.hotel.entity.Room;
import cn.hncj.hotel.entity.User;
import cn.hncj.hotel.utils.PageInfo;

@Service
public class BaseServiceImpl<T> extends ServiceDelegationDao implements BaseService<T>{
	Class<T> oriClass;
	@SuppressWarnings("unchecked")
	public BaseServiceImpl() {
		// TODO Auto-generated constructor stub
		Type type = getClass().getGenericSuperclass();
		if (type instanceof ParameterizedType) {
			Type p[] = ((ParameterizedType) type).getActualTypeArguments();
			oriClass = (Class<T>) p[0];
			System.out.println(oriClass.getSimpleName());
		}
	}
	@SuppressWarnings("unchecked")
	@Override
	public List<T> list() {
		// TODO Auto-generated method stub
		return findByCriteria(DetachedCriteria.forClass(oriClass));
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<T> listByPageInfo(PageInfo pageInfo) {
		// TODO Auto-generated method stub
		return findByCriteria(DetachedCriteria.forClass(oriClass), pageInfo.getStart(), pageInfo.getCount());
	}

	@Override
	public T getById(int id) {
		// TODO Auto-generated method stub
		return super.get(oriClass, id);
	}

	@Override
	public T getById(Class<T> clazz, int id) {
		// TODO Auto-generated method stub
		return super.get(clazz, id);
	}

	@Override
	public Integer save(Object clazz) {
		// TODO Auto-generated method stub
		return (Integer) super.save(clazz);
	}

	@Override
	public void delete(Object clazz) {
		// TODO Auto-generated method stub
		super.delete(clazz);
	}

	@Override
	public void update(Object clazz) {
		// TODO Auto-generated method stub
		super.update(clazz);
	}
	@SuppressWarnings("unchecked")
	@Override
	public T getByName(String name) {
		// TODO Auto-generated method stub
		DetachedCriteria dc = DetachedCriteria.forClass(oriClass);
		dc.add(Restrictions.eq("username", name));
		return (T) findByCriteria(dc);
	}
	@Override
	public int total(User user) {
		// TODO Auto-generated method stub
		String hql = "select count(*) from " + oriClass.getSimpleName();
		if (user != null) {
			hql += " c where c.user.userid=" + user.getUserid();
		}
		List<Long> list = find(hql);
		return list.get(0).intValue();
	}
	@Override
	public T findEntity(Object clazz, PageInfo pageInfo) {
		// TODO Auto-generated method stub
		DetachedCriteria dc = DetachedCriteria.forClass(oriClass);
		dc.add(Restrictions.eq("user", clazz));
		dc.addOrder(Order.desc("orderid"));
		return (T) findByCriteria(dc, pageInfo.getStart(), pageInfo.getCount());
	}
	@Override
	public List<T> listByPageInfo(PageInfo pageInfo, Object... objects) {
		// TODO Auto-generated method stub
		DetachedCriteria dc = DetachedCriteria.forClass(oriClass);
		if (objects[0].getClass().getSimpleName().equals("Room")) {
			Room _room = (Room)objects[0];
			dc.add(Restrictions.eq("status", _room.getStatus()));
			if (_room.getStatus() == 1) {
				String hql = "select r.roomid, r.name, r.price, r.category, r.status from Room r, Order o where r.roomid=o.room.roomid and o.user.userid=" + ((User)objects[1]).getUserid();
				List<Object[]> list = find(hql);
				List<Room> rooms = new ArrayList<>();
				for (Object[] objects2 : list) {
					Room tmp = new Room();
					tmp.setRoomid((int) objects2[0]);
					tmp.setName((String) objects2[1]);
					tmp.setPrice((double) objects2[2]);
					tmp.setCategory((String) objects2[3]);
					tmp.setStatus((int) objects2[4]);
					rooms.add(tmp);
				}
				return (List<T>) rooms;
			}
		}
		else if (objects[0].equals("Tourist")) {
			dc.add(Restrictions.eq("address", objects[1]));
			dc.add(Restrictions.eq("category", objects[2]));
			String order_type = (String) objects[4];
			if (order_type != null && !order_type.equals("")) {
				if (order_type.equals("desc")) {
					if (objects[3] != null && !objects[3].equals("")) {
						dc.addOrder(Order.desc((String) objects[3]));
					}
				}
				else {
					if (objects[3] != null && !objects[3].equals("")) {
						dc.addOrder(Order.asc((String) objects[3]));
					}
				}
			}
			return findByCriteria(dc);
		}
		else {
			for (Object object : objects) {
				dc.add(Restrictions.eq(object.getClass().getSimpleName().toLowerCase(), object));
			}
		}
		return findByCriteria(dc, pageInfo.getStart(), pageInfo.getCount());
	}
	@Override
	public T getByParameters(Object... objects) {
		// TODO Auto-generated method stub
		DetachedCriteria dc = DetachedCriteria.forClass(oriClass);
		if (objects[0].getClass().getSimpleName().equals("Order")) {
			cn.hncj.hotel.entity.Order order = (cn.hncj.hotel.entity.Order) objects[0];
			System.out.println(order.getRoom());
			System.out.println(order.getUser());
			dc.add(Restrictions.eq("user.userid", order.getUser().getUserid()));
			dc.add(Restrictions.eq("room.roomid", order.getRoom().getRoomid()));
			dc.addOrder(Order.desc("createDate"));
		}
		List<T> list = findByCriteria(dc);
		System.out.println(list);
		if (list != null) {
			return (T)list.get(0);
		}
		return null;
	}
	@Override
	public int total(int wtf, Object... objects) {
		// TODO Auto-generated method stub
		String hql = "select count(*) from " + oriClass.getSimpleName();
		if (objects[0] != null && objects[0].equals("Tourist")) {
			if (objects[1] != null && objects[1] != null) {
				hql += " address = '" + (String)objects[1] + "'";
				if (objects[2] != null && objects[2] != null) {
					hql += " address = '" + (String)objects[1] + "' and category = '" + objects[2] + "'";
				}
			}
		}
		List<Long> list = find(hql);
		if (list != null) {
			return list.get(0).intValue();
		}
		return 0;
	}
	

}
