package cn.riverdream.utils.exlexp;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
 
import javax.servlet.ServletOutputStream;
 
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFCellStyle;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import cn.riverdream.pojo.TbCheck;
import cn.riverdream.utils.ExportInternalUtil;
 
public class ExportCheck {
 
    public static void ExportExcel(String[] titles, ArrayList<TbCheck> list, ServletOutputStream outputStream) {
        // 创建一个workbook 对应一个excel应用文件
        XSSFWorkbook workBook = new XSSFWorkbook();
        // 在workbook中添加一个sheet,对应Excel文件中的sheet
        //Sheet名称，可以自定义中文名称
        XSSFSheet sheet = workBook.createSheet("Sheet1");
        ExportInternalUtil exportUtil = new ExportInternalUtil(workBook, sheet);
        XSSFCellStyle headStyle = exportUtil.getHeadStyle();
        XSSFCellStyle bodyStyle = exportUtil.getBodyStyle();
        // 构建表头
        XSSFRow headRow = sheet.createRow(0);
        XSSFCell cell = null;
 
        // 输出标题
        for (int i = 0; i < titles.length; i++) {
            cell = headRow.createCell(i);
            cell.setCellStyle(headStyle);
            cell.setCellValue(titles[i]);
        }
        // 构建表体数据
        for (int j = 0; j < list.size(); j++) {
            XSSFRow bodyRow = sheet.createRow(j + 1);
            TbCheck check = list.get(j);
 
            cell = bodyRow.createCell(0);
            cell.setCellStyle(bodyStyle);
            cell.setCellValue(check.getContractno());
 
            cell = bodyRow.createCell(1);
            cell.setCellStyle(bodyStyle);
            cell.setCellValue(check.getConsumer());
 
            cell = bodyRow.createCell(2);
            cell.setCellStyle(bodyStyle);
            cell.setCellValue(check.getCheckno());
             
            cell = bodyRow.createCell(3);
            cell.setCellStyle(bodyStyle);
            cell.setCellValue(check.getIncomeamount());
             
            cell = bodyRow.createCell(4);
            cell.setCellStyle(bodyStyle);
            SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
            String date = df.format(check.getIncomedate());
            cell.setCellValue(date);
            
            cell = bodyRow.createCell(5);
            cell.setCellStyle(bodyStyle);
            cell.setCellValue(check.getTaxamount());
            
            cell = bodyRow.createCell(6);
            cell.setCellStyle(bodyStyle);
            cell.setCellValue(check.getTaxpoint());
            
            cell = bodyRow.createCell(7);
            cell.setCellStyle(bodyStyle);
            cell.setCellValue(check.getPayamount());
            
            cell = bodyRow.createCell(8);
            cell.setCellStyle(bodyStyle);
            SimpleDateFormat df1 = new SimpleDateFormat("yyyy-MM-dd");
            String date1 = df.format(check.getPaydate());
            cell.setCellValue(date1);
            
            cell = bodyRow.createCell(9);
            cell.setCellStyle(bodyStyle);
            cell.setCellValue(check.getAccount());
            
            cell = bodyRow.createCell(10);
            cell.setCellStyle(bodyStyle);
            cell.setCellValue(check.getCompany());
            
            cell = bodyRow.createCell(11);
            cell.setCellStyle(bodyStyle);
            cell.setCellValue(check.getComment());
        }
 
        try {
            workBook.write(outputStream);
            outputStream.flush();
            outputStream.close();
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            try {
                outputStream.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }
}
