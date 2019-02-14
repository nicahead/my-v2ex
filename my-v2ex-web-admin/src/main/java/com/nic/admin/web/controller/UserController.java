package com.nic.admin.web.controller;

import com.nic.admin.service.UserService;
import com.nic.commons.dto.BaseResult;
import com.nic.commons.dto.PageInfo;
import com.nic.domain.User;
import com.nic.domain.UserQueryVO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping("user")
public class UserController {
    @Resource
    private UserService userService;

    @ModelAttribute("editUser")
    public User getUser(Long id) {
        User editUser = null;
        if (id != null) {
            UserQueryVO userQueryVO = new UserQueryVO();
            User userQuery = new User();
            userQuery.setId(id);
            userQueryVO.setUser(userQuery);
            List<User> userList = userService.getUserList(userQueryVO);
            editUser = userList.size() > 0 ? userList.get(0) : null;
        }
        return editUser;
    }

    @RequestMapping(value = "list", method = RequestMethod.GET)
    public String list(Model model) {
        return "user/list";
    }

    @RequestMapping(value = "form", method = RequestMethod.GET)
    public String form(Long id) {
        return "user/form";
    }

    @RequestMapping(value = "save", method = RequestMethod.POST)
    public String save(@ModelAttribute("editUser") User user, RedirectAttributes redirectAttributes, Model model) {
        BaseResult baseResult = userService.savaUser(user);
        if (baseResult.getStatus() == 200) {
            redirectAttributes.addFlashAttribute("baseResult", baseResult);
            return "redirect:/user/list";
        }
        model.addAttribute("baseResult", baseResult);
        return "user/form";
    }

    @ResponseBody
    @RequestMapping(value = "delete", method = RequestMethod.POST)
    public BaseResult delete(String ids) {
        return userService.delUsers(ids);
    }

    @ResponseBody
    @RequestMapping(value = "page", method = RequestMethod.GET)
    public PageInfo<User> page(HttpServletRequest request, User user) {
        PageInfo<User> pageInfo = new PageInfo<User>();
        String drawStr = request.getParameter("draw");
        String startStr = request.getParameter("start");
        String lengthStr = request.getParameter("length");
        int draw = drawStr == null ? 0 : Integer.parseInt(drawStr);
        int start = startStr == null ? 0 : Integer.parseInt(startStr);
        int length = lengthStr == null ? 10 : Integer.parseInt(lengthStr);
        UserQueryVO userQueryVO = new UserQueryVO();
        userQueryVO.setUser(user);
        userQueryVO.setStart(start);
        userQueryVO.setLength(length);
        List<User> userList = userService.getUserList(userQueryVO);
        int count = userService.getUserCount(userQueryVO);
        pageInfo.setDraw(draw);
        pageInfo.setRecordsTotal(count);
        pageInfo.setRecordsFiltered(count);
        pageInfo.setData(userList);
        pageInfo.setError("");
        return pageInfo;
    }
}
