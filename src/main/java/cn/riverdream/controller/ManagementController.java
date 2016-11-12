package cn.riverdream.controller;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.riverdream.pojo.TbContract;
import cn.riverdream.service.ContractService;

@Controller
@RequestMapping("/management")
public class ManagementController {

	@Autowired
	private ContractService contractService;
	
	@RequestMapping("/{type}")
	public String toPage(@PathVariable String type, Model model) {
		return "management/" + type;
	}
	
	@RequestMapping("/{type}/toadd")
	public String toAddContract(@PathVariable String type, Integer serialno, Model model) {
		//返回当前日期
		Date createDate = new Date();
		SimpleDateFormat formatter; 
	    formatter = new SimpleDateFormat ("yyyy-MM-dd"); 
	    String createDateStr = formatter.format(createDate); 
		model.addAttribute("createDate", createDateStr);
		if("invoice".equalsIgnoreCase(type)){
			TbContract contract = contractService.findBySerialNo(serialno);
			model.addAttribute("contract", contract);
		}
		
		return "management/add"+ type;
	}
	
}
