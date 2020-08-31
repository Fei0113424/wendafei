package com.nowcoder.wenda.services;

import com.nowcoder.wenda.model.TakeUser;
import org.springframework.stereotype.Service;

import java.util.List;

public interface MTuanSevice {
     TakeUser queryBy(String sfzh);


     void insertUser(TakeUser takeUser);

     void deleteUser(String sfzh);
}
