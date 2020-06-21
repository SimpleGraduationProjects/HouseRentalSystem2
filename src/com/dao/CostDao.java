package com.dao;

import com.model.Cost;
import com.model.Cost;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

public interface CostDao {
    //保存到数据库
    void saveEntity(Cost cost);

    //列表显示
    List<Cost> searchEntity(Map<String, Object> params);


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
    void updateEntity(Cost cost);

    //获取单条数据
    Cost getEntityById(Integer id);

}