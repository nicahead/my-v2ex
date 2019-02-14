package com.nic.api.service.impl;

import com.nic.api.dao.UserDao;
import com.nic.api.service.UserService;
import com.nic.commons.dto.BaseResult;
import com.nic.commons.utils.RegexpUtils;
import com.nic.domain.User;
import com.nic.domain.UserQueryVO;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.util.DigestUtils;

import javax.annotation.Resource;
import java.util.List;

@Service
public class UserServiceImpl implements UserService {
    @Resource
    private UserDao userMapper;

    /**
     * 登录验证
     *
     * @param user 封装用户名和密码
     * @return 存在该用户则返回用户对象，否则返回空
     */
    @Override
    public User login(User user) {
        User tbUser = userMapper.getUserByname(user.getUsername());
        //用户名存在
        if (tbUser != null) {
            //密码明文加密后与数据库中该用户的密码是否匹配
            String md5Password = DigestUtils.md5DigestAsHex(user.getPassword().getBytes());
            if (md5Password.equals(tbUser.getPassword()))
                return tbUser;
        }
        return null;
    }
    @Override
    public List<User> getUserList(UserQueryVO userQueryVO) {
        if (userQueryVO.getUser()!=null){
            if (userQueryVO.getUser().getRole() != null) {
                if (userQueryVO.getUser().getRole().intValue() == -1){
                    userQueryVO.getUser().setRole(null);
                }
            }
        }
        return userMapper.getUserList(userQueryVO);
    }

    @Override
    public int getUserCount(UserQueryVO userQueryVO) {
        return userMapper.getCount(userQueryVO);
    }

    @Override
    public BaseResult saveUser(User user) {
        BaseResult baseResult = checkUser(user);
        if (baseResult.getStatus() == 200) {
            user.setPassword(DigestUtils.md5DigestAsHex(user.getPassword().getBytes()));
            if (user.getId() != null) {
                //修改操作
                userMapper.updateUser(user);
                baseResult.setMessage("修改用户成功");
            } else {
                //新增操作
                userMapper.addUser(user);
                baseResult.setMessage("添加用户成功");
            }
        }
        return baseResult;
    }

    private BaseResult checkUser(User user) {
        BaseResult baseResult = BaseResult.success();
        UserQueryVO userQueryVO = new UserQueryVO();
        User userQuery = new User();
        userQuery.setEmail(user.getEmail());
        userQueryVO.setUser(userQuery);
        if (StringUtils.isBlank(user.getUsername())) {
            baseResult = BaseResult.fail("用户名不能为空！");
        } else if (userMapper.getUserByname(user.getUsername()) != null) {
            //用户名已存在，但不是当前修改信息用户的原用户名
            if (userMapper.getUserByname(user.getUsername()).getId() != user.getId())
                baseResult = BaseResult.fail("该用户名已存在！");
        } else if (StringUtils.isBlank(user.getPassword())) {
            baseResult = BaseResult.fail("密码不能为空！");
        } else if (StringUtils.isBlank(user.getEmail())) {
            baseResult = BaseResult.fail("邮箱不能为空！");
        } else if (!RegexpUtils.checkEmail(user.getEmail())) {
            baseResult = BaseResult.fail("邮箱格式不正确！");
        } else if (userMapper.getUserList(userQueryVO).size() > 0) {
            //邮箱已存在，但不是当前修改信息用户的原邮箱
            if (userMapper.getUserList(userQueryVO).get(0).getId() != user.getId())
                baseResult = BaseResult.fail("该邮箱已绑定过账号,请使用其他邮箱！");
        }
        return baseResult;
    }
}
