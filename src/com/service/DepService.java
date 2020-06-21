package com.service;

import com.dao.*;
import com.model.*;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;


@Service("dep")
public class DepService {

    @Resource
    private DeptDao deptDao;


    //select使用 	//列表显示
    public List<Dept> getList(Map<String, Object> params) {
        return deptDao.searchEntity(params);
    }

    /**
     * 统计
     * 查询分页统计方法
     *
     * @param params
     * @return
     */
    public int getCount(Map<String, Object> params) {
        return deptDao.count(params);
    }

    //保存到数据库
    public void saveEntity(Dept dept) {
        deptDao.saveEntity(dept);
    }

    //更新数据库
    public void updateEntity(Dept dept) {
        deptDao.updateEntity(dept);
    }

    //获取单条数据
    public Dept getEntityById(Integer id) {
        return deptDao.getEntityById(id);
    }

    //删除
    public void deleteEntity(Integer id) {
        deptDao.deleteEntity(id);
    }


}
