package com.nic.commons.constant;

public class ApiPath {
    // 主机地址
    public static final String HOST = "http://localhost:8081/api";

    // 会员管理接口 - 登录
    public static final String API_USERS_LOGIN = HOST + "/users/login";
    // 会员管理接口 - 保存
    public static final String API_USERS_SAVE = HOST + "/users/save";
    // 会员管理接口 - 查询
    public static final String API_USERS_QUERY = HOST + "/users/member";

    // 节点管理接口 - 查询
    public static final String API_NODES_QUERY = HOST + "/nodes/list";

    // 帖子管理接口 - 保存
    public static final String API_POSTS_SAVE = HOST + "/posts/save";
    // 帖子管理接口 - 查询列表
    public static final String API_POSTS_QUERY = HOST + "/posts/page";
    // 帖子管理接口 - 查询详情
    public static final String API_POSTS_DETAIL = HOST + "/posts/detail";
    // 帖子管理接口 - 获取热帖
    public static final String API_POSTS_POP = HOST + "/posts/pop";

    // 评论管理接口 - 添加
    public static final String API_COMMENTS_ADD = HOST + "/comments/add";
    // 评论管理接口 - 查询
    public static final String API_COMMENTS_QUERY = HOST + "/comments/page";

    // 系统管理接口 - 系统信息
    public static final String API_SYSTEM_INFO = HOST + "/system/info";

}
