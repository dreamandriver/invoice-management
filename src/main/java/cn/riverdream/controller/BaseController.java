package cn.riverdream.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BaseController {

	@RequestMapping("/base")
	public String toBasePage(Model model) {
		model.addAttribute("version_number", "1.0");
		model.addAttribute("version_date", "2016年11月14日");
		return "base/first";
	}
	
	@RequestMapping("/welcome")
	public String toWelcomPage(Model model) {
		return "base/welcome";
	}
}
