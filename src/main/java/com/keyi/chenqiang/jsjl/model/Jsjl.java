package com.keyi.chenqiang.jsjl.model;

import java.util.Date;

public class Jsjl {
    private String jylsh;

    private Date jyrq;

    private String skfs;

    private String user_id;

    private String user_name;

    private String ddh;

    private Double zfje;

    private String czr;

    private String bz;

    private String jyqssj;

    private String jyjssj;

    public String getUser_name()
    {
        return user_name;
    }

    public void setUser_name(String user_name)
    {
        this.user_name = user_name;
    }

    public String getJyqssj()
    {
        return jyqssj;
    }

    public void setJyqssj(String jyqssj)
    {
        this.jyqssj = jyqssj;
    }

    public String getJyjssj()
    {
        return jyjssj;
    }

    public void setJyjssj(String jyjssj)
    {
        this.jyjssj = jyjssj;
    }

    public String getJylsh() {
        return jylsh;
    }

    public void setJylsh(String jylsh) {
        this.jylsh = jylsh == null ? null : jylsh.trim();
    }

    public Date getJyrq() {
        return jyrq;
    }

    public void setJyrq(Date jyrq) {
        this.jyrq = jyrq;
    }

    public String getSkfs() {
        return skfs;
    }

    public void setSkfs(String skfs) {
        this.skfs = skfs == null ? null : skfs.trim();
    }

    public String getUser_id()
    {
        return user_id;
    }

    public void setUser_id(String user_id)
    {
        this.user_id = user_id;
    }

    public String getDdh() {
        return ddh;
    }

    public void setDdh(String ddh) {
        this.ddh = ddh == null ? null : ddh.trim();
    }

    public Double getZfje() {
        return zfje;
    }

    public void setZfje(Double zfje) {
        this.zfje = zfje;
    }

    public String getCzr() {
        return czr;
    }

    public void setCzr(String czr) {
        this.czr = czr == null ? null : czr.trim();
    }

    public String getBz() {
        return bz;
    }

    public void setBz(String bz) {
        this.bz = bz == null ? null : bz.trim();
    }
}