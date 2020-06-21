package com.service;

import com.dao.RepairDao;
import com.model.Repair;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;


@Service("repair")
public class RepairService {


    @Resource
    private RepairDao repairDao;



    //列表显示
    public List<Repair> getList(Map<String, Object> params) {
        return repairDao.searchEntity(params);
    }

    /**
     * 统计
     * 查询分页统计方法
     *
     * @param params
     * @return
     */
    public int getCount(Map<String, Object> params) {
        return repairDao.count(params);
    }


    //保存到数据库
    public void saveEntity(Repair repair) {
        repairDao.saveEntity(repair);
    }

    //更新数据库
    public void updateEntity(Repair repair) {
        repairDao.updateEntity(repair);
    }

    //获取单条数据
    public Repair getEntityById(Integer id) {
        return repairDao.getEntityById(id);
    }

    //删除
    public void deleteEntity(Integer id) {
        repairDao.deleteEntity(id);
    }

}
