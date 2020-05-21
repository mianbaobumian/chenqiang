package com.keyi.chenqiang.dd.controller;

import com.keyi.chenqiang.common.model.Page;
import com.keyi.chenqiang.dd.model.Dd;
import com.keyi.chenqiang.dd.model.DdMx;
import com.keyi.chenqiang.dd.service.DdService;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @Author:chengqiang
 * @Date 2020/4/3 11:29
 */
@Controller
@RequestMapping("Dd")
public class DdController {
    protected Logger logger = LogManager.getLogger(getClass());
    @Resource
    private DdService ddService;

    @RequestMapping("ddIndex")
    public ModelAndView openDdIndex(@RequestParam Map<String, Object> paramMap){
        return new ModelAndView("dd/dd_list");
    }

    // 分页查询
    @RequestMapping("list")
    @ResponseBody
    public Map<String, Object> listDd(@RequestParam Map<String, Object> paramMap){
        Map<String, Object> result = new HashMap<String, Object>();
        String page_num=paramMap.get("page").toString();
        String rows=paramMap.get("rows").toString();
        try
        {
            //定义分页bean
            Page<Dd> page = new Page<Dd>(Integer.parseInt(page_num),Integer.parseInt(rows));
            //拿到分页结果已经记录总数的page
            page = ddService.listByPage(page,paramMap);
            result.put("rows", page.getResult());
            result.put("total", page.getTotal());

        }catch (Exception e){
            logger.error(e.getMessage(), e);
            result.put("code", "500");
            result.put("msg", "查询出错,请联系管理员!");
        }
        return result;
    }

    @RequestMapping("addDdPage")
    public ModelAndView openAddDd(@RequestParam Map<String, Object> paramMap){
        String dgkh=paramMap.get("dgkh").toString();
        ModelAndView mav=new ModelAndView("dd/ddmx_list");
        mav.getModel().put("ddh", ddService.getDdh());
        mav.getModel().put("dgkh",dgkh);
        return mav;
    }


    @RequestMapping("updateDdPage")
    public ModelAndView openUpdateDd(@RequestParam Map<String, Object> paramMap){
        String dgkh=paramMap.get("dgkh").toString();
        String ddh=paramMap.get("ddh").toString();
        ModelAndView mav=new ModelAndView("dd/ddmx_list");
        mav.getModel().put("ddh", ddh);
        mav.getModel().put("dgkh",dgkh);
        return mav;
    }

    /**
     * 新增采购订单
     * @param paramMap
     * @return
     */
    @RequestMapping("addDd")
    @ResponseBody
    public Map<String, Object> addDd(@RequestParam Map<String, Object> paramMap){
        Map<String, Object> result = new HashMap<String, Object>();
        try
        {
            String str=ddService.saveDdInfo(paramMap);
            result.put("msg",str);
            if("success".equals(str)){
                result.put("status",200);
            }else {
                result.put("status",500);
            }
        }catch (Exception e){
            logger.error(e.getMessage(), e);
            result.put("status", 500);
            result.put("msg", "查询出错,请联系管理员!");
        }
        return result;
    }


    @RequestMapping("deleteDd")
    @ResponseBody
    public Map<String, Object> deleteDd(@RequestParam Map<String, String> paramMap){
        Map<String, Object> result = new HashMap<String, Object>();
        try
        {
            String str=ddService.deleteByDdh(paramMap);
            result.put("msg",str);
            if("success".equals(str)){
                result.put("status",200);
            }else {
                result.put("status",500);
            }
        }catch (Exception e){
            logger.error(e.getMessage(), e);
            result.put("status", 500);
            result.put("msg", "查询出错,请联系管理员!");
        }
        return result;
    }

    @RequestMapping("ddmxIndex")
    public ModelAndView openDdmxIndex(@RequestParam Map<String, Object> paramMap){
        return new ModelAndView("dd/ddmx_list");
    }

    // 分页查询
    @RequestMapping("listDdmx")
    @ResponseBody
    public Map<String, Object> listDdmx(@RequestParam Map<String, Object> paramMap){
        Map<String, Object> result = new HashMap<String, Object>();
        String page_num=paramMap.get("page").toString();
        String rows=paramMap.get("rows").toString();
        try
        {
            //定义分页bean
            Page<DdMx> page = new Page<DdMx>(Integer.parseInt(page_num),Integer.parseInt(rows));
            //拿到分页结果已经记录总数的page
            page = ddService.listDdmxByPage(page,paramMap);
            result.put("rows", page.getResult());
            result.put("total", page.getTotal());

        }catch (Exception e){
            logger.error(e.getMessage(), e);
            result.put("code", "500");
            result.put("msg", "查询出错,请联系管理员!");
        }
        return result;
    }

