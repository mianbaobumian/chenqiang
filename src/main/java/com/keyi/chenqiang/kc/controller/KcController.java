package com.keyi.chenqiang.kc.controller;

import com.keyi.chenqiang.common.model.Page;
import com.keyi.chenqiang.kc.model.Kc;
import com.keyi.chenqiang.kc.service.KcService;
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
@RequestMapping("Kc")
public class KcController
{
    protected Logger logger = LogManager.getLogger(getClass());
    @Resource
    private KcService kcService;

    @RequestMapping("kcIndex")
    public ModelAndView openKcIndex(@RequestParam Map<String, Object> paramMap){
        return new ModelAndView("kc/kc_list");
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
            Page<Kc> page = new Page<Kc>(Integer.parseInt(page_num),Integer.parseInt(rows));
            //拿到分页结果已经记录总数的page
            page = kcService.listByPage(page,paramMap);
            result.put("rows", page.getResult());
            result.put("total", page.getTotal());

        }catch (Exception e){
            logger.error(e.getMessage(), e);
            result.put("code", "500");
            result.put("msg", "查询出错,请联系管理员!");
        }
        return result;
    }

    @RequestMapping("addKcPage")
    public ModelAndView openAddKc(@RequestParam Map<String, Object> paramMap) {
        return new ModelAndView("kc/kc_add");
    }

    /**
     * 新增库存项目
     * @param paramMap
     * @return
     */
    @RequestMapping("addKc")
    @ResponseBody
    public Map<String, Object> addKc(@RequestParam Map<String, Object> paramMap){
        Map<String, Object> result = new HashMap<String, Object>();
        try
        {
            String str=kcService.saveKcInfo(paramMap);
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

    @RequestMapping("updateKcPage")
    public ModelAndView openUpdateKc(@RequestParam Map<String, Object> paramMap) {
        return new ModelAndView("kc/kc_edit");
    }

    /**
     * 更新库存
     * @param paramMap
     * @return
     */
    @RequestMapping("updateKc")
    @ResponseBody
    public Map<String, Object> updateKc(@RequestParam Map<String, String> paramMap){
        Map<String, Object> result = new HashMap<String, Object>();
        try
        {
            String str=kcService.updateKcInfo(paramMap);
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


    /**
     * 清空库存
     * @param paramMap
     * @return
     */
    @RequestMapping("deleteKc")
    @ResponseBody
    public Map<String, Object> deleteItem(@RequestParam Map<String, String> paramMap){
        Map<String, Object> result = new HashMap<String, Object>();
        try
        {
            String str=kcService.deleteKc(paramMap);
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
