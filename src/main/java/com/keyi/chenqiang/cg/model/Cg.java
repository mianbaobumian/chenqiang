package com.keyi.chenqiang.cg.model;

import com.fasterxml.jackson.annotation.JsonFormat;

import java.util.Date;

public class Cg
{
    private String lsh;

    private String item_id;

    private String item_name;

    private String lb;

    @JsonFormat(locale="zh", timezone="GMT+8", pattern="yyyy-MM-dd HH:mm:ss")
    private Date ddsqsj;//订单申请时间

    @JsonFormat(locale="zh", timezone="GMT+8", pattern="yyyy-MM-dd HH:mm:ss")
    private Date ywshsj;//业务确认时间

    @JsonFormat(locale="zh", timezone="GMT+8", pattern="yyyy-MM-dd")
    private Date yjdhrq;//预计到货日期

    private Integer cgsl;

    private Double cgdj;

    private Double cgzje;

    private String zt;

    private String sqqssj;//申请起始时间

    private String sqjssj;//申请结束时间

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

    public String getSqqssj()
    {
        return sqqssj;
    }

    public void setSqqssj(String sqqssj)
    {
        this.sqqssj = sqqssj;
    }

    public String getSqjssj()
    {
        return sqjssj;
    }

    public void setSqjssj(String sqjssj)
    {
        this.sqjssj = sqjssj;
    }

    public String getLsh() {
        return lsh;
    }

    public void setLsh(String lsh) {
        this.lsh = lsh == null ? null : lsh.trim();
    }

    public String getItem_id()
    {
        return item_id;
    }

    public void setItem_id(String item_id)
    {
        this.item_id = item_id;
    }

    public Date getDdsqsj()
    {
        return ddsqsj;
    }

    public void setDdsqsj(Date ddsqsj)
    {
        this.ddsqsj = ddsqsj;
    }

    public Date getYwshsj()
    {
        return ywshsj;
    }

    public void setYwshsj(Date ywshsj)
    {
        this.ywshsj = ywshsj;
    }

    public Date getYjdhrq()
    {
        return yjdhrq;
    }

    public void setYjdhrq(Date yjdhrq)
    {
        this.yjdhrq = yjdhrq;
    }

    public Integer getCgsl() {
        return cgsl;
    }

    public void setCgsl(Integer cgsl) {
        this.cgsl = cgsl;
    }

    public Double getCgdj() {
        return cgdj;
    }

    public void setCgdj(Double cgdj) {
        this.cgdj = cgdj;
    }

    public Double getCgzje() {
        return cgzje;
    }

    public void setCgzje(Double cgzje) {
        this.cgzje = cgzje;
    }

    public String getZt() {
        return zt;
    }

    public void setZt(String zt) {
        this.zt = zt == null ? null : zt.trim();
    }
}