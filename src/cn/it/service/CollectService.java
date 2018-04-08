package cn.it.service;

import cn.it.model.Collect;

public interface CollectService {
	public void insertcollect(Collect u);
	public void deletebyid(int classId,int userId,String classt);
	public int showcollect(int classId,String classt);
	public int showcollectnum(int classId,int userId,String classt);
}
