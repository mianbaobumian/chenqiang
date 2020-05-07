package com.keyi.chenqiang.kc.service;

import com.keyi.chenqiang.common.model.Page;
import com.keyi.chenqiang.kc.model.Kc;

import java.util.Map;

public interface KcService
{
    Page<Kc> listBypage(Page<Kc> page, Map<String,Object> paramMap);

    Kc queryKcByItemId(String item_id);

   String saveKcInfo(Map<String,String> paramMap);

   String updateKcInfo(Map<String,String> paramMap);

   String deleteKc(Map<String,String> paramMap);
}
