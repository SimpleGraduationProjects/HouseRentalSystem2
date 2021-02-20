package com.dao;

import com.model.Complain;

import java.util.List;
import java.util.Map;

public interface ComplainDao {
    //保存到数据库
    void saveEntity(Complain complain);

    //列表显示
    List<Complain> searchEntity(Map<String, Object> params);


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
    void updateEntity(Complain complain);

    //获取单条数据
    Complain getEntityById(Integer id);

}