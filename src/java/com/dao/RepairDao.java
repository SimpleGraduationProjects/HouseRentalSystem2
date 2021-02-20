package com.dao;

import com.model.Repair;

import java.util.List;
import java.util.Map;

public interface RepairDao {
    //保存到数据库
    void saveEntity(Repair repair);

    //列表显示
    List<Repair> searchEntity(Map<String, Object> params);


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
    void updateEntity(Repair repair);

    //获取单条数据
    Repair getEntityById(Integer id);

}