package cn.it.dao;

import org.apache.ibatis.annotations.Param;

import cn.it.model.Collect;

public interface CollectDao {
	public void CollectAdd(Collect u);
	public int getcollectcount(@Param("classId") int classId,@Param("classt") String classt);
	public int getcollect(@Param("classId")int classId,@Param("userId")int userId,@Param("classt")String classt);
	public void deletebyId(@Param("classId")int classId,@Param("userId")int userId,@Param("classt")String classt);
}
