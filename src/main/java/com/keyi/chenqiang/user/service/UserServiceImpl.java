package com.keyi.chenqiang.user.service;

import com.keyi.chenqiang.common.model.Page;
import com.keyi.chenqiang.user.dao.UserDao;
import com.keyi.chenqiang.user.model.User;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * @Description: [用户service]
 * @Author: [chengqiang]
 * @CreateDate: [2020/3/7 14:03]
 */
@Service("userService")
public class UserServiceImpl implements UserService
{
    @Resource
    private UserDao userDao;

  /*  @Resource(name = "userDao")
    public void setDao(UserDao dao) {
        userDao = dao;

    }*/

    @Override
    public Page<User> listByPage(Page<User> page)
    {
        //查询分页结果
        page.setResult(userDao.listByPage((page.getCurrPage()-1)*page.getPageSize(),page.getPageSize()));
        //查询记录总数
        page.setTotal(userDao.getTotal());
        return page;
    }
}
