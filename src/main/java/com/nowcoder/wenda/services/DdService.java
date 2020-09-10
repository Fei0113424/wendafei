package com.nowcoder.wenda.services;

import com.nowcoder.wenda.model.DdDriver;

public interface DdService {
    DdDriver queryBy(String sfzh);


    void insertUser(DdDriver ddDriver);

    void deleteUser(DdDriver ddDriver);
}
