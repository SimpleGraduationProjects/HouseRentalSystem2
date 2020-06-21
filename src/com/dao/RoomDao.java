package com.dao;

import com.model.Room;

import java.util.List;
import java.util.Map;

public interface RoomDao {

     //保存到数据库
     void saveEntity(Room room);

     //列表显示
     List<Room> searchEntity(Map<String, Object> params);


     /**
     * 统计
     *
     * @param params Map<String,Object>
     * @return
     */
    public int count(Map<String, Object> params);



    //删除
    void deleteEntity(Integer id);


    //更新数据库
    void updateEntity(Room room);

    //获取单条数据
    Room getEntityById(Integer id);




    void updateRoomDeleteCustomer(Integer id);





}