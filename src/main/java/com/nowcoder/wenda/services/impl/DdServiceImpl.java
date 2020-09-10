package com.nowcoder.wenda.services.impl;

import com.nowcoder.wenda.mapper.DdMapper;
import com.nowcoder.wenda.model.DdDriver;
import com.nowcoder.wenda.services.DdService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.Date;
@Service
public class DdServiceImpl implements DdService {

    @Autowired
    private DdMapper ddMapper;

    @Override
    public DdDriver queryBy(String sfzh) {
        DdDriver ddDriver = ddMapper.queryByCradNum(sfzh);
        return ddDriver;
    }

    @Override
    public void insertUser(DdDriver ddDriver) {
        DdDriver dd = this.queryBy(ddDriver.getSfzh());
        if(dd!=null) {
            throw new RuntimeException("用户已存在");
        }
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        ddDriver.setCreate_time(df.format(new Date()));

        ddMapper.insertUser(ddDriver);

    }

    @Override
    public void deleteUser(DdDriver ddDriver) {

        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        ddDriver.setDelete_time(df.format(new Date()));
        ddDriver.setYxbz("0");
        ddMapper.deleteByCard(ddDriver);

    }
}
