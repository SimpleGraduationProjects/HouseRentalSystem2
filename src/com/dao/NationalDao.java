package com.dao;

import com.model.National;

import java.util.List;
import java.util.Map;

public interface NationalDao {
    //列表显示
    List<National> searchEntity(Map<String, Object> params);


    /**
     * 统计
     *
     * @param params Map<String,Object>
     * @return
     */
    public int count(Map<String, Object> params);

}