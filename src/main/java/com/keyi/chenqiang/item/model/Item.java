package com.keyi.chenqiang.item.model;

public class Item
{
    private String item_id;

    private String item_name;

    private String lb;

    private String zt;

    private Double ysj;

    private Double cbj;

    private String hy;

    private String spms;

    private String bz;

    public String getItem_id()
    {
        return item_id;
    }

    public void setItem_id(String item_id)
    {
        this.item_id = item_id;
    }

    public String getItem_name()
    {
        return item_name;
    }

    public void setItem_name(String item_name)
    {
        this.item_name = item_name;
    }

    public String getLb() {
        return lb;
    }

    public void setLb(String lb) {
        this.lb = lb == null ? null : lb.trim();
    }

    public String getZt() {
        return zt;
    }

    public void setZt(String zt) {
        this.zt = zt == null ? null : zt.trim();
    }

    public Double getYsj() {
        return ysj;
    }

    public void setYsj(Double ysj) {
        this.ysj = ysj;
    }

    public Double getCbj() {
        return cbj;
    }

    public void setCbj(Double cbj) {
        this.cbj = cbj;
    }

    public String getHy() {
        return hy;
    }

    public void setHy(String hy) {
        this.hy = hy == null ? null : hy.trim();
    }

    public String getSpms() {
        return spms;
    }

    public void setSpms(String spms) {
        this.spms = spms == null ? null : spms.trim();
    }

    public String getBz() {
        return bz;
    }

    public void setBz(String bz) {
        this.bz = bz == null ? null : bz.trim();
    }
}