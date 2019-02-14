package com.nic.api.web.controller;

import com.nic.api.service.SystemService;
import com.nic.commons.dto.SystemDTO;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;

@RestController
@RequestMapping("api/system")
public class SystemController {
    @Resource
    private SystemService systemService;

    @RequestMapping(value = "info", method = RequestMethod.GET)
    public SystemDTO info() {
        return systemService.getSysInfo();
    }
}
