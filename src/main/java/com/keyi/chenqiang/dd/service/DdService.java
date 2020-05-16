package com.keyi.chenqiang.dd.service;

import com.keyi.chenqiang.common.model.Page;
import com.keyi.chenqiang.dd.model.Dd;

import java.util.List;
import java.util.Map;

/**
 * @Author:chengqiang
 * @Date 2020/4/3 11:29
 */
public interface DdService {
    String deleteByDdh(String Ddh);

    String saveDdInfo(Map<String, Object> paramMap);

    Dd selectByDdh(String Ddh);

    public Page<Dd> listByPage(Page<Dd> page, Map<String, Object> paramMap);

    String updateByDdh(Map<String, Object> paramMap);
}
