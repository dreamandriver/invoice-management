package cn.riverdream.mapper;

import cn.riverdream.pojo.TbConsumer;
import cn.riverdream.pojo.TbConsumerExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface TbConsumerMapper {
    int countByExample(TbConsumerExample example);

    int deleteByExample(TbConsumerExample example);

    int deleteByPrimaryKey(Integer serialno);

    int insert(TbConsumer record);

    int insertSelective(TbConsumer record);

    List<TbConsumer> selectByExample(TbConsumerExample example);

    TbConsumer selectByPrimaryKey(Integer serialno);

    int updateByExampleSelective(@Param("record") TbConsumer record, @Param("example") TbConsumerExample example);

    int updateByExample(@Param("record") TbConsumer record, @Param("example") TbConsumerExample example);

    int updateByPrimaryKeySelective(TbConsumer record);

    int updateByPrimaryKey(TbConsumer record);
}