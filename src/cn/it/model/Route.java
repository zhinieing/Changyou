package cn.it.model;

public class Route {
    private int routeId;
    private String routeTitle;
    private String routePass;
    private String routeTitles;
    private String routePlace;
    private String routeContent;
    private String UpdateTime;
    private String routeWriter;
    private int del;
    private String routeImg;
    private int routeCount;
    private int routeCollect;
	public int getRouteCollect() {
		return routeCollect;
	}
	public void setRouteCollect(int routeCollect) {
		this.routeCollect = routeCollect;
	}
	public int getRouteCount() {
		return routeCount;
	}
	public void setRouteCount(int routeCount) {
		this.routeCount = routeCount;
	}
	public int getRouteId() {
		return routeId;
	}
	public void setRouteId(int routeId) {
		this.routeId = routeId;
	}
	public String getRouteTitle() {
		return routeTitle;
	}
	public void setRouteTitle(String routeTitle) {
		this.routeTitle = routeTitle;
	}
	public String getRoutePass() {
		return routePass;
	}
	public void setRoutePass(String routePass) {
		this.routePass = routePass;
	}
	public String getRouteTitles() {
		return routeTitles;
	}
	public void setRouteTitles(String routeTitles) {
		this.routeTitles = routeTitles;
	}
	public String getRoutePlace() {
		return routePlace;
	}
	public void setRoutePlace(String routePlace) {
		this.routePlace = routePlace;
	}
	public String getRouteContent() {
		return routeContent;
	}
	public void setRouteContent(String routeContent) {
		this.routeContent = routeContent;
	}
	public String getUpdateTime() {
		return UpdateTime;
	}
	public void setUpdateTime(String updateTime) {
		UpdateTime = updateTime;
	}
	public String getRouteWriter() {
		return routeWriter;
	}
	public void setRouteWriter(String routeWriter) {
		this.routeWriter = routeWriter;
	}
	public int getDel() {
		return del;
	}
	public void setDel(int del) {
		this.del = del;
	}
	public String getRouteImg() {
		return routeImg;
	}
	public void setRouteImg(String routeImg) {
		this.routeImg = routeImg;
	}
}
