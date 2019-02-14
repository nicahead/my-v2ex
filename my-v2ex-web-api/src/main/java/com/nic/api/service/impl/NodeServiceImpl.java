package com.nic.api.service.impl;

import com.nic.api.dao.NodeDao;
import com.nic.api.service.NodeService;
import com.nic.domain.Node;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service("nodeService")
public class NodeServiceImpl implements NodeService {
    @Resource
    private NodeDao nodeDao;
    @Override
    public List<Node> getNodeList() {
        return nodeDao.getNodeList();
    }
}
