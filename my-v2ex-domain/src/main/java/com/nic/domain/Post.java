package com.nic.domain;

import java.io.Serializable;
import java.util.Date;

public class Post implements Serializable {
    private String id;
    private Long node_id;
    private String node_name;
    private String title;
    private String content;
    private Long author_id;
    private String author_name;
    private Integer comments;
    private Long reply_id;
    private String reply_username;
    private Date created;
    private Date updated;
    private Date replyed;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public Long getNode_id() {
        return node_id;
    }

    public void setNode_id(Long node_id) {
        this.node_id = node_id;
    }

    public String getNode_name() {
        return node_name;
    }

    public void setNode_name(String node_name) {
        this.node_name = node_name;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Long getAuthor_id() {
        return author_id;
    }

    public void setAuthor_id(Long author_id) {
        this.author_id = author_id;
    }

    public String getAuthor_name() {
        return author_name;
    }

    public void setAuthor_name(String author_name) {
        this.author_name = author_name;
    }

    public Integer getComments() {
        return comments;
    }

    public void setComments(Integer comments) {
        this.comments = comments;
    }

    public Long getReply_id() {
        return reply_id;
    }

    public void setReply_id(Long reply_id) {
        this.reply_id = reply_id;
    }

    public String getReply_username() {
        return reply_username;
    }

    public void setReply_username(String reply_username) {
        this.reply_username = reply_username;
    }

    public Date getCreated() {
        return created;
    }

    public void setCreated(Date created) {
        this.created = created;
    }

    public Date getUpdated() {
        return updated;
    }

    public void setUpdated(Date updated) {
        this.updated = updated;
    }

    public Date getReplyed() {
        return replyed;
    }

    public void setReplyed(Date replyed) {
        this.replyed = replyed;
    }
}
