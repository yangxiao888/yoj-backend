package com.yuoj.judge.codesandbox.model;

import lombok.Data;

import java.util.List;

@Data
public class ExecuteCodeResponse {

    /**
     * 接口错误信息
     */
    private String message;
    /**
     * 执行状态
     */
    private Integer status;

    /**
     * 执行结果
     */
    private List<String> outputList;

    /**
     * 执行状态
     */
    private JudgeInfo judgeInfo;
}
