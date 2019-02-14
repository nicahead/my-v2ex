package com.nic.api.web.controller;

import com.nic.api.service.PostService;
import com.nic.commons.dto.PageInfo;
import com.nic.commons.dto.PostListDTO;
import com.nic.commons.dto.BaseResult;
import com.nic.commons.utils.MapperUtils;
import com.nic.domain.Post;
import com.nic.domain.PostQueryVO;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.List;

@RestController
@RequestMapping("api/posts")
public class PostController {

    @Resource
    private PostService postService;

    @RequestMapping(value = "save", method = RequestMethod.POST)
    public BaseResult save(String postStr) {
        Post post = null;
        try {
            post = MapperUtils.json2pojo(postStr, Post.class);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return postService.savaPost(post);
    }

    @RequestMapping(value = "page", method = RequestMethod.POST)
    public PageInfo<PostListDTO> list(String postQueryStr) {
        PostQueryVO postQueryVO = null;
        PageInfo<PostListDTO> postList = null;
        try {
            postQueryVO = MapperUtils.json2pojo(postQueryStr, PostQueryVO.class);
            postList = postService.getAllposts(postQueryVO);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return postList;
    }

    @RequestMapping(value = "pop", method = RequestMethod.GET)
    public List<PostListDTO> pop() {
        return postService.getPopposts();
    }
    @RequestMapping(value = "detail", method = RequestMethod.GET)
    public Post detail(String id) {
        return postService.getPostDetail(id);
    }
}
