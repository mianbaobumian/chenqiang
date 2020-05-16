package com.keyi.chenqiang.cg.service;

import com.keyi.chenqiang.cg.dao.CgDao;
import com.keyi.chenqiang.cg.model.Cg;
import com.keyi.chenqiang.common.model.Page;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Map;

@Service("cgService")
public class CgServiceImpl implements CgService
{
    @Resource
    private CgDao cgDao;


    @Override
    public Page<Cg> listByPage(Page<Cg> page, Map<String, Object> paramMap)
    {
        paramMap.put("start",(page.getCurrPage()-1)*page.getPageSize());
        paramMap.put("end",page.getPageSize());
        //查询分页结果
        page.setResult(cgDao.listByPage(paramMap));
        //查询记录总数
        page.setTotal(cgDao.getToal(paramMap));
        return page;
    }

    @Override
    public Cg queryCgByLsh(String lsh)
    {
        return cgDao.selectByLsh(lsh);
    }

    @Override
    public String saveCgInfo(Map<String, Object> paramMap)
    {
        int cgsl=Integer.parseInt(paramMap.get("cgsl").toString());
        double cgdj=Double.parseDouble(paramMap.get("cgdj").toString());
        double cgzje=cgsl*cgdj;
        paramMap.put("cgsl",cgsl);
        paramMap.put("cgdj",cgdj);
        paramMap.put("cgzje",cgzje);
        cgDao.saveCgInfo(paramMap);
        return "success";
    }

    @Override
    public String updateCgInfo(Map<String, Object> paramMap)
    {
        return null;
    }

    @Override
    public String updateCgZt(String lsh, String zt)
    {
        return null;
    }

    @Override
    public String deleteCg(Map<String, String> paramMap)
    {
        String str[] = paramMap.get("ids").split(",");
        for(int i=0;i<str.length;i++){
            cgDao.deleteCgByLsh(str[i]);
        }
        return "success";
    }
}
