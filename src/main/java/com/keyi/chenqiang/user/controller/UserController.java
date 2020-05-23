package com.keyi.chenqiang.user.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.keyi.chenqiang.common.model.Page;
import com.keyi.chenqiang.user.model.User;
import com.keyi.chenqiang.user.service.UserService;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/admin/User")
public class UserController
{
    protected Logger logger = LogManager.getLogger(getClass());
    @Resource
    private UserService userService;

    @RequestMapping("userIndex")
    public ModelAndView openUserIndex(@RequestParam Map<String, Object> paramMap) {
        return new ModelAndView("admin/user_list");
    }


    // 分页查询
    @RequestMapping("list")
    @ResponseBody
    public Map<String, Object> listUser(@RequestParam Map<String, Object> paramMap){
        Map<String, Object> result = new HashMap<String, Object>();
        String page_num=paramMap.get("page").toString();
        String rows=paramMap.get("rows").toString();
        try
        {
            //定义分页bean
            Page<User> page = new Page<User>(Integer.parseInt(page_num),Integer.parseInt(rows));
            //拿到分页结果已经记录总数的page
            page = userService.listByPage(page,paramMap);
            result.put("rows", page.getResult());
            result.put("total", page.getTotal());

        }catch (Exception e){
            logger.error(e.getMessage(), e);
            result.put("code", "500");
            result.put("msg", "查询出错,请联系管理员!");
        }
        return result;
    }

    @RequestMapping("addUserPage")
    public ModelAndView openAddUser(@RequestParam Map<String, Object> paramMap) {
        return new ModelAndView("admin/user_add");
    }

    @RequestMapping("addUser")
    @ResponseBody
    public Map<String, Object> addUser(@RequestParam Map<String, String> paramMap){
        Map<String, Object> result = new HashMap<String, Object>();
        try
        {
            String str=userService.saveUserInfo(paramMap);
            result.put("msg",str);
            if("success".equals(str)){
                result.put("status",200);
            }else {
                result.put("status",500);
            }
        }catch (Exception e){
            logger.error(e.getMessage(), e);
            result.put("status", 500);
            result.put("msg", "account_error");
        }
        return result;
    }

    @RequestMapping("updateUserPage")
    public ModelAndView openUpdateUser(@RequestParam Map<String, Object> paramMap) {
        return new ModelAndView("admin/user_edit");
    }

    @RequestMapping("updateUser")
    @ResponseBody
    public Map<String, Object> updateUser(@RequestParam Map<String, String> paramMap){
        Map<String, Object> result = new HashMap<String, Object>();
        try
        {
            String str=userService.updateUserInfo(paramMap);
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

    @RequestMapping("deleteUser")
    @ResponseBody
    public Map<String, Object> deleteUser(@RequestParam Map<String, String> paramMap){
        Map<String, Object> result = new HashMap<String, Object>();
        try
        {
            String str=userService.deleteUser(paramMap);
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
