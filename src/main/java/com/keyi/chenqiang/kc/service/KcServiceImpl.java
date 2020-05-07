package com.keyi.chenqiang.kc.service;

import com.keyi.chenqiang.common.model.Page;
import com.keyi.chenqiang.kc.dao.KcDao;
import com.keyi.chenqiang.kc.model.Kc;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Map;

@Service("kcService")
public class KcServiceImpl implements KcService
{
    @Resource
    private KcDao kcDao;

    @Override
    public Page<Kc> listBypage(Page<Kc> page, Map<String, Object> paramMap)
    {
        paramMap.put("start",(page.getCurrPage()-1)*page.getPageSize());
        paramMap.put("end",page.getPageSize());
        //查询分页结果
        page.setResult(kcDao.listByPage(paramMap));
        //查询记录总数
        page.setTotal(kcDao.getToal(paramMap));
        return page;
    }

    @Override
    public Kc queryKcByItemId(String item_id)
    {
        return kcDao.selectByItemId(item_id);
    }

    @Override
    public String saveKcInfo(Map<String, String> paramMap)
    {
        Kc kc=kcDao.selectByItemId(paramMap.get("item_id").toString());
        if(kc!=null){
            return "该商品库里已存在，请做入库操作";
        }
        kcDao.saveItemInfo(paramMap);
        return "success";
    }

    @Override
    public String updateKcInfo(Map<String, String> paramMap)
    {
        kcDao.updateByItemId(paramMap);
        return "success";
    }

    @Override
    public String deleteKc(Map<String, String> paramMap)
    {
        String str[] = paramMap.get("ids").split(",");
        for(int i=0;i<str.length;i++){
            kcDao.deleteByItemId(str[i]);
        }
        return "success";
    }
}
