package com.nic.ui.api;

import com.nic.commons.constant.ApiPath;
import com.nic.commons.utils.HttpClientUtils;
import com.nic.commons.utils.MapperUtils;
import com.nic.domain.Node;

import java.util.List;

public class NodeApi {
    public static List<Node> getNodes() throws Exception {
        String json = HttpClientUtils.doGet(ApiPath.API_NODES_QUERY);
        List<Node> nodeList = MapperUtils.json2list(json,Node.class);
        return nodeList;
    }
}
