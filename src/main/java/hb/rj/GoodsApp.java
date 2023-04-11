package hb.rj;

import hb.rj.service.GoodsService;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class GoodsApp {
    private GoodsService goodsService;

    public GoodsService getGoodsService() {
        return goodsService;
    }

    public void setGoodsService(GoodsService goodsService) {
        this.goodsService = goodsService;
    }
    public void getApplicationContext(){
        //1.指定配置文件
        String XmlFile="applicationContext.xml";
        //2.加载配置问价n
        ApplicationContext applicationContext=new ClassPathXmlApplicationContext(XmlFile);
        //3.从Spring容器中取出goodsService对象
        this.goodsService=applicationContext.getBean("goodsService",GoodsService.class);

    }
    public GoodsApp(){
        this.getApplicationContext();//当GoodsApp被实例化时，就从Spring容器中取出对象
    }
}
