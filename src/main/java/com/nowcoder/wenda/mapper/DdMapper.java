package com.nowcoder.wenda.mapper;

import com.nowcoder.wenda.model.DdDriver;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Mapper
@Repository
public interface DdMapper {
    DdDriver queryByCradNum(String sfzh);

    void insertUser(DdDriver ddDriver);

    void deleteByCard(DdDriver ddDriver);
}
