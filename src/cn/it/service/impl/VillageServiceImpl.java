package cn.it.service.impl;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import cn.it.dao.VillageDao;
import cn.it.model.Village;
import cn.it.service.VillageService;
@Service("villageService")
public class VillageServiceImpl implements VillageService {
	@Autowired
	private VillageDao villageDao;
	public List<Village> findAll(){
		List<Village> villagelist =  villageDao.findAll();
		return villagelist;
	}
	public Village findbyid(int villageId){
		Village village = villageDao.findbyid(villageId);
		return village;
	}
	public void insertcount(int villageId,int count){
		villageDao.updatebyid(villageId, count);
	}
	public void insertcollect(int villageId,int count){
		villageDao.updatebyid1(villageId, count);
	}
	@Override
	public void insertVillagePoint(float point, String villageTitle) {
		// TODO Auto-generated method stub
		villageDao.VillagePointAdd(point, villageTitle);
	}
}
