package cn.riverdream.service;

import java.util.List;

import cn.riverdream.model.InvoiceVo;
import cn.riverdream.pojo.TbInvoice;
import cn.riverdream.utils.DataGridResultInfo;

public interface InvoiceService {

	DataGridResultInfo find(Integer type, InvoiceVo invoicevo);

	Integer save(TbInvoice invoice);

	void delete(InvoiceVo invoicevo);

	TbInvoice findBySerialNo(Integer serialNo);

	void update(InvoiceVo invoicevo);

	List<TbInvoice> findAll(Integer type, InvoiceVo invoicekvo);

	void changeFinish(TbInvoice invoice);

}
