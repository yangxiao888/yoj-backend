package com.yuoj.judge.codesandbox;


import com.yuoj.judge.codesandbox.impl.ExampleCodeSandbox;
import com.yuoj.judge.codesandbox.impl.RemoteCodeSandbox;
import com.yuoj.judge.codesandbox.impl.ThirdPartyCodeSandbox;

/**
 * 代码沙箱实现类工厂
 */
public class CodeSandboxFactory {

    /**
     * 根据传入的字符串，生成指定的代码沙箱，默认示例沙箱
     * @param type
     * @return
     */
    public static CodeSandbox newInstance(String type) {
        switch (type) {
            case "example":
                return new ExampleCodeSandbox();
            case "remote":
                return new RemoteCodeSandbox();
            case "thirdParty":
                return new ThirdPartyCodeSandbox();
            default:
                return new ExampleCodeSandbox();
        }
    }
}
