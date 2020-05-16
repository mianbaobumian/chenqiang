package com.keyi.chenqiang.cg.service;

import com.alibaba.fastjson.JSONArray;
import com.keyi.chenqiang.cg.dao.CgDao;
import com.keyi.chenqiang.cg.model.Cg;
import com.keyi.chenqiang.common.model.Page;
import com.keyi.chenqiang.item.dao.ItemDao;
import com.keyi.chenqiang.item.model.Item;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Service("cgService")
public class CgServiceImpl implements CgService
{
    @Resource
    private CgDao cgDao;
    @Resource
    private ItemDao itemDao;

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
        double cgdj=itemDao.selectByItemId(paramMap.get("item_id").toString()).getCbj();
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
        int cgsl=Integer.parseInt(paramMap.get("cgsl").toString());
        double cgdj=itemDao.selectByItemId(paramMap.get("item_id").toString()).getCbj();
        double cgzje=cgsl*cgdj;
        paramMap.put("cgsl",cgsl);
        paramMap.put("cgdj",cgdj);
        paramMap.put("cgzje",cgzje);
        cgDao.updateByLsh(paramMap);
        return "success";
    }

    @Override
    public String updateCgZt(Map<String, String> paramMap)
    {
        String json=paramMap.get("json");
        String zt=paramMap.get("zt");
        List<Cg> list=JSONArray.parseArray(json,Cg.class);
        for (Cg cg:list){
            cg.setZt(zt);
            cgDao.updateCgZt(cg);
        }
        return "success";
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
