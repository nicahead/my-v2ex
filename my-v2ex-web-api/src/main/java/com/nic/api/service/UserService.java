package com.nic.api.service;

import com.nic.commons.dto.BaseResult;
import com.nic.domain.User;
import com.nic.domain.UserQueryVO;

import java.util.List;

public interface UserService {
    public User login(User user);
    /**
     * 条件查询用户列表
     *
     * @param userQueryVO
     * @return
     */
    public List<User> getUserList(UserQueryVO userQueryVO);

    /**
     * 条件查询用户记录条数
     *
     * @param userQueryVO
     * @return
     */
    public int getUserCount(UserQueryVO userQueryVO);

    /**
     * 保存用户记录
     *
     * @param user
     * @return
     */
    public BaseResult saveUser(User user);

}
