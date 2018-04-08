package cn.it.model;

public class Collect {
	private int collectId;
	private int userId;
	private int classId;
	private String classt;
	public String getClasst() {
		return classt;
	}
	public void setClasst(String classt) {
		this.classt = classt;
	}
	private String UpdateTime;
	private int del;
	public int getCollectId() {
		return collectId;
	}
	public void setCollectId(int collectId) {
		this.collectId = collectId;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public int getClassId() {
		return classId;
	}
	public void setClassId(int classId) {
		this.classId = classId;
	}

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

}
