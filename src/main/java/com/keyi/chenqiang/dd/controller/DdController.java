package com.keyi.chenqiang.dd.controller;

import com.keyi.chenqiang.dd.model.Dd;
import com.keyi.chenqiang.dd.service.DdService;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

/**
 * @Author:Leib
 * @Date 2020/4/3 11:29
 */
@Controller
@RequestMapping("admin/Dd")
public class DdController {
    protected Logger logger = LogManager.getLogger(getClass());
    @Resource
    private DdService ddService;

    @RequestMapping("ddIndex")
    public String openDdIndex(@RequestParam Map<String, List<Dd>> paramMap, Model model) {
        List<Dd> listDd = ddService.selectAll();
        paramMap.put("ddIndex",listDd);
        model.addAttribute("ddIndex",paramMap);
        for (Dd d : listDd) {
            System.out.println(d);
        }

        return "admin/dingdan_manage";
    }
}
