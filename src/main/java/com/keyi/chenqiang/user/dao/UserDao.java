package com.keyi.chenqiang.user.dao;

import com.keyi.chenqiang.user.model.User;
import org.apache.ibatis.annotations.Param;
import org.mybatis.spring.annotation.MapperScan;

import java.util.List;
import java.util.Map;

@MapperScan
public interface UserDao {

    int deleteByUserId(String user_id);

    int saveUserInfo(Map<String, String> map);

    User selectByUserId(String user_id);

    List<User> listByPage(Map<String, Object> map);

    int updateByUserId(Map<String, String> map);

    int getTotal();
}