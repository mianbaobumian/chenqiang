package com.keyi.chenqiang.kc.model;

import java.util.Date;

public class Kc {
    private String itemId;

    private Date rksj;

    private Double kcs;

    private Date zhgxsj;

    public String getItemId() {
        return itemId;
    }

    public void setItemId(String itemId) {
        this.itemId = itemId == null ? null : itemId.trim();
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