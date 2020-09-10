package com.nowcoder.wenda.controller;

import com.nowcoder.wenda.model.Expressman;
import com.nowcoder.wenda.model.ResponseData;
import com.nowcoder.wenda.services.ExpreService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@Controller
public class ExpresController {

    @Autowired
    private ExpreService expreService;

    @RequestMapping(value = "/queryMas3",method = {RequestMethod.GET,RequestMethod.POST})
    @ResponseBody
    public ResponseData<Expressman> query(String sfzh){
        if (sfzh==null || sfzh.length()==0){
            throw new RuntimeException("身份证号码不能为空");
        }
        Expressman expressman =expreService.queryBy(sfzh);
        return new ResponseData<>(expressman) ;
    }

    @RequestMapping(value = "/insertMas3")
    @ResponseBody
    public ResponseData insert(@RequestBody Expressman expressman){

        if (expressman.getSfzh()==null || expressman.getSfzh().length()==0){
            throw new RuntimeException("身份证号码不能为空");
        }
        expreService.insertUser(expressman);

        return  new ResponseData();

    }

    @RequestMapping(value = "/deleteMas3")
    @ResponseBody
    public ResponseData delete(@RequestBody Expressman expressman){

        expreService.deleteUser(expressman);

        return new ResponseData();

    }

}
