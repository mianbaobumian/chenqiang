package com.keyi.chenqiang.jsjl.service;

import com.keyi.chenqiang.common.model.Page;
import com.keyi.chenqiang.dd.dao.DdDao;
import com.keyi.chenqiang.dd.model.Dd;
import com.keyi.chenqiang.jsjl.dao.JsjlDao;
import com.keyi.chenqiang.jsjl.model.Jsjl;
import com.keyi.chenqiang.jsjl.model.Skjl;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Map;

@Service("jsjlService")
public class JsjlServiceImpl implements JsjlService
{
    @Resource
    private JsjlDao jsjlDao;

    @Resource
    private DdDao ddDao;

    @Override
    public Page<Jsjl> listByPage(Page<Jsjl> page, Map<String, Object> paramMap)
    {
        paramMap.put("start",(page.getCurrPage()-1)*page.getPageSize());
        paramMap.put("end",page.getPageSize());
        //查询分页结果
        page.setResult(jsjlDao.listByPage(paramMap));
        //查询记录总数
        page.setTotal(jsjlDao.getTotal(paramMap));
        return page;
    }

    @Override
    public Page<Skjl> listSkByPage(Page<Skjl> page, Map<String, Object> paramMap)
    {
        paramMap.put("start",(page.getCurrPage()-1)*page.getPageSize());
        paramMap.put("end",page.getPageSize());
        //查询分页结果
        page.setResult(jsjlDao.listSkByPage(paramMap));
        //查询记录总数
        page.setTotal(jsjlDao.getSkTotal(paramMap));
        return page;
    }

    @Override
    public Skjl querySkjlBySklsh(String sklsh){ return jsjlDao.selectSkBySklsh(sklsh);}

    @Override
    public String saveSkInfo(Map<String, Object> paramMap){
        String ddh=paramMap.get("ddh").toString();
        Skjl skjl=jsjlDao.selectSkBySklsh(ddh);
        if(skjl!=null){
            return ddh+"订单已有收款记录请勿重复新增";
        }
        Dd dd=ddDao.selectByDdh(ddh);
        if(dd==null){
            return ddh+"订单号不存在";
        }
        paramMap.put("ddzje",dd.getDdzje());
        paramMap.put("user_id",dd.getDgkh());
        jsjlDao.saveSkInfo(paramMap);
        return "success";
    }

    @Override
    public String updateSkBySklsh(Map<String, Object> paramMap){
        jsjlDao.updateSkBySklsh(paramMap);
        return "success";
    }

    @Override
    public String updateSkZt(String sklsh){
        jsjlDao.updateSkZt(sklsh);
        return "success";
    }

    @Override
    public String deleteSkjl(Map<String, String> paramMap)
    {
        String str[] = paramMap.get("ids").split(",");
        for(int i=0;i<str.length;i++){
            jsjlDao.deleteBySklsh(str[i]);
        }
        return "success";
    }
}
