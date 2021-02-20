package com.dao;

import com.model.Customer;
import com.model.Customer;

import java.util.List;
import java.util.Map;

import com.model.User;
import org.apache.ibatis.annotations.Param;

public interface CustomerDao {
    //保存到数据库
    void saveEntity(Customer customer);

    //列表显示
    List<Customer> searchEntity(Map<String, Object> params);


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
    void updateEntity(Customer customer);

    //获取单条数据
    Customer getEntityById(Integer id);
    //登录
    Customer customerLogin(Map<String, Object> map);

}