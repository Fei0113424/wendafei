package com.nowcoder.wenda.services.impl;

import com.nowcoder.wenda.mapper.ExpreMapper;
import com.nowcoder.wenda.model.DdDriver;
import com.nowcoder.wenda.model.Expressman;
import com.nowcoder.wenda.services.ExpreService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.Date;

@Service
public class ExpreServiceImpl implements ExpreService {
    @Autowired
    private ExpreMapper expreMapper;
    @Override
    public Expressman queryBy(String sfzh) {
        Expressman expressman = expreMapper.queryByCradNum(sfzh);
        return expressman;
    }

    @Override
    public void insertUser(Expressman expressman) {
        Expressman ex = this.queryBy(expressman.getSfzh());
        if(ex!=null) {
            throw new RuntimeException("用户已存在");
        }
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        expressman.setCreate_time(df.format(new Date()));

        expreMapper.insertUser(expressman);
    }

    @Override
    public void deleteUser(Expressman expressman) {


        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        expressman.setDelete_time(df.format(new Date()));
        expressman.setYxbz("0");
        expreMapper.deleteByCard(expressman);

    }
}
