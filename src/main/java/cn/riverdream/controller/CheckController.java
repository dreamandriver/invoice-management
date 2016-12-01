package cn.riverdream.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.riverdream.model.CheckVo;
import cn.riverdream.pojo.TbCheck;
import cn.riverdream.service.CheckService;
import cn.riverdream.utils.DataGridResultInfo;
import cn.riverdream.utils.ResultInfo;
import cn.riverdream.utils.ResultUtil;
import cn.riverdream.utils.exlexp.ExportCheck;

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
	
	@RequestMapping("/searchd/{contractno}")
	@ResponseBody
	public DataGridResultInfo getCheck(@PathVariable String contractno) {
		CheckVo checkvo = new CheckVo();
		checkvo.setContractno(contractno);
		checkvo.setPage(1);
		checkvo.setRows(30);
		DataGridResultInfo gridResultInfo = checkService.find(checkvo);
		return gridResultInfo;
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
			if(checkvo.getCheck().getOther() == null){
				checkvo.getCheck().setOther(0.00);
			}
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
	
	@RequestMapping(value = "/excelDownload")
    public String exportExcel(HttpServletResponse response, CheckVo checkvo) {
        try {
            //String fileName = new String(("导出excel标题").getBytes(), "UTF-8") + ".xlsx";
            String fileName=new String(("支票").getBytes("gb2312"), "iso8859-1")+ ".xlsx";
            response.setContentType("application/vnd.ms-excel;charset=UTF-8");
            response.setHeader("Content-Disposition", "attachment;filename=" + fileName);
            response.setCharacterEncoding("utf-8");
 
            // response.setHeader("Content-disposition", "attachment; filename="
            // + "exdddcel" + ".xlsx");// 组装附件名称和格式
 
            String[] titles = { "合同号", "客户姓名", "支票号", "收入金额", "收入日期", "扣税金额", "扣税税点", "支出金额", "支出日期", "结算", "单位名称", "备注" };
 
            /*SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            String date = df.format(new Date());
            Date dateNow = null;
            try {
                dateNow = df.parse(date);
            } catch (ParseException e) {
                e.printStackTrace();
            }*/
            List<TbCheck> list = checkService.findAll(checkvo);
            ServletOutputStream outputStream = response.getOutputStream();
            
            ExportCheck.ExportExcel(titles, (ArrayList<TbCheck>) list, outputStream);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return null;
    }
}
