package com.keyi.chenqiang.dd.service;

import com.keyi.chenqiang.dd.dao.DdMxMapper;
import com.keyi.chenqiang.dd.model.DdMx;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * @Author:Leib
 * @Date 2020/4/3 11:33
 */
@Service("ddMxService")
public class DdMxServiceImpl implements DdMxService {
    @Resource
    DdMxMapper ddMxMapper;
    @Override
    public int deleteByPrimaryKey(String mxlsh) {
        return ddMxMapper.deleteByPrimaryKey(mxlsh);
    }

    @Override
    public int insert(DdMx record) {
        return ddMxMapper.insert(record);
    }

    @Override
    public DdMx selectByPrimaryKey(String mxlsh) {
        return ddMxMapper.selectByPrimaryKey(mxlsh);
    }

    @Override
    public List<DdMx> selectAll() {
        return ddMxMapper.selectAll();
    }

    @Override
    public int updateByPrimaryKey(DdMx record) {
        return ddMxMapper.updateByPrimaryKey(record);
    }
}
