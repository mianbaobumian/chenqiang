import com.keyi.chenqiang.user.dao.UserDao;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;

/**
 * @Description: [一句话描述该类的功能]
 * @Author: [xie_chenghao]
 * @CreateDate: [2020/3/29 15:21]
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath:spring-mybatis.xml")
public class UserTest
{
    @Resource
    private UserDao userDao;

    @Test
    public void selectUser(){
        int i=userDao.getTotal();
        System.out.println(i);
    }
}
