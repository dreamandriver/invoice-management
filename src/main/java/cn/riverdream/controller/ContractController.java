package cn.riverdream.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.riverdream.model.ContractVo;
import cn.riverdream.pojo.TbContract;
import cn.riverdream.service.ContractService;
import cn.riverdream.utils.DataGridResultInfo;
import cn.riverdream.utils.ResultInfo;
import cn.riverdream.utils.ResultUtil;

@Controller
@RequestMapping("/management/contract")
public class ContractController {

	@Autowired
	private ContractService contractService;
	
	@RequestMapping("/search")
	@ResponseBody
	public DataGridResultInfo getContract(ContractVo contractvo) {
		DataGridResultInfo gridResultInfo = contractService.find(contractvo);
		return gridResultInfo;
	}
	
	@RequestMapping("/add")
	@ResponseBody
	public ResultInfo saveContract(ContractVo contractvo) {
		try {
			contractService.save(contractvo.getContract());
		} catch (Exception e) {
			return ResultUtil.createFail("创建失败", ResultInfo.TYPE_RESULT_FAIL);
		}
		return ResultUtil.createSuccess("创建成功", ResultInfo.TYPE_RESULT_SUCCESS);
	}
	
	@RequestMapping("/del")
	@ResponseBody
	public ResultInfo deleteContract(ContractVo contractvo) {
		try {
			contractService.delete(contractvo);
		} catch (Exception e) {
			return ResultUtil.createFail("删除失败", ResultInfo.TYPE_RESULT_FAIL);
		}
		return ResultUtil.createSuccess("删除成功", ResultInfo.TYPE_RESULT_SUCCESS);
	}
	
	
	@RequestMapping("/toupdate")
	public String toupdateContract(Integer serialNo, Model model) {
		TbContract contract = contractService.findBySerialNo(serialNo);
		model.addAttribute("contract", contract);
		return "management/editcontract";
	}
	
	
	@RequestMapping("/update")
	@ResponseBody
	public ResultInfo updateContract(ContractVo contractvo) {
		try {
			contractService.update(contractvo);
		} catch (Exception e) {
			return ResultUtil.createFail("更新失败", ResultInfo.TYPE_RESULT_FAIL);
		}
		return ResultUtil.createSuccess("更新成功", ResultInfo.TYPE_RESULT_SUCCESS);
	}
}
