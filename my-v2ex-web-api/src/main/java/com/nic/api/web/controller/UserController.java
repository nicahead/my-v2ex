package com.nic.api.web.controller;

import com.nic.api.service.UserService;
import com.nic.api.web.dto.UserDTO;
import com.nic.commons.dto.BaseResult;
import com.nic.commons.utils.MapperUtils;
import com.nic.domain.User;
import org.springframework.beans.BeanUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;

@RestController
@RequestMapping("api/users")
public class UserController {

    @Resource
    private UserService userService;

    @RequestMapping(value = "login", method = RequestMethod.POST)
    public BaseResult login(User user) {
        User tbUser = userService.login(user);
        if (tbUser == null) {
            return BaseResult.fail("账户名或密码错误");
        } else {
            UserDTO dto = new UserDTO();
            BeanUtils.copyProperties(tbUser, dto);
            return BaseResult.success("登录成功", dto);
        }
    }

    @RequestMapping(value = "save", method = RequestMethod.POST)
    public BaseResult save(String userStr) {
        User user = null;
        try {
            user = MapperUtils.json2pojo(userStr, User.class);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return userService.saveUser(user);
    }

    @RequestMapping(value = "member", method = RequestMethod.POST)
    public BaseResult member(User user) {
        return null;
    }
}
