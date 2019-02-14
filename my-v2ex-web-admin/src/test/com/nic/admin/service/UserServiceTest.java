package com.nic.admin.service;

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
public class UserServiceTest {

    @Resource
    UserService userService;
    @Test
    public void getUserList() {
        List<User> ls = userService.getUserList(new UserQueryVO());
        System.out.println(ls);
    }
}