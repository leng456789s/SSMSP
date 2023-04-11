package hb.rj.controller;

import hb.rj.GoodsApp;
import hb.rj.dao.entity.Condition;
import hb.rj.dao.entity.Goods;
import hb.rj.dao.mapper.GoodsMapper;
import hb.rj.service.GoodsService;
import hb.rj.util.Page;
import hb.rj.util.PageUtil;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.List;

@Controller
@RequestMapping("/goods")
public class GoodsController {

    @RequestMapping("listAll")
    public String listAll(HttpServletRequest request) {
        HttpSession session = request.getSession();
        GoodsService goodsService = null;
        //产看session领域中有没有goodsService对象
        if (session.getAttribute("goodsService") == null) {
            GoodsApp goodsApp = new GoodsApp();
            goodsService = goodsApp.getGoodsService();
            session.setAttribute("goodsService", goodsService);

        } else {
            goodsService = (GoodsService) session.getAttribute("goodsService");
        }
        List<Goods> goodsList = goodsService.selectAll();
        session.setAttribute("goodsList", goodsList);
        return "List";// 打开list视图
    }
    @RequestMapping("/list")
    public String list(HttpServletRequest request, Condition condition) throws UnsupportedEncodingException {
        request.setCharacterEncoding("utf-8");
        String textSearch=new String(condition.getText_search().getBytes("iso8859-1"),"utf-8");
        HttpSession session = request.getSession();
        GoodsService goodsService=(GoodsService) session.getAttribute("goodService");
        List<Goods> list;
        if(id.equals("0")){
            list=(goodsService.fetPageUtil().Page(1,2,session,"","",""));
        }else {
            if (id.equals("1")){
                list=goodsService.getPageUtil().Page(1,2,session,"",textSearch,"");
            }else {
                list=goodsService.getPageUtil().Page(1,2,session,",",textSearch);
            }
        }
        session.setAttribute("goodsList",list);


        return "list";
    }
    @RequestMapping("/add")
    public String add(HttpServletRequest request,
                      @RequestParam("myFile")MultipartFile myFile,
                      Goods goods) throws IOException {
        HttpSession session=request.getSession();
        GoodsService goodsService=(GoodsService) session.getAttribute("goodsService");
        goodsService.getFileUpload().oneFilUpload(request,myFile,goods,goodsService);;
        Page page=(Page)session.getAttribute("pageGoods");//取当前的分页信息
        Long pagenNum=page.getTotalPage();//取总页数，添加应显示最后一页。
        List list=goodsService.getPageUtil().Page((int)(long)pagenNum,2,session,"","","");
        return "redirect:/goods/list?GoodsCurrentPage="+page.getTotalPage();
    }
        @RequestMapping("/selectById")
    public String selectById(HttpServletRequest request, @Param("id") String id){
        HttpSession session=request.getSession();
        GoodsService goodsService=(GoodsService) session.getAttribute("goodsService");
        List<Goods> list=goodsService.getPageUtil().Page(1,1,session,id,"","");
        Goods goods=list.get(0);
        session.setAttribute("goods",goods);
        return "Modify";

        }
        @RequestMapping("/modify")
        public String oneFileUpload(HttpServletRequest request, @Param("id") String id){
            HttpSession session=request.getSession();
            GoodsService goodsService=(GoodsService) session.getAttribute("goodsService");
            List<Goods> list=goodsService.getPageUtil().Page(1,1,session,id,"","");
            Goods goods=list.get(0);
            session.setAttribute("goods",goods);
            return "Modify";
        }
    @RequestMapping("/deleteById")//按照id号删除
    public String deleteById(HttpServletRequest request,@Param("id") String id) throws UnsupportedEncodingException {
        request.setCharacterEncoding("utf-8");
        HttpSession session=request.getSession();
        GoodsService goodsService=(GoodsService)session.getAttribute("goodsService");
        goodsService.deleteByPrimaryKey(Integer.parseInt(id));//删除指定的id记录
        Page page=(Page) session.getAttribute("pageGoods");//取出当给钱的分页信息
        int pageNum=page.getCurrentPage();//取出当前页号
        List list=goodsService.getPageUtil().Page(pageNum,3,session,"","","");
        return "redirect:/goods/list?GoodsCurrentPage="+page.getCurrentPage();//从那页删除的，跳回那页去。
    }
}
