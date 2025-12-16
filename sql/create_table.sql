# 数据库初始化
# @author <a href="https://github.com/liyupi">程序员鱼皮</a>
# @from <a href="https://yupi.icu">编程导航知识星球</a>

-- 创建库
create database if not exists my_db;

-- 切换库
use my_db;

-- 用户表
create table if not exists user
(
    id           bigint auto_increment comment 'id' primary key,
    userAccount  varchar(256)                           not null comment '账号',
    userPassword varchar(512)                           not null comment '密码',
    unionId      varchar(256)                           null comment '微信开放平台id',
    mpOpenId     varchar(256)                           null comment '公众号openId',
    userName     varchar(256)                           null comment '用户昵称',
    userAvatar   varchar(1024)                          null comment '用户头像',
    userProfile  varchar(512)                           null comment '用户简介',
    userRole     varchar(256) default 'user'            not null comment '用户角色：user/admin/ban',
    createTime   datetime     default CURRENT_TIMESTAMP not null comment '创建时间',
    updateTime   datetime     default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP comment '更新时间',
    isDelete     tinyint      default 0                 not null comment '是否删除',
    index idx_unionId (unionId)
) comment '用户' collate = utf8mb4_unicode_ci;



CREATE TABLE `question` (
                            `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
                            `title` varchar(512) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '标题',
                            `content` text COLLATE utf8mb4_unicode_ci COMMENT '内容',
                            `tags` varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '标签列表（json 数组）',
                            `answer` text COLLATE utf8mb4_unicode_ci COMMENT '题目答案',
                            `submitNum` int NOT NULL DEFAULT '0' COMMENT '题目提交数',
                            `acceptedNum` int NOT NULL DEFAULT '0' COMMENT '题目通过数',
                            `judgeCase` text COLLATE utf8mb4_unicode_ci COMMENT '判题用例（json 数组）',
                            `judgeConfig` text COLLATE utf8mb4_unicode_ci COMMENT '判题配置（json 对象）',
                            `thumbNum` int NOT NULL DEFAULT '0' COMMENT '点赞数',
                            `favourNum` int NOT NULL DEFAULT '0' COMMENT '收藏数',
                            `userId` bigint NOT NULL COMMENT '创建用户 id',
                            `createTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                            `updateTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                            `isDelete` tinyint NOT NULL DEFAULT '0' COMMENT '是否删除',
                            PRIMARY KEY (`id`),
                            KEY `idx_userId` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=1996105429824507907 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='题目'

CREATE TABLE `question_submit` (
                                   `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
                                   `language` varchar(128) NOT NULL COMMENT '编程语言',
                                   `code` text NOT NULL COMMENT '用户代码',
                                   `judgeInfo` text COMMENT '判题信息（json 对象）',
                                   `status` int NOT NULL DEFAULT '0' COMMENT '判题状态（0 - 待判题、1 - 判题中、2 - 成功、3 - 失败）',
                                   `questionId` bigint NOT NULL COMMENT '题目 id',
                                   `userId` bigint NOT NULL COMMENT '创建用户 id',
                                   `createTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                   `updateTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                   `isDelete` tinyint NOT NULL DEFAULT '0' COMMENT '是否删除',
                                   PRIMARY KEY (`id`),
                                   KEY `idx_questionId` (`questionId`),
                                   KEY `idx_userId` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=1996146127151964163 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='题目提交'

CREATE TABLE `user` (
                        `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
                        `userAccount` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '账号',
                        `userPassword` varchar(512) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '密码',
                        `unionId` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '微信开放平台id',
                        `mpOpenId` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '公众号openId',
                        `userName` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户昵称',
                        `userAvatar` varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户头像',
                        `userProfile` varchar(512) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户简介',
                        `userRole` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'user' COMMENT '用户角色：user/admin/ban',
                        `createTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                        `updateTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                        `isDelete` tinyint NOT NULL DEFAULT '0' COMMENT '是否删除',
                        PRIMARY KEY (`id`),
                        KEY `idx_unionId` (`unionId`)
) ENGINE=InnoDB AUTO_INCREMENT=1992219883150753794 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户'

