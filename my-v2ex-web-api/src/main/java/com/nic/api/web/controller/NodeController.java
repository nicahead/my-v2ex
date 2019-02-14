package com.nic.api.web.controller;

import com.nic.api.service.NodeService;
import com.nic.domain.Node;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.List;

@RestController
@RequestMapping("api/nodes")
public class NodeController {

    @Resource
    private NodeService nodeService;

    @RequestMapping(value = "list", method = RequestMethod.GET)
    public List<Node> list() {
        return nodeService.getNodeList();
    }
}
