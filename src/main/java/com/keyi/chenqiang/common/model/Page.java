package com.keyi.chenqiang.common.model;

import java.util.List;

/**
 * 分页
 */
public class Page<T> {

    private int currPage;   //当前页数
    private int pageSize;   //每页显示的个数
    private long total;      //总记录数
    private int start;
    private int end;
    private List<T> result; //分页查询的结果

    Page(){

    }

    public Page(int currPage, int pageSize) {
        this.currPage = currPage;
        this.pageSize = pageSize;
        this.start = (currPage-1)*pageSize;
        this.end = currPage*pageSize;
    }

    public int getCurrPage() {
        return currPage;
    }

    public void setCurrPage(int currPage) {
        this.currPage = currPage;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public long getTotal() {
        return total;
    }

    public void setTotal(long total) {
        this.total = total;
    }

    public List<T> getResult() {
        return result;
    }

    public void setResult(List<T> result) {
        this.result = result;
    }

    public int getStart() {
        return start;
    }

    public void setStart(int start) {
        this.start = start;
    }

    public int getEnd() {
        return end;
    }

    public void setEnd(int end) {
        this.end = end;
    }

    @Override
    public String toString() {
        return "Page{" +
                "currPage=" + currPage +
                ", pageSize=" + pageSize +
                ", total=" + total +
                ", start=" + start +
                ", end=" + end +
                ", result=" + result +
                '}';
    }
}