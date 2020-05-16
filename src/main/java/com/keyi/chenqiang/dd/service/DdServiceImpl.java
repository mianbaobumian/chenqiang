package com.keyi.chenqiang.dd.service;

import com.keyi.chenqiang.common.model.Page;
import com.keyi.chenqiang.dd.dao.DdDao;
import com.keyi.chenqiang.dd.model.Dd;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

/**
 * @Author:chengqiang
 * @Date 2020/4/3 11:29
 */
@Service("ddService")
public class DdServiceImpl implements DdService {
    @Resource
    private DdDao ddDao;
    @Override
    public String deleteByDdh(String Ddh) {
        ddDao.deleteByDdh(Ddh);
        return "success";
    }

    @Override
    public String  saveDdInfo(Map<String, Object> paramMap) {
        ddDao.saveDdInfo(paramMap);
        return "success";
    }

    @Override
    public Dd selectByDdh(String Ddh) {
        return ddDao.selectByDdh(Ddh);
    }

    @Override
    public Page<Dd> listByPage(Page<Dd> page, Map<String, Object> paramMap){
        paramMap.put("start",(page.getCurrPage()-1)*page.getPageSize());
        paramMap.put("end",page.getPageSize());
        //查询分页结果
        page.setResult(ddDao.listByPage(paramMap));
        //查询记录总数
        page.setTotal(ddDao.getToal(paramMap));
        return page;
    }

    @Override
    public String updateByDdh(Map<String, Object> paramMap) {
         ddDao.updateByDdh(paramMap);
         return "success";
    }
}
