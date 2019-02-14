package com.nic.api.web.controller;

import com.nic.api.service.CommentService;
import com.nic.commons.dto.CommentListDTO;
import com.nic.commons.dto.PageInfo;
import com.nic.commons.utils.MapperUtils;
import com.nic.domain.Comment;
import com.nic.domain.CommentQueryVO;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;

@RestController
@RequestMapping("api/comments")
public class CommentController {
    @Resource
    private CommentService commentService;

    @RequestMapping(value = "add",method = RequestMethod.POST)
    public void add(String commentStr){
        Comment comment = null;
        try {
            comment = MapperUtils.json2pojo(commentStr,Comment.class);
        } catch (Exception e) {
            e.printStackTrace();
        }
        commentService.addComment(comment);
    }
    @RequestMapping(value = "page", method = RequestMethod.POST)
    public PageInfo<CommentListDTO> list(String commentQueryStr) {
        CommentQueryVO commentQueryVO = null;
        PageInfo<CommentListDTO> pageInfo = null;
        try {
            commentQueryVO = MapperUtils.json2pojo(commentQueryStr, CommentQueryVO.class);
            pageInfo = commentService.getComments(commentQueryVO);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return pageInfo;
    }

}
