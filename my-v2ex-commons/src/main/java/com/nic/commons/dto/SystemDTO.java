package com.nic.commons.dto;

public class SystemDTO {
    private Integer userCount; //总用户数
    private Integer newUserCount;  //今日新增用户数
    private Integer postCount;  //总帖子数
    private Integer newPostCount;  //今日新增帖子数
    private Integer nodeCount;  //总节点数
    private Integer commentCount;  //总回复数
    private Integer newCommentCount;  //今日新增回复数

    public Integer getUserCount() {
        return userCount;
    }

    public void setUserCount(Integer userCount) {
        this.userCount = userCount;
    }

    public Integer getNewUserCount() {
        return newUserCount;
    }

    public void setNewUserCount(Integer newUserCount) {
        this.newUserCount = newUserCount;
    }

    public Integer getPostCount() {
        return postCount;
    }

    public void setPostCount(Integer postCount) {
        this.postCount = postCount;
    }

    public Integer getNewPostCount() {
        return newPostCount;
    }

    public void setNewPostCount(Integer newPostCount) {
        this.newPostCount = newPostCount;
    }

    public Integer getNodeCount() {
        return nodeCount;
    }

    public void setNodeCount(Integer nodeCount) {
        this.nodeCount = nodeCount;
    }

    public Integer getCommentCount() {
        return commentCount;
    }

    public void setCommentCount(Integer commentCount) {
        this.commentCount = commentCount;
    }

    public Integer getNewCommentCount() {
        return newCommentCount;
    }

    public void setNewCommentCount(Integer newCommentCount) {
        this.newCommentCount = newCommentCount;
    }
}
