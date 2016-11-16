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

import cn.riverdream.pojo.TbContract;
import cn.riverdream.utils.ExportInternalUtil;
 
public class ExportContract {
 
    public static void ExportExcel(String[] titles, ArrayList<TbContract> list, ServletOutputStream outputStream) {
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
            TbContract contract = list.get(j);
 
            cell = bodyRow.createCell(0);
            cell.setCellStyle(bodyStyle);
            cell.setCellValue(contract.getContractno());
 
            cell = bodyRow.createCell(1);
            cell.setCellStyle(bodyStyle);
            cell.setCellValue(contract.getConsumer());
 
            cell = bodyRow.createCell(2);
            cell.setCellStyle(bodyStyle);
            SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
            String date = df.format(contract.getCreatedate());
            cell.setCellValue(date);
             
            cell = bodyRow.createCell(3);
            cell.setCellStyle(bodyStyle);
            cell.setCellValue(contract.getAmount());
             
            cell = bodyRow.createCell(4);
            cell.setCellStyle(bodyStyle);
            cell.setCellValue(contract.getCompany());
            
            cell = bodyRow.createCell(5);
            cell.setCellStyle(bodyStyle);
            cell.setCellValue(contract.getIfformal()==1?"是":"否");
            
            cell = bodyRow.createCell(6);
            cell.setCellStyle(bodyStyle);
            cell.setCellValue(contract.getComment());
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
