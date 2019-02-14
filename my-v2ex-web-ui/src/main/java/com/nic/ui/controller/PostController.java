package com.nic.ui.controller;

import com.nic.commons.dto.BaseResult;
import com.nic.commons.dto.PageInfo;
import com.nic.commons.dto.PostListDTO;
import com.nic.domain.Node;
import com.nic.domain.Post;
import com.nic.domain.PostQueryVO;
import com.nic.ui.api.NodeApi;
import com.nic.ui.api.PostApi;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping("posts")
public class PostController {

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

    @RequestMapping(value = "add", method = RequestMethod.GET)
    public String add() {
        return "add";
    }

    @RequestMapping(value = "add", method = RequestMethod.POST)
    public String add(Post post) {
        BaseResult baseResult = null;
        try {
            baseResult = PostApi.savePost(post);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "redirect:detail/" + baseResult.getData();
    }

    @RequestMapping(value = "detail/{id}", method = RequestMethod.GET)
    public String detail(@PathVariable() String id, Model model) {
        try {
            Post post = PostApi.getPopDetail(id);
            if (post != null)
                model.addAttribute("post", post);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "detail";
    }

    @ResponseBody
    @RequestMapping(value = "pop", method = RequestMethod.GET)
    public List<PostListDTO> pop() {
        List<PostListDTO> popList = null;
        try {
            popList = PostApi.getPopPosts();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return popList;
    }

    @ResponseBody
    @RequestMapping(value = "page", method = RequestMethod.GET)
    public PageInfo<PostListDTO> page(HttpServletRequest request, Post post) {
        PageInfo<PostListDTO> pageInfo = null;
        String drawStr = request.getParameter("draw");
        String startStr = request.getParameter("start");
        String lengthStr = request.getParameter("length");
        int draw = drawStr == null ? 0 : Integer.parseInt(drawStr);
        int start = startStr == null ? 0 : Integer.parseInt(startStr);
        int length = lengthStr == null ? 10 : Integer.parseInt(lengthStr);
        PostQueryVO postQueryVO = new PostQueryVO();
        postQueryVO.setPost(post);
        postQueryVO.setStart(start);
        postQueryVO.setLength(length);
        try {
            pageInfo = PostApi.getPosts(postQueryVO);
        } catch (Exception e) {
            e.printStackTrace();
        }
        pageInfo.setDraw(draw);
        return pageInfo;
    }
}
