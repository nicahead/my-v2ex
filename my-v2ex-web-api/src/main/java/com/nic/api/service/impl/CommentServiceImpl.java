package com.nic.api.service.impl;

import com.nic.api.dao.CommentDao;
import com.nic.api.dao.PostDao;
import com.nic.api.service.CommentService;
import com.nic.commons.dto.CommentListDTO;
import com.nic.commons.dto.PageInfo;
import com.nic.domain.Comment;
import com.nic.domain.CommentQueryVO;
import com.nic.domain.Post;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;

@Service
@Transactional
public class CommentServiceImpl implements CommentService {
    @Resource
    private CommentDao commentDao;
    @Resource
    private PostDao postDao;

    @Override
    public void addComment(Comment comment) {
        commentDao.insertComment(comment);
        //更新该帖子的相关信息
        Post post = postDao.selectById(comment.getPost_id());
        post.setComments(post.getComments()+1); //评论数加一
        post.setReply_id(comment.getAuthor_id()); //最近回复人id
        post.setReply_username(comment.getAuthor_name()); //最近回复人name
        post.setReplyed(new Date()); //最近回复时间
        postDao.updatePost(post);
    }

    @Override
    public PageInfo<CommentListDTO> getComments(CommentQueryVO commentQueryVO) {
        PageInfo<CommentListDTO> pageInfo = new PageInfo<CommentListDTO>();
        List<CommentListDTO> commentList = commentDao.getComments(commentQueryVO);
        int count = commentDao.getCount(commentQueryVO);
        pageInfo.setData(commentList);
        pageInfo.setRecordsFiltered(count);
        pageInfo.setRecordsTotal(count);
        pageInfo.setError("");
        return pageInfo;
    }
}
