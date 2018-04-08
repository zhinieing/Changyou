package cn.it.dao;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.it.model.Village;
public interface VillageDao {
	public List<Village> findAll();
	public Village findbyid(int villageId);
	public void VillagePointAdd(@Param("point") float point,@Param("villageTitle") String villageTitle);
	public void updatebyid(@Param("villageId") int villageId,@Param("villageCount") int count);
	public void updatebyid1(@Param("villageId") int villageId,@Param("villageCollect") int villageCollect);
}
