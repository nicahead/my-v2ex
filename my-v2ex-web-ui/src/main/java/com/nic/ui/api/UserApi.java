package com.nic.ui.api;

import com.nic.commons.constant.ApiPath;
import com.nic.commons.dto.BaseResult;
import com.nic.commons.utils.HttpClientUtils;
import com.nic.commons.utils.MapperUtils;
import com.nic.domain.User;
import org.apache.http.message.BasicNameValuePair;

import java.util.ArrayList;
import java.util.List;

public class UserApi {
    public static User login(User user) throws Exception {
        List<BasicNameValuePair> params = new ArrayList<>();
        params.add(new BasicNameValuePair("username", user.getUsername()));
        params.add(new BasicNameValuePair("password", user.getPassword()));
        String json = HttpClientUtils.doPost(ApiPath.API_USERS_LOGIN, params.toArray(new BasicNameValuePair[params.size()]));
        User tbUser = MapperUtils.json2pojoByTree(json, "data", User.class);
        return tbUser;
    }

    public static User getUser(Long id) throws Exception {
        List<BasicNameValuePair> params = new ArrayList<>();
        String json = HttpClientUtils.doGet(ApiPath.API_USERS_QUERY + "?id=" + id);
        User tbUser = MapperUtils.json2pojoByTree(json, "data", User.class);
        return tbUser;
    }

    public static BaseResult savaUser(User user) throws Exception {
        String userStr = MapperUtils.obj2json(user);
        List<BasicNameValuePair> params = new ArrayList<>();
        params.add(new BasicNameValuePair("userStr", userStr));
        String json = HttpClientUtils.doPost(ApiPath.API_USERS_SAVE, params.toArray(new BasicNameValuePair[params.size()]));
        BaseResult baseResult = MapperUtils.json2pojo(json, BaseResult.class);
        return baseResult;
    }
}
