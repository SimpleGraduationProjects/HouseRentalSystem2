package com.service;

import java.util.List;
import java.util.Map;

import com.dao.*;
import com.model.*;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service("user")
public class UserService {
    @Resource
    private UserDao userDao;


    @Resource
    private EducationDao educationDao;

    @Resource
    private NationalDao nationalDao;


    //select使用 民族
    public List<National> getNationals() {
        return nationalDao.searchEntity(null);
    }

    //select使用 学历
    public List<Education> getEducation() {
        return educationDao.searchEntity(null);
    }


    //保存到数据库
    public void saveEntity(User user) {
        userDao.saveEntity(user);
    }


    //更新数据库
    public void updateEntity(User user) {
        userDao.updateEntity(user);
    }

    //获取单条数据
    public User getUserById(Integer id) {
        return userDao.getEntityById(id);
    }

    //列表显示
    public List<User> getList(Map<String, Object> params) {
        return userDao.searchEntity(params);
    }


    /**
     * 统计
     * 查询分页统计方法
     *
     * @param params
     * @return
     */
    public int getCount(Map<String, Object> params) {
        return userDao.count(params);
    }


    //删除
    public void deleteEntity(Integer id) {
        userDao.deleteEntity(id);
    }


    public User userLogin(Map<String, Object> map) {
        return userDao.userLogin(map);
    }

}
