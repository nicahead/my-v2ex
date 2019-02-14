package com.nic.admin.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("comment")
public class CommentController {
    @RequestMapping(value = "list",method = RequestMethod.GET)
    public String list(){
        return "comment/list";
    }
}
