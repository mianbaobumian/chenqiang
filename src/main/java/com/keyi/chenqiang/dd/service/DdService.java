package com.keyi.chenqiang.dd.service;

import com.keyi.chenqiang.common.model.Page;
import com.keyi.chenqiang.dd.model.Dd;
import com.keyi.chenqiang.dd.model.DdMx;

import java.util.List;
import java.util.Map;

/**
 * @Author:chengqiang
 * @Date 2020/4/3 11:29
 */
public interface DdService {
    String deleteByDdh(Map<String, String> paramMap);

    String saveDdInfo(Map<String, Object> paramMap);

    Dd selectByDdh(String Ddh);

    public Page<Dd> listByPage(Page<Dd> page, Map<String, Object> paramMap);

    String updateByDdh(Map<String, Object> paramMap);

    String updateDdzt(Map<String, String> paramMap);

    public Page<DdMx> listDdmxByPage(Page<DdMx> page, Map<String, Object> paramMap);

    String deleteByDdmxlsh(Map<String, String> paramMap);

    String getDdh();

    String saveDdMxInfo(Map<String, Object> paramMap);

    String updateDdMx(Map<String, Object> paramMap);
}
