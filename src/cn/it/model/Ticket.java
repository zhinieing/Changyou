package cn.it.model;

public class Ticket {
	private String spotName;
	private String typeofticket;
	private String priceofticket;
	private String policy;
	private String wayofpayment;
	private int ticketId;
	
	public int getTicketId() {
		return ticketId;
	}
	public void setTicketId(int ticketId) {
		this.ticketId = ticketId;
	}
	public String getSpotName() {
		return spotName;
	}
	public void setSpotName(String spotName) {
		this.spotName = spotName;
	}
	public String getTypeofticket() {
		return typeofticket;
	}
	public void setTypeofticket(String typeofticket) {
		this.typeofticket = typeofticket;
	}
	public String getPriceofticket() {
		return priceofticket;
	}
	public void setPriceofticket(String priceofticket) {
		this.priceofticket = priceofticket;
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
