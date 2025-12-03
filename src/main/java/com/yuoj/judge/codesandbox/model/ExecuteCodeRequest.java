package com.yuoj.judge.codesandbox.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class ExecuteCodeRequest {
    /**
     * 代码
     */
    private String code;

    /**
     * 语言
     */
    private String language;

    /**
     * 输入参数
     *
     */
    private List<String> inputList;



}
