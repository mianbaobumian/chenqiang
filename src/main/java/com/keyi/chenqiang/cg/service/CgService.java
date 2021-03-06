package com.keyi.chenqiang.cg.service;

import com.keyi.chenqiang.cg.model.Cg;
import com.keyi.chenqiang.common.model.Page;
import org.apache.ibatis.annotations.Param;

import java.util.Map;

public interface CgService
{

    Page<Cg> listByPage(Page<Cg> page, Map<String,Object> paramMap);

    Cg queryCgByLsh(String lsh);

    String saveCgInfo(Map<String,Object> paramMap);

    String updateCgInfo(Map<String,Object> paramMap);

    /**
     * 更新订单状态
     * @param \ 流水号
     * @param \ 状态
     * @return
     */
    String updateCgZt(Map<String,String> paramMap);

    String deleteCg(Map<String,String> paramMap);
}
