package com.keyi.chenqiang.user.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.keyi.chenqiang.common.model.Page;
import com.keyi.chenqiang.user.model.User;
import com.keyi.chenqiang.user.service.UserService;
import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/admin/User")
public class UserController
{
    protected Logger logger = LogManager.getLogger(getClass());
    @Resource
    private UserService userService;

    // 分页查询博客类别
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
            page = userService.listByPage(page);
//            JSONObject result = new JSONObject();
//            //通过fastJson序列化list为jsonArray
//            String jsonArray = JSON.toJSONString(page.getResult());
//            JSONArray array = JSONArray.parseArray(jsonArray);
//            //将序列化结果放入json对象中
//            result.put("total", count);
//            result.put("data", list);

            result.put("rows", page);
            result.put("total", page.getTotal());

            //使用自定义工具类向response中写入数据
            // ResponseUtil.write(response, result);
        }catch (Exception e){
            logger.error(e.getMessage(), e);
            result.put("code", "500");
            result.put("msg", "查询出错,请联系管理员!");
        }
        return result;
    }
}
