package com.dao;

import com.model.Dept;

import java.util.List;
import java.util.Map;

public interface DeptDao {
    //保存到数据库
    void saveEntity(Dept dept);

    //列表显示
    List<Dept> searchEntity(Map<String, Object> params);
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
    void updateEntity(Dept dept);

    //获取单条数据
    Dept getEntityById(Integer id);
}