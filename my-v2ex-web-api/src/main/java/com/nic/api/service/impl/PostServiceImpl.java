package com.nic.api.service.impl;

import com.nic.api.dao.PostDao;
import com.nic.api.service.PostService;
import com.nic.commons.dto.BaseResult;
import com.nic.commons.dto.PageInfo;
import com.nic.commons.dto.PostListDTO;
import com.nic.domain.Post;
import com.nic.domain.PostQueryVO;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;
import java.util.UUID;

@Service("postService")
public class PostServiceImpl implements PostService {

    @Resource
    private PostDao postdDao;
    @Override
    public BaseResult savaPost(Post post) {
        BaseResult baseResult = null;
        if (post.getId()==null){
            post.setId(UUID.randomUUID().toString());
            postdDao.insertPost(post);
            baseResult = BaseResult.success("帖子发表成功",post.getId());
        }
        else{
            post.setUpdated(new Date());
            postdDao.updatePost(post);
            baseResult = BaseResult.success("帖子修改成功",post.getId());
        }
        return baseResult;
    }

    @Override
    public Post getPostDetail(String id) {
        return postdDao.selectById(id);
    }

    @Override
    public PageInfo<PostListDTO> getAllposts(PostQueryVO postQueryVO) {
        PageInfo<PostListDTO> pageInfo = new PageInfo<PostListDTO>();
        List<PostListDTO> postList = postdDao.selectAll(postQueryVO);
        int count = postdDao.getCount(postQueryVO);
        pageInfo.setData(postList);
        pageInfo.setRecordsFiltered(count);
        pageInfo.setRecordsTotal(count);
        pageInfo.setError("");
        return pageInfo;
    }

    @Override
    public List<PostListDTO> getPopposts() {
        return postdDao.selectPop();
    }
}
