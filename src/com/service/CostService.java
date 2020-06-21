package com.service;

import com.dao.CostDao;
import com.model.Cost;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;


@Service("cost")
public class CostService {


    @Resource
    private CostDao costDao;



    //列表显示
    public List<Cost> getList(Map<String, Object> params) {
        return costDao.searchEntity(params);
    }

    /**
     * 统计
     * 查询分页统计方法
     *
     * @param params
     * @return
     */
    public int getCount(Map<String, Object> params) {
        return costDao.count(params);
    }


    //保存到数据库
    public void saveEntity(Cost cost) {
        costDao.saveEntity(cost);
    }

    //更新数据库
    public void updateEntity(Cost cost) {
        costDao.updateEntity(cost);
    }

    //获取单条数据
    public Cost getEntityById(Integer id) {
        return costDao.getEntityById(id);
    }

    //删除
    public void deleteEntity(Integer id) {
        costDao.deleteEntity(id);
    }

}
