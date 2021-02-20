package com.dao;

import com.model.News;

import java.util.List;
import java.util.Map;

public interface NewsDao {
    //保存到数据库
    void saveEntity(News news);

    //列表显示
    List<News> searchEntity(Map<String, Object> params);
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
    void updateEntity(News news);

    //获取单条数据
    News getEntityById(Integer id);
}