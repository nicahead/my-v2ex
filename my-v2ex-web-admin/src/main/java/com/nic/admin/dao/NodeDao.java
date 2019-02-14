package com.nic.admin.dao;

import com.nic.domain.Node;

import java.util.List;

public interface NodeDao {
    List<Node> getNodeList(Node nodeQuery);

    public int getCount();

    void addNode(Node node);

    void updateNode(Node node);

    void delNodes(String[] ids);
}