    @RequestMapping("ddmxAddPage")
    public ModelAndView openDdmxAdd(@RequestParam Map<String, Object> paramMap){
        ModelAndView mav=new ModelAndView("dd/ddmx_add");
        String ddh=paramMap.get("ddh").toString();
        String dgkh=paramMap.get("dgkh").toString();
        mav.getModel().put("ddh", ddh);
        mav.getModel().put("dgkh", dgkh);
        return mav;
    }


    @RequestMapping("ddmxUpdatePage")
    public ModelAndView openDdmxUpdate(@RequestParam Map<String, Object> paramMap){
        /*ModelAndView mav=new ModelAndView("dd/ddmx_edit");
        String mxlsh=paramMap.get("mxlsh").toString();
        String ddh=paramMap.get("ddh").toString();
        String dgkh=paramMap.get("dgkh").toString();
        mav.getModel().put("ddh", ddh);
        mav.getModel().put("mxlsh", mxlsh);
        mav.getModel().put("dgkh", dgkh);
        return mav;*/
        return new ModelAndView("dd/ddmx_edit");
    }

    @RequestMapping("deleteDdMx")
    @ResponseBody
    public Map<String, Object> deleteDdMx(@RequestParam Map<String, String> paramMap){
        Map<String, Object> result = new HashMap<String, Object>();
        try
        {
            String str=ddService.deleteByDdmxlsh(paramMap);
            result.put("msg",str);
            if("success".equals(str)){
                result.put("status",200);
            }else {
                result.put("status",500);
            }
        }catch (Exception e){
            logger.error(e.getMessage(), e);
            result.put("status", 500);
            result.put("msg", "查询出错,请联系管理员!");
        }
        return result;
    }

    @RequestMapping("getDdh")
    @ResponseBody
    public Map<String, Object> getDdh(@RequestParam Map<String, String> paramMap){
        Map<String, Object> result = new HashMap<String, Object>();
        try
        {
            String str=ddService.getDdh();
            result.put("msg",str);
            if("success".equals(str)){
                result.put("status",200);
            }else {
                result.put("status",500);
            }
        }catch (Exception e){
            logger.error(e.getMessage(), e);
            result.put("status", 500);
            result.put("msg", "查询出错,请联系管理员!");
        }
        return result;
    }

    @RequestMapping("addDdmx")
    @ResponseBody
    public Map<String, Object> addDdmx(@RequestParam Map<String, Object> paramMap){
        Map<String, Object> result = new HashMap<String, Object>();
        try
        {
            String str=ddService.ywAddDdMx(paramMap);
            result.put("msg",str);
            if("success".equals(str)){
                result.put("status",200);
            }else {
                result.put("status",500);
            }
        }catch (Exception e){
            logger.error(e.getMessage(), e);
            result.put("status", 500);
            result.put("msg", e.getMessage());
        }
        return result;
    }

    @RequestMapping("updateDdMx")
    @ResponseBody
    public Map<String, Object> updateDdmx(@RequestParam Map<String, Object> paramMap){
        Map<String, Object> result = new HashMap<String, Object>();
        try
        {
            String str=ddService.ywUpdateDdMx(paramMap);
            result.put("msg",str);
            if("success".equals(str)){
                result.put("status",200);
            }else {
                result.put("status",500);
            }
        }catch (Exception e){
            logger.error(e.getMessage(), e);
            result.put("status", 500);
            result.put("msg", e.getMessage());
        }
        return result;
    }

    @RequestMapping("updateDdzt")
    @ResponseBody
    public Map<String, Object> updateDdzt(@RequestParam Map<String, String> paramMap){
        Map<String, Object> result = new HashMap<String, Object>();
        try
        {
            String ddzt=paramMap.get("ddzt");
            String str=ddService.updateDdzt(paramMap);
            if("03".equals(ddzt)){
                str="退货已受理，请耐心等待";
            }
            if("05".equals(ddzt)){
                str="确认收货成功";
            }
            result.put("msg",str);
            if("success".equals(str)){
                result.put("status",200);
            }else {
                result.put("status",500);
            }
        }catch (Exception e){
            logger.error(e.getMessage(), e);
            result.put("status", 500);
            result.put("msg", "查询出错,请联系管理员!");
        }
        return result;
    }
}
