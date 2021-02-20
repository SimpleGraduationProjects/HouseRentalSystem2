package com.dao;

import java.util.List;
import java.util.Map;

import com.model.User;


public interface UserDao {
    //保存到数据库
    void saveEntity(User user);

    //列表显示
    List<User> searchEntity(Map<String, Object> params);

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
    void updateEntity(User user);

    //获取单条数据
    User getEntityById(Integer id);


    //登录
    User userLogin(Map<String, Object> map);

}