package cn.riverdream.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;

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
import cn.riverdream.utils.exlexp.ExportInvoice;

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
	
	@RequestMapping("/searchd/{type}/{contractno}")
	@ResponseBody
	public DataGridResultInfo getContract(@PathVariable String type, @PathVariable String contractno) {
		Integer itype = 0;
		if (type.equalsIgnoreCase("special")) {
			itype = 1;
		}
		
		InvoiceVo invoicevo = new InvoiceVo();
		invoicevo.setPage(1);
		invoicevo.setRows(30);
		invoicevo.setContractno(contractno);
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
	
	@RequestMapping(value = "/{type}/excelDownload")
    public String exportExcel(HttpServletResponse response, InvoiceVo invoicekvo, @PathVariable String type) {
        try {
        	Integer itype = 0;
        	String title = "普通发票";
        	if (type.equalsIgnoreCase("special")) {
        		itype = 1;
        		title = "专业发票";
        	}
            //String fileName = new String(("导出excel标题").getBytes(), "UTF-8") + ".xlsx";
            String fileName=new String((title).getBytes("gb2312"), "iso8859-1")+ ".xlsx";
            response.setContentType("application/vnd.ms-excel;charset=UTF-8");
            response.setHeader("Content-Disposition", "attachment;filename=" + fileName);
            response.setCharacterEncoding("utf-8");
 
            // response.setHeader("Content-disposition", "attachment; filename="
            // + "exdddcel" + ".xlsx");// 组装附件名称和格式
 
            String[] titles = { "合同号", "客户姓名", "发票号", "作废", "金额", "扣税税点", "扣税金额", "单位名称", "创建日期", "备注" };
 
            /*SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            String date = df.format(new Date());
            Date dateNow = null;
            try {
                dateNow = df.parse(date);
            } catch (ParseException e) {
                e.printStackTrace();
            }*/
            List<TbInvoice> list = invoiceService.findAll(itype,invoicekvo);
            ServletOutputStream outputStream = response.getOutputStream();
            
            ExportInvoice.ExportExcel(titles, (ArrayList<TbInvoice>) list, outputStream);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return null;
    }
}
