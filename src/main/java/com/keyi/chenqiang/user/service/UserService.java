package com.keyi.chenqiang.user.service;

import com.keyi.chenqiang.common.model.Page;
import com.keyi.chenqiang.user.model.User;

public interface UserService
{
    //分页查询
    Page<User> listByPage(Page<User> page);

    User queryUserByUserId(String user_id);
}
