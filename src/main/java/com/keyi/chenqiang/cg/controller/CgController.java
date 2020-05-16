package com.keyi.chenqiang.cg.controller;

import com.keyi.chenqiang.cg.model.Cg;
import com.keyi.chenqiang.cg.service.CgService;
import com.keyi.chenqiang.common.model.Page;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("Cg")
public class CgController
{
    protected Logger logger = LogManager.getLogger(getClass());
    @Resource
    private CgService cgService;

    @RequestMapping("cgIndex")
    public ModelAndView openKcIndex(@RequestParam Map<String, Object> paramMap){
        return new ModelAndView("cg/cg_list");
    }

    // 分页查询
    @RequestMapping("list")
    @ResponseBody
    public Map<String, Object> listItem(@RequestParam Map<String, Object> paramMap){
        Map<String, Object> result = new HashMap<String, Object>();
        String page_num=paramMap.get("page").toString();
        String rows=paramMap.get("rows").toString();
        try
        {
            //定义分页bean
            Page<Cg> page = new Page<Cg>(Integer.parseInt(page_num),Integer.parseInt(rows));
            //拿到分页结果已经记录总数的page
            page = cgService.listByPage(page,paramMap);
            result.put("rows", page.getResult());
            result.put("total", page.getTotal());

        }catch (Exception e){
            logger.error(e.getMessage(), e);
            result.put("code", "500");
            result.put("msg", "查询出错,请联系管理员!");
        }
        return result;
    }

    /**
     * 新增采购订单
     * @param paramMap
     * @return
     */
    @RequestMapping("addCg")
    @ResponseBody
    public Map<String, Object> addKc(@RequestParam Map<String, Object> paramMap){
        Map<String, Object> result = new HashMap<String, Object>();
        try
        {
            String str=cgService.saveCgInfo(paramMap);
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

    /**
     * 更新采购订单
     * @param paramMap
     * @return
     */
    @RequestMapping("updateCg")
    @ResponseBody
    public Map<String, Object> updateKc(@RequestParam Map<String, Object> paramMap){
        Map<String, Object> result = new HashMap<String, Object>();
        try
        {
            String str=cgService.updateCgInfo(paramMap);
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

    @RequestMapping("deleteCg")
    @ResponseBody
    public Map<String, Object> deleteItem(@RequestParam Map<String, String> paramMap){
        Map<String, Object> result = new HashMap<String, Object>();
        try
        {
            String str=cgService.deleteCg(paramMap);
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
