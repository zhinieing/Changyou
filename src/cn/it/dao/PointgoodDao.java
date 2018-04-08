package cn.it.dao;

import org.apache.ibatis.annotations.Param;

import cn.it.model.Pointgood;

public interface PointgoodDao {
	public void PointgoodAdd(Pointgood u);
	public int getpointgoodcount(@Param("classId") int classId,@Param("classt") String classt);
	public int getpointgood(@Param("classId")int classId,@Param("userId")int userId,@Param("classt")String classt);
	public void deletebyId(@Param("classId")int classId,@Param("userId")int userId,@Param("classt")String classt);
}
