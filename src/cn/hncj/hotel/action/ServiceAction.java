package cn.hncj.hotel.action;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;

import cn.hncj.hotel.service.AdminService;
import cn.hncj.hotel.service.OrderService;
import cn.hncj.hotel.service.RoomService;
import cn.hncj.hotel.service.UserService;

public class ServiceAction extends EntityAction{
//	@Resource(name = "userService")
	@Autowired
	protected UserService userService;
	
//	@Resource(name = "adminService")
	@Autowired
	protected AdminService adminService;
	
//	@Resource(name = "roomService")
	@Autowired
	protected RoomService roomService;
	
//	@Resource(name = "orderService")
	@Autowired
	protected OrderService orderService;

	public UserService getUserService() {
		return userService;
	}

	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	public AdminService getAdminService() {
		return adminService;
	}

	public void setAdminService(AdminService adminService) {
		this.adminService = adminService;
	}

	public RoomService getRoomService() {
		return roomService;
	}

	public void setRoomService(RoomService roomService) {
		this.roomService = roomService;
	}

	public OrderService getOrderService() {
		return orderService;
	}

	public void setOrderService(OrderService orderService) {
		this.orderService = orderService;
	}
}
