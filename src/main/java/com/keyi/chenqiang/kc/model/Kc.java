package com.keyi.chenqiang.kc.model;

import java.util.Date;

public class Kc {
    private String item_id;

    private String item_name;

    private String lb;

    private Date rksj;

    private Double kcs;

    private Date zhgxsj;

    public String getItem_name()
    {
        return item_name;
    }

    public void setItem_name(String item_name)
    {
        this.item_name = item_name;
    }

    public String getLb()
    {
        return lb;
    }

    public void setLb(String lb)
    {
        this.lb = lb;
    }

    public String getItem_id()
    {
        return item_id;
    }

    public void setItem_id(String item_id)
    {
        this.item_id = item_id;
    }

    public Date getRksj() {
        return rksj;
    }

    public void setRksj(Date rksj) {
        this.rksj = rksj;
    }

    public Double getKcs() {
        return kcs;
    }

    public void setKcs(Double kcs) {
        this.kcs = kcs;
    }

    public Date getZhgxsj() {
        return zhgxsj;
    }

    public void setZhgxsj(Date zhgxsj) {
        this.zhgxsj = zhgxsj;
    }
}