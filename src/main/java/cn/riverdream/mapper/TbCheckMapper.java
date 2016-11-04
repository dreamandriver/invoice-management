package cn.riverdream.mapper;

import cn.riverdream.pojo.TbCheck;
import cn.riverdream.pojo.TbCheckExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface TbCheckMapper {
    int countByExample(TbCheckExample example);

    int deleteByExample(TbCheckExample example);

    int deleteByPrimaryKey(Integer serialno);

    int insert(TbCheck record);

    int insertSelective(TbCheck record);

    List<TbCheck> selectByExample(TbCheckExample example);

    TbCheck selectByPrimaryKey(Integer serialno);

    int updateByExampleSelective(@Param("record") TbCheck record, @Param("example") TbCheckExample example);

    int updateByExample(@Param("record") TbCheck record, @Param("example") TbCheckExample example);

    int updateByPrimaryKeySelective(TbCheck record);

    int updateByPrimaryKey(TbCheck record);
}