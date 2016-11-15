package cn.riverdream.controller;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.riverdream.model.UserVo;
import cn.riverdream.pojo.TbUser;
import cn.riverdream.service.UserService;
import cn.riverdream.utils.DataGridResultInfo;
import cn.riverdream.utils.ResultInfo;
import cn.riverdream.utils.ResultUtil;

@Controller
@RequestMapping("/sys")
public class UserController {
	
	@Autowired 
	private UserService userService;
	
	@RequestMapping("/user")
	public String toAnalyze( Model model) {
		return "sys/user";
	}
	
	@RequestMapping("/user/toadd")
	public String toAddContract(Model model) {
		//返回当前日期
		Date createDate = new Date();
		SimpleDateFormat formatter; 
	    formatter = new SimpleDateFormat ("yyyy/MM/dd"); 
	    String createDateStr = formatter.format(createDate); 
		model.addAttribute("createDate", createDateStr);
		
		//身份
		Subject subject = SecurityUtils.getSubject();
		TbUser activeUser = (TbUser) subject.getPrincipal();
		model.addAttribute("user", activeUser);
		
		return "sys/adduser";
	}
	
	@RequestMapping("/user/search")
	@ResponseBody
	public DataGridResultInfo getContract(UserVo vo) {
		DataGridResultInfo gridResultInfo = userService.find(vo);
		return gridResultInfo;
	}
	
	@RequestMapping("/user/add")
	@ResponseBody
	public ResultInfo saveContract(UserVo vo) {
		try {
			userService.save(vo.getUser());
		} catch (Exception e) {
			return ResultUtil.createFail("创建失败", ResultInfo.TYPE_RESULT_FAIL);
		}
		return ResultUtil.createSuccess("创建成功", ResultInfo.TYPE_RESULT_SUCCESS);
	}
	
	@RequestMapping("/user/del")
	@ResponseBody
	public ResultInfo deleteContract(UserVo vo) {
		try {
			userService.delete(vo);
		} catch (Exception e) {
			return ResultUtil.createFail("删除失败", ResultInfo.TYPE_RESULT_FAIL);
		}
		return ResultUtil.createSuccess("删除成功", ResultInfo.TYPE_RESULT_SUCCESS);
	}
	
	
	@RequestMapping("/user/toupdate")
	public String toupdateContract(Integer serialNo, Model model) {
		TbUser user = userService.findBySerialNo(serialNo);
		model.addAttribute("user", user);
		return "sys/edituser";
	}
	
	
	@RequestMapping("/user/update")
	@ResponseBody
	public ResultInfo updateContract(UserVo vo) {
		try {
			userService.update(vo);
		} catch (Exception e) {
			return ResultUtil.createFail("更新失败", ResultInfo.TYPE_RESULT_FAIL);
		}
		return ResultUtil.createSuccess("更新成功", ResultInfo.TYPE_RESULT_SUCCESS);
	}
}
