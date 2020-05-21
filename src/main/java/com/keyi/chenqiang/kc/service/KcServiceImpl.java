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
    public Page<Kc> listByPage(Page<Kc> page, Map<String, Object> paramMap)
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
    public String saveKcInfo(Map<String, Object> paramMap) throws Exception
    {
        Kc kc=kcDao.selectByItemId(paramMap.get("item_id").toString());
        if(kc!=null){
            throw new Exception("该商品库里已存在，请做入库操作");
        }
        kcDao.saveKcInfo(paramMap);
        return "success";
    }

    @Override
    public String updateKcInfo(Map<String, String> paramMap) throws Exception
    {
        String czlx=paramMap.get("czlx").toString();
        String item_id=paramMap.get("item_id").toString();
        int sl=Integer.parseInt(paramMap.get("sl").toString());
        Kc kc=kcDao.selectByItemId(item_id);
        if(kc==null){
            throw new Exception("该商品库里不存在，请做新增库存操作");
        }
        if("2".equals(czlx)){
            if(kc.getKcs()>=sl){
                kc.setKcs(kc.getKcs()-sl);
                kcDao.updateByItemId(kc);
            }else {
                throw new Exception("库存数不足");
            }
        }else if("1".equals(czlx)){
            kc.setKcs(kc.getKcs()+sl);
            kcDao.updateByItemId(kc);
        }
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
