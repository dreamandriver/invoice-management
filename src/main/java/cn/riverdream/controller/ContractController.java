package cn.riverdream.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/management/contract")
public class ContractController {

	@RequestMapping("/search")
	public String getContract(@PathVariable String type, Model model) {
		return "management/add"+ type;
	}
}
