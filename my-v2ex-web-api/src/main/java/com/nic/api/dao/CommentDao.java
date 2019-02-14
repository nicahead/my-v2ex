package com.nic.api.dao;

import com.nic.commons.dto.CommentListDTO;
import com.nic.domain.Comment;
import com.nic.domain.CommentQueryVO;

import java.util.List;

public interface CommentDao {
    public List<CommentListDTO> getComments(CommentQueryVO commentQueryVO);
    public int getCount(CommentQueryVO commentQueryVO);
    public void insertComment(Comment comment);
}
