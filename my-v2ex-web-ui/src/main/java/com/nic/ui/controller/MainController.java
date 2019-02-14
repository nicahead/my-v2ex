package com.nic.ui.controller;

import com.nic.commons.dto.SystemDTO;
import com.nic.domain.Node;
import com.nic.ui.api.NodeApi;
import com.nic.ui.api.SystemApi;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class MainController {
    @ModelAttribute("nodeList")
    public List<Node> getNodes() {
        List<Node> nodeList = null;
        try {
            nodeList = NodeApi.getNodes();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return nodeList;
    }

    @RequestMapping(value = {"", "main"}, method = RequestMethod.GET)
    public String main() {
        return "main";
    }

    @ResponseBody
    @RequestMapping(value = "system", method = RequestMethod.GET)
    public SystemDTO system() {
        SystemDTO sysInfo = null;
        try {
             sysInfo = SystemApi.getSysInfo();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return sysInfo;
    }
}
