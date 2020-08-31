package com.nowcoder.wenda.controller;

import com.nowcoder.wenda.model.ResponseData;
import com.nowcoder.wenda.model.TakeUser;
import com.nowcoder.wenda.services.MTuanSevice;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.Arrays;
import java.util.List;
import java.util.Map;

/**
 *
 */
@Controller
public class IndexController {
    @Autowired
    private MTuanSevice querySevice ;

    @RequestMapping(value = "/queryMas",method = {RequestMethod.GET,RequestMethod.POST})
    @ResponseBody
    public ResponseData<TakeUser> query(String sfzh){
        if (sfzh==null || sfzh.length()==0){
            throw new RuntimeException("身份证号码不能为空");
        }
        TakeUser takeUser =querySevice.queryBy(sfzh);
        return new ResponseData<>(takeUser) ;
    }

    @RequestMapping(value = "/insertMas")
    @ResponseBody
    public ResponseData insert(@RequestBody TakeUser takeUser){

      querySevice.insertUser(takeUser);

      return  new ResponseData();

    }

    @RequestMapping(value = "deleteMas")
    @ResponseBody
    public void delete(@RequestParam(value = "sfzh",required = false) String sfzh){

        if (sfzh==null || sfzh.length()==0){
            throw new RuntimeException("身份证号码不能为空");
        }
        querySevice.deleteUser(sfzh);

    }

    @RequestMapping(value = "updataMas")
    @ResponseBody
    public void updata(TakeUser takeUser){


    }





    @RequestMapping(path={"/","index"},method = {RequestMethod.GET})
    @ResponseBody
    public String index(){
        return "Hello NowCoder.html";
    }

    @RequestMapping(path={"/profile/{groupId}/{userId}"})
    @ResponseBody
    public String profile(@PathVariable("userId") int userId,//@PathVariable解析路径变量，路径里的参数解析
                          @PathVariable("groupId") String groupId,
                          @RequestParam(value = "type",defaultValue = "1") int type,//@RequestParam
                          @RequestParam(value = "key",defaultValue = "zz",required = false) String key){
        return String.format("Profile Page of %s / %d, t:%d k: %s",groupId,userId,type,key);
    }


    @RequestMapping("/hello")
    public String hello(Map<String,Object> map){
        map.put("name","[飞飞]");
        return "hello";
    }

    @RequestMapping("/hello2")
    public String hello(Model model){
        model.addAttribute("name","[飞飞]");
        List<String> colors = Arrays.asList(new String[]{"red","bule","yellwo"});
        model.addAttribute("colors",colors.toString());
        return "home";
    }


}
