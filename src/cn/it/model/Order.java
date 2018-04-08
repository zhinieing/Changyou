package cn.it.model;

public class Order {
	private int orderId;
	private String orderName;
	private String address;
	private String theme;
	private String type;
	private int price;
	private String wayofpayment;
	private int number;
	private int total;
	private int useraId;
	private int userbId;
	private int del;
	private String UpdateTime;
	public String getUpdateTime() {
		return UpdateTime;
	}
	public void setUpdateTime(String updateTime) {
		UpdateTime = updateTime;
	}
	public int getDel() {
		return del;
	}
	public void setDel(int del) {
		this.del = del;
	}
	public int getOrderId() {
		return orderId;
	}
	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}
	public String getOrderName() {
		return orderName;
	}
	public void setOrderName(String orderName) {
		this.orderName = orderName;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getTheme() {
		return theme;
	}
	public void setTheme(String theme) {
		this.theme = theme;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getWayofpayment() {
		return wayofpayment;
	}
	public void setWayofpayment(String wayofpayment) {
		this.wayofpayment = wayofpayment;
	}
	public int getNumber() {
		return number;
	}
	public void setNumber(int number) {
		this.number = number;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public int getUseraId() {
		return useraId;
	}
	public void setUseraId(int useraId) {
		this.useraId = useraId;
	}
	public int getUserbId() {
		return userbId;
	}
	public void setUserbId(int userbId) {
		this.userbId = userbId;
	}

}
