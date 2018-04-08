package cn.it.service;

import java.util.List;

import cn.it.model.Spot;
import cn.it.model.Ticket;

public interface SpotService {
    public List<Ticket> findAll();
    public List<Ticket> findMinPrice();
    public Spot findBySpotName(String spotName);
    public void insertSpotPoint(float point, String spotName);
    public List<Spot> findMaxPoint();
}
