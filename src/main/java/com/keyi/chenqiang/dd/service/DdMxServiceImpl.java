package com.keyi.chenqiang.dd.service;

import com.keyi.chenqiang.dd.dao.DdMxDao;
import com.keyi.chenqiang.dd.model.DdMx;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * @Author:chengqiang
 * @Date 2020/4/3 11:33
 */
@Service("ddMxService")
public class DdMxServiceImpl implements DdMxService {
    @Resource
    DdMxDao ddMxDao;
    @Override
    public int deleteByPrimaryKey(String mxlsh) {
        return ddMxDao.deleteByPrimaryKey(mxlsh);
    }

    @Override
    public int insert(DdMx record) {
        return ddMxDao.insert(record);
    }

    @Override
    public DdMx selectByPrimaryKey(String mxlsh) {
        return ddMxDao.selectByPrimaryKey(mxlsh);
    }

    @Override
    public List<DdMx> selectAll() {
        return ddMxDao.selectAll();
    }

    @Override
    public int updateByPrimaryKey(DdMx record) {
        return ddMxDao.updateByPrimaryKey(record);
    }
}
