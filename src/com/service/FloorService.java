package com.service;

import com.dao.FloorDao;
import com.model.Floor;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;


@Service("floor")
public class FloorService {


    @Resource
    private FloorDao floorDao;



    //列表显示
    public List<Floor> getList(Map<String, Object> params) {
        return floorDao.searchEntity(params);
    }

    /**
     * 统计
     * 查询分页统计方法
     *
     * @param params
     * @return
     */
    public int getCount(Map<String, Object> params) {
        return floorDao.count(params);
    }


    //保存到数据库
    public void saveEntity(Floor floor) {
        floorDao.saveEntity(floor);
    }

    //更新数据库
    public void updateEntity(Floor floor) {
        floorDao.updateEntity(floor);
    }

    //获取单条数据
    public Floor getEntityById(Integer id) {
        return floorDao.getEntityById(id);
    }

    //删除
    public void deleteEntity(Integer id) {
        floorDao.deleteEntity(id);
    }

}
