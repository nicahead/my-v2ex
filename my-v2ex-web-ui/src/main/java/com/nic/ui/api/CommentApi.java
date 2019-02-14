package com.nic.ui.api;

import com.nic.commons.constant.ApiPath;
import com.nic.commons.dto.CommentListDTO;
import com.nic.commons.dto.PageInfo;
import com.nic.commons.utils.HttpClientUtils;
import com.nic.commons.utils.MapperUtils;
import com.nic.domain.Comment;
import com.nic.domain.CommentQueryVO;
import org.apache.http.message.BasicNameValuePair;

import java.util.ArrayList;
import java.util.List;

public class CommentApi {

    public static void addComment(Comment comment) throws Exception {
        String commentStr = MapperUtils.obj2json(comment);
        List<BasicNameValuePair> params = new ArrayList<>();
        params.add(new BasicNameValuePair("commentStr", commentStr));
        HttpClientUtils.doPost(ApiPath.API_COMMENTS_ADD, params.toArray(new BasicNameValuePair[params.size()]));
    }

    public static PageInfo<CommentListDTO> getComments(CommentQueryVO commentQueryVO) throws Exception {
        String commentQueryStr = MapperUtils.obj2json(commentQueryVO);
        List<BasicNameValuePair> params = new ArrayList<>();
        params.add(new BasicNameValuePair("commentQueryStr", commentQueryStr));
        String json = HttpClientUtils.doPost(ApiPath.API_COMMENTS_QUERY, params.toArray(new BasicNameValuePair[params.size()]));
        PageInfo<CommentListDTO> pageInfo = MapperUtils.json2pojo(json,PageInfo.class);
        return pageInfo;
    }
}
