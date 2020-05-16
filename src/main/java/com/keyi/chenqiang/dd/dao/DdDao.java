package com.keyi.chenqiang.dd.dao;

import com.keyi.chenqiang.dd.model.Dd;
import org.mybatis.spring.annotation.MapperScan;

import java.util.List;
import java.util.Map;

@MapperScan
public interface DdDao {
    int deleteByDdh(String Ddh);

    int saveDdInfo(Map<String, Object> paramMap);

    Dd selectByDdh(String Ddh);

    List<Dd> listByPage(Map<String, Object> map);

    int getToal(Map<String, Object> map);

    int updateByDdh(Map<String, Object> map);
}