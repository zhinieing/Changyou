package cn.it.model;

public class Room {
	private int roomId;
	private String hotelName;
	private String type;
	private String price;
	private String policy;
	private String wayofpayment;
	private int total;
	
	
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public int getRoomId() {
		return roomId;
	}
	public void setRoomId(int roomId) {
		this.roomId = roomId;
	}
	public String getHotelName() {
		return hotelName;
	}
	public void setHotelName(String hotelName) {
		this.hotelName = hotelName;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getPolicy() {
		return policy;
	}
	public void setPolicy(String policy) {
		this.policy = policy;
	}
	public String getWayofpayment() {
		return wayofpayment;
	}
	public void setWayofpayment(String wayofpayment) {
		this.wayofpayment = wayofpayment;
	}
	
	

}
