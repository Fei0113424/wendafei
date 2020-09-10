package com.nowcoder.wenda.mapper;


import com.nowcoder.wenda.model.Expressman;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Mapper
@Repository
public interface ExpreMapper {

    Expressman queryByCradNum(String sfzh);

    void insertUser(Expressman expressman);

    void deleteByCard(Expressman expressman);

}
