package cn.riverdream.mapper;

import cn.riverdream.pojo.TbContract;
import cn.riverdream.pojo.TbContractExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface TbContractMapper {
    int countByExample(TbContractExample example);

    int deleteByExample(TbContractExample example);

    int deleteByPrimaryKey(Integer serialno);

    int insert(TbContract record);

    int insertSelective(TbContract record);

    List<TbContract> selectByExample(TbContractExample example);

    TbContract selectByPrimaryKey(Integer serialno);

    int updateByExampleSelective(@Param("record") TbContract record, @Param("example") TbContractExample example);

    int updateByExample(@Param("record") TbContract record, @Param("example") TbContractExample example);

    int updateByPrimaryKeySelective(TbContract record);

    int updateByPrimaryKey(TbContract record);
}