package com.keyi.chenqiang.dd.dao;

import com.keyi.chenqiang.dd.model.Dd;
import com.keyi.chenqiang.dd.model.DdMx;
import org.mybatis.spring.annotation.MapperScan;

import java.util.List;
import java.util.Map;

@MapperScan
public interface DdDao {
    void deleteByDdh(String Ddh);

    void deleteMxByMxlsh(String mxlsh);

    void deleteMxByDdh(String Ddh);

    int saveDdInfo(Map<String, Object> paramMap);

    int saveDdMxInfo(Map<String, Object> paramMap);

    Dd selectByDdh(String Ddh);

    DdMx selectByMxlsh(String mxlsh);

    List<Dd> listByPage(Map<String, Object> map);

    int getToal(Map<String, Object> map);

    int updateByDdh(Dd dd);

    void updateDdZt(Dd dd);

    void updateDdXd(Dd dd);

    int getMxToal(Map<String, Object> map);

    List<DdMx> listDdmxByPage(Map<String, Object> map);

    void updateDdmxByMxlsh(DdMx ddMx);

    String getDdh();
}