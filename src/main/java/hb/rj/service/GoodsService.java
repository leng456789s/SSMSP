package hb.rj.service;

import hb.rj.dao.entity.Goods;
import hb.rj.dao.mapper.GoodsMapper;
import hb.rj.util.FileUpload;
import hb.rj.util.PageUtil;
import org.springframework.stereotype.Repository;

import java.util.List;

public class GoodsService {
    private Goods goods;//商品实体类
    private GoodsMapper goodsMapper;//商品表的操作类
    private PageUtil pageUtil;

    public Goods getGoods() {
        return goods;
    }

    public void setGoods(Goods goods) {
        this.goods = goods;
    }

    public GoodsMapper getGoodsMapper() {
        return goodsMapper;
    }

    public void setGoodsMapper(GoodsMapper goodsMapper) {
        this.goodsMapper = goodsMapper;
    }
    //显示所有的记录,服务层调用dao层的方法
    public List<Goods> selectAll(){
        List<Goods> list=goodsMapper.selectAll();
        return list;
    }
    public List <Goods> selectByCondition(String id,String name,String type){
        List<Goods> list=goodsMapper.selectBycondition(id,name,type);
        return list;
    }

    public PageUtil getPageUtil() {
        return pageUtil;
    }

    public FileUpload getFileUpload() {
        return fileUpload;
    }

    public void setFileUpload(FileUpload fileUpload) {
        this.fileUpload = fileUpload;
    }

    public void setPageUtil(PageUtil pageUtil) {
        this.pageUtil = pageUtil;
    }

    private FileUpload fileUpload;//文件上传
    public int insert(Goods goods){
        int i=goodsMapper.insert(goods);
        return i;
    }
    //按id号修改记录
    int updateByPrimaryKye(Goods godos){
        int i=goodsMapper.updateByPrimaryKey(goods);
        return  i;
    }
    //按id号删除记录
    public int deleteByPrimaryKey(Integer id){
        int i=goodsMapper.deleteByPrimaryKey(id);
        return i;
    }


}
