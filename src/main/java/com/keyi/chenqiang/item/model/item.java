package com.keyi.chenqiang.item.model;

public class item {
    private String itemId;

    private String itemName;

    private String lb;

    private String zt;

    private Double ysj;

    private Double cbj;

    private String hy;

    private String spms;

    private String bz;

    public String getItemId() {
        return itemId;
    }

    public void setItemId(String itemId) {
        this.itemId = itemId == null ? null : itemId.trim();
    }

    public String getItemName() {
        return itemName;
    }

    public void setItemName(String itemName) {
        this.itemName = itemName == null ? null : itemName.trim();
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