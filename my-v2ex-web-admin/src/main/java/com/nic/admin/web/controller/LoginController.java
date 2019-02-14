package com.nic.admin.web.controller;

import com.nic.admin.service.LoginService;
import com.nic.admin.service.UserService;
import com.nic.domain.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.Date;

@Controller
public class LoginController {

    @Resource
    private LoginService loginService;
    @Resource
    private UserService userService;

    @RequestMapping(value = {"", "login"}, method = RequestMethod.GET)
    public String login() {
        return "login";
    }

    @RequestMapping(value = "login", method = RequestMethod.POST)
    public String login(User user, Model model, HttpServletRequest httpServletRequest) {
        User tbUser = loginService.login(user);
        if (tbUser != null) {
            httpServletRequest.getSession().setAttribute("user", tbUser);
            tbUser.setPassword(user.getPassword()); //防止密码被修改
            tbUser.setLogined(new Date());
            userService.savaUser(tbUser); //更新最近登录时间
            return "redirect:/main";
        }
        model.addAttribute("message", "用户名或密码错误，请重新输入");
        return "login";
    }
    @RequestMapping(value = "logout", method = RequestMethod.GET)
    public String logout(HttpServletRequest httpServletRequest) {
        httpServletRequest.getSession().invalidate();
        return "login";
    }
}
