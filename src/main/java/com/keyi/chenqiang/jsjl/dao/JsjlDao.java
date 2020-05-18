package com.keyi.chenqiang.jsjl.dao;

import com.keyi.chenqiang.jsjl.model.Jsjl;
import com.keyi.chenqiang.jsjl.model.Skjl;

import java.util.List;
import java.util.Map;

public interface JsjlDao
{
    void deleteBySklsh(String sklsh);

    void saveSkInfo(Map<String, Object> map);

    void updateSkBySklsh(Map<String,Object> map);

    void updateSkZt(String sklsh);

    Skjl selectSkBySklsh(String sklsh);

    List<Skjl> listSkByPage(Map<String, Object> map);

    List<Jsjl> listByPage(Map<String, Object> map);

    Integer getTotal(Map<String, Object> map);

    Integer getSkTotal(Map<String, Object> map);
}