package com.nowcoder.wenda.services.impl;

import com.nowcoder.wenda.mapper.CrudMapper;
import com.nowcoder.wenda.model.TakeUser;
import com.nowcoder.wenda.services.MTuanSevice;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Service
public class MTuanServiceImpl implements MTuanSevice {
    @Autowired
    private CrudMapper queryMapper ;
    @Override
    public TakeUser queryBy(String sfzh) {
        TakeUser user = queryMapper.queryByCradNum(sfzh);
        return user;
    }

    @Override
    public void insertUser(TakeUser takeUser) {

        //if (takeUser.getSfzh() == queryMapper.queryByCradNum(sfzh))

        TakeUser user = this.queryBy(takeUser.getSfzh());
        if(user!=null) {
            throw new RuntimeException("用户已存在");
        }
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        takeUser.setCreate_time(df.format(new Date()));

        queryMapper.insertUser(takeUser);


    }

    @Override
    public void deleteUser(TakeUser takeUser) {


        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        takeUser.setDelete_time(df.format(new Date()));
        takeUser.setYxbz("0");
        queryMapper.deleteByCard(takeUser);

    }
}
