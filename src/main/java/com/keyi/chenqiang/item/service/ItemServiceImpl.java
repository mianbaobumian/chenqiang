package com.keyi.chenqiang.item.service;

import com.keyi.chenqiang.common.model.Page;
import com.keyi.chenqiang.item.dao.ItemDao;
import com.keyi.chenqiang.item.model.Item;
import com.keyi.chenqiang.user.dao.UserDao;
import com.keyi.chenqiang.user.model.User;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Map;


@Service("itemService")
public class ItemServiceImpl implements ItemService
{
    @Resource
    private ItemDao itemDao;

    @Override
    public Page<Item> listByPage(Page<Item> page,Map<String, Object> paramMap)
    {
        paramMap.put("start",(page.getCurrPage()-1)*page.getPageSize());
        paramMap.put("end",page.getPageSize());
        //查询分页结果
        page.setResult(itemDao.listByPage(paramMap));
        //查询记录总数
        page.setTotal(itemDao.getToal(paramMap));
        return page;
    }

    @Override
    public Item queryItemByItemId(String item_id)
    {
        return itemDao.selectByItemId(item_id);
    }

    @Override
    public String saveItemInfo(Map<String, String> paramMap)
    {
        itemDao.saveItemInfo(paramMap);
        return "success";
    }

    @Override
    public String updateItemInfo(Map<String, String> paramMap)
    {
        if("生活用品".equals(paramMap.get("lb"))){
            paramMap.put("lb","1");
        }
        if("方便速食".equals(paramMap.get("lb"))){
            paramMap.put("lb","2");
        }
        if("酒水饮品".equals(paramMap.get("lb"))){
            paramMap.put("lb","3");
        }
        if("家用电器".equals(paramMap.get("lb"))){
            paramMap.put("lb","4");
        }
        if("除菌防疫".equals(paramMap.get("lb"))){
            paramMap.put("lb","5");
        }
        if("进口商品".equals(paramMap.get("lb"))){
            paramMap.put("lb","6");
        }
        if("调味品".equals(paramMap.get("lb"))){
            paramMap.put("lb","7");
        }
        itemDao.updateByItemId(paramMap);
        return "success";
    }

    @Override
    public String deleteItem(Map<String, String> paramMap)
    {
        String str[] = paramMap.get("ids").split(",");
        for(int i=0;i<str.length;i++){
            itemDao.deleteByItemId(str[i]);
        }
        return null;
    }

    /*@Override
    public Item queryItemByItemId(String user_id)
    {

    }

    @Override
    public String saveUserInfo(Map<String, String> paramMap)
    {
        *//*User user=new User();
        user.setUser_id(paramMap.get("user_id").toString());
        user.setUser_name(paramMap.get("user_name").toString());
        user.setUser_password(paramMap.get("user_password").toString());
        user.setUser_type(paramMap.get("user_type").toString());
        user.setValue_flag(paramMap.get("value_flag").toString());*//*
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
        *//*User user=new User();
        user.setUser_id(paramMap.get("user_id").toString());
        user.setUser_name(paramMap.get("user_name").toString());
        user.setUser_password(paramMap.get("user_password").toString());
        user.setUser_type(paramMap.get("user_type").toString());
        user.setValue_flag(paramMap.get("value_flag").toString());*//*
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
       *//* User user=userDao.selectByUserId(paramMap.get("user_id"));
        if(user==null){
            return "该用户不存在";
        }*//*
        return "success";
    }*/
}
