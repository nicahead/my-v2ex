package com.nic.admin.web.controller;

import com.nic.admin.service.SystemService;
import com.nic.commons.dto.SystemDTO;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.annotation.Resource;

@Controller
public class MainController {
    @Resource
    private SystemService systemService;

    @ModelAttribute("sysInfo")
    public SystemDTO getSysInfo() {
        SystemDTO systemDTO = systemService.getSysInfo();
        return systemDTO;
    }

    @RequestMapping(value = "main", method = RequestMethod.GET)
    public String main() {
        return "main";
    }
}
