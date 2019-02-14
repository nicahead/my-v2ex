package com.nic.admin.service.impl;

import com.nic.admin.dao.UserDao;
import com.nic.admin.service.UserService;
import com.nic.commons.constant.Constant;
import com.nic.commons.dto.BaseResult;
import com.nic.commons.utils.RegexpUtils;
import com.nic.domain.User;
import com.nic.domain.UserQueryVO;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.util.DigestUtils;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;

@Service
public class UserServiceImpl implements UserService {
    @Resource
    private UserDao userDao;

    @Override
    public List<User> getUserList(UserQueryVO userQueryVO) {
        if (userQueryVO.getUser()!=null){
            if (userQueryVO.getUser().getRole() != null) {
                if (userQueryVO.getUser().getRole().intValue() == -1){
                    userQueryVO.getUser().setRole(null);
                }
            }
        }
        return userDao.getUserList(userQueryVO);
    }

    @Override
    public int getUserCount(UserQueryVO userQueryVO) {
        return userDao.getCount(userQueryVO);
    }

    @Override
    public BaseResult savaUser(User user) {
        BaseResult baseResult = checkUser(user);
        if (baseResult.getStatus() == 200) {
            if (StringUtils.isBlank(user.getAvatar()))
                user.setAvatar(Constant.DEFAULT_AVATAR);
            user.setPassword(DigestUtils.md5DigestAsHex(user.getPassword().getBytes()));
            if (user.getId() != null) {
                //修改操作
                userDao.updateUser(user);
                baseResult.setMessage("修改用户成功");
            } else {
                //新增操作
                userDao.addUser(user);
                baseResult.setMessage("添加用户成功");
            }
        }
        return baseResult;
    }

    @Override
    public BaseResult delUsers(String ids) {
        BaseResult baseResult;
        if (!StringUtils.isBlank(ids)){
            String[] idArray = ids.split(",");
            userDao.delUsers(idArray);
            baseResult = BaseResult.success("删除用户成功");
        }else{
            baseResult = BaseResult.fail("删除用户失败");
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
        } else if (userDao.getUserByname(user.getUsername()) != null) {
            //用户名已存在，但不是当前修改信息用户的原用户名
            if (userDao.getUserByname(user.getUsername()).getId() != user.getId())
                baseResult = BaseResult.fail("该用户名已存在！");
        } else if (StringUtils.isBlank(user.getPassword())) {
            baseResult = BaseResult.fail("密码不能为空！");
        } else if (StringUtils.isBlank(user.getEmail())) {
            baseResult = BaseResult.fail("邮箱不能为空！");
        } else if (!RegexpUtils.checkEmail(user.getEmail())) {
            baseResult = BaseResult.fail("邮箱格式不正确！");
        } else if (userDao.getUserList(userQueryVO).size() > 0) {
            //邮箱已存在，但不是当前修改信息用户的原邮箱
            if (userDao.getUserList(userQueryVO).get(0).getId() != user.getId())
                baseResult = BaseResult.fail("该邮箱已绑定过账号,请使用其他邮箱！");
        }
        return baseResult;
    }
}
