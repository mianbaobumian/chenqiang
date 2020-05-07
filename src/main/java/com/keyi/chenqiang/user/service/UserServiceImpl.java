package com.keyi.chenqiang.user.service;

import com.keyi.chenqiang.common.model.Page;
import com.keyi.chenqiang.user.dao.UserDao;
import com.keyi.chenqiang.user.model.User;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import javax.annotation.Resource;
import java.util.Map;


@Service("userService")
public class UserServiceImpl implements UserService
{
    @Resource
    private UserDao userDao;

    @Override
    public Page<User> listByPage(Page<User> page,Map<String, Object> paramMap)
    {
        paramMap.put("start",(page.getCurrPage()-1)*page.getPageSize());
        paramMap.put("end",page.getPageSize());
        //查询分页结果
        page.setResult(userDao.listByPage(paramMap));
        //查询记录总数
        page.setTotal(userDao.getTotal(paramMap));
        return page;
    }

    @Override
    public User queryUserByUserId(String user_id)
    {
        return userDao.selectByUserId(user_id);
    }

    @Override
    public String saveUserInfo(Map<String, String> paramMap)
    {
        /*User user=new User();
        user.setUser_id(paramMap.get("user_id").toString());
        user.setUser_name(paramMap.get("user_name").toString());
        user.setUser_password(paramMap.get("user_password").toString());
        user.setUser_type(paramMap.get("user_type").toString());
        user.setValue_flag(paramMap.get("value_flag").toString());*/
        User user=userDao.selectByUserId(paramMap.get("user_id").toString());
        if(user!=null){
            return  "该用户已存在";
        }
        userDao.saveUserInfo(paramMap);
        return "success";
    }

    @Override
    public String updateUserInfo(Map<String, String> paramMap)
    {
        /*User user=new User();
        user.setUser_id(paramMap.get("user_id").toString());
        user.setUser_name(paramMap.get("user_name").toString());
        user.setUser_password(paramMap.get("user_password").toString());
        user.setUser_type(paramMap.get("user_type").toString());
        user.setValue_flag(paramMap.get("value_flag").toString());*/
        if("订货方".equals(paramMap.get("user_type"))){
            paramMap.put("user_type","1");
        }
        if("管理人员".equals(paramMap.get("user_type"))){
            paramMap.put("user_type","2");
        }
        userDao.updateByUserId(paramMap);
        return "success";
    }

    @Override
    public String deleteUser(Map<String, String> paramMap)
    {
        String str[] = paramMap.get("ids").split(",");
        for(int i=0;i<str.length;i++){
            userDao.deleteByUserId(str[i]);
        }
       /* User user=userDao.selectByUserId(paramMap.get("user_id"));
        if(user==null){
            return "该用户不存在";
        }*/
        return "success";
    }
}
