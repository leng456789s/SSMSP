package hb.rj.util;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import hb.rj.dao.entity.Goods;
import hb.rj.service.GoodsService;

import javax.servlet.http.HttpSession;
import java.util.List;

public class PageUtil {
    private Page page;

    public Page getPage() {
        return page;
    }

    public void setPage(Page page) {
        this.page = page;
    }
    public List<Goods> Page(
            Integer pageNum,//页号
            Integer RowCunt,//每页的记录数量
            HttpSession session,//session
            String id,
            String name,
            String type
    ){
        if(id==""){
            id=null;
        }
        if(name==""){
            name=null;
        }
        if(type==""){
            type=null;
        }
        GoodsService goodsService=(GoodsService) session.getAttribute("goodsService");
        PageHelper.startPage(pageNum,RowCunt);//使用PageHelper进行分页，指定当前页号和每页包含的记录
        List<Goods> list=goodsService.selectByCondition(id,name,type);//按条件查询
        PageInfo<Goods> pageInfo=new PageInfo<>(list,pageNum);

        System.out.println(pageInfo);//输出一下pageInfo便于调试

        page.setCurrentPage(pageInfo.getPageNum());//获取当前页号
        page.setTotalPage(pageInfo.getPages());//总页数
        page.setTotalCount(pageInfo.getPageSize());//分页时每页的记录数
        page.setPageRowCount(pageInfo.getSize());//当前页的记录数
        page.setRowCount(pageInfo.getTotal());//记录总数
        session.setAttribute("pb",page);//将分页信息写入session

        return list;
    }



}
