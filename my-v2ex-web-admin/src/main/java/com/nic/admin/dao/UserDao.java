package com.nic.admin.dao;

import com.nic.domain.User;
import com.nic.domain.UserQueryVO;

import java.util.List;

public interface UserDao {
    /**
     * 根据用户名获得一条用户记录
     *
     * @param name
     * @return
     */
    User getUserByname(String name);

    /**
     * 条件查询用户列表
     *
     * @param userQueryVO 查询条件实体类
     * @return
     */
    List<User> getUserList(UserQueryVO userQueryVO);

    /**
     * 条件查询记录条数
     *
     * @param userQueryVO
     * @return
     */
    int getCount(UserQueryVO userQueryVO);

    int getNewCount();

    /**
     * 添加一条用户记录
     *
     * @param user
     */
    void addUser(User user);

    /**
     * 更新用户记录
     *
     * @param user
     */
    void updateUser(User user);

    /**
     * 删除用户（一条或多条）
     *
     * @param idArray
     */
    void delUsers(String[] idArray);
}
