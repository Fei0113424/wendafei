package com.nowcoder.wenda.mapper;

import com.nowcoder.wenda.model.TakeUser;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
@Mapper
@Repository
public interface CrudMapper {


     /*String TABLE_NAME = " usertest ";
     String INSERT_FIELDS = " username,sfzh,phone " ;



     @Insert({"insert into ",TABLE_NAME,"(",INSERT_FIELDS,") values(#{username},#{sfzh},#{phone})"})*/

     //int adduser(TakeUser takeUser);

     TakeUser queryByCradNum(String sfzjhm);

     void insertUser(TakeUser takeUser);

     void deleteByCard(String sfzjhm);

}
