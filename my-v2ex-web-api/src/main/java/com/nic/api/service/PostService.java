package com.nic.api.service;

import com.nic.commons.dto.PageInfo;
import com.nic.commons.dto.PostListDTO;
import com.nic.commons.dto.BaseResult;
import com.nic.domain.Post;
import com.nic.domain.PostQueryVO;

import java.util.List;

public interface PostService {
    public BaseResult savaPost(Post post);
    public Post getPostDetail(String id);
    public PageInfo<PostListDTO> getAllposts(PostQueryVO postQueryVO);
    public List<PostListDTO> getPopposts();
}
