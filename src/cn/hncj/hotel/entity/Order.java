package cn.hncj.hotel.entity;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="hotel_order")
public class Order {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="orderid")
	int orderid;
	
	@ManyToOne(cascade = CascadeType.REFRESH, optional = false)
	@JoinColumn(name = "roomid", referencedColumnName="roomid")
	Room room;
	
	@ManyToOne(cascade = CascadeType.REFRESH, optional = false)
	@JoinColumn(name = "userid", referencedColumnName="userid")
	User user;
	
	
	String createDate;
	public int getOrderid() {
		return orderid;
	}

	public void setOrderid(int orderid) {
		this.orderid = orderid;
	}

	public Room getRoom() {
		return room;
	}

	public void setRoom(Room room) {
		this.room = room;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public String getCreateDate() {
		return createDate;
	}

	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}
	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return "Order [ id = " + orderid + " ]";
	}
}
