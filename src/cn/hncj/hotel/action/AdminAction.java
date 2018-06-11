package cn.hncj.hotel.action;

import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;

import com.opensymphony.xwork2.ActionContext;

import cn.hncj.hotel.entity.Admin;
import cn.hncj.hotel.utils.PageInfo;

public class AdminAction extends ResultAction{
	@Action("admin_list_user")
	public String list_user() {
		if (pageInfo == null) {
			pageInfo = new PageInfo();
		}
		pageInfo.setTotal(userService.total(null));
		users = userService.listByPageInfo(pageInfo);
		return "listUser";
	}
	@Action("admin_edit_user")
	public String edit_user() {
		user = userService.getById(user.getUserid());
		return "editUserProperty";
	}
	@Action("admin_delete_user")
	public String delete_user() {
		user = userService.getById(user.getUserid());
		System.out.println(user);
		userService.delete(user);
		return "findUserByAdmin";
	}
	@Action("admin_update_user")
	public String update_user() {
		userService.update(user);
		return "findUserByAdmin";
	}
	@Action("admin_clear_session")
	public String clear_session() {
		try {
			ActionContext.getContext().getSession().remove("admin");
			this.setResult("success");
		} catch (Exception e) {
			// TODO: handle exception
			this.setResult("fail");
			return "clear_session_failed";
		}
		return "clear_session_success";
	}
	
	@Action("admin_list_order")
	public String list_order() {
		if (pageInfo == null) {
			pageInfo = new PageInfo();
		}
		pageInfo.setTotal(orderService.total(null));
		orders = orderService.listByPageInfo(pageInfo);
		return "listOrder";
	}
	@Action("admin_edit_order")
	public String edit_order() {
		order = orderService.getById(order.getOrderid());
		return "editOrderProperty";
	}
	@Action("admin_delete_order")
	public String delete_order() {
		order = orderService.getById(order.getOrderid());
		System.out.println(order);
		orderService.delete(order);
		return "findOrderByAdmin";
	}
	@Action("admin_update_order")
	public String update_order() {
		try {
			orderService.update(order);
		} catch (Exception e) {
			// TODO: handle exception
			ActionContext.getContext().getSession().put("msg", "±‡º≠ ß∞‹");
			return "showEditOrderError";
		}
		return "findOrderByAdmin";
	}
	@Action("admin_add_order")
	public String add_order() {
		try {
			String tmp = order.getCreateDate();
			Calendar calendar = Calendar.getInstance();
			calendar.setTimeInMillis(Long.parseLong(tmp));
			StringBuffer sb = new StringBuffer();
			sb.append(calendar.get(Calendar.YEAR) + "-" + (calendar.get(Calendar.MONTH) + 1) + "-" + calendar.get(Calendar.DAY_OF_MONTH) + " " + calendar.get(Calendar.HOUR_OF_DAY) + ":" + calendar.get(Calendar.MINUTE) + ":" + calendar.get(Calendar.SECOND));
			System.out.println(sb);
			order.setCreateDate(sb.toString());
			orderService.save(order);
		} catch (Exception e) {
			// TODO: handle exception
			ActionContext.getContext().getSession().put("msg", "ÃÌº” ß∞‹");
			return "showAddOrderError";
		}
		return "findOrderByAdmin";
	}
	
	@Action("admin_list_room")
	public String list_room() {
		if (pageInfo == null) {
			pageInfo = new PageInfo();
		}
		pageInfo.setTotal(roomService.total(null));
		rooms = roomService.listByPageInfo(pageInfo);
		return "listRoom";
	}
	@Action("admin_edit_room")
	public String edit_room() {
		room = roomService.getById(room.getRoomid());
		return "editRoomProperty";
	}
	@Action("admin_delete_room")
	public String delete_room() {
		room = roomService.getById(room.getRoomid());
		System.out.println(room);
		roomService.delete(room);
		return "findRoomByAdmin";
	}
	@Action("admin_update_room")
	public String update_room() {
		try {
			roomService.update(room);
		} catch (Exception e) {
			// TODO: handle exception
			ActionContext.getContext().getSession().put("msg", "±‡º≠ ß∞‹");
			return "showEditRoomError";
		}
		return "findRoomByAdmin";
	}
	@Action("admin_add_room")
	public String add_room() {
		try {
			roomService.save(room);
		} catch (Exception e) {
			// TODO: handle exception
			ActionContext.getContext().getSession().put("msg", "ÃÌº” ß∞‹");
			return "showAddRoomError";
		}
		return "findRoomByAdmin";
	}
}
