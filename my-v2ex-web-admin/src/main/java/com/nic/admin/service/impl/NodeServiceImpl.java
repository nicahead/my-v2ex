package com.nic.admin.service.impl;

import com.nic.admin.dao.NodeDao;
import com.nic.admin.service.NodeService;
import com.nic.commons.constant.Constant;
import com.nic.commons.dto.BaseResult;
import com.nic.domain.Node;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service("nodeService")
public class NodeServiceImpl implements NodeService {

    @Resource
    private NodeDao nodeDao;

    @Override
    public List<Node> getNodeList(Node nodeQuery) {
        nodeQuery.setState(Constant.NODE_EXIST);
        return nodeDao.getNodeList(nodeQuery);
    }

    @Override
    public BaseResult saveNode(Node node) {
        BaseResult baseResult = checkNode(node);
        if (baseResult.getStatus() == 200) {
            if (node.getId() != null) {
                //修改操作
                nodeDao.updateNode(node);
                baseResult.setMessage("修改节点成功");
            } else {
                //新增操作
                nodeDao.addNode(node);
                baseResult.setMessage("添加节点成功");
            }
        }
        return baseResult;
    }

    @Override
    public BaseResult delNodes(String ids) {
        BaseResult baseResult;
        if (!StringUtils.isBlank(ids)){
            String[] idArray = ids.split(",");
            nodeDao.delNodes(idArray);
            baseResult = BaseResult.success("删除节点成功");
        }else{
            baseResult = BaseResult.fail("删除节点失败");
        }
        return baseResult;
    }

    private BaseResult checkNode(Node node) {
        BaseResult baseResult = BaseResult.success();
        if (StringUtils.isBlank(node.getNodename())) {
            baseResult = BaseResult.fail("节点名称不能为空！");
        } else if (nodeDao.getNodeList(node).size()>0) {
            //节点已存在，但不是当前修改节点的原节点名
//            if (nodeDao.getNodeByname(node.getNodename()).getId() != node.getId())
//                baseResult = BaseResult.fail("该节点已存在！");
        }
        return baseResult;
    }
}
