package com.dao;

import com.model.Floor;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

public interface FloorDao {
    //保存到数据库
    void saveEntity(Floor floor);

    //列表显示
    List<Floor> searchEntity(Map<String, Object> params);


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
    void updateEntity(Floor floor);

    //获取单条数据
    Floor getEntityById(Integer id);

}