package com.keyi.chenqiang.jsjl.service;

import com.keyi.chenqiang.common.model.Page;
import com.keyi.chenqiang.jsjl.dao.JsjlDao;
import com.keyi.chenqiang.jsjl.model.Jsjl;
import com.keyi.chenqiang.jsjl.model.Skjl;

import javax.annotation.Resource;
import java.util.Map;

public interface JsjlService
{
    Page<Jsjl> listByPage(Page<Jsjl> page, Map<String, Object> paramMap);

    Page<Skjl> listSkByPage(Page<Skjl> page, Map<String, Object> paramMap);

    Skjl querySkjlBySklsh(String sklsh);

    String saveSkInfo(Map<String, Object> paramMap) throws Exception;

    String updateSkBySklsh(Map<String, Object> paramMap) throws Exception;

    String updateSkZt(String sklsh, String ddzt) throws Exception;

    String deleteSkjl(Map<String, String> paramMap);
}
