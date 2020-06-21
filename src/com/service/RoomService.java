package com.service;

import com.dao.RoomDao;
import com.model.Room;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;


@Service("room")
public class RoomService {


    @Resource
    private RoomDao roomDao;



    //列表显示
    public List<Room> getList(Map<String, Object> params) {
        return roomDao.searchEntity(params);
    }

    /**
     * 统计
     * 查询分页统计方法
     *
     * @param params
     * @return
     */
    public int getCount(Map<String, Object> params) {
        return roomDao.count(params);
    }


    //保存到数据库
    public void saveEntity(Room room) {
        roomDao.saveEntity(room);
    }

    //更新数据库
    public void updateEntity(Room room) {
        roomDao.updateEntity(room);
    }

    //获取单条数据
    public Room getEntityById(Integer id) {
        return roomDao.getEntityById(id);
    }

    //删除
    public void deleteEntity(Integer id) {
        roomDao.deleteEntity(id);
    }

    public void updateRoomDeleteCustomer(Integer id){
        roomDao.updateRoomDeleteCustomer(id);
    };


}
