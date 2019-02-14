package com.nic.api.dao;

import com.nic.commons.dto.PostListDTO;
import com.nic.domain.Post;
import com.nic.domain.PostQueryVO;

import java.util.List;

public interface PostDao {

    public void insertPost(Post post);
    public void updatePost(Post post);
    public Post selectById(String id);
    public List<PostListDTO> selectAll(PostQueryVO postQueryVO);
    public int getCount(PostQueryVO postQueryVO);
    public List<PostListDTO> selectPop();
}
