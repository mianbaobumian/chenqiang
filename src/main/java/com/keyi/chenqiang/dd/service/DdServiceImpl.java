package com.keyi.chenqiang.dd.service;

import com.alibaba.fastjson.JSONArray;
import com.keyi.chenqiang.common.model.Page;
import com.keyi.chenqiang.dd.dao.DdDao;
import com.keyi.chenqiang.dd.model.Dd;
import com.keyi.chenqiang.dd.model.DdMx;
import com.keyi.chenqiang.item.dao.ItemDao;
import com.keyi.chenqiang.item.model.Item;
import com.keyi.chenqiang.jsjl.dao.JsjlDao;
import com.keyi.chenqiang.jsjl.model.Jsjl;
import com.keyi.chenqiang.jsjl.model.Skjl;
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

    @Resource
    private JsjlDao jsjlDao;

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
        List<Dd> list=ddDao.listByPage(paramMap);
        for (Dd dd:list){
            //查询无明细的无效的订单 删除无效的订单
            List<DdMx> listDdMx = ddDao.selectDdmxByDdh(dd.getDdh());
            if(listDdMx==null ||listDdMx.size()==0){
                ddDao.deleteByDdh(dd.getDdh());
            }
        }
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
    public String updateDdzt(Map<String, String> paramMap) throws Exception
    {
        String json=paramMap.get("json");
        String ddzt=paramMap.get("ddzt");
        Dd dd= JSONArray.parseObject(json,Dd.class);
        if("01".equals(ddzt)){//下单
            dd.setDdzt(ddzt);
            ddDao.updateDdXd(dd);
        }else if("02".equals(ddzt)) {//发货
            Skjl skjl=jsjlDao.selectSkjlByDdh(dd.getDdh());
            if(skjl==null){
                throw new Exception("客户未付款或业务人员未新增收款记录，请检查");
            }
            Jsjl jsjl=jsjlDao.selectJsjlByDdh(dd.getDdh());
            if(jsjl==null){
                throw new Exception("业务人员未审核收款记录，请检查");
            }
            List<DdMx> ddMxList=ddDao.selectDdmxByDdh(dd.getDdh());
            for(DdMx ddMx:ddMxList){
                Kc kc=kcDao.selectByItemId(ddMx.getItem_id());
                //检查库存
                if(kc.getKcs()<ddMx.getSl()){
                    kc.setKcs(kc.getKcs()-ddMx.getSl());
                    kcDao.updateByItemId(kc);
                }else {
                    throw new Exception(kc.getItem_name()+"库存数不足，联系采购员补充库存");
                }
            }
            dd.setDdzt(ddzt);
            ddDao.updateDdZt(dd);
        }else if("03".equals(ddzt)){
            dd.setDdzt(ddzt);
            ddDao.updateDdZt(dd);
        }else if("04".equals(ddzt)){//撤销
            Skjl skjl=jsjlDao.selectSkjlByDdh(dd.getDdh());
            if(skjl!=null){
                throw new Exception("已收款，请联系业务人员处理");
            }
            //订单作废
            dd.setDdzt(ddzt);
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
        String ddh=ddDao.selectByMxlsh(str[0]).getDdh();
        for(int i=0;i<str.length;i++){
            ddDao.deleteMxByMxlsh(str[i]);
        }
        double ddzje=0.00;
        List<DdMx> list=ddDao.selectDdmxByDdh(ddh);
        if(list==null ||list.size()==0){
            ddDao.deleteByDdh(ddh);
        }else{
            for(DdMx ddMx:list){
                ddzje+=ddMx.getDxzje();
            }
        }
        Dd dd=selectByDdh(ddh);
        dd.setDdzje(ddzje);
        ddDao.updateByDdh(dd);
        return "success";
    }

    @Override
    public String getDdh(){
        return ddDao.getDdh();
    }

    @Override
    public String saveDdMxInfo(Map<String, Object> paramMap) throws Exception
    {
        String item_id=paramMap.get("item_id").toString();
        int sl=Integer.parseInt(paramMap.get("sl").toString());
        Kc kc = kcDao.selectByItemId(item_id);
        if(sl>kc.getKcs()){
            throw new Exception("库存数少于所需数量");
        }
        Item item=itemDao.selectByItemId(item_id);
        double ysj=item.getYsj();
        double dxzje=ysj*sl;
        paramMap.put("dxzje",dxzje);
        ddDao.saveDdMxInfo(paramMap);
        return "success";
    }

    @Override
    public String updateDdMx(Map<String, Object> paramMap) throws Exception
    {
        String item_id=paramMap.get("item_id").toString();
        String ddh=paramMap.get("ddh").toString();
        String mxlsh=paramMap.get("mxlsh").toString();
        int sl=Integer.parseInt(paramMap.get("sl").toString());
        Kc kc = kcDao.selectByItemId(item_id);
        if(sl>kc.getKcs()){
            throw new Exception("库存数少于所需数量");
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

    @Override
    public String ywAddDdMx(Map<String, Object> paramMap) throws Exception{
        saveDdMxInfo(paramMap);
        String ddh=paramMap.get("ddh").toString();
        Dd dd=selectByDdh(ddh);
        double ddzje=0.00;
        List<DdMx> list=ddDao.selectDdmxByDdh(ddh);
        for(DdMx ddMx:list){
            ddzje+=ddMx.getDxzje();
        }
        if(dd!=null){
            dd.setDdzje(ddzje);
            ddDao.updateByDdh(dd);
        }else{
            paramMap.put("ddzje",ddzje);
            ddDao.saveDdInfo(paramMap);
        }
        return "success";
    }

    @Override
    public String ywUpdateDdMx(Map<String, Object> paramMap) throws Exception{
        String mxlsh=paramMap.get("mxlsh").toString();
        DdMx ddMx=ddDao.selectByMxlsh(mxlsh);//查询原订单号
        paramMap.put("ddh",ddMx.getDdh());
        String str=updateDdMx(paramMap);//更新订单明细
        double ddzje=0.00;
        List<DdMx> list=ddDao.selectDdmxByDdh(ddMx.getDdh());
        for(DdMx mx:list){
            ddzje+=mx.getDxzje();
        }
        Dd dd=selectByDdh(ddMx.getDdh());
        dd.setDdzje(ddzje);
        str=updateByDdh(dd);//更新订单
        return str;
    }
}
