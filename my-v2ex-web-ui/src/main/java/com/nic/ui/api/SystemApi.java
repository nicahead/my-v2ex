package com.nic.ui.api;

import com.nic.commons.constant.ApiPath;
import com.nic.commons.dto.SystemDTO;
import com.nic.commons.utils.HttpClientUtils;
import com.nic.commons.utils.MapperUtils;

public class SystemApi {
    public static SystemDTO getSysInfo() throws Exception {
        String json = HttpClientUtils.doGet(ApiPath.API_SYSTEM_INFO);
        SystemDTO systemDTO = MapperUtils.json2pojo(json, SystemDTO.class);
        return systemDTO;
    }
}
