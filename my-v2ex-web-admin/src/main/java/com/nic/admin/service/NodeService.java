package com.nic.admin.service;

import com.nic.commons.dto.BaseResult;
import com.nic.domain.Node;

import java.util.List;

public interface NodeService {
    List<Node> getNodeList(Node nodeQuery);

    BaseResult saveNode(Node node);

    BaseResult delNodes(String ids);
}
