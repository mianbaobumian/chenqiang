package com.keyi.chenqiang.jsjl.controller;

import com.alibaba.fastjson.JSONArray;
import com.keyi.chenqiang.common.model.Page;
import com.keyi.chenqiang.jsjl.model.Jsjl;
import com.keyi.chenqiang.jsjl.model.Skjl;
import com.keyi.chenqiang.jsjl.service.JsjlService;
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
@RequestMapping("Jsjl")
public class JsjlController
{
    protected Logger logger = LogManager.getLogger(getClass());
    @Resource
    private JsjlService jsjlService;

    @RequestMapping("jsjlIndex")
    public ModelAndView openKcIndex(@RequestParam Map<String, Object> paramMap){
        return new ModelAndView("jsjl/jsjl_list");
    }

    @RequestMapping("skjlIndex")
    public ModelAndView openSkjlIndex(@RequestParam Map<String, Object> paramMap){
        return new ModelAndView("jsjl/skjl_list");
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
            Page<Jsjl> page = new Page<Jsjl>(Integer.parseInt(page_num),Integer.parseInt(rows));
            //拿到分页结果已经记录总数的page
            page = jsjlService.listByPage(page,paramMap);
            result.put("rows", page.getResult());
            result.put("total", page.getTotal());

        }catch (Exception e){
            logger.error(e.getMessage(), e);
            result.put("code", "500");
            result.put("msg", "查询出错,请联系管理员!");
        }
        return result;
    }

    @RequestMapping("addSkjlPage")
    public ModelAndView openAddSkjl(@RequestParam Map<String, Object> paramMap){
        return new ModelAndView("jsjl/skjl_add");
    }

    @RequestMapping("addSkjl")
    @ResponseBody
    public Map<String, Object> addKc(@RequestParam Map<String, Object> paramMap){
        Map<String, Object> result = new HashMap<String, Object>();
        try
        {
            String str=jsjlService.saveSkInfo(paramMap);
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

    @RequestMapping("updateSkjlPage")
    public ModelAndView openUpdateSkjl(@RequestParam Map<String, Object> paramMap){
        return new ModelAndView("jsjl/skjl_edit");
    }

    /**
     * 更新采购订单
     * @param paramMap
     * @return
     */
    @RequestMapping("updateSkjl")
    @ResponseBody
    public Map<String, Object> updateKc(@RequestParam Map<String, Object> paramMap){
        Map<String, Object> result = new HashMap<String, Object>();
        try
        {
            String str=jsjlService.updateSkBySklsh(paramMap);
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

    @RequestMapping("deleteSkjl")
    @ResponseBody
    public Map<String, Object> deleteItem(@RequestParam Map<String, String> paramMap){
        Map<String, Object> result = new HashMap<String, Object>();
        try
        {
            String str=jsjlService.deleteSkjl(paramMap);
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

    @RequestMapping("updateSkjlZt")
    @ResponseBody
    public Map<String, Object> updateSkjlZt(@RequestParam Map<String, String> paramMap){
        Map<String, Object> result = new HashMap<String, Object>();
        try
        {
            String json=paramMap.get("json");
            String skzt=paramMap.get("skzt");
            json= json.replace("["," ");
            json= json.replace("]"," ");
            Skjl skjl= JSONArray.parseObject(json,Skjl.class);
            String str=jsjlService.updateSkZt(skjl.getSklsh(),skzt);
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

    // 分页查询
    @RequestMapping("listSkjl")
    @ResponseBody
    public Map<String, Object> listSkjl(@RequestParam Map<String, Object> paramMap){
        Map<String, Object> result = new HashMap<String, Object>();
        String page_num=paramMap.get("page").toString();
        String rows=paramMap.get("rows").toString();
        try
        {
            //定义分页bean
            Page<Skjl> page = new Page<Skjl>(Integer.parseInt(page_num),Integer.parseInt(rows));
            //拿到分页结果已经记录总数的page
            page = jsjlService.listSkByPage(page,paramMap);
            result.put("rows", page.getResult());
            result.put("total", page.getTotal());

        }catch (Exception e){
            logger.error(e.getMessage(), e);
            result.put("code", "500");
            result.put("msg", "查询出错,请联系管理员!");
        }
        return result;
    }
}
