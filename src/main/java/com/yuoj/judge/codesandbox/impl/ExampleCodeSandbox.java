package com.yuoj.judge.codesandbox.impl;



import com.yuoj.judge.codesandbox.CodeSandbox;
import com.yuoj.judge.codesandbox.model.ExecuteCodeRequest;
import com.yuoj.judge.codesandbox.model.ExecuteCodeResponse;
import com.yuoj.judge.codesandbox.model.JudgeInfo;
import com.yuoj.model.enums.JudgeInfoMessageEnum;
import com.yuoj.model.enums.QuestionSubmitStatusEnum;

import java.util.List;

/**
 * 示例代码沙箱
 */
public class ExampleCodeSandbox implements CodeSandbox {
    @Override
    public ExecuteCodeResponse executeCode(ExecuteCodeRequest request) {
        List<String> inputList = request.getInputList();
        ExecuteCodeResponse executeCodeResponse = new ExecuteCodeResponse();

        executeCodeResponse.setMessage("示例代码沙箱运行成功");
        executeCodeResponse.setOutputList(inputList);
        executeCodeResponse.setStatus(QuestionSubmitStatusEnum.SUCCEED.getValue());
        JudgeInfo judgeInfo = new JudgeInfo();
        judgeInfo.setMessage(JudgeInfoMessageEnum.ACCEPTED.getText());
        judgeInfo.setMemory(100L);
        judgeInfo.setTime(100L);
        executeCodeResponse.setJudgeInfo(judgeInfo);

        return executeCodeResponse;
    }
}
