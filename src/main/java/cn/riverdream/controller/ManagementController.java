package cn.riverdream.controller;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.riverdream.pojo.TbContract;
import cn.riverdream.pojo.TbUser;
import cn.riverdream.service.ContractService;
import cn.riverdream.service.UserService;

@Controller
@RequestMapping("/management")
public class ManagementController {

	@Autowired
	private ContractService contractService;
	
	@Autowired
	private UserService userService;
	
	 @InitBinder
	 public void initBinder(WebDataBinder binder) {
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd");
		dateFormat.setLenient(false);
		binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));   //true:允许输入空值，false:不能为空值
	}
	
	@RequestMapping("/{type}")
	public String toPage(@PathVariable String type, Model model) {
		Subject subject = SecurityUtils.getSubject();
		//身份
		TbUser activeUser = (TbUser) subject.getPrincipal();
		TbUser user = userService.findByUserId(activeUser.getUserid());
		model.addAttribute("activeUser", user);
		return "management/" + type;
	}
	
	@RequestMapping("/{type}/toadd")
	public String toAddContract(@PathVariable String type, Integer serialno, Model model) {
		//返回当前日期
		Date createDate = new Date();
		SimpleDateFormat formatter; 
	    formatter = new SimpleDateFormat ("yyyy/MM/dd"); 
	    String createDateStr = formatter.format(createDate); 
		model.addAttribute("createDate", createDateStr);
		if("invoice".equalsIgnoreCase(type) ||"check".equalsIgnoreCase(type)){
			TbContract contract = contractService.findBySerialNo(serialno);
			model.addAttribute("contract", contract);
		}
		if("contract".equalsIgnoreCase(type)){
			String contractNo = contractService.getcontractNo();
			model.addAttribute("contractNo", contractNo);
		}
		
		//身份
		Subject subject = SecurityUtils.getSubject();
		TbUser activeUser = (TbUser) subject.getPrincipal();
		model.addAttribute("user", activeUser);
		
		return "management/add"+ type;
	}
	
}
