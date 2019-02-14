package com.nic.ui.controller;

import com.nic.commons.dto.BaseResult;
import com.nic.domain.User;
import com.nic.ui.api.UserApi;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;

@Controller
public class UserController {

//    @ModelAttribute("editUser")
//    public User getUser(Long id) {
//        if (id != null) {
//            try {
//                return UserApi.getUser(id);
//            } catch (Exception e) {
//                e.printStackTrace();
//            }
//        }
//        return null;
//    }

    @RequestMapping(value = "login", method = RequestMethod.GET)
    public String login() {
        return "login";
    }

    @RequestMapping(value = "login", method = RequestMethod.POST)
    public String login(User user, Model model, HttpServletRequest httpServletRequest) {
        User tbUser = null;
        try {
            tbUser = UserApi.login(user);
            if (tbUser != null) {
                httpServletRequest.getSession().setAttribute("user", tbUser);
                tbUser.setPassword(user.getPassword()); //防止密码被修改
                tbUser.setLogined(new Date());
                UserApi.savaUser(tbUser); //更新最近登录时间
                return "redirect:/main";
            }
            model.addAttribute("message", "用户名或密码错误，请重新输入");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "login";
    }

    @RequestMapping(value = "logout", method = RequestMethod.GET)
    public String logout(HttpServletRequest httpServletRequest) {
        httpServletRequest.getSession().invalidate();
        return "login";
    }

    @RequestMapping(value = "signup", method = RequestMethod.GET)
    public String signup() {
        return "signup";
    }

    @RequestMapping(value = "save", method = RequestMethod.POST)
    public String save(@ModelAttribute("editUser") User user, RedirectAttributes redirectAttributes, Model model) {
        BaseResult baseResult = null;
        try {
            baseResult = UserApi.savaUser(user);
            if (baseResult.getStatus() == 200) {
                redirectAttributes.addFlashAttribute("baseResult", baseResult);
                return "redirect:/login";
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        model.addAttribute("baseResult", baseResult);
        return "signup";
    }
}
