package cn.hncj.hotel.action;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.apache.struts2.json.annotations.JSON;
import org.apache.struts2.json.annotations.JSONParameter;

import cn.hncj.hotel.entity.Admin;
import cn.hncj.hotel.entity.Order;
import cn.hncj.hotel.entity.Room;
import cn.hncj.hotel.entity.User;

public class EntityAction extends PaginationAction{
	/**
	 * 
	 */
	String result;
	String userresult;
	
	String destination;
	String datein;
	String dateout;
	String keywords;
	String orderRoomByCol;
	String orderRules;
	
	private static final long serialVersionUID = 1L;
	User user;
	List<User> users;
	protected Order order;
	List<Order> orders;
	
	Room room;
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	
	public Order getOrder() {
		return order;
	}
	public void setOrder(Order order) {
		this.order = order;
	}
	public Room getRoom() {
		return room;
	}
	public void setRoom(Room room) {
		this.room = room;
	}
	public Admin getAdmin() {
		return admin;
	}
	public void setAdmin(Admin admin) {
		this.admin = admin;
	}
	List<Room> rooms;
	Admin admin;
	List<Admin> admins;
	public List<User> getUsers() {
		return users;
	}
	public void setUsers(List<User> users) {
		this.users = users;
	}
	public List<Order> getOrders() {
		return orders;
	}
	public void setOrders(List<Order> orders) {
		this.orders = orders;
	}
	public List<Room> getRooms() {
		return rooms;
	}
	public void setRooms(List<Room> rooms) {
		this.rooms = rooms;
	}
	public List<Admin> getAdmins() {
		return admins;
	}
	public void setAdmins(List<Admin> admins) {
		this.admins = admins;
	}
	public String getResult() {
		return result;
	}
	public void setResult(String result) {
		this.result = result;
	}
	public String getUserresult() {
		return userresult;
	}
	public void setUserresult(String userresult) {
		this.userresult = userresult;
	}
	public String getDestination() {
		return destination;
	}
	public void setDestination(String destination) {
		this.destination = destination;
	}
	public String getDatein() {
		return datein;
	}
	public void setDatein(String datein) {
		this.datein = datein;
	}
	public String getDateout() {
		return dateout;
	}
	public void setDateout(String dateout) {
		this.dateout = dateout;
	}
	public String getKeywords() {
		return keywords;
	}
	public void setKeywords(String keywords) {
		this.keywords = keywords;
	}
	public String getOrderRoomByCol() {
		return orderRoomByCol;
	}
	public void setOrderRoomByCol(String orderRoomByCol) {
		this.orderRoomByCol = orderRoomByCol;
	}
	public String getOrderRules() {
		return orderRules;
	}
	public void setOrderRules(String orderRules) {
		this.orderRules = orderRules;
	}
}
