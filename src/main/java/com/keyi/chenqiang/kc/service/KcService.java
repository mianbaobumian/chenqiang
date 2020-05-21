package com.keyi.chenqiang.kc.service;

import com.keyi.chenqiang.common.model.Page;
import com.keyi.chenqiang.kc.model.Kc;

import java.util.Map;

public interface KcService
{
    Page<Kc> listByPage(Page<Kc> page, Map<String,Object> paramMap);

    Kc queryKcByItemId(String item_id);

   String saveKcInfo(Map<String,Object> paramMap) throws Exception;

   String updateKcInfo(Map<String,String> paramMap) throws Exception;

   String deleteKc(Map<String,String> paramMap);
}
