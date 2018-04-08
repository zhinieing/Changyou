package cn.it.service;
import java.util.List;

import cn.it.model.Village;
public interface VillageService {
    public List<Village> findAll();
    public Village findbyid(int villageId);
    public void insertVillagePoint(float point, String villageTitle);
    public void insertcount(int villageId,int count);
    public void insertcollect(int villageId,int count);
}
