package cn.it.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.it.dao.CollectDao;
import cn.it.model.Collect;
import cn.it.service.CollectService;

@Service("collectService")
public class CollectServiceImpl implements CollectService{
	@Autowired
	private CollectDao collectDao;
	public void insertcollect(Collect u) {
		collectDao.CollectAdd(u);
	}
	public void deletebyid(int classId,int userId,String classt){
		collectDao.deletebyId(classId, userId, classt);
	}
	public int showcollect(int classId,String classt){
		int a = collectDao.getcollectcount(classId, classt);
		return a;
	}
	public int showcollectnum(int classId,int userId,String classt){
		int a = collectDao.getcollect(classId,userId, classt);
		return a;
	}

}
