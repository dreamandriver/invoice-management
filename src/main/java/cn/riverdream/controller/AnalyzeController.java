package cn.riverdream.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/analyze")
public class AnalyzeController {

	@RequestMapping("/index")
	public String toAnalyze( Model model) {
		return "analyze/analyze";
	}
}
