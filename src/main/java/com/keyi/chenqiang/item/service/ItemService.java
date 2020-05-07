package com.keyi.chenqiang.item.service;

import com.keyi.chenqiang.common.model.Page;
import com.keyi.chenqiang.item.model.Item;

import java.util.Map;

public interface ItemService
{
    //分页查询
    Page<Item> listByPage(Page<Item> page, Map<String, Object> paramMap);

    Item queryItemByItemId(String item_id);

    String saveItemInfo(Map<String, String> paramMap);

    String updateItemInfo(Map<String, String> paramMap);

    String deleteItem(Map<String, String> paramMap);
}
