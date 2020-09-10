package com.nowcoder.wenda.controller;

import com.nowcoder.wenda.model.DdDriver;
import com.nowcoder.wenda.model.ResponseData;
import com.nowcoder.wenda.model.TakeUser;
import com.nowcoder.wenda.services.DdService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class DdsjController {


    @Autowired
    private DdService ddService;

    @RequestMapping(value = "/queryMas2", method = {RequestMethod.GET, RequestMethod.POST})
    @ResponseBody
    public ResponseData<DdDriver> queryMas(String sfzh) {
        if (sfzh == null || sfzh.length() == 0) {
            throw new RuntimeException("身份证号码不能为空");
        }
        DdDriver ddDriver = ddService.queryBy(sfzh);
        return new ResponseData<>(ddDriver);
    }

    @RequestMapping(value = "/insertMas2")
    @ResponseBody
    public ResponseData insertMas(@RequestBody DdDriver ddDriver) {

        if (ddDriver.getSfzh() == null || ddDriver.getSfzh().length() == 0) {
            throw new RuntimeException("身份证号码不能为空");
        }
        ddService.insertUser(ddDriver);

        return new ResponseData();

    }

    @RequestMapping(value = "/deleteMas2")
    @ResponseBody
    public ResponseData deleteMas(@RequestBody DdDriver ddDriver) {

        ddService.deleteUser(ddDriver);

        return new ResponseData();

    }

}
