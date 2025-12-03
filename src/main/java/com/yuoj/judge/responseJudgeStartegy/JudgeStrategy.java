package com.yuoj.judge.responseJudgeStartegy;


import com.yuoj.judge.codesandbox.model.JudgeInfo;

public interface JudgeStrategy {

    /**
     * 执行判题
     *
     * @param judgeContext
     * @return
     */
    JudgeInfo doJudge(JudgeContext judgeContext);
}
