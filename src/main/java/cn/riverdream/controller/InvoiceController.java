package cn.riverdream.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.riverdream.model.InvoiceVo;
import cn.riverdream.pojo.TbContract;
import cn.riverdream.pojo.TbInvoice;
import cn.riverdream.service.ContractService;
import cn.riverdream.service.InvoiceService;
import cn.riverdream.utils.DataGridResultInfo;
import cn.riverdream.utils.ResultInfo;
import cn.riverdream.utils.ResultUtil;

@Controller
@RequestMapping("/management/invoice")
public class InvoiceController {

	@Autowired
	private InvoiceService invoiceService;
	
	@Autowired
	private ContractService contractService;
	
	@RequestMapping("/search/{type}")
	@ResponseBody
	public DataGridResultInfo getContract(@PathVariable String type, InvoiceVo invoicevo) {
		Integer itype = 0;
		if (type.equalsIgnoreCase("special")) {
			itype = 1;
		}
		DataGridResultInfo gridResultInfo = invoiceService.find(itype, invoicevo);
		return gridResultInfo;
	}
	
	@RequestMapping("/add")
	@ResponseBody
	public ResultInfo saveContract(InvoiceVo invoicevo) {
		try {
			invoiceService.save(invoicevo.getInvoice());
		} catch (Exception e) {
			return ResultUtil.createFail("创建失败", ResultInfo.TYPE_RESULT_FAIL);
		}
		return ResultUtil.createSuccess("创建成功", ResultInfo.TYPE_RESULT_SUCCESS);
	}
	
	@RequestMapping("/del")
	@ResponseBody
	public ResultInfo deleteContract(InvoiceVo invoicevo) {
		try {
			invoiceService.delete(invoicevo);
		} catch (Exception e) {
			return ResultUtil.createFail("删除失败", ResultInfo.TYPE_RESULT_FAIL);
		}
		return ResultUtil.createSuccess("删除成功", ResultInfo.TYPE_RESULT_SUCCESS);
	}
	
	
	@RequestMapping("/toupdate")
	public String toupdateContract(Integer serialNo, Model model) {
		TbInvoice invoice = invoiceService.findBySerialNo(serialNo);
		TbContract contract = contractService.findBySerialNo(invoice.getContractserialno());
		model.addAttribute("invoice", invoice);
		model.addAttribute("contract", contract);		
		return "management/editinvoice";
	}
	
	
	@RequestMapping("/update")
	@ResponseBody
	public ResultInfo updateContract(InvoiceVo invoicevo) {
		try {
			invoiceService.update(invoicevo);
		} catch (Exception e) {
			return ResultUtil.createFail("更新失败", ResultInfo.TYPE_RESULT_FAIL);
		}
		return ResultUtil.createSuccess("更新成功", ResultInfo.TYPE_RESULT_SUCCESS);
	}
}
