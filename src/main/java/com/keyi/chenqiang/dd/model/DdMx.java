package com.keyi.chenqiang.dd.model;

import lombok.Data;

@Data
public class DdMx {
    private String mxlsh;

    private String ddh;

    private String item_id;

    private Integer sl;

    public String getMxlsh() {
        return mxlsh;
    }

    public void setMxlsh(String mxlsh) {
        this.mxlsh = mxlsh == null ? null : mxlsh.trim();
    }

    public String getDdh() {
        return ddh;
    }

    public void setDdh(String ddh) {
        this.ddh = ddh == null ? null : ddh.trim();
    }

    public String getitem_id() {
        return item_id;
    }

    public void setitem_id(String item_id) {
        this.item_id = item_id == null ? null : item_id.trim();
    }

    public Integer getSl() {
        return sl;
    }

    public void setSl(Integer sl) {
        this.sl = sl;
    }
}