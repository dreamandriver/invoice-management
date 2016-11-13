package cn.riverdream.controller;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.riverdream.model.CheckVo;
import cn.riverdream.pojo.TbCheck;
import cn.riverdream.service.CheckService;
import cn.riverdream.utils.DataGridResultInfo;
import cn.riverdream.utils.ResultInfo;
import cn.riverdream.utils.ResultUtil;

@Controller
@RequestMapping("/management/check")
public class CheckController {

	@Autowired
	private CheckService checkService;
	
	 @InitBinder
	 public void initBinder(WebDataBinder binder) {
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd");
		dateFormat.setLenient(false);
		binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));   //true:允许输入空值，false:不能为空值
	}
	
	@RequestMapping("/search")
	@ResponseBody
	public DataGridResultInfo getCheck(CheckVo checkvo) {
		DataGridResultInfo gridResultInfo = checkService.find(checkvo);
		return gridResultInfo;
	}
	
	@RequestMapping("/add")
	@ResponseBody
	public ResultInfo saveCheck(CheckVo checkvo) {
		try {
			checkService.save(checkvo.getCheck());
		} catch (Exception e) {
			return ResultUtil.createFail("创建失败", ResultInfo.TYPE_RESULT_FAIL);
		}
		return ResultUtil.createSuccess("创建成功", ResultInfo.TYPE_RESULT_SUCCESS);
	}
	
	@RequestMapping("/del")
	@ResponseBody
	public ResultInfo deleteCheck(CheckVo checkvo) {
		try {
			checkService.delete(checkvo);
		} catch (Exception e) {
			return ResultUtil.createFail("删除失败", ResultInfo.TYPE_RESULT_FAIL);
		}
		return ResultUtil.createSuccess("删除成功", ResultInfo.TYPE_RESULT_SUCCESS);
	}
	
	
	@RequestMapping("/toupdate")
	public String toupdateCheck(Integer serialNo, Model model) {
		TbCheck check = checkService.findBySerialNo(serialNo);
		model.addAttribute("check", check);
		return "management/editcheck";
	}
	
	
	@RequestMapping("/update")
	@ResponseBody
	public ResultInfo updateCheck(CheckVo checkvo) {
			try {
				checkService.update(checkvo);
			} catch (Exception e) {
				e.printStackTrace();
				return ResultUtil.createFail("更新失败", ResultInfo.TYPE_RESULT_FAIL);
			}
		return ResultUtil.createSuccess("更新成功", ResultInfo.TYPE_RESULT_SUCCESS);
	}
}
