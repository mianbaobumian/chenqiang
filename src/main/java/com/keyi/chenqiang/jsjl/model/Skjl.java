package com.keyi.chenqiang.jsjl.model;

import com.fasterxml.jackson.annotation.JsonFormat;

import java.util.Date;

public class Skjl
{
    private String sklsh;

    @JsonFormat(locale="zh", timezone="GMT+8", pattern="yyyy-MM-dd")
    private Date sksj;

    private String ddh;

    private double ddzje;

    private double skzje;

    private String user_id;

    private String user_name;

    private String skzt;

    private String skr;

    private String skqssj;

    private String skjssj;

    private String skfs;

    public String getSkfs()
    {
        return skfs;
    }

    public void setSkfs(String skfs)
    {
        this.skfs = skfs;
    }

    public String getSkr()
    {
        return skr;
    }

    public void setSkr(String skr)
    {
        this.skr = skr;
    }

    public String getSklsh()
    {
        return sklsh;
    }

    public void setSklsh(String sklsh)
    {
        this.sklsh = sklsh;
    }

    public Date getSksj()
    {
        return sksj;
    }

    public void setSksj(Date sksj)
    {
        this.sksj = sksj;
    }

    public String getDdh()
    {
        return ddh;
    }

    public void setDdh(String ddh)
    {
        this.ddh = ddh;
    }

    public double getDdzje()
    {
        return ddzje;
    }

    public void setDdzje(double ddzje)
    {
        this.ddzje = ddzje;
    }

    public double getSkzje()
    {
        return skzje;
    }

    public void setSkzje(double skzje)
    {
        this.skzje = skzje;
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

    public String getSkzt()
    {
        return skzt;
    }

    public void setSkzt(String skzt)
    {
        this.skzt = skzt;
    }

    public String getSkqssj()
    {
        return skqssj;
    }

    public void setSkqssj(String skqssj)
    {
        this.skqssj = skqssj;
    }

    public String getSkjssj()
    {
        return skjssj;
    }

    public void setSkjssj(String skjssj)
    {
        this.skjssj = skjssj;
    }
}
