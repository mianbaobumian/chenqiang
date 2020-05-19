package com.keyi.chenqiang.dd.model;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import java.util.Date;
@Data
public class Dd {
    private String ddh;

    @JsonFormat(locale="zh", timezone="GMT+8", pattern="yyyy-MM-dd HH:mm:ss")
    private Date jyrq;

    private String ddzt;

    private String psfs;

    private String dgkh;

    private double ddzje;

    public String getDgkh()
    {
        return dgkh;
    }

    public void setDgkh(String dgkh)
    {
        this.dgkh = dgkh;
    }

    public double getDdzje()
    {
        return ddzje;
    }

    public void setDdzje(double ddzje)
    {
        this.ddzje = ddzje;
    }

    public String getDdh() {
        return ddh;
    }

    public void setDdh(String ddh) {
        this.ddh = ddh == null ? null : ddh.trim();
    }

    public Date getJyrq() {
        return jyrq;
    }

    public void setJyrq(Date jyrq) {
        this.jyrq = jyrq;
    }

    public String getDdzt() {
        return ddzt;
    }

    public void setDdzt(String ddzt) {
        this.ddzt = ddzt == null ? null : ddzt.trim();
    }

    public String getPsfs() {
        return psfs;
    }

    public void setPsfs(String psfs) {
        this.psfs = psfs == null ? null : psfs.trim();
    }
}