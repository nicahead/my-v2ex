package com.nic.admin.service.impl;

import com.nic.admin.dao.UserDao;
import com.nic.admin.service.LoginService;
import com.nic.domain.User;
import org.springframework.stereotype.Service;
import org.springframework.util.DigestUtils;

import javax.annotation.Resource;

@Service
public class LoginServiceImpl implements LoginService {
    @Resource
    UserDao userDao;

    /**
     * 登录验证
     *
     * @param user 封装用户名和密码
     * @return 存在该用户则返回用户对象，否则返回空
     */
    @Override
    public User login(User user) {
        User tbUser = userDao.getUserByname(user.getUsername());
        //用户名存在
        if (tbUser != null) {
            //密码明文加密后与数据库中该用户的密码是否匹配
            String md5Password = DigestUtils.md5DigestAsHex(user.getPassword().getBytes());
            if (md5Password.equals(tbUser.getPassword()) && (tbUser.getRole().intValue()==1))
                return tbUser;
        }
        return null;
    }
}
