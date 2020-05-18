package com.keyi.chenqiang.dd.service;

import com.alibaba.fastjson.JSONArray;
import com.keyi.chenqiang.common.model.Page;
import com.keyi.chenqiang.dd.dao.DdDao;
import com.keyi.chenqiang.dd.model.Dd;
import com.keyi.chenqiang.dd.model.DdMx;
import com.keyi.chenqiang.item.dao.ItemDao;
import com.keyi.chenqiang.item.model.Item;
import com.keyi.chenqiang.kc.dao.KcDao;
import com.keyi.chenqiang.kc.model.Kc;
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

    @Resource
    private KcDao kcDao;

    @Resource
    private ItemDao itemDao;

    @Override
    public String deleteByDdh(Map<String, String> paramMap) {
        String str[] = paramMap.get("ids").split(",");
        for(int i=0;i<str.length;i++){
            ddDao.deleteByDdh(str[i]);
            ddDao.deleteMxByDdh(str[i]);
        }
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
    public DdMx selectByMxlsh(String mxlsh) {
        return ddDao.selectByMxlsh(mxlsh);
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
    public String updateByDdh(Dd dd) {
         ddDao.updateByDdh(dd);
         return "success";
    }

    @Override
    public String updateDdzt(Map<String, String> paramMap)
    {
        String json=paramMap.get("json");
        String zt=paramMap.get("zt");
        Dd dd= JSONArray.parseObject(json,Dd.class);
        if("01".equals(zt)){
            dd.setDdzt(zt);
            ddDao.updateDdXd(dd);
        }else {
            dd.setDdzt(zt);
            ddDao.updateDdZt(dd);
        }
        return "success";
    }

    @Override
    public Page<DdMx> listDdmxByPage(Page<DdMx> page, Map<String, Object> paramMap){
        paramMap.put("start",(page.getCurrPage()-1)*page.getPageSize());
        paramMap.put("end",page.getPageSize());
        //查询分页结果
        page.setResult(ddDao.listDdmxByPage(paramMap));
        //查询记录总数
        page.setTotal(ddDao.getMxToal(paramMap));
        return page;
    }

    @Override
    public String deleteByDdmxlsh(Map<String, String> paramMap) {
        String str[] = paramMap.get("ids").split(",");
        for(int i=0;i<str.length;i++){
            ddDao.deleteMxByMxlsh(str[i]);
        }
        return "success";
    }

    @Override
    public String getDdh(){
        return ddDao.getDdh();
    }

    @Override
    public String saveDdMxInfo(Map<String, Object> paramMap)
    {
        String item_id=paramMap.get("item_id").toString();
        int sl=Integer.parseInt(paramMap.get("sl").toString());
        Kc kc = kcDao.selectByItemId(item_id);
        if(sl>kc.getKcs()){
            return "库存数少于所需数量";
        }
        Item item=itemDao.selectByItemId(item_id);
        double ysj=item.getYsj();
        double dxzje=ysj*sl;
        paramMap.put("dxzje",dxzje);
        ddDao.saveDdMxInfo(paramMap);
        return "success";
    }

    @Override
    public String updateDdMx(Map<String, Object> paramMap)
    {
        String item_id=paramMap.get("item_id").toString();
        String ddh=paramMap.get("ddh").toString();
        String mxlsh=paramMap.get("mxlsh").toString();
        int sl=Integer.parseInt(paramMap.get("sl").toString());
        Kc kc = kcDao.selectByItemId(item_id);
        if(sl>kc.getKcs()){
            return "库存数少于所需数量";
        }
        Item item=itemDao.selectByItemId(item_id);
        double ysj=item.getYsj();
        double dxzje=ysj*sl;
        paramMap.put("dxzje",dxzje);
        DdMx ddMx=new DdMx();
        ddMx.setDdh(ddh);
        ddMx.setItem_id(item_id);
        ddMx.setMxlsh(mxlsh);
        ddMx.setSl(sl);
        ddMx.setDxzje(dxzje);
        ddDao.updateDdmxByMxlsh(ddMx);
        return "success";
    }
}
