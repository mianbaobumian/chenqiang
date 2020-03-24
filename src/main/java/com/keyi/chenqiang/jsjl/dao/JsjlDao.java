package com.keyi.chenqiang.jsjl.dao;

import com.keyi.chenqiang.jsjl.model.Jsjl;
import java.util.List;

public interface JsjlDao
{
    int deleteByPrimaryKey(String jylsh);

    int insert(Jsjl record);

    Jsjl selectByPrimaryKey(String jylsh);

    List<Jsjl> selectAll();

    int updateByPrimaryKey(Jsjl record);
}