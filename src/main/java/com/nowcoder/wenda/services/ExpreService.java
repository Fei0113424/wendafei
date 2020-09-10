package com.nowcoder.wenda.services;

import com.nowcoder.wenda.model.Expressman;


public interface ExpreService {
    Expressman queryBy(String sfzh);


    void insertUser(Expressman expressman);

    void deleteUser(Expressman expressman);
}
