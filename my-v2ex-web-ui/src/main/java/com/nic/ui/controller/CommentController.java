package com.nic.ui.controller;

import com.nic.commons.dto.CommentListDTO;
import com.nic.commons.dto.PageInfo;
import com.nic.domain.Comment;
import com.nic.domain.CommentQueryVO;
import com.nic.ui.api.CommentApi;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("comments")
public class CommentController {

    @RequestMapping(value = "add",method = RequestMethod.POST)
    public String add(Comment comment){
        String post_id = comment.getPost_id();
        try {
            CommentApi.addComment(comment);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "redirect:/posts/detail/"+post_id;
    }

    @ResponseBody
    @RequestMapping(value = "page", method = RequestMethod.GET)
    public PageInfo<CommentListDTO> page(HttpServletRequest request, Comment comment) {
        PageInfo<CommentListDTO> pageInfo = null;
        String drawStr = request.getParameter("draw");
        String startStr = request.getParameter("start");
        String lengthStr = request.getParameter("length");
        int draw = drawStr == null ? 0 : Integer.parseInt(drawStr);
        int start = startStr == null ? 0 : Integer.parseInt(startStr);
        int length = lengthStr == null ? 10 : Integer.parseInt(lengthStr);
        CommentQueryVO commentQueryVO = new CommentQueryVO();
        commentQueryVO.setComment(comment);
        commentQueryVO.setStart(start);
        commentQueryVO.setLength(length);
        try {
            pageInfo = CommentApi.getComments(commentQueryVO);
        } catch (Exception e) {
            e.printStackTrace();
        }
        pageInfo.setDraw(draw);
        return pageInfo;
    }
}
