package com.keyi.chenqiang.user.service;

import com.keyi.chenqiang.common.model.Page;
import com.keyi.chenqiang.user.model.User;

import java.util.Map;

public interface UserService
{
    //分页查询
    Page<User> listByPage(Page<User> page,Map<String, Object> paramMap);

    User queryUserByUserId(String user_id);

    String saveUserInfo(Map<String, String> paramMap);

    String updateUserInfo(Map<String, String> paramMap);

    String deleteUser(Map<String, String> paramMap);
}
