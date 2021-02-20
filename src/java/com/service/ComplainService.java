package com.service;

import com.dao.ComplainDao;
import com.model.Complain;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;


@Service("complain")
public class ComplainService {


    @Resource
    private ComplainDao complainDao;



    //列表显示
    public List<Complain> getList(Map<String, Object> params) {
        return complainDao.searchEntity(params);
    }

    /**
     * 统计
     * 查询分页统计方法
     *
     * @param params
     * @return
     */
    public int getCount(Map<String, Object> params) {
        return complainDao.count(params);
    }


    //保存到数据库
    public void saveEntity(Complain complain) {
        complainDao.saveEntity(complain);
    }

    //更新数据库
    public void updateEntity(Complain complain) {
        complainDao.updateEntity(complain);
    }

    //获取单条数据
    public Complain getEntityById(Integer id) {
        return complainDao.getEntityById(id);
    }

    //删除
    public void deleteEntity(Integer id) {
        complainDao.deleteEntity(id);
    }

}
