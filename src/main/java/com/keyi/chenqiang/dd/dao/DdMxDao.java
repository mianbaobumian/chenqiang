package com.keyi.chenqiang.dd.dao;

import com.keyi.chenqiang.dd.model.DdMx;
import org.mybatis.spring.annotation.MapperScan;

import java.util.List;
@MapperScan
public interface DdMxDao
{
    int deleteByPrimaryKey(String mxlsh);

    int insert(DdMx record);

    DdMx selectByPrimaryKey(String mxlsh);

    List<DdMx> selectAll();

    int updateByPrimaryKey(DdMx record);
}