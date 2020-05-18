package com.keyi.chenqiang.dd.model;

import lombok.Data;

@Data
public class DdMx {
    private String mxlsh;

    private String ddh;

    private String item_id;

    private Integer sl;

    private String lb;

    private String item_name;

    private Double dxzje;

    public String getMxlsh()
    {
        return mxlsh;
    }

    public void setMxlsh(String mxlsh)
    {
        this.mxlsh = mxlsh;
    }

    public String getDdh()
    {
        return ddh;
    }

    public void setDdh(String ddh)
    {
        this.ddh = ddh;
    }

    public String getItem_id()
    {
        return item_id;
    }

    public void setItem_id(String item_id)
    {
        this.item_id = item_id;
    }

    public Integer getSl()
    {
        return sl;
    }

    public void setSl(Integer sl)
    {
        this.sl = sl;
    }

    public String getLb()
    {
        return lb;
    }

    public void setLb(String lb)
    {
        this.lb = lb;
    }

    public String getItem_name()
    {
        return item_name;
    }

    public void setItem_name(String item_name)
    {
        this.item_name = item_name;
    }

    public Double getDxzje()
    {
        return dxzje;
    }

    public void setDxzje(Double dxzje)
    {
        this.dxzje = dxzje;
    }
}