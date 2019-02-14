package com.nic.admin.dao;

import com.nic.commons.dto.CommentListDTO;
import com.nic.domain.Comment;
import com.nic.domain.CommentQueryVO;

import java.util.List;

public interface CommentDao {
    public List<CommentListDTO> getComments(CommentQueryVO commentQueryVO);
    public int getCount(CommentQueryVO commentQueryVO);
    public int getNewCount();
    public void insertComment(Comment comment);
}
