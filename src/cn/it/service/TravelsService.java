package cn.it.service;
import java.util.List;

import cn.it.model.Travels;



public interface TravelsService {
    public Travels inserttravels(Travels u);
    public List<Travels> findAll();
    public List<Travels> findAllbytitle(String title);
    public Travels deletetravels(int travelsId);
    public Travels findbyId(int travelsId);
    public void insertdel(int id,int del);
    public void insertComment(int id,int count);
}
