package hb.rj.util;

import hb.rj.dao.entity.Goods;
import hb.rj.service.GoodsService;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class FileUpload {
    public void oneFilUpload(
            HttpServletRequest request,
            MultipartFile myFile, Goods goods,
            GoodsService goodsService
    ) throws IOException {
        String realpath=request.getServletContext().getRealPath("/img/");//取出服务器上保存文件的路径
        System.out.println("服务器上的存放路径时realpath："realpath);//文件存放的目录
        String fileName=myFile.getOriginalFilename();//获取上传文件的文件名
        System.out.println("上传文件名称："+fileName);
        Date dNow=new Date();
        SimpleDateFormat ft=new SimpleDateFormat("yyyyMMddhhmmss");//设置日期格式
        String SDate=ft.format(dNow);//取出服务器当前日期
        fileName = SDate+fileName;//防止图片重名

        File targetFile=new File(realpath,fileName);
        if (!targetFile.exists()){
            System.out.println("创建文件");
            targetFile.mkdirs();
        }else {
            System.out.println("文件夹已经创建");
        }
        goods.serPicture(fileName);//good对象设置文件名
        myFile.transferTo(targetFile);//上传文件、
        goodsService.insert(goods);//向表中写入记录
    }
}
