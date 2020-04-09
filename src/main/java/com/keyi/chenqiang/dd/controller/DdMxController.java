package com.keyi.chenqiang.dd.controller;

import com.keyi.chenqiang.dd.service.DdMxService;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import java.util.Map;

/**
 * @Author:Leib
 * @Date 2020/4/3 11:32
 */
@Controller
@RequestMapping("admin/DdMx")
public class DdMxController {
    protected Logger logger = LogManager.getLogger(getClass());
    @Resource
    private DdMxService ddMXService;

    @RequestMapping("ddMxIndex")
    public ModelAndView openDdIndex(@RequestParam Map<String, Object> paramMap) {
        return new ModelAndView("dd/dingdanMx_manage");
    }
}
