package cn.hncj.hotel.action;

import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;

@Namespace("/")
@ParentPackage("basic")
@Results({
	@Result(name = "RuntimeException", location = "/error.jsp"),
	
	@Result(name = "clear_session_success", type = "json", params = {"root", "result"}),
	@Result(name = "clear_session_failed", type = "json", params = {"root", "result"}),
	
	@Result(name = "clear_usession_success", type = "json", params = {"root", "userresult"}),
	@Result(name = "clear_usession_failed", type = "json", params = {"root", "userresult"}),
	
	@Result(name = "listUserIndex", location = "/user/userIndex.jsp"),
	@Result(name = "showUserLoginError", type = "redirect", location = "/user/login.jsp"),
	@Result(name = "showAdminLoginError", type = "redirect", location = "/admin/admin_login.jsp"),
	@Result(name = "showRegistError", type = "redirect", location = "/user/regist.jsp"),
	@Result(name = "user_login", type = "redirect", location = "/user/login.jsp"),
	
	@Result(name = "listUser", location = "/admin/listUser.jsp"),
	@Result(name = "findUserByAdmin", type = "redirect", location = "/admin_list_user"),
	@Result(name = "editUserProperty", location = "/admin/editUser.jsp"),
	
	@Result(name = "showEditOrderError", type = "redirect", location = "/admin/editOrder.jsp"),
	@Result(name = "showAddOrderError", type = "redirect", location = "/admin_list_order"),
	@Result(name = "listOrder", location = "/admin/listOrder.jsp"),
	@Result(name = "findOrderByAdmin", type = "redirect", location = "/admin_list_order"),
	@Result(name = "editOrderProperty", location = "/admin/editOrder.jsp"),
	
	@Result(name = "showEditRoomError", type = "redirect", location = "/admin/editRoom.jsp"),
	@Result(name = "showAddRoomError", type = "redirect", location = "/admin_list_room"),
	@Result(name = "listRoom", location = "/admin/listRoom.jsp"),
	@Result(name = "findRoomByAdmin", type = "redirect", location = "/admin_list_room"),
	@Result(name = "editRoomProperty", location = "/admin/editRoom.jsp"),
	
	@Result(name = "listMessage", location = "/user/userIndex.jsp"),
	@Result(name = "listUserOrder", location = "/user/listOrder.jsp"),
	@Result(name = "listUserRoom", location = "/user/listRoom.jsp"),
	@Result(name = "listUserBookedRoom", location = "/user/listBookedRoom.jsp"),
	@Result(name = "showUAddOrderError", type = "redirect", location = "/user_list_room?room.status=0"),
	@Result(name = "findOrderByUser", type = "redirect", location = "/user_list_order"),
	@Result(name = "showUDeleteOrderError", type = "redirect", location = "/user_list_booked_room?room.status=1"),
	@Result(name = "findBookedRoomByUser", type = "redirect", location = "/user_list_booked_room?room.status=1"),
	
	@Result(name = "listRoomByTour", location = "/index.jsp"),
})
public class ResultAction extends ServiceAction {

}
