package com.keyi.chenqiang.dd.service;

import com.keyi.chenqiang.dd.model.Dd;

import java.util.List;

/**
 * @Author:Leib
 * @Date 2020/4/3 11:29
 */
public interface DdService {
    int deleteByPrimaryKey(String Ddh);

    int insert(Dd record);

    Dd selectByPrimaryKey(String Ddh);

    List<Dd> selectAll();

    int updateByPrimaryKey(Dd record);
}
