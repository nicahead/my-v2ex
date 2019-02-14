package com.nic.admin.web.controller;

import com.nic.admin.service.NodeService;
import com.nic.commons.dto.BaseResult;
import com.nic.domain.Node;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.annotation.Resource;
import java.util.List;

@Controller
@RequestMapping("node")
public class NodeController {

    @Resource
    private NodeService nodeService;

    @RequestMapping(value = "list", method = RequestMethod.GET)
    public String list(Model model) {
        List<Node> nodeList = nodeService.getNodeList(new Node());
        model.addAttribute("nodeList",nodeList);
        return "node/list";
    }

    @RequestMapping(value = "form", method = RequestMethod.GET)
    public String form(Integer id,Model model) {
        Node editNode = null;
        if (id != null) {
            Node nodeQuery = new Node();
            nodeQuery.setId(id);
            List<Node> nodeList = nodeService.getNodeList(nodeQuery);
            editNode = nodeList.size() > 0 ? nodeList.get(0) : null;
        }
        model.addAttribute("editNode",editNode);
        return "node/form";
    }

    @RequestMapping(value = "save", method = RequestMethod.POST)
    public String save(@ModelAttribute("editNode")Node node, RedirectAttributes redirectAttributes, Model model) {
        BaseResult baseResult = nodeService.saveNode(node);
        if (baseResult.getStatus() == 200) {
            redirectAttributes.addFlashAttribute("baseResult", baseResult);
            return "redirect:/node/list";
        }
        model.addAttribute("baseResult", baseResult);
        return "node/form";
    }

    @ResponseBody
    @RequestMapping(value = "delete", method = RequestMethod.POST)
    public BaseResult delete(String ids) {
        return nodeService.delNodes(ids);
    }
}
