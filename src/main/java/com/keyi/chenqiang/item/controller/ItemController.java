package com.keyi.chenqiang.item.controller;

import com.keyi.chenqiang.common.model.Page;
import com.keyi.chenqiang.item.model.Item;
import com.keyi.chenqiang.item.service.ItemService;
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
@RequestMapping("/admin/Item")
public class ItemController
{
    protected Logger logger = LogManager.getLogger(getClass());
    @Resource
    private ItemService itemService;

    @RequestMapping("itemIndex")
    public ModelAndView openitemIndex(@RequestParam Map<String, Object> paramMap) {
        return new ModelAndView("admin/item_list");
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
            Page<Item> page = new Page<Item>(Integer.parseInt(page_num),Integer.parseInt(rows));
            //拿到分页结果已经记录总数的page
            page = itemService.listByPage(page,paramMap);
            result.put("rows", page.getResult());
            result.put("total", page.getTotal());

        }catch (Exception e){
            logger.error(e.getMessage(), e);
            result.put("code", "500");
            result.put("msg", "查询出错,请联系管理员!");
        }
        return result;
    }

    @RequestMapping("addItemPage")
    public ModelAndView openAdditem(@RequestParam Map<String, Object> paramMap) {
        return new ModelAndView("admin/item_add");
    }

    @RequestMapping("addItem")
    @ResponseBody
    public Map<String, Object> addItem(@RequestParam Map<String, String> paramMap){
        Map<String, Object> result = new HashMap<String, Object>();
        try
        {
            String str=itemService.saveItemInfo(paramMap);
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

    @RequestMapping("updateItemPage")
    public ModelAndView openUpdateItem(@RequestParam Map<String, Object> paramMap) {
        return new ModelAndView("admin/item_edit");
    }

    @RequestMapping("updateItem")
    @ResponseBody
    public Map<String, Object> updateItem(@RequestParam Map<String, String> paramMap){
        Map<String, Object> result = new HashMap<String, Object>();
        try
        {
            String str=itemService.updateItemInfo(paramMap);
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

    @RequestMapping("deleteItem")
    @ResponseBody
    public Map<String, Object> deleteItem(@RequestParam Map<String, String> paramMap){
        Map<String, Object> result = new HashMap<String, Object>();
        try
        {
            String str=itemService.deleteItem(paramMap);
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
