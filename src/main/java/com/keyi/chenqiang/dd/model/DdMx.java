package com.keyi.chenqiang.jsjl.model;

public class DdMx {
    private String mxlsh;

    private String ddh;

    private String itemId;

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

    public String getItemId() {
        return itemId;
    }

    public void setItemId(String itemId) {
        this.itemId = itemId == null ? null : itemId.trim();
    }

    public Integer getSl() {
        return sl;
    }

    public void setSl(Integer sl) {
        this.sl = sl;
    }
}