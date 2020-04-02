package com.keyi.chenqiang.user.dao;

import com.keyi.chenqiang.user.model.User;
import org.apache.ibatis.annotations.Param;
import org.mybatis.spring.annotation.MapperScan;

import java.util.List;
@MapperScan
public interface UserDao {

    int deleteByUserId(String user_id);

    int insert(User record);

    User selectByUserId(String user_id);

    List<User> listByPage(@Param("start")Integer start,@Param("end") Integer end);

    int updateByUserId(User record);

    int getTotal();
}