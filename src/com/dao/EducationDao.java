package com.dao;

import com.model.Education;

import java.util.List;
import java.util.Map;

public interface EducationDao {
    //列表显示
    List<Education> searchEntity(Map<String, Object> params);

    /**
     * 统计
     *
     * @param params Map<String,Object>
     * @return
     */
    public int count(Map<String, Object> params);

}