package com.keyi.chenqiang.kc.dao;

import com.keyi.chenqiang.kc.model.Kc;
import java.util.List;
import java.util.Map;

public interface KcDao {
    int deleteByItemId(String item_id);

    int saveKcInfo(Map<String, Object> map);

    Kc selectByItemId(String item_id);

    List<Kc> listByPage(Map<String, Object> map);

    int updateByItemId(Kc kc);

    int getToal(Map<String, Object> map);
}