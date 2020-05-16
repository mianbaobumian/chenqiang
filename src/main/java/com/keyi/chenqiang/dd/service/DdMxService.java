package com.keyi.chenqiang.dd.service;

import com.keyi.chenqiang.dd.model.DdMx;

import java.util.List;

/**
 * @Author:chengqiang
 * @Date 2020/4/3 11:33
 */
public interface DdMxService {
    int deleteByPrimaryKey(String mxlsh);

    int insert(DdMx record);

    DdMx selectByPrimaryKey(String mxlsh);

    List<DdMx> selectAll();

    int updateByPrimaryKey(DdMx record);
}
