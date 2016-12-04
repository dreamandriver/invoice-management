package cn.riverdream.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.riverdream.model.ContractVo;
import cn.riverdream.pojo.TbContract;
import cn.riverdream.pojo.TbUser;
import cn.riverdream.service.ContractService;
import cn.riverdream.service.UserService;
import cn.riverdream.utils.DataGridResultInfo;
import cn.riverdream.utils.ResultInfo;
import cn.riverdream.utils.ResultUtil;
import cn.riverdream.utils.exlexp.ExportContract;

@Controller
@RequestMapping("/management/contract")
public class ContractController {

	@Autowired
	private ContractService contractService;

	@Autowired
	private UserService userService;

	@RequestMapping("/search")
	@ResponseBody
	public DataGridResultInfo getContract(ContractVo contractvo) {
		DataGridResultInfo gridResultInfo = contractService.find(contractvo);
		return gridResultInfo;
	}

	@RequestMapping("/add")
	@ResponseBody
	public ResultInfo saveContract(ContractVo contractvo) {
		String contractno = contractvo.getContract().getContractno();
		if (contractService.findByContractNo(contractno) != null) {
			return ResultUtil.createFail("合同号重复,请修改合同号", ResultInfo.TYPE_RESULT_FAIL);
		}
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
		String contractno = contractvo.getContract().getContractno();
		TbContract contract = contractService.findByContractNo(contractno);

		if (contract != null && !contract.getSerialno().equals(contractvo.getContract().getSerialno())) {
			return ResultUtil.createFail("合同号重复,请修改合同号", ResultInfo.TYPE_RESULT_FAIL);
		}
		try {
			contractService.update(contractvo);
		} catch (Exception e) {
			return ResultUtil.createFail("更新失败", ResultInfo.TYPE_RESULT_FAIL);
		}
		return ResultUtil.createSuccess("更新成功", ResultInfo.TYPE_RESULT_SUCCESS);
	}

	@RequestMapping(value = "/excelDownload")
	public String exportExcel(HttpServletResponse response, ContractVo contractvo) {
		try {
			// String fileName = new String(("导出excel标题").getBytes(), "UTF-8") +
			// ".xlsx";
			String fileName = new String(("合同").getBytes("gb2312"), "iso8859-1") + ".xlsx";
			response.setContentType("application/vnd.ms-excel;charset=UTF-8");
			response.setHeader("Content-Disposition", "attachment;filename=" + fileName);
			response.setCharacterEncoding("utf-8");

			// response.setHeader("Content-disposition", "attachment; filename="
			// + "exdddcel" + ".xlsx");// 组装附件名称和格式

			String[] titles = { "合同号", "客户姓名", "创建日期", "金额", "单位名称", "是否正式合同", "备注" };

			/*
			 * SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"
			 * ); String date = df.format(new Date()); Date dateNow = null; try
			 * { dateNow = df.parse(date); } catch (ParseException e) {
			 * e.printStackTrace(); }
			 */
			List<TbContract> list = contractService.findAll(contractvo);
			ServletOutputStream outputStream = response.getOutputStream();

			ExportContract.ExportExcel(titles, (ArrayList<TbContract>) list, outputStream);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}

	@RequestMapping("/detail/{serialNo}")
	public String toContractDetail(@PathVariable Integer serialNo, Model model) {
		TbContract contract = contractService.findBySerialNo(serialNo);
		model.addAttribute("contract", contract);
		Subject subject = SecurityUtils.getSubject();
		// 身份
		TbUser activeUser = (TbUser) subject.getPrincipal();
		TbUser user = userService.findByUserId(activeUser.getUserid());
		model.addAttribute("activeUser", user);
		return "management/detail";
	}

}
