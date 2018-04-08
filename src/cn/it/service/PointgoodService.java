package cn.it.service;

import cn.it.model.Pointgood;


public interface PointgoodService {
	public Pointgood insertpointgood(Pointgood u);
	public int showpointgood(int classId,String classt);
	public int showpointgoodnum(int classId,int userId,String classt);
	public void deletebyid(int classId,int userId,String classt);
}
