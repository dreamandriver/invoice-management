package cn.riverdream.controller;

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
	
	@RequestMapping("/{type}/add")
	public String toAddContract(@PathVariable String type, Model model) {
		return "management/add"+ type;
	}
	
}
