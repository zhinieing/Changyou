package cn.it.dao;

import org.apache.ibatis.annotations.Param;

import cn.it.model.Order;

public interface OrderDao {
	public void OrderAdd(Order o);	
	public void OrderdelAdd(@Param("orderId") int orderId,@Param("del") int del);
	public void deletebyid(@Param("orderId") int orderId);
	public Order findbyid(@Param("orderId") int orderId);

}
