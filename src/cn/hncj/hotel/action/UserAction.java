package cn.hncj.hotel.action;

import java.util.Calendar;
import java.util.List;

import org.apache.struts2.convention.annotation.Action;
import org.springframework.transaction.annotation.Transactional;

import com.opensymphony.xwork2.ActionContext;

import cn.hncj.hotel.entity.Order;
import cn.hncj.hotel.entity.User;
import cn.hncj.hotel.utils.PageInfo;

public class UserAction extends ResultAction{
	@Action("user_regist")
	public String regist_user() {
		try {
			int cnt = userService.save(user).intValue();
			if (cnt <= 0) {
				ActionContext.getContext().getSession().put("msg", "×¢²áÊ§°Ü");
				return "showRegistError";
			}
		} catch (Exception e) {
			// TODO: handle exception
			ActionContext.getContext().getSession().put("msg", "×¢²áÊ§°Ü");
			return "showRegistError";
		}
		ActionContext.getContext().getSession().put("msg", "×¢²á³É¹¦");
		return "user_login";
	}
	@Action("user_list_message")
	public String list_message() {
		user = userService.getById(user.getUserid());
		return "listMessage";
	}
	@Action("user_clear_session")
	public String clear_session() {
		try {
			ActionContext.getContext().getSession().remove("user");
			this.setUserresult("success");
		} catch (Exception e) {
			// TODO: handle exception
			this.setUserresult("fail");
			return "clear_usession_failed";
		}
		return "clear_usession_success";
	}
	
	@Action("user_list_room") 
	public String list_user_room() {
		if (pageInfo == null) {
			pageInfo = new PageInfo();
		}
		pageInfo.setTotal(roomService.total(null));
		rooms = roomService.listByPageInfo(pageInfo, room);
		return "listUserRoom";
	}
	@Action("user_list_booked_room") 
	public String list_user_booked_room() {
		try {
			if (pageInfo == null) {
				pageInfo = new PageInfo();
			}
			pageInfo.setTotal(roomService.total(null));
			rooms = roomService.listByPageInfo(pageInfo, room, (User)ActionContext.getContext().getSession().get("user"));
		} catch (Exception e) {
			// TODO: handle exception
		}
		return "listUserBookedRoom";
	}
	
	@Action("user_list_order")
	public String list_user_order(){
		try {
			user = userService.getById(((User) ActionContext.getContext().getSession().get("user")).getUserid());
			if (pageInfo == null) {
				pageInfo = new PageInfo();
			}
			pageInfo.setTotal(orderService.total(user));
			orders = (List<Order>) orderService.findEntity(user, pageInfo);
		} catch (Exception e) {
			// TODO: handle exception
		}
		return "listUserOrder";
	}
	@Transactional
	@Action("user_add_order")
	public String add_user_order() {
		try {
			String tmp = order.getCreateDate();
			Calendar calendar = Calendar.getInstance();
			calendar.setTimeInMillis(Long.parseLong(tmp));
			StringBuffer sb = new StringBuffer();
			sb.append(calendar.get(Calendar.YEAR) + "-" + (calendar.get(Calendar.MONTH) + 1) + "-" + calendar.get(Calendar.DAY_OF_MONTH) + " " + calendar.get(Calendar.HOUR_OF_DAY) + ":" + calendar.get(Calendar.MINUTE) + ":" + calendar.get(Calendar.SECOND));
			System.out.println(sb);
			order.setCreateDate(sb.toString());
			orderService.save(order);
			room = roomService.getById(order.getRoom().getRoomid());
			if (room.getStatus() != 0) {
				throw new Exception();
			}
			else {
				room.setStatus(1);
				roomService.update(room);
			}
		} catch (Exception e) {
			// TODO: handle exception
			ActionContext.getContext().getSession().put("msg", "Ô¤¶©Ê§°Ü");
			return "showUAddOrderError";
		}
		return "findOrderByUser";
	}
	@Transactional
	@Action("user_delete_order")
	public String delete_user_order() {
		try {
			room = roomService.getById(room.getRoomid());
			order.setRoom(room);
			order.setUser((User)ActionContext.getContext().getSession().get("user"));
			order = orderService.getByParameters(order);
			System.out.println(order);
			orderService.delete(order);
			room.setStatus(0);
			roomService.update(room);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			ActionContext.getContext().getSession().put("msg", "ÍË¶©Ê§°Ü");
			return "showUDeleteOrderError";
		}
		return "findBookedRoomByUser";
	}
}
