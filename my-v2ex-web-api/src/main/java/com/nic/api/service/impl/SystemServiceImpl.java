package com.nic.api.service.impl;

import com.nic.api.dao.CommentDao;
import com.nic.api.dao.PostDao;
import com.nic.api.dao.UserDao;
import com.nic.api.service.SystemService;
import com.nic.commons.dto.SystemDTO;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class SystemServiceImpl implements SystemService {
    @Resource
    private UserDao userDao;
    @Resource
    private PostDao postDao;
    @Resource
    private CommentDao commentDao;
    @Override
    public SystemDTO getSysInfo() {
        SystemDTO systemDTO = new SystemDTO();
        systemDTO.setUserCount(userDao.getCount(null));
        systemDTO.setPostCount(postDao.getCount(null));
        systemDTO.setCommentCount(commentDao.getCount(null));
        return systemDTO;
    }
}
