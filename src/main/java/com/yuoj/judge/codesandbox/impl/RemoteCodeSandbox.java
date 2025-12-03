package com.yuoj.judge.codesandbox.impl;

import cn.hutool.core.util.StrUtil;
import cn.hutool.crypto.digest.MD5;
import cn.hutool.http.HttpUtil;
import cn.hutool.json.JSONUtil;
import com.yuoj.exception.BusinessException;
import com.yuoj.judge.codesandbox.CodeSandbox;
import com.yuoj.common.ErrorCode;
import com.yuoj.judge.codesandbox.model.ExecuteCodeRequest;
import com.yuoj.judge.codesandbox.model.ExecuteCodeResponse;


/**
 * 远程代码沙箱
 */
public class RemoteCodeSandbox implements CodeSandbox {
    // 定义鉴权请求头和密钥
    private static final String AUTH_REQUEST_HEADER = "auth";

    private static final String AUTH_REQUEST_SECRET = MD5.create().digestHex16("secretKey");

    @Override
    public ExecuteCodeResponse executeCode(ExecuteCodeRequest request) {
        System.out.println("远程代码沙箱");
        //String dockerurl = "http://192.168.100.131:8090/executeCode";
        String rul = "http://localhost:8090/executeCode";

        String json = JSONUtil.toJsonStr(request);
        String httpResponse = HttpUtil
                .createPost(rul)
                //.createPost(dockerurl)
                .header(AUTH_REQUEST_HEADER, AUTH_REQUEST_SECRET)
                .body(json)
                .execute()
                .body();
        if(StrUtil.isBlank(httpResponse)){
            throw new BusinessException(ErrorCode.API_REQUEST_ERROR,"远程代码沙箱执行代码错误");
        }

        return JSONUtil.toBean(httpResponse, ExecuteCodeResponse.class);
    }
}
