package com.yuoj.judge.responseJudgeStartegy;


import com.yuoj.judge.codesandbox.model.JudgeInfo;
import com.yuoj.model.entity.QuestionSubmit;
import org.springframework.stereotype.Service;

/**
 * 判断管理（简化调用）
 */
@Service
public class JudgeStrategyManage {
    public JudgeInfo doJudge(JudgeContext judgeContext){
        QuestionSubmit questionSubmit = judgeContext.getQuestionSubmit();
        String language = questionSubmit.getLanguage();
        if("java".equals(language)){
            return new JavaJudgeStrategy().doJudge(judgeContext);
        }
        return new DefaultJudgeStrategy().doJudge(judgeContext);

    }

}
