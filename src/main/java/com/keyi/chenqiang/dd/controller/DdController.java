package com.keyi.chenqiang.dd.controller;

import com.keyi.chenqiang.dd.model.Dd;
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
    public ModelAndView openKcIndex(@RequestParam Map<String, Object> paramMap){
        return new ModelAndView("dd/dd_list");
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
}
