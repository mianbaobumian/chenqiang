import com.keyi.chenqiang.cg.model.Cg;
import com.keyi.chenqiang.cg.service.CgService;
import com.keyi.chenqiang.common.model.Page;
import com.keyi.chenqiang.dd.model.Dd;
import com.keyi.chenqiang.dd.service.DdService;
import com.keyi.chenqiang.item.model.Item;
import com.keyi.chenqiang.item.service.ItemService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath:spring-mybatis.xml")
public class DdTest {
    @Resource(name="ddService")
    private DdService ddService;

    @Resource
    private CgService cgService;

    @Resource
    private ItemService itemService;

//    @Resource
//    private DdDao ddDao; //调用service

    @Test
    public void saveCgdd(){
        Map<String, Object> paramMap = new HashMap<String, Object>();
        paramMap.put("item_id","2020032601");//商品编号
        paramMap.put("cgsl",1);//采购数量
        paramMap.put("cgdj",8.00);//采购单价
        cgService.saveCgInfo(paramMap);
    }

    @Test
    public void cgListByPage(){
        Map<String, Object> paramMap = new HashMap<String, Object>();
        Page<Cg> page=new Page<Cg>(1,5);
        paramMap.put("sqqssj","20200514");//起始时间
        paramMap.put("sqjssj","20200514");//结束时间
        paramMap.put("cgdj",8.00);//采购单价
        cgService.listByPage(page,paramMap);
    }
}
