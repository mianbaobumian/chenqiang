import com.keyi.chenqiang.dd.model.Dd;
import com.keyi.chenqiang.dd.service.DdService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;
import java.util.List;

/**
 * @Author:Leib
 * @Date 2020/4/3 10:47
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath:spring-mybatis.xml")
public class DdTest {
    @Resource(name="ddService")
    private DdService ddService;

//    @Resource
//    private DdDao ddDao; //调用service

    @Test
    public void selectAll(){
        List<Dd> listDd= ddService.selectAll();
        for (Dd d : listDd) {
            System.out.println(d );
        }
    }
}
