package com.nic.admin.web.controller;

import com.sun.jersey.api.client.Client;
import com.sun.jersey.api.client.WebResource;
import org.apache.commons.io.FileUtils;
import org.junit.Test;

import java.io.File;
import java.io.IOException;

public class UploadControllerTest {

    @Test
    public void upload() throws IOException {
        //实例化一个jersey
    Client client = new Client();
    //另一台服务器的请求路径
    String url = "http://localhost:8080/upload/1.png";
     //设置请求路径
    WebResource resource = client.resource(url);
     //需要添加的图片
    String pathname = "d:\\1.png";
    byte[] readFileToByteArray = FileUtils.readFileToByteArray(new File(pathname));
     //发送开始 post  get  put
    resource.put(String.class, readFileToByteArray);
    System.out.println("发送完毕");

    }
}