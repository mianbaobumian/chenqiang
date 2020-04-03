package com.keyi.chenqiang.dd.service;

import com.keyi.chenqiang.dd.dao.DdDao;
import com.keyi.chenqiang.dd.model.Dd;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * @Author:Leib
 * @Date 2020/4/3 11:29
 */
@Service("ddService")
public class DdServiceImpl implements DdService {
    @Resource
    DdDao ddDao;
    @Override
    public int deleteByPrimaryKey(String Ddh) {
        return ddDao.deleteByPrimaryKey(Ddh);
    }

    @Override
    public int insert(Dd record) {
        return ddDao.insert(record);
    }

    @Override
    public Dd selectByPrimaryKey(String Ddh) {
        return ddDao.selectByPrimaryKey(Ddh);
    }

    @Override
    public List<Dd> selectAll() {
        return ddDao.selectAll();
    }

    @Override
    public int updateByPrimaryKey(Dd record) {
        return ddDao.updateByPrimaryKey(record);
    }
}
