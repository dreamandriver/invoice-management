package cn.riverdream.controller;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/management")
public class ManagementController {

	@RequestMapping("/{type}")
	public String toPage(@PathVariable String type, Model model) {
		return "management/" + type;
	}
	
	@RequestMapping("/{type}/toadd")
	public String toAddContract(@PathVariable String type, Model model) {
		//返回当前日期
		Date createDate = new Date();
		SimpleDateFormat formatter; 
	    formatter = new SimpleDateFormat ("yyyy-MM-dd"); 
	    String createDateStr = formatter.format(createDate); 
		model.addAttribute("createDate", createDateStr);
		
		return "management/add"+ type;
	}
	
}
