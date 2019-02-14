package com.nic.admin.service.impl;

import com.nic.admin.dao.CommentDao;
import com.nic.admin.dao.NodeDao;
import com.nic.admin.dao.PostDao;
import com.nic.admin.dao.UserDao;
import com.nic.admin.service.SystemService;
import com.nic.commons.dto.SystemDTO;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class SystemServiceImpl implements SystemService {
    @Resource
    private UserDao userDao;
    @Resource
    private NodeDao nodeDao;
    @Resource
    private PostDao postDao;
    @Resource
    private CommentDao commentDao;
    @Override
    public SystemDTO getSysInfo() {
        SystemDTO systemDTO = new SystemDTO();
        systemDTO.setUserCount(userDao.getCount(null));
        systemDTO.setNewUserCount(userDao.getNewCount());
        systemDTO.setNodeCount(nodeDao.getCount());
        systemDTO.setPostCount(postDao.getCount(null));
        systemDTO.setNewPostCount(postDao.getNewCount());
        systemDTO.setCommentCount(commentDao.getCount(null));
        systemDTO.setNewCommentCount(commentDao.getNewCount());
        return systemDTO;
    }
}
