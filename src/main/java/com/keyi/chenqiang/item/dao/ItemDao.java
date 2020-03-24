package com.keyi.chenqiang.item.dao;

import com.keyi.chenqiang.item.model.item;
import java.util.List;

public interface ItemDao
{
    int deleteByPrimaryKey(String itemId);

    int insert(item record);

    item selectByPrimaryKey(String itemId);

    List<item> selectAll();

    int updateByPrimaryKey(item record);
}