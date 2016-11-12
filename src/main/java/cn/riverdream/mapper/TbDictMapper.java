package cn.riverdream.mapper;

import cn.riverdream.pojo.TbDict;
import cn.riverdream.pojo.TbDictExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface TbDictMapper {
    int countByExample(TbDictExample example);

    int deleteByExample(TbDictExample example);

    int insert(TbDict record);

    int insertSelective(TbDict record);

    List<TbDict> selectByExample(TbDictExample example);

    int updateByExampleSelective(@Param("record") TbDict record, @Param("example") TbDictExample example);

    int updateByExample(@Param("record") TbDict record, @Param("example") TbDictExample example);
}