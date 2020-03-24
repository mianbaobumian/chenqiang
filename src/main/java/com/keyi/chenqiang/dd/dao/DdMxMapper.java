package com.keyi.chenqiang.jsjl.dao;

import com.keyi.chenqiang.jsjl.model.DdMx;
import java.util.List;

public interface DdMxMapper {
    int deleteByPrimaryKey(String mxlsh);

    int insert(DdMx record);

    DdMx selectByPrimaryKey(String mxlsh);

    List<DdMx> selectAll();

    int updateByPrimaryKey(DdMx record);
}