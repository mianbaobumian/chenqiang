package com.keyi.chenqiang.user.model;

import java.io.Serializable;

/**
 * 用户视图实体类
 */
public class User implements Serializable
{
    private String user_id;

    private String user_name;

    private String user_password;

    private String user_type;

    private String role_name;

    private String value_flag;

    public String getRole_name()
    {
        return role_name;
    }

    public void setRole_name(String role_name)
    {
        this.role_name = role_name;
    }

    public String getUser_password()
    {
        return user_password;
    }

    public void setUser_password(String user_password)
    {
        this.user_password = user_password;
    }

    public String getValue_flag()
    {
        return value_flag;
    }

    public void setValue_flag(String value_flag)
    {
        this.value_flag = value_flag;
    }

    public String getUser_id()
    {
        return user_id;
    }

    public void setUser_id(String user_id)
    {
        this.user_id = user_id;
    }

    public String getUser_name()
    {
        return user_name;
    }

    public void setUser_name(String user_name)
    {
        this.user_name = user_name;
    }

    public String getUser_type()
    {
        return user_type;
    }

    public void setUser_type(String user_type)
    {
        this.user_type = user_type;
    }
}