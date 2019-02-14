package com.nic.admin.dao;

import com.nic.domain.User;
import com.nic.domain.UserQueryVO;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;
import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:spring/applicationContext-dao.xml", "classpath:spring/applicationContext-service.xml"})
public class UserDaoTest {

    @Resource
    UserDao userDao;
    @Test
    public void getUsers() {
//        User user = new User();
//        user.setId(1l);
//        user.setUsername("root");
//        user.setRole(1);
//        System.out.println(userDao.getUserList(user));
//        UserQueryVO userQueryVO = new UserQueryVO();
//        userQueryVO.setStart(0);
//        userQueryVO.setLength(1);
        List<User> ls = userDao.getUserList(new UserQueryVO());
        System.out.println(ls);
    }
}