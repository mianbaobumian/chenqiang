package com.keyi.chenqiang.cg.dao;

import com.keyi.chenqiang.cg.model.Cg;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface CgDao
{
    int saveCgInfo(Map<String, Object> map);

    Cg selectByLsh(String lsh);

    List<Cg> listByPage(Map<String, Object> map);

    int updateByLsh(Map<String, Object> map);

    int getToal(Map<String, Object> map);

    /**
     * 更新订单状态
     * @param cg 流水号
     * @param cg 状态
     * @return
     */
    void updateCgZt(Cg cg);

    void deleteCgByLsh(@Param("lsh")String lsh);
}