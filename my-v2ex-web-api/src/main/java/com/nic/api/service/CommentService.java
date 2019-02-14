package com.nic.api.service;

import com.nic.commons.dto.CommentListDTO;
import com.nic.commons.dto.PageInfo;
import com.nic.domain.Comment;
import com.nic.domain.CommentQueryVO;

public interface CommentService {
    public void addComment(Comment comment);
    public PageInfo<CommentListDTO> getComments(CommentQueryVO commentQueryVO);
}
