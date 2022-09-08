-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- 主机： localhost
-- 生成日期： 2021-09-16 09:46:49
-- 服务器版本： 5.6.31
-- PHP 版本： 7.4.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 数据库： `dss_V2_call`
--
CREATE DATABASE IF NOT EXISTS `dss_V2_call` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE `dss_V2_call`;

-- --------------------------------------------------------

--
-- 表的结构 `tb_call_dialog`
--

CREATE TABLE `tb_call_dialog` (
  `CD_ID` int(11) NOT NULL,
  `CD_TimeKey` bigint(15) NOT NULL COMMENT '通话开始时间',
  `CD_TimeStamp` bigint(15) NOT NULL COMMENT '毫秒键',
  `CD_TalkKey` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '当前通话语句排序',
  `CD_Talker` enum('1','0') COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '1=扬声器=客户，0=麦克风=外呼人员',
  `CD_UserID` int(11) NOT NULL COMMENT '对应user表id',
  `CD_OutCall` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '被叫号码',
  `CD_Content` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '对话内容',
  `CD_Recommend` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '建议内容',
  `CD_WavPath` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '音频文件路径',
  `CD_Source` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '源数据',
  `CD_CreateTime` int(11) NOT NULL COMMENT '记录创建时间',
  `CD_UpdateTime` int(11) NOT NULL COMMENT '记录更新时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `tb_call_list`
--

CREATE TABLE `tb_call_list` (
  `CL_ID` int(11) NOT NULL,
  `CL_UserID` int(11) NOT NULL COMMENT '对应USER表ID',
  `CL_TimeKey` bigint(14) NOT NULL COMMENT '通话唯一键',
  `CL_ProductCode` varchar(255) DEFAULT NULL,
  `CL_TaskName` varchar(100) NOT NULL COMMENT '任务名称',
  `CL_MainCall` varchar(20) NOT NULL COMMENT '主叫号码',
  `CL_OutCall` varchar(20) NOT NULL COMMENT '被叫号码',
  `CL_SalesProductKey` varchar(255) NOT NULL DEFAULT '0' COMMENT '外呼产品Key',
  `CL_BG` bigint(14) NOT NULL COMMENT '通话开始时间',
  `CL_ED` bigint(14) NOT NULL COMMENT '通话结束时间',
  `CL_TotalTime` int(11) NOT NULL DEFAULT '0' COMMENT '通话时长(毫秒)',
  `CL_Portrait` varchar(50) NOT NULL COMMENT '画像',
  `CL_SecConfirmation` varchar(50) NOT NULL COMMENT '二次确认',
  `CL_Processor` varchar(50) NOT NULL COMMENT '处理人',
  `CL_TableAccount` varchar(50) NOT NULL COMMENT '坐席号',
  `CL_DepartmentName` varchar(50) NOT NULL COMMENT '部门名称',
  `CL_ConnectStatus` int(11) NOT NULL COMMENT '接通状态1=接通，0=未接通',
  `CL_Intention` int(3) NOT NULL COMMENT '用户意向 1=同意，2=拒绝，3=拨通非该用户，4联通漏话提示，5中通挂机，6=客户已办理，7=关机，8=停机，9=空号，10=用户忙，11=强制挂机，12=暂时无法接通，13=呼转，14=呼出受限，15=拆机预约，16=已携转， 17=用户已改其他资费， 18=直接失败， 19=回访成功， 20营销预约， 21已办理，22无人接听',
  `CL_Note` text NOT NULL COMMENT '备注',
  `CL_City` varchar(50) NOT NULL COMMENT '地址',
  `CL_BusinessProcessor` varchar(50) NOT NULL COMMENT '业务办理人',
  `CL_BusinessTransactTime` int(11) NOT NULL COMMENT '业务办理时间',
  `CL_BusinessResult` int(11) NOT NULL DEFAULT '3' COMMENT '业务办理结果 1=已办理， 2=办理失败，3未办理',
  `CL_BusinessNote` text NOT NULL COMMENT '业务办理备注',
  `CL_TidyBGTime` bigint(14) NOT NULL COMMENT '通话整理开始时间(毫秒)',
  `CL_TidyEDTime` bigint(14) NOT NULL COMMENT '通话整理结束时间',
  `CL_TidyTotalTime` bigint(14) NOT NULL COMMENT '通话整理花费时间',
  `CL_IsSimulationEnv` tinyint(2) NOT NULL COMMENT '1=模拟环境',
  `CL_CompanyID` int(11) NOT NULL COMMENT '公司ID',
  `CL_OperatorID` int(11) NOT NULL COMMENT '运营商ID',
  `CL_Source` text NOT NULL COMMENT '源数据',
  `CL_Version` varchar(20) NOT NULL COMMENT 'dss平台版本号',
  `CL_CreateTime` int(11) NOT NULL COMMENT '记录创建时间',
  `CL_UpdateTime` int(11) NOT NULL COMMENT '记录更新时间',
  `CL_DeleteTime` int(11) NOT NULL COMMENT '记录删除时间',
  `CL_IsDelete` tinyint(2) NOT NULL COMMENT '记录是否删除',
  `CL_WavPath` varchar(255) NOT NULL COMMENT 'wav音频文件路径',
  `CL_Rate` varchar(11) NOT NULL DEFAULT '0' COMMENT '该通电话推荐话术在轨率 %',
  `CL_IsPlay1000` int(11) NOT NULL DEFAULT '0' COMMENT '是否播放问候句：0未播放；1已播放',
  `CL_IsPlay1001` int(11) NOT NULL COMMENT '是否播放质检句一：0未播放；1已播放',
  `CL_IsPlay1002` int(11) NOT NULL COMMENT '是否播放质检句二：0未播放；1已播放'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='通话记录表';

-- --------------------------------------------------------

--
-- 表的结构 `tb_call_recommend`
--

CREATE TABLE `tb_call_recommend` (
  `CR_ID` int(11) NOT NULL,
  `CR_TimeKey` bigint(15) NOT NULL COMMENT '通话开始时间',
  `CR_TalkKey` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '当前通话语句排序',
  `CR_UserID` int(11) NOT NULL COMMENT '对应dss_user表id',
  `CR_DialogID` int(11) NOT NULL COMMENT '对应dss_dialog表ID',
  `CR_SalesText` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '推荐内容',
  `CR_RecommendSource` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '源数据',
  `CR_TimeStamp` bigint(15) NOT NULL COMMENT '毫秒键',
  `CR_CreateTime` int(11) NOT NULL,
  `CR_UpdateTime` int(11) NOT NULL,
  `CR_Title` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户意向'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 转储表的索引
--

--
-- 表的索引 `tb_call_dialog`
--
ALTER TABLE `tb_call_dialog`
  ADD PRIMARY KEY (`CD_ID`),
  ADD UNIQUE KEY `TimeKey` (`CD_TimeKey`,`CD_TimeStamp`) USING BTREE;

--
-- 表的索引 `tb_call_list`
--
ALTER TABLE `tb_call_list`
  ADD PRIMARY KEY (`CL_ID`),
  ADD UNIQUE KEY `CL_UserID` (`CL_UserID`,`CL_TimeKey`),
  ADD KEY `CL_TimeKey` (`CL_TimeKey`),
  ADD KEY `CL_CreateTime` (`CL_CreateTime`),
  ADD KEY `CL_BG` (`CL_BG`,`CL_ED`,`CL_CreateTime`);

--
-- 表的索引 `tb_call_recommend`
--
ALTER TABLE `tb_call_recommend`
  ADD PRIMARY KEY (`CR_ID`),
  ADD KEY `CR_UserID` (`CR_UserID`),
  ADD KEY `CR_TimeKey` (`CR_TimeKey`,`CR_TalkKey`,`CR_TimeStamp`),
  ADD KEY `CR_TimeKey_2` (`CR_TimeKey`,`CR_TimeStamp`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `tb_call_dialog`
--
ALTER TABLE `tb_call_dialog`
  MODIFY `CD_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `tb_call_list`
--
ALTER TABLE `tb_call_list`
  MODIFY `CL_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `tb_call_recommend`
--
ALTER TABLE `tb_call_recommend`
  MODIFY `CR_ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- 数据库： `dss_V2_company`
--
CREATE DATABASE IF NOT EXISTS `dss_V2_company` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE `dss_V2_company`;

-- --------------------------------------------------------

--
-- 表的结构 `tb_company`
--

CREATE TABLE `tb_company` (
  `C_ID` int(11) NOT NULL,
  `C_Name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '公司名字',
  `C_CreateTime` datetime DEFAULT NULL COMMENT '记录创建时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `tb_company_operator`
--

CREATE TABLE `tb_company_operator` (
  `CO_ID` int(11) NOT NULL,
  `CO_OperatorURL` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '运营商URL',
  `CO_OperatorName` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '运营商名称',
  `CO_CompanyID` int(11) NOT NULL COMMENT '公司ID',
  `CO_IsDelete` tinyint(2) NOT NULL,
  `CO_DeleteTime` int(11) NOT NULL,
  `CO_CreateTime` int(11) NOT NULL COMMENT '记录创建时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- 表的结构 `tb_company_original_task`
--

CREATE TABLE `tb_company_original_task` (
  `COT_ID` int(11) NOT NULL COMMENT '唯一标识',
  `COT_TaskName` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '任务名称',
  `COT_Portrait` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '画像',
  `COT_Company` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '公司名称',
  `COT_Operator` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '运营商',
  `COT_ProductName` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '业务名称',
  `COT_ProductOverview` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '业务综述',
  `COT_ProductContent` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '业务内容',
  `COT_OriginalProductCost` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '原业务资费',
  `COT_OriginalProductTime` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '原业务时长',
  `COT_OriginalActivityTime` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '原活动时长',
  `COT_ProductCost` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '现业务资费',
  `COT_ProductTime` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '现业务时长',
  `COT_ActivityTime` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '现活动时长',
  `COT_Batch` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '批次',
  `COT_BindProductCode` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '绑定业务编码',
  `COT_BindProductCodeTime` int(11) NOT NULL COMMENT '绑定业务编码时间',
  `COT_IsDisplay` int(11) NOT NULL DEFAULT '1' COMMENT '是否显示 0: 不显示 1: 显示',
  `COT_IsBindSTT` int(11) NOT NULL COMMENT '是否已绑定STT',
  `COT_BindSTTTime` int(11) NOT NULL COMMENT '绑定STT时间',
  `COT_UpdateSTTTime` int(11) NOT NULL COMMENT '修改STT时间',
  `COT_CreateTime` int(11) NOT NULL COMMENT '创建时间',
  `COT_LastUpdateTime` int(11) NOT NULL COMMENT '最后更新时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `tb_company_product`
--

CREATE TABLE `tb_company_product` (
  `CP_ID` int(11) NOT NULL,
  `CP_ProductKey` int(11) NOT NULL,
  `CP_ProductName` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '业务名称',
  `CP_ProductCode` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CP_SalesProductKey` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '业务编码(前端获取)',
  `CP_CompanyKey` int(11) NOT NULL COMMENT '公司key识别值',
  `CP_Operator` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '运营商',
  `CP_IsDelete` tinyint(2) NOT NULL,
  `CP_DeleteTime` int(11) NOT NULL,
  `CP_CreateTime` int(11) NOT NULL COMMENT '记录创建时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `tb_company_relation`
--

CREATE TABLE `tb_company_relation` (
  `CR_ID` int(11) NOT NULL COMMENT '唯一标识',
  `CR_ProductCode` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '业务code',
  `CR_Company` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '公司名称',
  `CR_CompanyID` int(11) NOT NULL COMMENT '公司ID',
  `CR_Operator` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '运营商',
  `CR_OperatorID` int(11) NOT NULL COMMENT '运营商ID',
  `CR_TaskName` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '任务名称',
  `CR_Portrait` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '画像',
  `CR_IsDisplay` int(11) NOT NULL DEFAULT '1' COMMENT '是否显示 0: 不显示 1: 显示',
  `CR_IsDelete` int(2) NOT NULL COMMENT '是否删除：0不删除；1已删除',
  `CR_OriginalProductCode` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '原业务编码',
  `CR_CreateTime` int(11) NOT NULL COMMENT '创建时间',
  `CR_LastUpdateTime` int(11) NOT NULL COMMENT '最后更新时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `tb_company_task_info`
--

CREATE TABLE `tb_company_task_info` (
  `CTI_ID` int(11) NOT NULL,
  `CTI_CompanyID` int(11) NOT NULL COMMENT '公司ID',
  `CTI_OperatorID` int(11) NOT NULL COMMENT '运营商ID',
  `CTI_TaskId` varchar(255) NOT NULL COMMENT '任务唯一标识',
  `CTI_TaskName` varchar(255) NOT NULL COMMENT '任务名称',
  `CTI_AllotMode` varchar(255) NOT NULL COMMENT '分配方式',
  `CTI_TaskStatus` varchar(255) NOT NULL COMMENT '任务状态',
  `CTI_TaskType` varchar(255) NOT NULL COMMENT '任务类型',
  `CTI_CallType` varchar(255) NOT NULL COMMENT '外呼方式',
  `CTI_City` varchar(255) NOT NULL COMMENT '所属地市',
  `CTI_MaxCallNum` int(11) NOT NULL COMMENT '最大拨打次数',
  `CTI_StartTime` varchar(255) NOT NULL COMMENT '原数据开始时间',
  `CTI_OriginalCreateTime` varchar(255) NOT NULL COMMENT '原数据创建时间',
  `CTI_EndTime` varchar(255) NOT NULL COMMENT '原数据结束时间',
  `CTI_CreateTime` int(11) NOT NULL COMMENT '创建(入库)时间',
  `CTI_NoticeTime` int(11) NOT NULL COMMENT '通知时间',
  `CTI_STTConfigTime` int(11) NOT NULL COMMENT 'STT配置时间',
  `CTI_PartTeamTime` int(11) NOT NULL COMMENT '组长分配组员时间',
  `CTI_StartTaskTime` int(11) NOT NULL COMMENT '开启任务时间',
  `CTI_ConsultTime` int(11) NOT NULL COMMENT '查阅时间',
  `CTI_ConsultStatus` int(2) NOT NULL COMMENT '查阅状态, 0: 未查阅  1: 已查阅',
  `CTI_LastUpdateTime` int(11) NOT NULL COMMENT '最后更新时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- 表的结构 `tb_company_task_portrait_info`
--

CREATE TABLE `tb_company_task_portrait_info` (
  `CTPI_ID` int(11) NOT NULL,
  `CTPI_CompanyID` int(11) NOT NULL COMMENT '公司ID',
  `CTPI_OperatorID` int(11) NOT NULL COMMENT '运营商ID',
  `CTPI_TaskId` varchar(255) NOT NULL COMMENT '任务唯一标识',
  `CTPI_TaskName` varchar(255) NOT NULL COMMENT '任务名称',
  `CTPI_Portrait` varchar(255) NOT NULL COMMENT '画像',
  `CTPI_CreateTime` int(11) NOT NULL COMMENT '创建时间',
  `CTPI_LastUpdateTime` int(11) NOT NULL COMMENT '最后更新时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- 表的结构 `tb_company_task_record`
--

CREATE TABLE `tb_company_task_record` (
  `CTR_ID` int(11) NOT NULL,
  `CTR_CompanyID` int(11) NOT NULL COMMENT '公司ID',
  `CTR_OperatorID` int(11) NOT NULL COMMENT '运营商ID',
  `CTR_TaskId` varchar(255) NOT NULL COMMENT '任务唯一标识',
  `CTR_TaskName` varchar(255) NOT NULL COMMENT '任务名称',
  `CTR_AllotMode` varchar(255) NOT NULL COMMENT '分配方式',
  `CTR_TaskStatus` varchar(255) NOT NULL COMMENT '任务状态',
  `CTR_TaskType` varchar(255) NOT NULL COMMENT '任务类型',
  `CTR_CallType` varchar(255) NOT NULL COMMENT '外呼方式',
  `CTR_City` varchar(255) NOT NULL COMMENT '城市',
  `CTR_LastMaxCallNum` int(11) NOT NULL COMMENT '最后更新的最大拨打次数',
  `CTR_MaxCallNum` varchar(255) NOT NULL COMMENT '最大拨打次数',
  `CTR_StartTime` varchar(255) NOT NULL COMMENT '开始时间',
  `CTR_CreateTime` varchar(255) NOT NULL COMMENT '创建时间',
  `CTR_EndTime` varchar(255) NOT NULL COMMENT '结束时间',
  `CTR_RawData` text NOT NULL COMMENT '源数据',
  `CTR_LastUpdateTime` int(11) NOT NULL COMMENT '最后更新时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- 表的结构 `tb_company_user_info`
--

CREATE TABLE `tb_company_user_info` (
  `CUI_ID` int(11) NOT NULL,
  `CUI_CompanyID` int(11) NOT NULL COMMENT '公司ID',
  `CUI_OperatorID` int(11) NOT NULL COMMENT '运营商ID',
  `CUI_DataId` varchar(255) NOT NULL COMMENT '用户唯一标识',
  `CUI_TaskId` varchar(255) NOT NULL COMMENT '任务唯一标识',
  `CUI_TaskName` varchar(255) NOT NULL COMMENT '任务名称',
  `CUI_Activity` varchar(255) NOT NULL COMMENT '活动',
  `CUI_Portrait` varchar(255) NOT NULL COMMENT '画像',
  `CUI_Batch` varchar(255) NOT NULL COMMENT '批次',
  `CUI_DataStatus` varchar(255) NOT NULL COMMENT '数据状态',
  `CUI_Department` varchar(255) NOT NULL COMMENT '下发部门',
  `CUI_CallNum` int(11) NOT NULL COMMENT '外呼次数',
  `CUI_GridOrg` varchar(255) NOT NULL COMMENT '网格',
  `CUI_Area` varchar(255) NOT NULL COMMENT '小区',
  `CUI_UserPhoneNum` varchar(255) NOT NULL COMMENT '客户号码',
  `CUI_ImportTime` varchar(255) NOT NULL COMMENT '导入时间',
  `CUI_CreateTime` int(11) NOT NULL COMMENT '创建时间',
  `CUI_LastUpdateTime` int(11) NOT NULL COMMENT '最后更新时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- 表的结构 `tb_company_user_record`
--

CREATE TABLE `tb_company_user_record` (
  `CUR_ID` int(11) NOT NULL,
  `CUR_CompanyID` int(11) NOT NULL COMMENT '公司ID',
  `CUR_OperatorID` int(11) NOT NULL COMMENT '运营商ID',
  `CUR_DataId` varchar(255) NOT NULL COMMENT '用户唯一标识',
  `CUR_TaskId` varchar(255) NOT NULL COMMENT '任务唯一标识',
  `CUR_Batch` varchar(255) NOT NULL COMMENT '批次',
  `CUR_DataStatus` varchar(255) NOT NULL COMMENT '数据状态',
  `CUR_Department` varchar(255) NOT NULL COMMENT '下发部门',
  `CUR_CallNum` int(11) NOT NULL COMMENT '外呼次数',
  `CUR_Province` varchar(255) NOT NULL COMMENT '省份',
  `CUR_GridOrg` varchar(255) NOT NULL COMMENT '网格',
  `CUR_Custom1` varchar(255) NOT NULL COMMENT '活动',
  `CUR_City` varchar(255) NOT NULL COMMENT '城市',
  `CUR_EncryptMobileNo` varchar(255) NOT NULL COMMENT '移动号码',
  `CUR_CustomerName` varchar(255) NOT NULL COMMENT '画像',
  `CUR_ImportTime` varchar(255) NOT NULL COMMENT '导入时间',
  `CUR_MobileNo` varchar(255) NOT NULL COMMENT '手机号码',
  `CUR_UpdateTime` varchar(255) NOT NULL COMMENT '更新时间',
  `CUR_RawData` text NOT NULL COMMENT '源数据',
  `CUR_LastUpdateTime` int(11) NOT NULL COMMENT '最后更新时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- 转储表的索引
--

--
-- 表的索引 `tb_company`
--
ALTER TABLE `tb_company`
  ADD PRIMARY KEY (`C_ID`);

--
-- 表的索引 `tb_company_operator`
--
ALTER TABLE `tb_company_operator`
  ADD PRIMARY KEY (`CO_ID`) USING BTREE;

--
-- 表的索引 `tb_company_original_task`
--
ALTER TABLE `tb_company_original_task`
  ADD PRIMARY KEY (`COT_ID`);

--
-- 表的索引 `tb_company_product`
--
ALTER TABLE `tb_company_product`
  ADD PRIMARY KEY (`CP_ID`),
  ADD KEY `productKey` (`CP_ProductKey`) COMMENT '自增唯一',
  ADD KEY `unique` (`CP_ProductName`(191),`CP_CompanyKey`,`CP_Operator`) USING BTREE COMMENT '业务唯一';

--
-- 表的索引 `tb_company_relation`
--
ALTER TABLE `tb_company_relation`
  ADD PRIMARY KEY (`CR_ID`);

--
-- 表的索引 `tb_company_task_info`
--
ALTER TABLE `tb_company_task_info`
  ADD PRIMARY KEY (`CTI_ID`) USING BTREE,
  ADD KEY `CTI_CompanyID` (`CTI_CompanyID`,`CTI_OperatorID`,`CTI_ConsultStatus`);

--
-- 表的索引 `tb_company_task_portrait_info`
--
ALTER TABLE `tb_company_task_portrait_info`
  ADD PRIMARY KEY (`CTPI_ID`) USING BTREE;

--
-- 表的索引 `tb_company_task_record`
--
ALTER TABLE `tb_company_task_record`
  ADD PRIMARY KEY (`CTR_ID`) USING BTREE;

--
-- 表的索引 `tb_company_user_info`
--
ALTER TABLE `tb_company_user_info`
  ADD PRIMARY KEY (`CUI_ID`) USING BTREE;

--
-- 表的索引 `tb_company_user_record`
--
ALTER TABLE `tb_company_user_record`
  ADD PRIMARY KEY (`CUR_ID`) USING BTREE;

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `tb_company`
--
ALTER TABLE `tb_company`
  MODIFY `C_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `tb_company_operator`
--
ALTER TABLE `tb_company_operator`
  MODIFY `CO_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `tb_company_original_task`
--
ALTER TABLE `tb_company_original_task`
  MODIFY `COT_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '唯一标识';

--
-- 使用表AUTO_INCREMENT `tb_company_product`
--
ALTER TABLE `tb_company_product`
  MODIFY `CP_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `tb_company_relation`
--
ALTER TABLE `tb_company_relation`
  MODIFY `CR_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '唯一标识';

--
-- 使用表AUTO_INCREMENT `tb_company_task_info`
--
ALTER TABLE `tb_company_task_info`
  MODIFY `CTI_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `tb_company_task_portrait_info`
--
ALTER TABLE `tb_company_task_portrait_info`
  MODIFY `CTPI_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `tb_company_task_record`
--
ALTER TABLE `tb_company_task_record`
  MODIFY `CTR_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `tb_company_user_info`
--
ALTER TABLE `tb_company_user_info`
  MODIFY `CUI_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `tb_company_user_record`
--
ALTER TABLE `tb_company_user_record`
  MODIFY `CUR_ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- 数据库： `dss_V2_customer`
--
CREATE DATABASE IF NOT EXISTS `dss_V2_customer` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE `dss_V2_customer`;

-- --------------------------------------------------------

--
-- 表的结构 `tb_customer`
--

CREATE TABLE `tb_customer` (
  `C_ID` int(11) NOT NULL,
  `C_Phone` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `C_LastUpdateTime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='客户表';

-- --------------------------------------------------------

--
-- 表的结构 `tb_customer_status`
--

CREATE TABLE `tb_customer_status` (
  `CS_CID` int(11) NOT NULL COMMENT '客户ID',
  `CS_LastUpdateTime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='客户状态表';

--
-- 转储表的索引
--

--
-- 表的索引 `tb_customer`
--
ALTER TABLE `tb_customer`
  ADD PRIMARY KEY (`C_ID`),
  ADD UNIQUE KEY `C_Phone` (`C_Phone`);

--
-- 表的索引 `tb_customer_status`
--
ALTER TABLE `tb_customer_status`
  ADD UNIQUE KEY `CS_ID` (`CS_CID`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `tb_customer`
--
ALTER TABLE `tb_customer`
  MODIFY `C_ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- 数据库： `dss_V2_log`
--
CREATE DATABASE IF NOT EXISTS `dss_V2_log` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE `dss_V2_log`;

-- --------------------------------------------------------

--
-- 表的结构 `tb_log_action`
--

CREATE TABLE `tb_log_action` (
  `LA_ID` int(11) NOT NULL,
  `LA_UserID` int(11) NOT NULL COMMENT '用户ID',
  `LA_Name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户名字',
  `LA_API` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `LA_Description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '描述信息',
  `LA_InputParam` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `LA_OutPut` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `LA_DbResult` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `LA_Param` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '附加参数',
  `LA_CreteTime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `tb_log_dialog`
--

CREATE TABLE `tb_log_dialog` (
  `LD_ID` int(11) NOT NULL,
  `LD_TimeKey` bigint(14) NOT NULL COMMENT '开始时间',
  `LD_TimeStamp` bigint(14) NOT NULL COMMENT '毫秒键',
  `LD_UserID` int(11) NOT NULL COMMENT '对应user表id',
  `LD_OutCall` varchar(20) NOT NULL COMMENT '被叫号码',
  `LD_Content` text NOT NULL COMMENT '对话内容',
  `LD_Recommend` text NOT NULL COMMENT '建议内容',
  `LD_Source` text NOT NULL COMMENT '源数据',
  `LD_States` tinyint(2) NOT NULL COMMENT '对话，0=完整，1=非完整',
  `LD_CreateTime` int(11) NOT NULL COMMENT '记录创建时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='对话日志';

-- --------------------------------------------------------

--
-- 表的结构 `tb_log_login`
--

CREATE TABLE `tb_log_login` (
  `LL_ID` int(11) NOT NULL,
  `LL_UserID` int(11) NOT NULL,
  `LL_Date` int(11) NOT NULL COMMENT '年月日',
  `LL_LoginTime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='DSS登陆日志表';

-- --------------------------------------------------------

--
-- 表的结构 `tb_log_message_push`
--

CREATE TABLE `tb_log_message_push` (
  `LMP_ID` int(11) NOT NULL,
  `LMP_UserID` int(11) NOT NULL COMMENT '销售用户ID',
  `LMP_Type` int(11) NOT NULL COMMENT '推送类型 1=在轨率 2=外呼工时 3=成交量',
  `LMP_Context` text NOT NULL COMMENT '推送内容',
  `LMP_IsSimulation` tinyint(2) NOT NULL COMMENT '测试环境账号1=是，2=生产环',
  `LMP_CreateTime` int(11) NOT NULL COMMENT '创建时间',
  `LMP_UpdateTime` int(11) NOT NULL COMMENT '更新时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- 表的结构 `tb_log_operation`
--

CREATE TABLE `tb_log_operation` (
  `LO_ID` int(11) NOT NULL,
  `LO_UserID` int(11) NOT NULL COMMENT 'DSS账号ID',
  `LO_TimeKey` bigint(14) NOT NULL COMMENT '通话唯一标识',
  `LO_ProductCode` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '业务编码',
  `LO_Operation` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '操作类型，connect=双接通，clickSalesText=点击话术，disconnect=通话结束',
  `LO_OperationTime` bigint(13) NOT NULL COMMENT '操作时间（毫秒级）',
  `LO_Param` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '参数集合',
  `LO_Date` int(8) NOT NULL COMMENT '日期',
  `LO_Env` int(11) NOT NULL COMMENT '1=培训环境',
  `LO_CreateTime` int(11) NOT NULL COMMENT '记录创建时间（秒级）'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='数据采集（布点）';

-- --------------------------------------------------------

--
-- 表的结构 `tb_log_play_recording`
--

CREATE TABLE `tb_log_play_recording` (
  `LPR_ID` int(11) NOT NULL,
  `LPR_TimeKey` bigint(18) NOT NULL COMMENT '通话唯一标识',
  `LPR_UserID` int(11) NOT NULL COMMENT '账号ID',
  `LPR_TextCenterID` int(11) NOT NULL COMMENT 'salesConfig表簇心ID',
  `LPR_PlayTime` int(11) NOT NULL COMMENT '录音播放时间',
  `LPR_CreateTime` int(11) NOT NULL COMMENT '记录创建时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='记录播放话术脚本录音文件';

-- --------------------------------------------------------

--
-- 表的结构 `tb_log_source`
--

CREATE TABLE `tb_log_source` (
  `LS_ID` int(11) NOT NULL,
  `LS_TimeKey` bigint(14) DEFAULT NULL COMMENT '开始时间 ',
  `LS_Type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `LS_Env` int(11) NOT NULL COMMENT '1=培训环境',
  `LS_Source` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `LS_CompanyID` int(11) NOT NULL,
  `LS_UserID` int(11) NOT NULL,
  `LS_CreateDay` int(11) NOT NULL,
  `LS_CreateTime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `tb_log_tmp`
--

CREATE TABLE `tb_log_tmp` (
  `LT_ID` int(11) NOT NULL COMMENT '关键词',
  `LT_Key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '关键词',
  `LT_Value` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '值',
  `LT_Param` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '附加值',
  `LT_CreateTime` int(11) NOT NULL,
  `LT_UpdateTime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `tb_log_train`
--

CREATE TABLE `tb_log_train` (
  `LT_ID` int(11) NOT NULL COMMENT '日志ID',
  `LT_UserTrainCaseID` int(11) NOT NULL COMMENT '培训中案例ID',
  `LT_UserID` int(11) NOT NULL COMMENT '用户ID',
  `LT_Action` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '操作码',
  `LT_ActionTime` bigint(13) NOT NULL COMMENT '操作时间：微秒',
  `LT_Param` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '参数',
  `LT_LastUpdateTime` int(11) NOT NULL COMMENT '最后更新时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `tb_log_ws`
--

CREATE TABLE `tb_log_ws` (
  `LW_ID` int(11) NOT NULL,
  `LW_SalesID` int(11) NOT NULL COMMENT '销售ID',
  `LW_Service` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '请求接口名',
  `LW_TimeKey` bigint(14) NOT NULL COMMENT '通话的唯一key',
  `LW_Time` int(11) NOT NULL COMMENT '添加时间',
  `LW_Param` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '请求参数',
  `LW_LastUpdateTime` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `tb_user_login_info`
--

CREATE TABLE `tb_user_login_info` (
  `ULI_ID` int(11) NOT NULL,
  `ULI_UserID` int(11) NOT NULL,
  `ULI_LoginStatus` enum('1','0') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT '是否在线1=在线，0=不在线',
  `ULI_FirstLoginTime` int(11) NOT NULL,
  `ULI_LoginTime` int(11) NOT NULL,
  `ULI_LogoutTime` int(11) NOT NULL,
  `ULI_CreateTime` int(11) NOT NULL,
  `ULI_LastUpdateTime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户日登录信息表';

--
-- 转储表的索引
--

--
-- 表的索引 `tb_log_action`
--
ALTER TABLE `tb_log_action`
  ADD PRIMARY KEY (`LA_ID`);

--
-- 表的索引 `tb_log_dialog`
--
ALTER TABLE `tb_log_dialog`
  ADD PRIMARY KEY (`LD_ID`) USING BTREE,
  ADD KEY `DL_TimeKey` (`LD_TimeKey`),
  ADD KEY `DL_UserID` (`LD_UserID`);

--
-- 表的索引 `tb_log_login`
--
ALTER TABLE `tb_log_login`
  ADD PRIMARY KEY (`LL_ID`);

--
-- 表的索引 `tb_log_message_push`
--
ALTER TABLE `tb_log_message_push`
  ADD PRIMARY KEY (`LMP_ID`) USING BTREE,
  ADD KEY `LMP_CreateTime` (`LMP_CreateTime`);

--
-- 表的索引 `tb_log_operation`
--
ALTER TABLE `tb_log_operation`
  ADD PRIMARY KEY (`LO_ID`),
  ADD KEY `LO_TimeKey` (`LO_TimeKey`);

--
-- 表的索引 `tb_log_play_recording`
--
ALTER TABLE `tb_log_play_recording`
  ADD PRIMARY KEY (`LPR_ID`),
  ADD KEY `LPR_UserID` (`LPR_UserID`),
  ADD KEY `LPR_TimeKey` (`LPR_TimeKey`);

--
-- 表的索引 `tb_log_source`
--
ALTER TABLE `tb_log_source`
  ADD PRIMARY KEY (`LS_ID`),
  ADD KEY `LS_Type` (`LS_Type`(191));

--
-- 表的索引 `tb_log_tmp`
--
ALTER TABLE `tb_log_tmp`
  ADD PRIMARY KEY (`LT_ID`);

--
-- 表的索引 `tb_log_train`
--
ALTER TABLE `tb_log_train`
  ADD PRIMARY KEY (`LT_ID`),
  ADD KEY `LT_UserTrainCaseID` (`LT_UserTrainCaseID`);

--
-- 表的索引 `tb_log_ws`
--
ALTER TABLE `tb_log_ws`
  ADD PRIMARY KEY (`LW_ID`);

--
-- 表的索引 `tb_user_login_info`
--
ALTER TABLE `tb_user_login_info`
  ADD PRIMARY KEY (`ULI_ID`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `tb_log_action`
--
ALTER TABLE `tb_log_action`
  MODIFY `LA_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `tb_log_dialog`
--
ALTER TABLE `tb_log_dialog`
  MODIFY `LD_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `tb_log_login`
--
ALTER TABLE `tb_log_login`
  MODIFY `LL_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `tb_log_message_push`
--
ALTER TABLE `tb_log_message_push`
  MODIFY `LMP_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `tb_log_operation`
--
ALTER TABLE `tb_log_operation`
  MODIFY `LO_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `tb_log_play_recording`
--
ALTER TABLE `tb_log_play_recording`
  MODIFY `LPR_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `tb_log_source`
--
ALTER TABLE `tb_log_source`
  MODIFY `LS_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `tb_log_tmp`
--
ALTER TABLE `tb_log_tmp`
  MODIFY `LT_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '关键词';

--
-- 使用表AUTO_INCREMENT `tb_log_train`
--
ALTER TABLE `tb_log_train`
  MODIFY `LT_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '日志ID';

--
-- 使用表AUTO_INCREMENT `tb_log_ws`
--
ALTER TABLE `tb_log_ws`
  MODIFY `LW_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `tb_user_login_info`
--
ALTER TABLE `tb_user_login_info`
  MODIFY `ULI_ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- 数据库： `dss_V2_manager`
--
CREATE DATABASE IF NOT EXISTS `dss_V2_manager` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE `dss_V2_manager`;

-- --------------------------------------------------------

--
-- 表的结构 `tb_manage_task`
--

CREATE TABLE `tb_manage_task` (
  `MT_ID` int(11) NOT NULL COMMENT '主键 唯一标识',
  `MT_ProductCode` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '产品代码',
  `MT_SalesID` int(11) NOT NULL COMMENT '销售id',
  `MT_TaskID` int(11) NOT NULL COMMENT '关联的任务id',
  `MT_Status` int(11) NOT NULL COMMENT '任务状态 , 0:未领, 1:已领',
  `MT_CreateTime` int(10) NOT NULL COMMENT '创建时间',
  `MT_CreateDate` int(10) NOT NULL COMMENT '创建日期',
  `MT_LastStatusChangeTime` int(10) NOT NULL COMMENT '最后状态变化时间',
  `MT_WeekStartDate` int(10) NOT NULL COMMENT '周开始时间',
  `MT_WeekEndDate` int(10) NOT NULL COMMENT '周结束时间',
  `MT_LastUpdateTime` int(11) NOT NULL COMMENT '最后更新时间',
  `MT_ProductName` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '产品名称'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 转储表的索引
--

--
-- 表的索引 `tb_manage_task`
--
ALTER TABLE `tb_manage_task`
  ADD PRIMARY KEY (`MT_ID`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `tb_manage_task`
--
ALTER TABLE `tb_manage_task`
  MODIFY `MT_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键 唯一标识';
--
-- 数据库： `dss_V2_script`
--
CREATE DATABASE IF NOT EXISTS `dss_V2_script` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE `dss_V2_script`;

-- --------------------------------------------------------

--
-- 表的结构 `tb_hist_audio`
--

CREATE TABLE `tb_hist_audio` (
  `HA_ID` int(11) NOT NULL COMMENT '案例ID',
  `HA_AudioName` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '录音文件名称',
  `HA_CaseTaskID` int(11) NOT NULL COMMENT '案例入库任务ID',
  `HA_ClipUserID` int(11) NOT NULL COMMENT '剪辑人员ID',
  `HA_ProductCode` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '业务编码',
  `HA_CaseKey` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '案例标识',
  `HA_AudioPath` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '录音文件路径',
  `HA_LabelPath` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '智能转文文件路径',
  `HA_CasePath` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '案例文件路径',
  `HA_Status` int(2) NOT NULL COMMENT '案例是否同意0：拒绝 1：同意',
  `HA_IsHandle` int(2) NOT NULL COMMENT '录音是否处理：0未处理；1已处理',
  `HA_IsSuccessText` int(11) NOT NULL COMMENT '录音转文转成功状态 0: 转文失败 1: 转文成功',
  `HA_LastUpdateTime` int(10) NOT NULL,
  `HA_IsMatchTask` int(2) NOT NULL COMMENT '是否符合任务要求'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `tb_hist_case`
--

CREATE TABLE `tb_hist_case` (
  `HC_ID` int(11) NOT NULL COMMENT '案例ID',
  `HC_CompanyID` int(11) NOT NULL COMMENT '公司ID',
  `HC_OperatorID` int(11) NOT NULL COMMENT '运营商ID',
  `HC_TaskName` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '生产任务名称',
  `HC_ProductName` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '业务名称',
  `HC_UserState` int(11) NOT NULL COMMENT '客户状态',
  `HC_BqContent` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Bq内容',
  `HC_ProductCode` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '业务编码',
  `HC_SpeakerGender` int(2) NOT NULL COMMENT '案例客户性别:0男生：1女生',
  `HC_CaseKey` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '案例标识Key',
  `HC_LayerNum` int(11) NOT NULL COMMENT '平层数',
  `HC_CasePath` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '案例文件路径',
  `HC_Status` int(2) NOT NULL COMMENT '案例是否同意：0拒绝；1同意',
  `HC_WasInUserState1` int(11) NOT NULL COMMENT '经过客户状态1',
  `HC_BqContentInUserState1` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '客户状态1 Bq内容',
  `HC_BqTypeNumInUserState1` int(11) NOT NULL COMMENT '客户状态1 疑问类型数',
  `HC_WasInUserState2` int(11) NOT NULL COMMENT '经过客户状态2',
  `HC_BqContentInUserState2` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '客户状态2 Bq内容',
  `HC_BqTypeNumInUserState2` int(11) NOT NULL COMMENT '客户状态2 疑问类型数',
  `HC_WasInUserState3` int(11) NOT NULL COMMENT '经过客户状态3',
  `HC_BqContentInUserState3` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '客户状态3 Bq内容',
  `HC_BqTypeNumInUserState3` int(11) NOT NULL COMMENT '客户状态3 疑问类型数',
  `HC_CreateTime` int(11) NOT NULL COMMENT '创建时间',
  `HC_LastUpdateTime` int(11) NOT NULL COMMENT '最后更新时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `tb_hist_case_task`
--

CREATE TABLE `tb_hist_case_task` (
  `HCT_ID` int(11) NOT NULL COMMENT '唯一标识',
  `HCT_CompanyID` int(11) NOT NULL COMMENT '公司ID',
  `HCT_OperatorID` int(11) NOT NULL COMMENT '运营商ID',
  `HCT_TaskName` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '生产任务名称',
  `HCT_ProductCode` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '生产业务编码',
  `HCT_UserState` int(11) NOT NULL COMMENT '客户状态',
  `HCT_BqTypeNum` int(11) NOT NULL COMMENT 'Bq种类',
  `HCT_BqContent` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Bq内容',
  `HCT_AudioStatus` int(11) NOT NULL COMMENT '录音类型 0: 失败 1: 成功',
  `HCT_AudioNum` int(11) NOT NULL COMMENT '录音需求数',
  `HCT_AudioSuccessNum` int(11) NOT NULL COMMENT '录音已完成数',
  `HTC_AudioSkipNum` int(11) NOT NULL COMMENT '跳过录音数量',
  `HTC_AudioSuccessQulifiedNum` int(11) NOT NULL COMMENT '成功剪辑并符合要求数量',
  `HCT_AudioMaterialNum` int(11) NOT NULL COMMENT '录音素材数',
  `HCT_CreateTime` int(11) NOT NULL COMMENT '创建时间',
  `HCT_LastUpdateTime` int(11) NOT NULL COMMENT '最后更新时间',
  `HCT_ProductName` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '生产业务名称',
  `HTC_ClipNum` int(11) NOT NULL DEFAULT '0' COMMENT '剪辑次序 默认0',
  `HTC_RelateKey` int(11) NOT NULL DEFAULT '0' COMMENT '关联字段 默认0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `tb_hist_speak`
--

CREATE TABLE `tb_hist_speak` (
  `HS_ID` int(11) NOT NULL COMMENT '历史发言ID',
  `HS_ProductCode` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '业务编码',
  `HS_CaseKey` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '案例标识',
  `HS_Sort` int(11) NOT NULL COMMENT '发言排序',
  `HS_SpeakerType` int(11) NOT NULL COMMENT '发言者类型：1：销售；2：客户',
  `HS_AudioPath` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '录音文件路径',
  `HS_Text` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '文本内容',
  `HS_LayerDetail` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '平层类型',
  `HS_TextCenterID` int(11) NOT NULL COMMENT '匹配簇中心ID',
  `HS_UserState` int(11) NOT NULL COMMENT '客户状态',
  `HS_PointSet` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '匹配关键元素集合',
  `HS_CreateTime` int(11) NOT NULL COMMENT '创建时间',
  `HS_LastUpdateTime` int(11) NOT NULL COMMENT '最后更新时间',
  `HS_BqContent` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '疑问内容',
  `HS_ConfirmSave` int(11) NOT NULL DEFAULT '0' COMMENT '是否为最终保存 1是 ；0否'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `tb_hist_speak_record`
--

CREATE TABLE `tb_hist_speak_record` (
  `HSR_ID` int(11) NOT NULL COMMENT '历史发言ID',
  `HSR_ProductCode` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '业务编码',
  `HSR_CaseKey` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '案例标识',
  `HSR_Sort` int(11) NOT NULL COMMENT '发言排序',
  `HSR_SpeakerType` int(11) NOT NULL COMMENT '发言者类型：1：销售；2：客户',
  `HSR_AudioPath` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '录音文件路径',
  `HSR_Text` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '文本内容',
  `HSR_LayerDetail` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '平层类型',
  `HSR_TextCenterID` int(11) NOT NULL COMMENT '匹配簇中心ID',
  `HSR_UserState` int(11) NOT NULL COMMENT '客户状态',
  `HSR_PointSet` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '匹配关键元素集合',
  `HSR_CreateTime` int(11) NOT NULL COMMENT '创建时间',
  `HSR_LastUpdateTime` int(11) NOT NULL COMMENT '最后更新时间',
  `HSR_BqContent` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '疑问内容',
  `HSR_ClipNum` int(11) NOT NULL DEFAULT '0' COMMENT '剪辑次序',
  `HSR_TaskID` int(11) NOT NULL COMMENT '关联的任务id',
  `HSR_ClipUserID` int(11) NOT NULL COMMENT '剪辑人员Id 用于试听',
  `HSR_Bg` int(11) NOT NULL COMMENT '切段录音开始时间 单位ms ',
  `HSR_Ed` int(11) NOT NULL COMMENT '切段录音开始时间 单位ms'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `tb_question_cate`
--

CREATE TABLE `tb_question_cate` (
  `QC_ID` int(11) NOT NULL COMMENT '问题类型ID',
  `QC_Title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '问题类型标题',
  `QC_LastUpdateTime` int(11) NOT NULL COMMENT '最后更新时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `tb_script_cate_config`
--

CREATE TABLE `tb_script_cate_config` (
  `SCC_ID` int(11) NOT NULL COMMENT '客户回复类型ID',
  `SCC_ProductCode` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '关联产品表唯一字段',
  `SCC_Cate` int(11) NOT NULL COMMENT '客户回复类型',
  `SCC_SubCate` int(11) NOT NULL COMMENT '客户回复子类型',
  `SCC_Title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '客户回复类型标题',
  `SCC_LastUpdateTime` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `tb_script_complete_dialog`
--

CREATE TABLE `tb_script_complete_dialog` (
  `SCD_ID` int(11) NOT NULL,
  `SCD_UserID` int(11) NOT NULL COMMENT 'dss用户id',
  `SCD_TimeKey` bigint(15) NOT NULL COMMENT '通话唯一key，对应call_list表timekey',
  `SCD_Talker` tinyint(2) NOT NULL COMMENT '讲话人0=外呼者，1=被叫人',
  `SCD_TalkKey` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '句子唯一键,可用于排序',
  `SCD_Sort` int(11) NOT NULL COMMENT '句子排序',
  `SCD_IsSuccess` tinyint(2) NOT NULL DEFAULT '0' COMMENT '此通电话业务办理结果1=办理成功',
  `SCD_SalesScriptID` int(11) NOT NULL COMMENT '推荐话术ID',
  `SCD_ScriptStatus` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '脚本ScriptStatus',
  `SCD_Content` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '句子内容',
  `SCD_TimeStamp` bigint(15) NOT NULL COMMENT '毫秒级，句子最后更新时间',
  `SCD_IsTidy` tinyint(2) NOT NULL DEFAULT '0' COMMENT '1=已整理，0=未整理',
  `SCD_CreateTime` int(11) NOT NULL COMMENT '记录创建时间',
  `SCD_UpdateTime` int(11) NOT NULL COMMENT '记录最后更新时间',
  `SCD_Cate` varchar(11) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户意向',
  `SCD_IsRecord` tinyint(2) NOT NULL DEFAULT '0' COMMENT '1=录音转文，0=非录音转文'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `tb_script_config`
--

CREATE TABLE `tb_script_config` (
  `SC_ID` int(11) NOT NULL,
  `SC_ProductCode` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '关联产品表唯一字段',
  `SC_SalesTextCenterID` int(11) NOT NULL COMMENT '簇心编码',
  `SC_UserState` int(11) NOT NULL COMMENT '客户状态',
  `SC_Title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '平层类型标题',
  `SC_IsKeyPoint` int(2) NOT NULL COMMENT '是否重点',
  `SC_IsAllowAudio` int(2) NOT NULL COMMENT '是否允许录制语音',
  `SC_AudioRecordInfo` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '录音录制注意事项',
  `SC_LastUpdateTime` int(11) NOT NULL COMMENT '最后更新时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='话术配置表';

-- --------------------------------------------------------

--
-- 表的结构 `tb_script_conflict`
--

CREATE TABLE `tb_script_conflict` (
  `SC_ID` int(11) NOT NULL,
  `SC_UserID` int(11) NOT NULL COMMENT 'DssUserID',
  `SC_ProductCode` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '业务编码',
  `SC_TaskName` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `SC_TimeKey` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '客户（被叫）句子排序ID',
  `SC_LastUserTalkKey` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '上一客户发言段落标识',
  `SC_SalesTalkKey` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '销售当前发言标识',
  `SC_SalesTextCenterID` int(11) NOT NULL COMMENT '中心话术',
  `SC_SttSalesScriptID` int(11) NOT NULL COMMENT 'STT,当前标准话术',
  `SC_StaSalesScriptID` int(11) NOT NULL COMMENT 'STA,销售当前话术',
  `SC_StaFollowScriptID` int(11) NOT NULL COMMENT 'STA,销售之后话术',
  `SC_ConflictType` enum('5','4','3','2','1') COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '冲突类型',
  `SC_IsModified` tinyint(2) NOT NULL DEFAULT '0' COMMENT '1=已修改，0=未修改',
  `SC_ModifiedTime` int(11) NOT NULL,
  `SC_CreateTime` int(11) NOT NULL,
  `SC_UpdateTime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='销售话术冲突表';

-- --------------------------------------------------------

--
-- 表的结构 `tb_script_conflict_serviving`
--

CREATE TABLE `tb_script_conflict_serviving` (
  `SCS_ID` int(11) NOT NULL,
  `SCS_UserID` int(11) NOT NULL COMMENT '账号ID',
  `SCS_ProductCode` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '业务编码',
  `SCS_TaskName` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '任务名字',
  `SCS_LastConflictTime` int(11) NOT NULL COMMENT '最后新增冲突时间',
  `SCS_SurvivingNum` int(11) NOT NULL COMMENT '任务剩余冲突数量',
  `SCS_LastUpdateTime` int(11) NOT NULL,
  `SCS_CreateTime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `tb_script_logic`
--

CREATE TABLE `tb_script_logic` (
  `CL_ID` int(11) NOT NULL,
  `CL_ProductCode` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '关联产品表唯一字段',
  `CL_CurTextCenterID` int(11) NOT NULL COMMENT '当前销售话术中心',
  `CL_Cate` int(11) NOT NULL COMMENT '客户回复分类：1、肯定；2、否定；3、疑问',
  `CL_SubCate` int(11) NOT NULL COMMENT '客户分类细分',
  `CL_NextTextCenterID` int(11) NOT NULL COMMENT '下一个销售话术中心',
  `CL_RecommendWeight` int(11) NOT NULL COMMENT '排序权重',
  `CL_LastUpdateTime` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `tb_script_pact_lexicon`
--

CREATE TABLE `tb_script_pact_lexicon` (
  `SPL_ID` int(11) NOT NULL,
  `SPL_ProductCode` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '业务code',
  `SPL_UserState` int(11) NOT NULL COMMENT '客户状态',
  `SPL_LayerDetail` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '平层类型',
  `SPL_TextCenterID` int(11) NOT NULL COMMENT '簇心ID',
  `SPL_BqContent` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '疑问内容',
  `SPL_Word` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '公约词',
  `SPL_LastMatchTime` int(11) NOT NULL COMMENT '当前最后更新匹配时间',
  `SPL_CreateTime` int(11) NOT NULL COMMENT '创建时间',
  `SPL_LastUpdateTime` int(11) NOT NULL COMMENT '最后更新时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `tb_script_sales`
--

CREATE TABLE `tb_script_sales` (
  `SS_ID` int(11) NOT NULL COMMENT '销售话术编码',
  `SS_ProductCode` varchar(255) DEFAULT NULL,
  `SS_Product` varchar(100) NOT NULL COMMENT '产品',
  `SS_SalesID` int(11) NOT NULL COMMENT '所属销售',
  `SS_SalesTextCenterID` int(11) NOT NULL COMMENT '簇心编码',
  `SS_SalesText` text NOT NULL COMMENT '销售话术内容',
  `SS_IsCenter` tinyint(2) NOT NULL COMMENT '是否簇心',
  `SS_UserState` varchar(255) NOT NULL COMMENT '当前客户状态',
  `SS_CenterScriptID` varchar(50) NOT NULL COMMENT '对应簇心编码',
  `SS_DefaultNextSalesTextCenterID` int(11) NOT NULL COMMENT '默认下一销售话术簇编码',
  `SS_PaidWeight` float(4,2) NOT NULL COMMENT '成交权重',
  `SS_IsKeyPoint` int(2) NOT NULL COMMENT '是否重点句:0不是，1是',
  `SS_QualityPoint` text NOT NULL COMMENT '质检点',
  `SS_Status` int(11) NOT NULL COMMENT '话术审核状态：\r\n1：STA文本待审\r\n2：STA文本已审\r\n3：STA录音待审\r\n4：STA录音已审\r\n5：STA文本不通过',
  `SS_AudioUploadTime` int(11) NOT NULL COMMENT '录音更新时间',
  `SS_LastStatusChangeTime` int(11) DEFAULT NULL,
  `SS_AudioPath` varchar(1000) NOT NULL COMMENT '录音文件路径',
  `SS_AudioTime` bigint(13) NOT NULL COMMENT '音频时长',
  `SS_IsDiscard` int(11) NOT NULL DEFAULT '0' COMMENT 'STA是否弃用: 0: 未弃用 1: 已弃用',
  `SS_CreateTime` int(11) NOT NULL COMMENT '创建时间',
  `SS_LastUpdateTime` int(11) NOT NULL COMMENT '最后更新时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='销售话术表';

-- --------------------------------------------------------

--
-- 表的结构 `tb_script_sales_state`
--

CREATE TABLE `tb_script_sales_state` (
  `SSS_ID` int(11) NOT NULL COMMENT '与tb_sales_scriptID一一对应',
  `SSS_ProductCode` varchar(255) NOT NULL COMMENT '关联产品表唯一字段',
  `SSS_ScriptID` int(11) NOT NULL,
  `SSS_SalesID` int(11) NOT NULL COMMENT '所属销售',
  `SSS_SalesTextCenterID` int(11) NOT NULL COMMENT '簇心编码',
  `SSS_CallCount` int(11) NOT NULL COMMENT '被调用次数',
  `SSS_SuccessCount` int(11) NOT NULL COMMENT '成交次数',
  `SSS_CreateTime` int(11) NOT NULL COMMENT '创建时间',
  `SSS_LastUpdateTime` int(11) NOT NULL COMMENT '最后更新时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='销售话术统计表';

-- --------------------------------------------------------

--
-- 表的结构 `tb_script_sales_track`
--

CREATE TABLE `tb_script_sales_track` (
  `SST_ID` int(11) NOT NULL,
  `SST_TimeKey` bigint(14) NOT NULL COMMENT '通话唯一键',
  `SST_ScriptSalesID` int(11) NOT NULL COMMENT '操作建议记录ID',
  `SST_IsOnTrack` varchar(11) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '是否在轨',
  `SST_IsSuccess` varchar(11) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '是否成功',
  `SST_CreateTime` int(11) NOT NULL COMMENT '记录创建时间',
  `SST_UpdateTime` int(11) NOT NULL COMMENT '记录更新时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `tb_script_user`
--

CREATE TABLE `tb_script_user` (
  `SU_ID` int(11) NOT NULL COMMENT '客户话术编码',
  `SU_UserState` int(11) NOT NULL COMMENT '客户当前状态',
  `SU_LastUserState` varchar(50) NOT NULL COMMENT '上一客户状态',
  `SU_LastSalesTextCenterId` int(11) NOT NULL COMMENT '上一销售簇编码',
  `SU_UserText` text NOT NULL COMMENT '客户话术内容',
  `SU_NextUserState` varchar(50) NOT NULL COMMENT '下一客户状态',
  `SU_NextSalesTextCenterID` varchar(50) NOT NULL COMMENT '下一销售簇编码',
  `SU_Cate` int(11) NOT NULL COMMENT '主分类：0、其它；1、肯定；2、否定；3、疑问',
  `SU_QuestionCate` int(11) NOT NULL COMMENT '疑问分类：与疑问分类表对应（暂无）',
  `SU_IsConfirm` tinyint(2) NOT NULL COMMENT '是否人工确认：0、未确认；1、已确认',
  `SU_RuleCate` int(11) NOT NULL COMMENT '客户回应规则主分类',
  `SU_RuleQuestionCate` int(11) NOT NULL COMMENT '客户回应规则疑问类型',
  `SU_AICate` int(11) NOT NULL COMMENT '客户回应智能算法主分类',
  `SU_AIQuestionCate` int(11) NOT NULL COMMENT '客户回应智能算法疑问类型',
  `SU_SuccessCount` int(11) NOT NULL COMMENT '成功次数',
  `SU_CreateTime` int(11) NOT NULL COMMENT '创建时间',
  `SU_LastUdateTime` int(11) NOT NULL COMMENT '最后更新时间',
  `SU_CreateSalesID` int(11) NOT NULL COMMENT '产生记录时与客户沟通的销售ID',
  `SU_CreateUserTalkKey` varchar(50) NOT NULL COMMENT '创建通话记录的talkKey'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='客户话术表';

-- --------------------------------------------------------

--
-- 表的结构 `tb_script_user_new`
--

CREATE TABLE `tb_script_user_new` (
  `SU_ID` int(11) NOT NULL COMMENT '客户话术编码',
  `SU_UserState` int(11) NOT NULL COMMENT '客户当前状态',
  `SU_LastUserState` varchar(50) NOT NULL COMMENT '上一客户状态',
  `SU_LastSalesTextCenterId` int(11) NOT NULL COMMENT '上一销售簇编码',
  `SU_UserText` text NOT NULL COMMENT '客户话术内容',
  `SU_NextUserState` varchar(50) NOT NULL COMMENT '下一客户状态',
  `SU_NextSalesTextCenterID` varchar(50) NOT NULL COMMENT '下一销售簇编码',
  `SU_Cate` int(11) NOT NULL COMMENT '主分类：0、其它；1、肯定；2、否定；3、疑问',
  `SU_QuestionCate` int(11) NOT NULL COMMENT '疑问分类：与疑问分类表对应（暂无）',
  `SU_IsConfirm` tinyint(2) NOT NULL COMMENT '是否人工确认：0、未确认；1、已确认',
  `SU_RuleCate` int(11) NOT NULL COMMENT '客户回应规则主分类',
  `SU_RuleQuestionCate` int(11) NOT NULL COMMENT '客户回应规则疑问类型',
  `SU_AICate` int(11) NOT NULL COMMENT '客户回应智能算法主分类',
  `SU_AIQuestionCate` int(11) NOT NULL COMMENT '客户回应智能算法疑问类型',
  `SU_SuccessCount` int(11) NOT NULL COMMENT '成功次数',
  `SU_CreateTime` int(11) NOT NULL COMMENT '创建时间',
  `SU_LastUdateTime` int(11) NOT NULL COMMENT '最后更新时间',
  `SU_CreateSalesID` int(11) NOT NULL COMMENT '产生记录时与客户沟通的销售ID',
  `SU_CreateUserTalkKey` varchar(50) NOT NULL COMMENT '创建通话记录的talkKey'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='客户话术表';

-- --------------------------------------------------------

--
-- 表的结构 `tb_state_config`
--

CREATE TABLE `tb_state_config` (
  `SC_ID` int(11) NOT NULL COMMENT '状态ID',
  `SC_ProductCode` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '业务标识',
  `SC_UserState` int(11) NOT NULL COMMENT '客户状态',
  `SC_TextCenterID` int(11) NOT NULL COMMENT '关键句簇中心ID',
  `SC_KeyPointSet` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '关键句关键元素',
  `SC_NormalPointSet` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '非关键句关键元素',
  `SC_LastUpdateTime` int(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 转储表的索引
--

--
-- 表的索引 `tb_hist_audio`
--
ALTER TABLE `tb_hist_audio`
  ADD PRIMARY KEY (`HA_ID`);

--
-- 表的索引 `tb_hist_case`
--
ALTER TABLE `tb_hist_case`
  ADD PRIMARY KEY (`HC_ID`);

--
-- 表的索引 `tb_hist_case_task`
--
ALTER TABLE `tb_hist_case_task`
  ADD PRIMARY KEY (`HCT_ID`);

--
-- 表的索引 `tb_hist_speak`
--
ALTER TABLE `tb_hist_speak`
  ADD PRIMARY KEY (`HS_ID`);

--
-- 表的索引 `tb_hist_speak_record`
--
ALTER TABLE `tb_hist_speak_record`
  ADD PRIMARY KEY (`HSR_ID`);

--
-- 表的索引 `tb_question_cate`
--
ALTER TABLE `tb_question_cate`
  ADD PRIMARY KEY (`QC_ID`);

--
-- 表的索引 `tb_script_cate_config`
--
ALTER TABLE `tb_script_cate_config`
  ADD PRIMARY KEY (`SCC_ID`);

--
-- 表的索引 `tb_script_complete_dialog`
--
ALTER TABLE `tb_script_complete_dialog`
  ADD PRIMARY KEY (`SCD_ID`),
  ADD UNIQUE KEY `SCD_TalkKey` (`SCD_TalkKey`,`SCD_UserID`,`SCD_IsRecord`) USING BTREE,
  ADD KEY `SCD_UpdateTime` (`SCD_UpdateTime`),
  ADD KEY `SCD_TimeKey` (`SCD_TimeKey`,`SCD_TimeStamp`) USING BTREE;

--
-- 表的索引 `tb_script_config`
--
ALTER TABLE `tb_script_config`
  ADD PRIMARY KEY (`SC_ID`);

--
-- 表的索引 `tb_script_conflict`
--
ALTER TABLE `tb_script_conflict`
  ADD PRIMARY KEY (`SC_ID`),
  ADD KEY `SC_UserID` (`SC_UserID`,`SC_TimeKey`),
  ADD KEY `SC_TimeKey` (`SC_TimeKey`,`SC_SalesTalkKey`);

--
-- 表的索引 `tb_script_conflict_serviving`
--
ALTER TABLE `tb_script_conflict_serviving`
  ADD PRIMARY KEY (`SCS_ID`);

--
-- 表的索引 `tb_script_logic`
--
ALTER TABLE `tb_script_logic`
  ADD PRIMARY KEY (`CL_ID`),
  ADD KEY `CL_ProductCode` (`CL_ProductCode`),
  ADD KEY `CL_CurTextCenterID` (`CL_CurTextCenterID`,`CL_ProductCode`) USING BTREE;

--
-- 表的索引 `tb_script_pact_lexicon`
--
ALTER TABLE `tb_script_pact_lexicon`
  ADD PRIMARY KEY (`SPL_ID`) USING BTREE;

--
-- 表的索引 `tb_script_sales`
--
ALTER TABLE `tb_script_sales`
  ADD PRIMARY KEY (`SS_ID`),
  ADD KEY `SS_SalesID` (`SS_SalesID`,`SS_SalesTextCenterID`,`SS_ID`) USING BTREE,
  ADD KEY `SS_SalesTextCenterID` (`SS_SalesTextCenterID`),
  ADD KEY `SS_UniqueCode` (`SS_ProductCode`);

--
-- 表的索引 `tb_script_sales_state`
--
ALTER TABLE `tb_script_sales_state`
  ADD PRIMARY KEY (`SSS_ID`),
  ADD KEY `SSS_LastUpdateTime` (`SSS_LastUpdateTime`),
  ADD KEY `SSS_SalesTextCenterID` (`SSS_SalesTextCenterID`,`SSS_SalesID`,`SSS_ID`) USING BTREE,
  ADD KEY `SSS_SalesID` (`SSS_SalesID`,`SSS_SalesTextCenterID`);

--
-- 表的索引 `tb_script_sales_track`
--
ALTER TABLE `tb_script_sales_track`
  ADD PRIMARY KEY (`SST_ID`);

--
-- 表的索引 `tb_script_user`
--
ALTER TABLE `tb_script_user`
  ADD PRIMARY KEY (`SU_ID`) USING BTREE;

--
-- 表的索引 `tb_script_user_new`
--
ALTER TABLE `tb_script_user_new`
  ADD PRIMARY KEY (`SU_ID`) USING BTREE;

--
-- 表的索引 `tb_state_config`
--
ALTER TABLE `tb_state_config`
  ADD PRIMARY KEY (`SC_ID`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `tb_hist_audio`
--
ALTER TABLE `tb_hist_audio`
  MODIFY `HA_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '案例ID';

--
-- 使用表AUTO_INCREMENT `tb_hist_case`
--
ALTER TABLE `tb_hist_case`
  MODIFY `HC_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '案例ID';

--
-- 使用表AUTO_INCREMENT `tb_hist_case_task`
--
ALTER TABLE `tb_hist_case_task`
  MODIFY `HCT_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '唯一标识';

--
-- 使用表AUTO_INCREMENT `tb_hist_speak`
--
ALTER TABLE `tb_hist_speak`
  MODIFY `HS_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '历史发言ID';

--
-- 使用表AUTO_INCREMENT `tb_hist_speak_record`
--
ALTER TABLE `tb_hist_speak_record`
  MODIFY `HSR_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '历史发言ID';

--
-- 使用表AUTO_INCREMENT `tb_question_cate`
--
ALTER TABLE `tb_question_cate`
  MODIFY `QC_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '问题类型ID';

--
-- 使用表AUTO_INCREMENT `tb_script_cate_config`
--
ALTER TABLE `tb_script_cate_config`
  MODIFY `SCC_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '客户回复类型ID';

--
-- 使用表AUTO_INCREMENT `tb_script_complete_dialog`
--
ALTER TABLE `tb_script_complete_dialog`
  MODIFY `SCD_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `tb_script_config`
--
ALTER TABLE `tb_script_config`
  MODIFY `SC_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `tb_script_conflict`
--
ALTER TABLE `tb_script_conflict`
  MODIFY `SC_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `tb_script_conflict_serviving`
--
ALTER TABLE `tb_script_conflict_serviving`
  MODIFY `SCS_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `tb_script_logic`
--
ALTER TABLE `tb_script_logic`
  MODIFY `CL_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `tb_script_pact_lexicon`
--
ALTER TABLE `tb_script_pact_lexicon`
  MODIFY `SPL_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `tb_script_sales`
--
ALTER TABLE `tb_script_sales`
  MODIFY `SS_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '销售话术编码';

--
-- 使用表AUTO_INCREMENT `tb_script_sales_state`
--
ALTER TABLE `tb_script_sales_state`
  MODIFY `SSS_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '与tb_sales_scriptID一一对应';

--
-- 使用表AUTO_INCREMENT `tb_script_sales_track`
--
ALTER TABLE `tb_script_sales_track`
  MODIFY `SST_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `tb_script_user`
--
ALTER TABLE `tb_script_user`
  MODIFY `SU_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '客户话术编码';

--
-- 使用表AUTO_INCREMENT `tb_script_user_new`
--
ALTER TABLE `tb_script_user_new`
  MODIFY `SU_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '客户话术编码';

--
-- 使用表AUTO_INCREMENT `tb_state_config`
--
ALTER TABLE `tb_state_config`
  MODIFY `SC_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '状态ID';
--
-- 数据库： `dss_V2_stat`
--
CREATE DATABASE IF NOT EXISTS `dss_V2_stat` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE `dss_V2_stat`;

-- --------------------------------------------------------

--
-- 表的结构 `tb_daily_statistic`
--

CREATE TABLE `tb_daily_statistic` (
  `DS_ID` int(11) NOT NULL COMMENT '主键 唯一标识',
  `DS_ProductCode` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '产品代码',
  `DS_SalesID` int(11) NOT NULL COMMENT '销售id',
  `DS_StatisticKey` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '统计的指标key',
  `DS_StatisticDate` int(11) NOT NULL COMMENT '统计日期',
  `DS_Value` decimal(10,6) NOT NULL COMMENT '统计值',
  `DS_CreateTime` int(11) NOT NULL COMMENT '创建时间',
  `DS_LastUpdateTime` int(11) NOT NULL COMMENT '最后更新时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `tb_dim_task`
--

CREATE TABLE `tb_dim_task` (
  `DT_ID` int(11) NOT NULL COMMENT '记录ID',
  `DT_TaskKey` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '生产任务键值',
  `DT_CompanyID` int(11) NOT NULL COMMENT '公司ID',
  `DT_OperatorID` int(11) NOT NULL COMMENT '运营商ID',
  `DT_TaskName` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '生产任务名称',
  `DT_Commission` decimal(10,2) NOT NULL COMMENT '生产任务提成',
  `DT_LastUpdateTime` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `tb_stat_call`
--

CREATE TABLE `tb_stat_call` (
  `SC_ID` int(11) NOT NULL COMMENT '记录ID',
  `SC_CompanyID` int(11) NOT NULL COMMENT '公司ID',
  `SC_OperatorID` int(11) NOT NULL COMMENT '运营商ID',
  `SC_ProductCode` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '业务编码',
  `SC_TaskName` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '任务名称',
  `SC_SalesID` int(11) NOT NULL COMMENT '销售ID',
  `SC_CallDate` int(11) NOT NULL COMMENT '呼叫日期',
  `SC_CallStartTime` bigint(13) NOT NULL COMMENT '呼叫开始时间（毫秒）',
  `SC_UserState1CheckTime` bigint(13) NOT NULL COMMENT '状态1到达时间（毫秒）',
  `SC_UserState1Period` int(11) NOT NULL COMMENT '状态1经历时长',
  `SC_UserState2CheckTime` bigint(13) NOT NULL COMMENT '状态2到达时间（毫秒）',
  `SC_UserState2Period` int(11) NOT NULL COMMENT '状态2经历时长',
  `SC_UserState2WithBQNum` int(11) NOT NULL COMMENT '状态2下的Bq数量',
  `SC_UserState2HasAudio` int(11) NOT NULL COMMENT '状态2是否有录音',
  `SC_UserState3CheckTime` bigint(13) NOT NULL COMMENT '状态3到达时间（毫秒）',
  `SC_UserState3Period` int(11) NOT NULL COMMENT '状态3经历时长',
  `SC_LastUserState` int(11) NOT NULL COMMENT '最后状态',
  `SC_LastStateCheckTime` int(11) NOT NULL COMMENT '最后状态确定时间',
  `SC_CallEndTime` bigint(13) NOT NULL COMMENT '通话结束时间（毫秒）',
  `SC_IsSuccess` int(11) NOT NULL COMMENT '是否成功',
  `SC_LastUpdateTime` int(11) NOT NULL COMMENT '最后更新时间',
  `SC_TimeKey` bigint(14) NOT NULL COMMENT '通话标识'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `tb_stat_training`
--

CREATE TABLE `tb_stat_training` (
  `ST_ID` int(11) NOT NULL COMMENT '记录ID',
  `ST_CompanyID` int(11) NOT NULL COMMENT '公司ID',
  `ST_OperatorID` int(11) NOT NULL COMMENT '运营商ID',
  `ST_ProductCode` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '业务编码',
  `ST_TaskName` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '任务名称',
  `ST_SalesID` int(11) NOT NULL COMMENT '销售ID',
  `ST_CallDate` int(11) NOT NULL COMMENT '呼叫日期',
  `ST_CallStartTime` bigint(13) NOT NULL COMMENT '呼叫开始时间（毫秒）',
  `ST_UserState1CheckTime` bigint(13) NOT NULL COMMENT '状态1到达时间（毫秒）',
  `ST_UserState1Period` int(11) NOT NULL COMMENT '状态1经历时长',
  `ST_UserState2CheckTime` bigint(13) NOT NULL COMMENT '状态2到达时间（毫秒）',
  `ST_UserState2Period` int(11) NOT NULL COMMENT '状态2经历时长',
  `ST_UserState2WithBQNum` int(11) NOT NULL COMMENT '状态2下的Bq数量',
  `ST_UserState2HasAudio` int(11) NOT NULL COMMENT '状态2是否有录音',
  `ST_UserState3CheckTime` bigint(13) NOT NULL COMMENT '状态3到达时间（毫秒）',
  `ST_UserState3Period` int(11) NOT NULL COMMENT '状态3经历时长',
  `ST_LastUserState` int(11) NOT NULL COMMENT '最后状态',
  `ST_LastStateCheckTime` int(11) NOT NULL COMMENT '最后状态确定时间',
  `ST_CallEndTime` bigint(13) NOT NULL COMMENT '通话结束时间（毫秒）',
  `ST_IsSuccess` int(11) NOT NULL COMMENT '是否成功',
  `ST_LastUpdateTime` int(11) NOT NULL COMMENT '最后更新时间',
  `ST_TimeKey` bigint(14) NOT NULL COMMENT '通话标识'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 转储表的索引
--

--
-- 表的索引 `tb_daily_statistic`
--
ALTER TABLE `tb_daily_statistic`
  ADD PRIMARY KEY (`DS_ID`);

--
-- 表的索引 `tb_dim_task`
--
ALTER TABLE `tb_dim_task`
  ADD PRIMARY KEY (`DT_ID`);

--
-- 表的索引 `tb_stat_call`
--
ALTER TABLE `tb_stat_call`
  ADD PRIMARY KEY (`SC_ID`);

--
-- 表的索引 `tb_stat_training`
--
ALTER TABLE `tb_stat_training`
  ADD PRIMARY KEY (`ST_ID`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `tb_daily_statistic`
--
ALTER TABLE `tb_daily_statistic`
  MODIFY `DS_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键 唯一标识';

--
-- 使用表AUTO_INCREMENT `tb_dim_task`
--
ALTER TABLE `tb_dim_task`
  MODIFY `DT_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '记录ID';

--
-- 使用表AUTO_INCREMENT `tb_stat_call`
--
ALTER TABLE `tb_stat_call`
  MODIFY `SC_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '记录ID';

--
-- 使用表AUTO_INCREMENT `tb_stat_training`
--
ALTER TABLE `tb_stat_training`
  MODIFY `ST_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '记录ID';
--
-- 数据库： `dss_V2_user`
--
CREATE DATABASE IF NOT EXISTS `dss_V2_user` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE `dss_V2_user`;

-- --------------------------------------------------------

--
-- 表的结构 `tb_user`
--

CREATE TABLE `tb_user` (
  `U_ID` int(11) NOT NULL COMMENT '用户ID',
  `U_AccountID` int(11) NOT NULL COMMENT '账户ID',
  `U_Name` varchar(25) NOT NULL COMMENT '姓名,账号隶属人',
  `U_Account` varchar(50) NOT NULL COMMENT 'dss账号',
  `U_Password` varchar(50) NOT NULL COMMENT '密码',
  `U_PasswordMD5` varchar(100) NOT NULL COMMENT '加密密码',
  `U_Token` varchar(100) NOT NULL,
  `U_IsAdmin` tinyint(2) NOT NULL DEFAULT '0' COMMENT '是否管理员',
  `U_IsSimulation` int(11) NOT NULL DEFAULT '1' COMMENT '测试环境账号1=是，2=生产环境，9999=测试账号',
  `U_InductionTime` int(11) NOT NULL COMMENT '入职时间',
  `U_Position` varchar(50) NOT NULL COMMENT '职位',
  `U_Gender` tinyint(2) NOT NULL DEFAULT '0' COMMENT '性别，1=男，2=女',
  `U_CompanyID` int(11) NOT NULL COMMENT '公司ID',
  `U_OperatorID` int(11) NOT NULL COMMENT '运营商ID',
  `U_OperatorName` varchar(64) NOT NULL COMMENT '运营商名称',
  `U_TeamID` int(11) NOT NULL DEFAULT '0' COMMENT '小组ID，默认没有小组ID=0',
  `U_IsDelete` tinyint(2) NOT NULL COMMENT '是否删除',
  `U_CreateTime` int(11) NOT NULL COMMENT '创建时间',
  `U_DeleteTime` int(11) NOT NULL COMMENT '删除时间',
  `U_UpdateTime` int(11) NOT NULL COMMENT '更新时间',
  `U_Guide` tinyint(2) NOT NULL COMMENT '新人引导'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='dss账号信息';

-- --------------------------------------------------------

--
-- 表的结构 `tb_user_call_state`
--

CREATE TABLE `tb_user_call_state` (
  `UCS_ID` int(11) NOT NULL,
  `UCS_UserID` int(11) NOT NULL COMMENT '所属销售',
  `UCS_SuccessCallCount` int(11) NOT NULL COMMENT '有效通话次数',
  `USS_CreateTime` int(11) NOT NULL COMMENT '创建时间',
  `USS_UpdateTime` int(11) NOT NULL COMMENT '更新时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='销售通话统计表';

-- --------------------------------------------------------

--
-- 表的结构 `tb_user_daily_project`
--

CREATE TABLE `tb_user_daily_project` (
  `UDP_ID` int(11) NOT NULL,
  `UDP_UserID` int(11) NOT NULL COMMENT '用户ID',
  `UDP_TaskName` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '产品名字',
  `UDP_CallCount` int(11) NOT NULL COMMENT '外呼总量',
  `UDP_AgreeCount` int(11) NOT NULL COMMENT '客户同意数（成交量）',
  `UDP_SeatSuccessRate` decimal(6,0) NOT NULL COMMENT '坐席成功率',
  `UDP_TimeTotal` int(11) NOT NULL COMMENT '总时长（秒）',
  `UDP_CreateTime` int(11) NOT NULL COMMENT '记录创建时间',
  `UDP_DateTime` int(8) NOT NULL COMMENT '记录创建日期',
  `UDP_UpdateTime` int(11) NOT NULL COMMENT '记录更新时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='每日个人任务数据统计';

-- --------------------------------------------------------

--
-- 表的结构 `tb_user_daily_project_detail`
--

CREATE TABLE `tb_user_daily_project_detail` (
  `UDPD_ID` int(11) NOT NULL,
  `UDPD_UserID` int(11) NOT NULL COMMENT 'DSS用户ID',
  `UDPD_UDPID` int(11) NOT NULL COMMENT '对应user_daily_project表ID',
  `UDPD_CallCount` int(11) NOT NULL COMMENT '外呼总量',
  `UDPD_AgreeCount` int(11) NOT NULL COMMENT '同意客户数（成交量）',
  `UDPD_TimeTotal` int(11) NOT NULL COMMENT '外呼时长',
  `UDPD_Hours` tinyint(2) NOT NULL COMMENT '小时数',
  `UDPD_CreateTime` int(11) NOT NULL,
  `UDPD_UpdateTime` int(11) NOT NULL,
  `UDPD_Source` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '原数据'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户每日任务小时统计表';

-- --------------------------------------------------------

--
-- 表的结构 `tb_user_daily_task_summary`
--

CREATE TABLE `tb_user_daily_task_summary` (
  `UDTS_ID` int(11) NOT NULL,
  `UDTS_UserID` int(11) NOT NULL COMMENT 'dss用户ID',
  `UDTS_Attr` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '其他属性',
  `UDTS_CreateTime` int(11) NOT NULL COMMENT '记录创建时间',
  `UDTS_UpdateTime` int(11) NOT NULL COMMENT '记录更新时间',
  `UDTS_TimeTotal` int(11) NOT NULL COMMENT '外呼时长',
  `UDTS_CallCount` int(11) NOT NULL COMMENT '外呼总量',
  `UDTS_TimetotalStandard` tinyint(1) NOT NULL COMMENT '总外呼时间是否达标1=达标0=不达标',
  `UDTS_SuccessCountStandard` tinyint(1) NOT NULL COMMENT '总成功外呼次数是否达标1=达标，0=不达标'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户每日任务总汇';

-- --------------------------------------------------------

--
-- 表的结构 `tb_user_login_info`
--

CREATE TABLE `tb_user_login_info` (
  `ULI_ID` int(11) NOT NULL,
  `ULI_UserID` int(11) NOT NULL,
  `ULI_LoginStatus` enum('1','0') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT '是否在线1=在线，0=不在线',
  `ULI_FirstLoginTime` int(11) NOT NULL,
  `ULI_LoginTime` int(11) NOT NULL,
  `ULI_LogoutTime` int(11) NOT NULL,
  `ULI_CreateTime` int(11) NOT NULL,
  `ULI_LastUpdateTime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户日登录信息表';

-- --------------------------------------------------------

--
-- 表的结构 `tb_user_outbound`
--

CREATE TABLE `tb_user_outbound` (
  `UO_ID` int(11) NOT NULL,
  `UO_OutboundSalesID` varchar(50) NOT NULL COMMENT '外呼员工ID',
  `UO_IP` text NOT NULL COMMENT '外呼平台域名',
  `UO_DssUserID` int(11) NOT NULL COMMENT '对应dss_user',
  `UO_Name` varchar(50) NOT NULL COMMENT '外呼员工姓名',
  `UO_AvatarUrl` text NOT NULL COMMENT '头像URL',
  `UO_IsDelete` tinyint(2) NOT NULL COMMENT '是否删除',
  `UO_CreateTime` int(11) NOT NULL COMMENT '创建时间',
  `UO_DeleteTime` int(11) NOT NULL COMMENT '删除时间',
  `UO_UpdateTime` int(11) NOT NULL COMMENT '更新时间',
  `UO_Source` text NOT NULL COMMENT '源数据'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='外呼员工信息表';

-- --------------------------------------------------------

--
-- 表的结构 `tb_user_platform_account`
--

CREATE TABLE `tb_user_platform_account` (
  `UPA_ID` int(11) NOT NULL,
  `UPA_UserID` int(11) NOT NULL COMMENT '对应User表',
  `UPA_Account` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '平台账号',
  `UPA_Password` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'MD5密码',
  `UPA_Status` tinyint(1) NOT NULL COMMENT '启用状态，1=启用，2=关闭',
  `UPA_CompanyID` int(11) NOT NULL COMMENT '对应company表',
  `UPA_OperatorID` int(11) NOT NULL COMMENT '对应operatorID表',
  `UPA_Delete` tinyint(1) NOT NULL COMMENT '1=删除',
  `UPA_DeleteTime` int(11) NOT NULL,
  `UPA_CreateTime` int(11) NOT NULL,
  `UPA_UpdateTime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `tb_user_project`
--

CREATE TABLE `tb_user_project` (
  `UP_ID` int(11) NOT NULL,
  `UP_OutboundUserID` int(11) NOT NULL COMMENT '对应outbound_user员工ID',
  `UP_ProjectName` varchar(255) NOT NULL COMMENT '任务名称',
  `UP_CallType` tinyint(2) NOT NULL COMMENT '外呼方式：1=预测试',
  `UP_Account` varchar(50) NOT NULL COMMENT '坐席账号',
  `UP_TotalCall` int(11) NOT NULL COMMENT '总呼次数',
  `UP_TotalTime` int(11) NOT NULL COMMENT '总呼时长',
  `UP_Source` text NOT NULL COMMENT '源数据',
  `UP_IsDelete` tinyint(2) NOT NULL COMMENT '是否删除',
  `UP_CreateTime` int(11) NOT NULL COMMENT '创建时间',
  `UP_DeleteTime` int(11) NOT NULL COMMENT '删除时间',
  `UP_UpdateTime` int(11) NOT NULL COMMENT '更新时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='外呼员工项目详情';

-- --------------------------------------------------------

--
-- 表的结构 `tb_user_suggest`
--

CREATE TABLE `tb_user_suggest` (
  `US_ID` int(11) NOT NULL,
  `US_UserID` int(11) NOT NULL COMMENT '对应dss_user表id',
  `US_SuggestID` int(11) NOT NULL COMMENT '对应dss_suggest表id',
  `US_Content` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '修改建议内容',
  `US_SuggestSource` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '数据源',
  `US_CreateTime` int(11) NOT NULL,
  `US_UpdateTime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `tb_user_team`
--

CREATE TABLE `tb_user_team` (
  `UT_ID` int(11) NOT NULL COMMENT '主键',
  `UT_CompanyID` int(11) NOT NULL COMMENT '公司ID',
  `UT_Name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '小组名称',
  `TU_UserID` int(11) NOT NULL COMMENT '用户ID',
  `UT_LeaderID` int(11) NOT NULL COMMENT '负责人ID，对应user表ID',
  `UT_ParentID` int(11) NOT NULL DEFAULT '0' COMMENT '父级ID',
  `UT_Status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '小组状态（0=正常，1=停用）',
  `UT_IsDelete` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除（0=未删除，1=删除）',
  `UT_CreateTime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='销售小组表';

-- --------------------------------------------------------

--
-- 表的结构 `tb_user_team_list`
--

CREATE TABLE `tb_user_team_list` (
  `UTL_ID` int(11) NOT NULL,
  `UTL_CompanyID` int(11) NOT NULL COMMENT '公司ID',
  `UTL_Name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '小组名字',
  `UTL_LeaderID` int(11) NOT NULL COMMENT '组长ID',
  `UTL_UserNum` int(11) NOT NULL,
  `UTL_Status` int(11) NOT NULL DEFAULT '0' COMMENT '1=删除',
  `UTL_CreateTime` int(11) NOT NULL,
  `UTL_LastUpdateTime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `tb_user_train_case`
--

CREATE TABLE `tb_user_train_case` (
  `UTC_ID` int(11) NOT NULL COMMENT '记录ID',
  `UTC_UserTrainTaskID` int(11) NOT NULL COMMENT '培训任务ID',
  `UTC_UserTrainRecordID` int(11) NOT NULL COMMENT '培训记录ID',
  `UTC_SequenceSort` int(11) NOT NULL COMMENT '序列排序',
  `UTC_CaseKey` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '培训案例CaseKey',
  `UTC_CurrentSalesSpeakID` int(11) NOT NULL COMMENT '当前销售发言ID',
  `UTC_CurrentUserSpeakID` int(11) NOT NULL COMMENT '当前客户发言ID',
  `UTC_CurrentSort` int(11) NOT NULL COMMENT '当前发言排序',
  `UTC_Status` int(11) NOT NULL COMMENT '案例状态：0正常结束；1生效；2 ASD结束；3 人工中断结束',
  `UTC_IsSuccess` int(11) NOT NULL COMMENT '是否成功案例：0失败；1成功',
  `UTC_CreateTime` int(11) NOT NULL COMMENT '创建时间',
  `UTC_CloseTime` int(11) NOT NULL COMMENT '结束时间',
  `UTC_LastUpdateTime` int(11) NOT NULL COMMENT '上次更新时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `tb_user_train_record`
--

CREATE TABLE `tb_user_train_record` (
  `UTR_ID` int(11) NOT NULL COMMENT '培训记录ID',
  `UTR_UserID` int(11) NOT NULL COMMENT '培训销售ID',
  `UTR_UserTrainTaskID` int(11) NOT NULL COMMENT '培训任务ID',
  `UTR_CurrentSequenceSort` int(11) NOT NULL COMMENT '当前序列位置',
  `UTR_CurrentCaseKey` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '当前培训案例键值',
  `UTR_CaseNum` int(11) NOT NULL COMMENT '培训案例数量',
  `UTR_SuccessCaseNum` int(11) NOT NULL COMMENT '成功案例数',
  `UTR_ASDSuccessCaseNum` int(11) NOT NULL COMMENT 'ASD成功案例数',
  `UTR_PassCaseNum` int(11) NOT NULL COMMENT '培训通过案例数量',
  `UTR_FinishCaseNum` int(11) NOT NULL COMMENT '提交案例数',
  `UTR_TestCaseNum` int(11) NOT NULL COMMENT '培训过的案例数',
  `UTR_Status` int(11) NOT NULL COMMENT '培训状态：0：已完成；1：未完成',
  `UTR_Score` int(11) NOT NULL COMMENT '培训评分',
  `UTR_CreateTime` int(11) NOT NULL COMMENT '创建时间',
  `UTR_LastUpdateTime` int(11) NOT NULL COMMENT '最后更新时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `tb_user_train_sequence`
--

CREATE TABLE `tb_user_train_sequence` (
  `UTS_ID` int(11) NOT NULL,
  `UTS_TrainTaskID` int(11) DEFAULT NULL,
  `UTS_CaseKey` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UTS_IsSuccess` int(11) NOT NULL COMMENT '是否成功：0失败；1成功',
  `UTS_Sort` int(11) NOT NULL COMMENT '案例在序列中的排序',
  `UTS_CreateTime` int(11) NOT NULL COMMENT '创建时间',
  `UTS_LastUpdateTime` int(11) NOT NULL COMMENT '最后更新时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- 表的结构 `tb_user_train_speak`
--

CREATE TABLE `tb_user_train_speak` (
  `UTS_ID` int(11) NOT NULL COMMENT '培训中的销售发言',
  `UTS_UserTrainCaseID` int(11) NOT NULL COMMENT '培训中的案例ID：tb_user_train_case',
  `UTS_Sort` int(11) NOT NULL COMMENT '在案例中的顺序',
  `UTS_SalesText` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '销售发言',
  `UTS_MatchPointSet` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '命中的元素',
  `UTS_LastUpdateTime` int(11) NOT NULL COMMENT '最后更新时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `tb_user_train_task`
--

CREATE TABLE `tb_user_train_task` (
  `UTT_ID` int(11) NOT NULL COMMENT '主键ID',
  `UTT_UserID` int(11) NOT NULL COMMENT '销售ID',
  `UTT_CompanyID` int(11) NOT NULL COMMENT '公司ID',
  `UTT_OperatorID` int(11) NOT NULL COMMENT '运营商ID',
  `UTT_CompanyName` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '公司名称',
  `UTT_OperatorName` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '运营商名称',
  `UTT_TaskName` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '任务名称',
  `UTT_TrainContent` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '培训内容',
  `UTT_TrainLevel` int(11) NOT NULL COMMENT '培训难度等级',
  `UTT_CaseNum` int(11) NOT NULL COMMENT '培训案例数',
  `UTT_FailCaseRatio` decimal(10,2) NOT NULL COMMENT '失败案例比例',
  `UTT_FailCaseNum` int(11) NOT NULL COMMENT '失败培训案例数',
  `UTT_SuccessCaseNum` int(11) NOT NULL COMMENT '成功培训案例数',
  `UTT_TrainUserState` int(11) NOT NULL COMMENT '培训对应客户状态',
  `UTT_TrainBqNum` int(11) NOT NULL COMMENT '培训对应Bq数量',
  `UTT_TrainBqContent` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '培训对应Bq内容',
  `UTT_TrainTaskStatus` int(11) NOT NULL COMMENT '培训任务状态：0等待完成任务，1 完成任务',
  `UTT_WeekStart` int(11) NOT NULL COMMENT '培训任务对应周期开始日期',
  `UTT_WeekEnd` int(11) NOT NULL COMMENT '培训任务对应周期结束日期',
  `UTT_CreateTime` int(11) NOT NULL,
  `UTT_LastUpdateTime` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 转储表的索引
--

--
-- 表的索引 `tb_user`
--
ALTER TABLE `tb_user`
  ADD PRIMARY KEY (`U_ID`),
  ADD UNIQUE KEY `DU_Account` (`U_Account`) USING BTREE;

--
-- 表的索引 `tb_user_call_state`
--
ALTER TABLE `tb_user_call_state`
  ADD PRIMARY KEY (`UCS_ID`);

--
-- 表的索引 `tb_user_daily_project`
--
ALTER TABLE `tb_user_daily_project`
  ADD PRIMARY KEY (`UDP_ID`),
  ADD KEY `UDP_DateTime` (`UDP_DateTime`),
  ADD KEY `UDP_UserID` (`UDP_UserID`,`UDP_TaskName`(191),`UDP_DateTime`);

--
-- 表的索引 `tb_user_daily_project_detail`
--
ALTER TABLE `tb_user_daily_project_detail`
  ADD PRIMARY KEY (`UDPD_ID`),
  ADD KEY `UDPD_UDPID` (`UDPD_UDPID`),
  ADD KEY `UDPD_UserID` (`UDPD_UserID`,`UDPD_Hours`,`UDPD_CreateTime`);

--
-- 表的索引 `tb_user_daily_task_summary`
--
ALTER TABLE `tb_user_daily_task_summary`
  ADD PRIMARY KEY (`UDTS_ID`);

--
-- 表的索引 `tb_user_login_info`
--
ALTER TABLE `tb_user_login_info`
  ADD PRIMARY KEY (`ULI_ID`);

--
-- 表的索引 `tb_user_outbound`
--
ALTER TABLE `tb_user_outbound`
  ADD PRIMARY KEY (`UO_ID`),
  ADD KEY `OU_OutboundSalesID` (`UO_OutboundSalesID`);

--
-- 表的索引 `tb_user_platform_account`
--
ALTER TABLE `tb_user_platform_account`
  ADD PRIMARY KEY (`UPA_ID`),
  ADD KEY `unique` (`UPA_Account`,`UPA_CompanyID`,`UPA_OperatorID`);

--
-- 表的索引 `tb_user_project`
--
ALTER TABLE `tb_user_project`
  ADD PRIMARY KEY (`UP_ID`),
  ADD KEY `UP_OutboundUserID` (`UP_OutboundUserID`);

--
-- 表的索引 `tb_user_suggest`
--
ALTER TABLE `tb_user_suggest`
  ADD PRIMARY KEY (`US_ID`),
  ADD KEY `US_SuggestID` (`US_SuggestID`),
  ADD KEY `US_UserID` (`US_UserID`,`US_SuggestID`) USING BTREE;

--
-- 表的索引 `tb_user_team`
--
ALTER TABLE `tb_user_team`
  ADD PRIMARY KEY (`UT_ID`),
  ADD KEY `UT_CompanyID` (`UT_CompanyID`,`UT_Name`) USING BTREE;

--
-- 表的索引 `tb_user_team_list`
--
ALTER TABLE `tb_user_team_list`
  ADD PRIMARY KEY (`UTL_ID`),
  ADD UNIQUE KEY `unqiue` (`UTL_CompanyID`,`UTL_Name`);

--
-- 表的索引 `tb_user_train_case`
--
ALTER TABLE `tb_user_train_case`
  ADD PRIMARY KEY (`UTC_ID`);

--
-- 表的索引 `tb_user_train_record`
--
ALTER TABLE `tb_user_train_record`
  ADD PRIMARY KEY (`UTR_ID`);

--
-- 表的索引 `tb_user_train_sequence`
--
ALTER TABLE `tb_user_train_sequence`
  ADD PRIMARY KEY (`UTS_ID`) USING BTREE;

--
-- 表的索引 `tb_user_train_speak`
--
ALTER TABLE `tb_user_train_speak`
  ADD PRIMARY KEY (`UTS_ID`);

--
-- 表的索引 `tb_user_train_task`
--
ALTER TABLE `tb_user_train_task`
  ADD PRIMARY KEY (`UTT_ID`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `tb_user`
--
ALTER TABLE `tb_user`
  MODIFY `U_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户ID';

--
-- 使用表AUTO_INCREMENT `tb_user_call_state`
--
ALTER TABLE `tb_user_call_state`
  MODIFY `UCS_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `tb_user_daily_project`
--
ALTER TABLE `tb_user_daily_project`
  MODIFY `UDP_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `tb_user_daily_project_detail`
--
ALTER TABLE `tb_user_daily_project_detail`
  MODIFY `UDPD_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `tb_user_daily_task_summary`
--
ALTER TABLE `tb_user_daily_task_summary`
  MODIFY `UDTS_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `tb_user_login_info`
--
ALTER TABLE `tb_user_login_info`
  MODIFY `ULI_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `tb_user_outbound`
--
ALTER TABLE `tb_user_outbound`
  MODIFY `UO_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `tb_user_platform_account`
--
ALTER TABLE `tb_user_platform_account`
  MODIFY `UPA_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `tb_user_project`
--
ALTER TABLE `tb_user_project`
  MODIFY `UP_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `tb_user_suggest`
--
ALTER TABLE `tb_user_suggest`
  MODIFY `US_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `tb_user_team`
--
ALTER TABLE `tb_user_team`
  MODIFY `UT_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键';

--
-- 使用表AUTO_INCREMENT `tb_user_team_list`
--
ALTER TABLE `tb_user_team_list`
  MODIFY `UTL_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `tb_user_train_case`
--
ALTER TABLE `tb_user_train_case`
  MODIFY `UTC_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '记录ID';

--
-- 使用表AUTO_INCREMENT `tb_user_train_record`
--
ALTER TABLE `tb_user_train_record`
  MODIFY `UTR_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '培训记录ID';

--
-- 使用表AUTO_INCREMENT `tb_user_train_sequence`
--
ALTER TABLE `tb_user_train_sequence`
  MODIFY `UTS_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `tb_user_train_speak`
--
ALTER TABLE `tb_user_train_speak`
  MODIFY `UTS_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '培训中的销售发言';

--
-- 使用表AUTO_INCREMENT `tb_user_train_task`
--
ALTER TABLE `tb_user_train_task`
  MODIFY `UTT_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID';
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
