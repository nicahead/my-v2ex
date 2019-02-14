package com.nic.ui.api;

import com.nic.commons.constant.ApiPath;
import com.nic.commons.dto.BaseResult;
import com.nic.commons.dto.PageInfo;
import com.nic.commons.dto.PostListDTO;
import com.nic.commons.utils.HttpClientUtils;
import com.nic.commons.utils.MapperUtils;
import com.nic.domain.Post;
import com.nic.domain.PostQueryVO;
import org.apache.http.message.BasicNameValuePair;

import java.util.ArrayList;
import java.util.List;

public class PostApi {
    public static BaseResult savePost(Post post) throws Exception {
        String postStr = MapperUtils.obj2json(post);
        List<BasicNameValuePair> params = new ArrayList<>();
        params.add(new BasicNameValuePair("postStr", postStr));
        String json = HttpClientUtils.doPost(ApiPath.API_POSTS_SAVE, params.toArray(new BasicNameValuePair[params.size()]));
        BaseResult baseResult = MapperUtils.json2pojo(json,BaseResult.class);
        return baseResult;
    }
    public static PageInfo<PostListDTO> getPosts(PostQueryVO postQueryVO) throws Exception {
        String postQueryStr = MapperUtils.obj2json(postQueryVO);
        List<BasicNameValuePair> params = new ArrayList<>();
        params.add(new BasicNameValuePair("postQueryStr", postQueryStr));
        String json = HttpClientUtils.doPost(ApiPath.API_POSTS_QUERY, params.toArray(new BasicNameValuePair[params.size()]));
        PageInfo<PostListDTO> pageInfo = MapperUtils.json2pojo(json,PageInfo.class);
        return pageInfo;
    }
    public static List<PostListDTO> getPopPosts() throws Exception {
        String json = HttpClientUtils.doGet(ApiPath.API_POSTS_POP);
        List<PostListDTO> postList = MapperUtils.json2list(json,PostListDTO.class);
        return postList;
    }
    public static Post getPopDetail(String id) throws Exception {
        String json = HttpClientUtils.doGet(ApiPath.API_POSTS_DETAIL+"?id="+id);
        Post post = MapperUtils.json2pojo(json,Post.class);
        return post;
    }
}
