package com.keyi.chenqiang.kc.dao;

import com.keyi.chenqiang.kc.model.Kc;
import java.util.List;
import java.util.Map;

public interface KcDao {
    int deleteByItemId(String item_id);

    int saveItemInfo(Map<String, String> map);

    Kc selectByItemId(String item_id);

    List<Kc> listByPage(Map<String, Object> map);

    int updateByItemId(Map<String, String> map);

    int getToal(Map<String, Object> map);
}