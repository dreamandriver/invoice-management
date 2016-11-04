package cn.riverdream.mapper;

import cn.riverdream.pojo.TbInvoice;
import cn.riverdream.pojo.TbInvoiceExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface TbInvoiceMapper {
    int countByExample(TbInvoiceExample example);

    int deleteByExample(TbInvoiceExample example);

    int deleteByPrimaryKey(Integer serialno);

    int insert(TbInvoice record);

    int insertSelective(TbInvoice record);

    List<TbInvoice> selectByExample(TbInvoiceExample example);

    TbInvoice selectByPrimaryKey(Integer serialno);

    int updateByExampleSelective(@Param("record") TbInvoice record, @Param("example") TbInvoiceExample example);

    int updateByExample(@Param("record") TbInvoice record, @Param("example") TbInvoiceExample example);

    int updateByPrimaryKeySelective(TbInvoice record);

    int updateByPrimaryKey(TbInvoice record);
}