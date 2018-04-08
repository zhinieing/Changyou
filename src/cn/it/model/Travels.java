package cn.it.model;

public class Travels {
	private int travelsId;
	private String travelsClass;
	private String travelsPlace;
	private String travelsContent;
	private int del;
	private String UpdateTime;
	private String travelsTitle;
	private String travelsWriter;
	private int travelsCount;
	private int travelsCollect;
	private int travelsComment;
	
	public int getTravelsId() {
		return travelsId;
	}
	public int getTravelsCount() {
		return travelsCount;
	}
	public void setTravelsCount(int travelsCount) {
		this.travelsCount = travelsCount;
	}
	public int getTravelsCollect() {
		return travelsCollect;
	}
	public void setTravelsCollect(int travelsCollect) {
		this.travelsCollect = travelsCollect;
	}
	public int getTravelsComment() {
		return travelsComment;
	}
	public void setTravelsComment(int travelsComment) {
		this.travelsComment = travelsComment;
	}
	public void setTravelsId(int travelsId) {
		this.travelsId = travelsId;
	}
	public String getTravelsClass() {
		return travelsClass;
	}
	public void setTravelsClass(String travelsClass) {
		this.travelsClass = travelsClass;
	}
	public String getTravelsPlace() {
		return travelsPlace;
	}
	public void setTravelsPlace(String travelsplace) {
		this.travelsPlace = travelsplace;
	}
	public String getTravelsContent() {
		return travelsContent;
	}
	public void setTravelsContent(String travelsContent) {
		this.travelsContent = travelsContent;
	}
	public int getDel() {
		return del;
	}
	public void setDel(int del) {
		this.del = del;
	}
	public String getUpdateTime() {
		return UpdateTime;
	}
	public void setUpdateTime(String updateTime) {
		UpdateTime = updateTime;
	}
	public void setTravelsTitle(String travelsTitle) {
		this.travelsTitle = travelsTitle;
	}
	public String getTravelsTitle() {
		return travelsTitle;
	}
	public void setTravelsWriter(String travelsWriter) {
		this.travelsWriter = travelsWriter;
	}
	public String getTravelsWriter() {
		return travelsWriter;
	}

}
