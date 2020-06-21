package com.service;

import com.dao.*;
import com.model.*;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;


@Service("news")
public class NewsService {

    @Resource
    private NewsDao newsDao;


    //保存到数据库
    public void saveEntity(News news) {
        newsDao.saveEntity(news);
    }

    //更新数据库
    public void updateEntity(News news) {
        newsDao.updateEntity(news);
    }

    //获取单条数据
    public News getEntityById(Integer id) {
        return newsDao.getEntityById(id);
    }

    //列表显示
    public List<News> getList(Map<String, Object> params) {
        return newsDao.searchEntity(params);
    }
    /**
     * 统计
     * 查询分页统计方法
     *
     * @param params
     * @return
     */
    public int getCount(Map<String, Object> params) {
        return newsDao.count(params);
    }

    //删除
    public void deleteEntity(Integer id) {
        newsDao.deleteEntity(id);
    }

}
