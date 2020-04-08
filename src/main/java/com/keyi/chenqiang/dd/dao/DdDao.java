package com.keyi.chenqiang.dd.dao;

import com.keyi.chenqiang.dd.model.Dd;
import org.mybatis.spring.annotation.MapperScan;

import java.util.List;
@MapperScan
public interface DdDao {
    int deleteByPrimaryKey(String Ddh);

    int insert(Dd record);

    Dd selectByPrimaryKey(String Ddh);

    List<Dd> selectAll();

    int updateByPrimaryKey(Dd record);
}