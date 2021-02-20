package com.service;

import com.dao.CustomerDao;
import com.model.Customer;
import com.model.User;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;


@Service("customer")
public class CustomerService {


    @Resource
    private CustomerDao customerDao;



    //列表显示
    public List<Customer> getList(Map<String, Object> params) {
        return customerDao.searchEntity(params);
    }

    /**
     * 统计
     * 查询分页统计方法
     *
     * @param params
     * @return
     */
    public int getCount(Map<String, Object> params) {
        return customerDao.count(params);
    }


    //保存到数据库
    public void saveEntity(Customer customer) {
        customerDao.saveEntity(customer);
    }

    //更新数据库
    public void updateEntity(Customer customer) {
        customerDao.updateEntity(customer);
    }

    //获取单条数据
    public Customer getEntityById(Integer id) {
        return customerDao.getEntityById(id);
    }

    //删除
    public void deleteEntity(Integer id) {
        customerDao.deleteEntity(id);
    }




    public Customer customerLogin(Map<String, Object> map) {
        return customerDao.customerLogin(map);
    }


}
