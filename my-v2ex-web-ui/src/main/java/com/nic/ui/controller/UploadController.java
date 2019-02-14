package com.nic.ui.controller;

import com.nic.commons.constant.Constant;
import com.sun.jersey.api.client.Client;
import com.sun.jersey.api.client.WebResource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.*;

@Controller
public class UploadController {

    /**
     * 文件上传
     *
     * @param dropFile Dropzone
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "upload", method = RequestMethod.POST)
    public Map<String, Object> upload(MultipartFile dropFile,MultipartFile[] editorFiles, HttpServletRequest request) {
        Map<String, Object> result = new HashMap<>();
        // Dropzone 上传
        if (dropFile != null) {
            result.put("fileName", writeFile(dropFile, request));
        }
        // wangEditor 上传
        if (editorFiles != null && editorFiles.length > 0) {
            List<String> fileNames = new ArrayList<>();
            for (MultipartFile editorFile : editorFiles) {
                fileNames.add(Constant.FILE_HOST+writeFile(editorFile, request));
            }
            result.put("errno", 0);
            result.put("data", fileNames);
        }
        return result;
    }
    /**
     * 将图片写入指定目录
     *
     * @param multipartFile
     * @param request
     * @return 返回文件完整路径
     */
    private String writeFile(MultipartFile multipartFile, HttpServletRequest request) {
        // 获得文件上传流
        byte[] fileBytes = new byte[0];
        try {
            fileBytes = multipartFile.getBytes();
        } catch (IOException e) {
            e.printStackTrace();
        }
        // 获取文件后缀
        String fileName = multipartFile.getOriginalFilename();
        String fileSuffix = fileName.substring(fileName.lastIndexOf("."));
        // 设置文件在服务器的随机名字
        String newFileName = UUID.randomUUID()+fileSuffix;
        // 创建jersey服务器，进行跨服务器上传
        Client client = Client.create();
        // 将文件关联到远程服务器
        WebResource resource = client.resource(Constant.FILE_HOST +newFileName);
        // 上传
        resource.put(String.class, fileBytes);
        return newFileName;
    }
}