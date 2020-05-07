package com.keyi.chenqiang.item.dao;

import com.keyi.chenqiang.item.model.Item;
import java.util.List;
import java.util.Map;

public interface ItemDao
{
    int deleteByItemId(String item_id);

    int saveItemInfo(Map<String, String> map);

    Item selectByItemId(String item_id);

    List<Item> listByPage(Map<String, Object> map);

    int updateByItemId(Map<String, String> map);

    int getToal(Map<String, Object> map);
}