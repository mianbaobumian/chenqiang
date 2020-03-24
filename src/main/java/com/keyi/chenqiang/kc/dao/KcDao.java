package com.keyi.chenqiang.kc.dao;

import com.keyi.chenqiang.kc.model.Kc;
import java.util.List;

public interface KcDao {
    int deleteByPrimaryKey(String itemId);

    int insert(Kc record);

    Kc selectByPrimaryKey(String itemId);

    List<Kc> selectAll();

    int updateByPrimaryKey(Kc record);
}