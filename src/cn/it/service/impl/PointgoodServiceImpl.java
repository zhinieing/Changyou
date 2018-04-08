package cn.it.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.it.dao.PointgoodDao;

import cn.it.model.Pointgood;
import cn.it.service.PointgoodService;
@Service("pointgoodService")
public class PointgoodServiceImpl implements PointgoodService{
	@Autowired
	private PointgoodDao pointgoodDao;
	public Pointgood insertpointgood(Pointgood u) {
		pointgoodDao.PointgoodAdd(u);
		return null;
	}
	public int showpointgood(int classId,String classt){
		int a = pointgoodDao.getpointgoodcount(classId, classt);
		return a;
	}
	public int showpointgoodnum(int classId,int userId,String classt){
		int a = pointgoodDao.getpointgood(classId,userId, classt);
		return a;
	}
	public void deletebyid(int classId,int userId,String classt){
		pointgoodDao.deletebyId(classId, userId, classt);
	}
}
