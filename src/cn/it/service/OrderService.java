package cn.it.service;

import cn.it.model.Order;

public interface OrderService {
	public void insertOrder(Order o);
	public void insertdelOrder(int id,int del);
	public void deleteOrder(int id);
	public Order findbyid(int id);
}
