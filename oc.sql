-- phpMyAdmin SQL Dump
-- version 4.5.3.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: 2016-04-14 08:32:22
-- 服务器版本： 5.7.10-log
-- PHP Version: 5.6.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `oc`
--

-- --------------------------------------------------------

--
-- 表的结构 `ocenter_action`
--

CREATE TABLE `ocenter_action` (
  `id` int(11) UNSIGNED NOT NULL COMMENT '主键',
  `name` char(30) NOT NULL DEFAULT '' COMMENT '行为唯一标识',
  `title` char(80) NOT NULL DEFAULT '' COMMENT '行为说明',
  `remark` char(140) NOT NULL DEFAULT '' COMMENT '行为描述',
  `rule` text NOT NULL COMMENT '行为规则',
  `log` text NOT NULL COMMENT '日志规则',
  `type` tinyint(2) UNSIGNED NOT NULL DEFAULT '1' COMMENT '类型',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态',
  `update_time` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '修改时间',
  `module` varchar(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='系统行为表' ROW_FORMAT=DYNAMIC;

--
-- 转存表中的数据 `ocenter_action`
--

INSERT INTO `ocenter_action` (`id`, `name`, `title`, `remark`, `rule`, `log`, `type`, `status`, `update_time`, `module`) VALUES
(1, 'reg', '用户注册', '用户注册', '', '', 1, 1, 1426070545, ''),
(2, 'input_password', '输入密码', '记录输入密码的次数。', '', '', 1, 1, 1426122119, ''),
(3, 'user_login', '用户登录', '积分+10，每天一次', 'a:1:{i:0;a:5:{s:5:"table";s:6:"member";s:5:"field";s:1:"1";s:4:"rule";s:2:"10";s:5:"cycle";s:2:"24";s:3:"max";s:1:"1";}}', '[user|get_nickname]在[time|time_format]登录了账号', 1, 1, 1428397656, ''),
(4, 'update_config', '更新配置', '新增或修改或删除配置', '', '', 1, 1, 1383294988, ''),
(7, 'update_channel', '更新导航', '新增或修改或删除导航', '', '', 1, 1, 1383296301, ''),
(8, 'update_menu', '更新菜单', '新增或修改或删除菜单', '', '', 1, 1, 1383296392, ''),
(10007, 'add_event', '编辑活动', '用户发布、编辑活动', 'N;', '', 2, 1, 1428479582, 'Event'),
(10006, 'event_do_sign', '报名活动', '活动报名', '', '', 2, 1, 1432088916, 'Event');

-- --------------------------------------------------------

--
-- 表的结构 `ocenter_action_limit`
--

CREATE TABLE `ocenter_action_limit` (
  `id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `name` varchar(50) NOT NULL,
  `frequency` int(11) NOT NULL,
  `time_number` int(11) NOT NULL,
  `time_unit` varchar(50) NOT NULL,
  `punish` text NOT NULL,
  `if_message` tinyint(4) NOT NULL,
  `message_content` text NOT NULL,
  `action_list` text NOT NULL,
  `status` tinyint(4) NOT NULL,
  `create_time` int(11) NOT NULL,
  `module` varchar(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `ocenter_action_limit`
--

INSERT INTO `ocenter_action_limit` (`id`, `title`, `name`, `frequency`, `time_number`, `time_unit`, `punish`, `if_message`, `message_content`, `action_list`, `status`, `create_time`, `module`) VALUES
(1, 'reg', '注册限制', 1, 1, 'minute', 'warning', 0, '', '[reg]', 1, 0, ''),
(2, 'input_password', '输密码', 3, 1, 'minute', 'warning', 0, '', '[input_password]', 1, 0, ''),
(10, 'add_event', '编辑活动', 1, 1, 'minute', 'warning', 1, '操作太频繁！', '[add_event]', 1, 0, 'Event'),
(9, 'event_do_sign', '报名活动', 1, 1, 'minute', 'warning', 1, '操作太频繁！', '[event_do_sign]', 1, 0, 'Event');

-- --------------------------------------------------------

--
-- 表的结构 `ocenter_action_log`
--

CREATE TABLE `ocenter_action_log` (
  `id` int(10) UNSIGNED NOT NULL COMMENT '主键',
  `action_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '行为id',
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '执行用户id',
  `action_ip` bigint(20) NOT NULL COMMENT '执行行为者ip',
  `model` varchar(50) NOT NULL DEFAULT '' COMMENT '触发行为的表',
  `record_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0' COMMENT '触发行为的数据id',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '日志备注',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态',
  `create_time` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '执行行为的时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='行为日志表' ROW_FORMAT=FIXED;

--
-- 转存表中的数据 `ocenter_action_log`
--

INSERT INTO `ocenter_action_log` (`id`, `action_id`, `user_id`, `action_ip`, `model`, `record_id`, `remark`, `status`, `create_time`) VALUES
(1, 3, 1, 0, 'member', 1, 'admin在2016-03-03 14:32登录了账号【积分：+10分】', 1, 1456986739),
(2, 10005, 1, 0, 'event', 9, '操作url：/oc/index.php?s=/event/index/dopost.html', 1, 1456991205),
(3, 3, 1, 0, 'member', 1, 'admin在2016-03-10 14:21登录了账号【积分：+10分】', 1, 1457590868),
(4, 10007, 1, 0, 'event', 9, '操作url：/oc/index.php?s=/event/index/dopost.html', 1, 1457598147),
(5, 1, 1, 0, 'ucenter_member', 1, '操作url：/oc/index.php?s=/ucenter/member/register.html', 1, 1457598215),
(6, 3, 100, 0, 'member', 100, 'sdfdf在2016-03-10 16:23登录了账号【积分：+10分】', 1, 1457598216),
(7, 10006, 100, 0, 'event', 9, '操作url：/oc/index.php?s=/event/index/dosign.html', 1, 1457598456),
(8, 3, 1, 0, 'member', 1, 'admin在2016-03-17 14:47登录了账号【积分：+10分】', 1, 1458197246),
(9, 3, 1, 0, 'member', 1, 'admin在2016-03-24 14:34登录了账号【积分：+10分】', 1, 1458801294),
(10, 3, 1, 2130706433, 'member', 1, 'admin在2016-03-30 17:07登录了账号【积分：+10分】', 1, 1459328845),
(11, 10007, 1, 2130706433, 'event', 10, '操作url：/oc/index.php?s=/event/index/dopost.html', 1, 1459329847),
(12, 3, 1, 0, 'member', 1, 'admin在2016-03-31 14:08登录了账号', 1, 1459404531),
(13, 3, 1, 0, 'member', 1, 'admin在2016-03-31 14:54登录了账号', 1, 1459407295),
(14, 3, 1, 0, 'member', 1, 'admin在2016-03-31 15:00登录了账号', 1, 1459407656),
(15, 3, 1, 0, 'member', 1, 'admin在2016-03-31 15:18登录了账号', 1, 1459408719),
(16, 1, 1, 0, 'ucenter_member', 1, '操作url：/oc/index.php?s=/ucenter/member/register.html', 1, 1459408831),
(17, 3, 101, 0, 'member', 101, 's1在2016-03-31 15:20登录了账号【积分：+10分】', 1, 1459408831),
(18, 1, 1, 0, 'ucenter_member', 1, '操作url：/oc/index.php?s=/ucenter/member/register.html', 1, 1459408907),
(19, 3, 102, 0, 'member', 102, 't1在2016-03-31 15:21登录了账号【积分：+10分】', 1, 1459408907),
(20, 3, 1, 0, 'member', 1, 'admin在2016-03-31 15:22登录了账号', 1, 1459408964),
(21, 3, 1, 2130706433, 'member', 1, 'admin在2016-04-02 19:13登录了账号【积分：+10分】', 1, 1459595586),
(22, 3, 1, 2130706433, 'member', 1, 'admin在2016-04-02 19:44登录了账号', 1, 1459597481),
(23, 3, 101, 2130706433, 'member', 101, 's1在2016-04-02 19:49登录了账号【积分：+10分】', 1, 1459597746),
(24, 3, 102, 2130706433, 'member', 102, 't1在2016-04-02 19:49登录了账号【积分：+10分】', 1, 1459597771),
(25, 2, 101, 2130706433, 'ucenter_member', 101, '操作url：/oc/index.php?s=/admin/public/login.html', 1, 1459597787),
(26, 3, 1, 2130706433, 'member', 1, 'admin在2016-04-02 19:50登录了账号', 1, 1459597848),
(27, 3, 101, 2130706433, 'member', 101, 's1在2016-04-02 19:51登录了账号', 1, 1459597868),
(28, 2, 101, 2130706433, 'ucenter_member', 101, '操作url：/oc/index.php?s=/ucenter/member/login.html', 1, 1459597899),
(29, 2, 101, 2130706433, 'ucenter_member', 101, '操作url：/oc/index.php?s=/ucenter/member/login.html', 1, 1459597900),
(30, 3, 101, 2130706433, 'member', 101, 's1在2016-04-02 20:01登录了账号', 1, 1459598514),
(31, 3, 101, 2130706433, 'member', 101, 's1在2016-04-02 20:08登录了账号', 1, 1459598906),
(32, 3, 1, 2130706433, 'member', 1, 'admin在2016-04-02 20:08登录了账号', 1, 1459598938),
(33, 3, 102, 2130706433, 'member', 102, 't1在2016-04-02 20:10登录了账号', 1, 1459599052),
(34, 1, 1, 2130706433, 'ucenter_member', 1, '操作url：/oc/index.php?s=/ucenter/member/register.html', 1, 1459940192),
(35, 3, 103, 2130706433, 'member', 103, 't2在2016-04-06 18:56登录了账号【积分：+10分】', 1, 1459940192),
(36, 1, 1, 2130706433, 'ucenter_member', 1, '操作url：/oc/index.php?s=/ucenter/member/register.html', 1, 1459940256),
(37, 3, 104, 2130706433, 'member', 104, 't3在2016-04-06 18:57登录了账号【积分：+10分】', 1, 1459940257),
(38, 3, 103, 2130706433, 'member', 103, 't2在2016-04-06 19:10登录了账号', 1, 1459941046),
(39, 3, 1, 2130706433, 'member', 1, 'admin在2016-04-06 19:11登录了账号【积分：+10分】', 1, 1459941079),
(40, 3, 103, 2130706433, 'member', 103, 't2在2016-04-06 19:23登录了账号', 1, 1459941793),
(41, 3, 104, 2130706433, 'member', 104, 't3在2016-04-06 19:23登录了账号', 1, 1459941818),
(42, 3, 103, 2130706433, 'member', 103, 't2在2016-04-07 17:34登录了账号', 1, 1460021666),
(43, 3, 1, 2130706433, 'member', 1, 'admin在2016-04-10 19:42登录了账号【积分：+10分】', 1, 1460288546),
(44, 3, 103, 2130706433, 'member', 103, 't2在2016-04-10 19:42登录了账号【积分：+10分】', 1, 1460288578),
(45, 3, 1, 2130706433, 'member', 1, 'admin在2016-03-31 20:20登录了账号', 1, 1459426854),
(46, 3, 103, 2130706433, 'member', 103, 't2在2016-03-31 20:21登录了账号', 1, 1459426886),
(47, 3, 103, 2130706433, 'member', 103, 't2在2016-03-31 20:21登录了账号', 1, 1459426887);

-- --------------------------------------------------------

--
-- 表的结构 `ocenter_addons`
--

CREATE TABLE `ocenter_addons` (
  `id` int(10) UNSIGNED NOT NULL COMMENT '主键',
  `name` varchar(40) NOT NULL COMMENT '插件名或标识',
  `title` varchar(20) NOT NULL DEFAULT '' COMMENT '中文名',
  `description` text COMMENT '插件描述',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态',
  `config` text COMMENT '配置',
  `author` varchar(40) DEFAULT '' COMMENT '作者',
  `version` varchar(20) DEFAULT '' COMMENT '版本号',
  `create_time` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '安装时间',
  `has_adminlist` tinyint(1) UNSIGNED NOT NULL DEFAULT '0' COMMENT '是否有后台列表'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='插件表';

--
-- 转存表中的数据 `ocenter_addons`
--

INSERT INTO `ocenter_addons` (`id`, `name`, `title`, `description`, `status`, `config`, `author`, `version`, `create_time`, `has_adminlist`) VALUES
(1, 'CheckIn', '签到', '签到插件', 1, '{"random":"1"}', 'xjw129xjt(肖骏涛)', '0.1', 1432791968, 0),
(2, 'Support', '赞', '赞的功能', 1, 'null', '嘉兴想天信息科技有限公司', '0.1', 1432792013, 0),
(3, 'SuperLinks', '合作单位', '合作单位', 1, '{"random":"1"}', '苏南 newsn.net', '0.1', 1432792019, 1),
(4, 'Report', '举报后台', '可举报不法数据', 1, '{"meta":""}', '想天科技xuminwei', '0.1', 1432792026, 1),
(5, 'LocalComment', '本地评论', '本地评论插件，不依赖社会化评论平台', 1, '{"can_guest_comment":"0"}', 'caipeichao', '0.1', 1432792035, 0),
(9, 'ChinaCity', '中国省市区三级联动', '每个系统都需要的一个中国省市区三级联动插件。想天-駿濤修改，将镇级地区移除', 1, 'null', 'i友街', '2.0', 1456992353, 0),
(7, 'Recommend', '推荐关注', '可选择多种方法推荐用户', 1, '{"howToRecommend":"1","howManyRecommend":"1","recommendUser":"1"}', '嘉兴想天信息科技有限公司', '0.1', 1432792055, 1),
(8, 'SyncLogin', '同步登陆', '同步登陆', 1, '{"type":null,"meta":"","bind":"0","QqKEY":"","QqSecret":"","SinaKEY":"","SinaSecret":"","WeixinKEY":"","WeixinSecret":""}', 'xjw129xjt', '0.1', 1432792112, 0);

-- --------------------------------------------------------

--
-- 表的结构 `ocenter_adv`
--

CREATE TABLE `ocenter_adv` (
  `id` int(11) UNSIGNED NOT NULL COMMENT '主键',
  `title` char(80) NOT NULL DEFAULT '' COMMENT '广告名称',
  `pos_id` int(11) NOT NULL COMMENT '广告位置',
  `data` text NOT NULL COMMENT '图片地址',
  `click_count` int(11) NOT NULL COMMENT '点击量',
  `url` varchar(500) NOT NULL COMMENT '链接地址',
  `sort` int(3) UNSIGNED NOT NULL DEFAULT '0' COMMENT '排序',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态（0：禁用，1：正常）',
  `create_time` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '开始时间',
  `start_time` int(11) DEFAULT NULL,
  `end_time` int(11) UNSIGNED DEFAULT '0' COMMENT '结束时间',
  `target` varchar(20) DEFAULT '_blank'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='广告表' ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- 表的结构 `ocenter_adv_pos`
--

CREATE TABLE `ocenter_adv_pos` (
  `id` int(11) UNSIGNED NOT NULL COMMENT '主键',
  `name` varchar(50) NOT NULL,
  `title` char(80) NOT NULL DEFAULT '' COMMENT '广告位置名称',
  `path` varchar(100) NOT NULL COMMENT '所在路径 模块/控制器/方法',
  `type` int(11) UNSIGNED NOT NULL DEFAULT '1' COMMENT '广告位类型 \r\n1.单图\r\n2.多图\r\n3.文字链接\r\n4.代码',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态（0：禁用，1：正常）',
  `data` varchar(500) NOT NULL COMMENT '额外的数据',
  `width` char(20) NOT NULL DEFAULT '' COMMENT '广告位置宽度',
  `height` char(20) NOT NULL DEFAULT '' COMMENT '广告位置高度',
  `margin` varchar(50) NOT NULL COMMENT '边缘',
  `padding` varchar(50) NOT NULL COMMENT '留白',
  `theme` varchar(50) NOT NULL DEFAULT 'all' COMMENT '适用主题，默认为all，通用'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='广告位置表' ROW_FORMAT=DYNAMIC;

--
-- 转存表中的数据 `ocenter_adv_pos`
--

INSERT INTO `ocenter_adv_pos` (`id`, `name`, `title`, `path`, `type`, `status`, `data`, `width`, `height`, `margin`, `padding`, `theme`) VALUES
(1, 'slider', '首页轮播图', 'Home/Index/home', 2, 1, '{"style":1}', '1120px', '300px', '0 0 15px 0', '', 'all');

-- --------------------------------------------------------

--
-- 表的结构 `ocenter_appraise`
--

CREATE TABLE `ocenter_appraise` (
  `id` int(11) NOT NULL,
  `studentId` int(11) NOT NULL COMMENT '学生用户Id',
  `teacherId` int(11) NOT NULL COMMENT '教师用户Id',
  `sessionId` int(11) NOT NULL COMMENT '评价时段Id',
  `point` tinyint(4) NOT NULL COMMENT '评价分数',
  `content` varchar(255) NOT NULL COMMENT '评价内容',
  `anonymous` tinyint(4) NOT NULL COMMENT '匿名评价,0不匿名,1匿名',
  `createTime` int(11) NOT NULL COMMENT '创建时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `ocenter_appraise`
--

INSERT INTO `ocenter_appraise` (`id`, `studentId`, `teacherId`, `sessionId`, `point`, `content`, `anonymous`, `createTime`) VALUES
(2, 103, 101, 1, 3, '一般', 0, 1459428337);

-- --------------------------------------------------------

--
-- 表的结构 `ocenter_appraise_lesson`
--

CREATE TABLE `ocenter_appraise_lesson` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL COMMENT '课程名称'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `ocenter_appraise_lesson`
--

INSERT INTO `ocenter_appraise_lesson` (`id`, `title`) VALUES
(1, '数据结构'),
(2, 'PHP'),
(3, '数据建模');

-- --------------------------------------------------------

--
-- 表的结构 `ocenter_appraise_session`
--

CREATE TABLE `ocenter_appraise_session` (
  `id` int(11) NOT NULL,
  `lessonId` int(11) NOT NULL COMMENT '课程Id',
  `sTime` int(11) NOT NULL COMMENT '评价开始时间',
  `eTime` int(11) NOT NULL COMMENT '评价结束时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `ocenter_appraise_session`
--

INSERT INTO `ocenter_appraise_session` (`id`, `lessonId`, `sTime`, `eTime`) VALUES
(1, 1, 1459267200, 1459872000),
(2, 2, 1459267200, 1459872000),
(3, 3, 1459267200, 1459872000);

-- --------------------------------------------------------

--
-- 表的结构 `ocenter_appraise_student_lesson`
--

CREATE TABLE `ocenter_appraise_student_lesson` (
  `id` int(11) NOT NULL,
  `uid` int(11) NOT NULL COMMENT '学生用户Id',
  `lessonId` int(11) NOT NULL COMMENT '课程Id'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `ocenter_appraise_student_lesson`
--

INSERT INTO `ocenter_appraise_student_lesson` (`id`, `uid`, `lessonId`) VALUES
(1, 103, 1),
(2, 104, 2),
(3, 3, 3);

-- --------------------------------------------------------

--
-- 表的结构 `ocenter_appraise_teacher_lesson`
--

CREATE TABLE `ocenter_appraise_teacher_lesson` (
  `id` int(11) NOT NULL,
  `uid` int(11) NOT NULL COMMENT '教师用户Id',
  `lessonId` int(11) NOT NULL COMMENT '课程Id'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `ocenter_appraise_teacher_lesson`
--

INSERT INTO `ocenter_appraise_teacher_lesson` (`id`, `uid`, `lessonId`) VALUES
(1, 101, 1),
(2, 102, 2),
(3, 103, 3);

-- --------------------------------------------------------

--
-- 表的结构 `ocenter_attachment`
--

CREATE TABLE `ocenter_attachment` (
  `id` int(10) UNSIGNED NOT NULL,
  `uid` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '用户ID',
  `title` char(30) NOT NULL DEFAULT '' COMMENT '附件显示名',
  `type` tinyint(3) UNSIGNED NOT NULL DEFAULT '0' COMMENT '附件类型',
  `source` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '资源ID',
  `record_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '关联记录ID',
  `download` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '下载次数',
  `size` bigint(20) UNSIGNED NOT NULL DEFAULT '0' COMMENT '附件大小',
  `dir` int(12) UNSIGNED NOT NULL DEFAULT '0' COMMENT '上级目录ID',
  `sort` int(8) UNSIGNED NOT NULL DEFAULT '0' COMMENT '排序',
  `create_time` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='附件表';

-- --------------------------------------------------------

--
-- 表的结构 `ocenter_auth_extend`
--

CREATE TABLE `ocenter_auth_extend` (
  `group_id` mediumint(10) UNSIGNED NOT NULL COMMENT '用户id',
  `extend_id` mediumint(8) UNSIGNED NOT NULL COMMENT '扩展表中数据的id',
  `type` tinyint(1) UNSIGNED NOT NULL COMMENT '扩展类型标识 1:栏目分类权限;2:模型权限'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户组与分类的对应关系表';

--
-- 转存表中的数据 `ocenter_auth_extend`
--

INSERT INTO `ocenter_auth_extend` (`group_id`, `extend_id`, `type`) VALUES
(1, 1, 1),
(1, 1, 2),
(1, 2, 1),
(1, 2, 2),
(1, 3, 1),
(1, 3, 2),
(1, 4, 1),
(1, 37, 1);

-- --------------------------------------------------------

--
-- 表的结构 `ocenter_auth_group`
--

CREATE TABLE `ocenter_auth_group` (
  `id` mediumint(8) UNSIGNED NOT NULL COMMENT '用户组id,自增主键',
  `module` varchar(20) NOT NULL COMMENT '用户组所属模块',
  `type` tinyint(4) NOT NULL COMMENT '组类型',
  `title` char(20) NOT NULL DEFAULT '' COMMENT '用户组中文名称',
  `description` varchar(80) NOT NULL DEFAULT '' COMMENT '描述信息',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '用户组状态：为1正常，为0禁用,-1为删除',
  `rules` text NOT NULL COMMENT '用户组拥有的规则id，多个规则 , 隔开'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `ocenter_auth_group`
--

INSERT INTO `ocenter_auth_group` (`id`, `module`, `type`, `title`, `description`, `status`, `rules`) VALUES
(1, 'admin', 1, '普通用户', '', 1, ',338,340,341,344,10000,10002,10005,10008,10011,10014,10017,10020,10023'),
(2, 'admin', 1, 'VIP', '', 1, ',338,340,341,344,10000,10002,10005,10008,10011,10014,10017,10020,10023');

-- --------------------------------------------------------

--
-- 表的结构 `ocenter_auth_group_access`
--

CREATE TABLE `ocenter_auth_group_access` (
  `uid` int(10) UNSIGNED NOT NULL COMMENT '用户id',
  `group_id` mediumint(8) UNSIGNED NOT NULL COMMENT '用户组id'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `ocenter_auth_group_access`
--

INSERT INTO `ocenter_auth_group_access` (`uid`, `group_id`) VALUES
(1, 1),
(100, 1);

-- --------------------------------------------------------

--
-- 表的结构 `ocenter_auth_rule`
--

CREATE TABLE `ocenter_auth_rule` (
  `id` mediumint(8) UNSIGNED NOT NULL COMMENT '规则id,自增主键',
  `module` varchar(20) NOT NULL COMMENT '规则所属module',
  `type` tinyint(2) NOT NULL DEFAULT '1' COMMENT '1-url;2-主菜单',
  `name` char(80) NOT NULL DEFAULT '' COMMENT '规则唯一英文标识',
  `title` char(20) NOT NULL DEFAULT '' COMMENT '规则中文描述',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效(0:无效,1:有效)',
  `condition` varchar(300) NOT NULL DEFAULT '' COMMENT '规则附加条件'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `ocenter_auth_rule`
--

INSERT INTO `ocenter_auth_rule` (`id`, `module`, `type`, `name`, `title`, `status`, `condition`) VALUES
(1, 'admin', 2, 'Admin/Index/index', '首页', 1, ''),
(2, 'admin', 2, 'Admin/Article/mydocument', '资讯', -1, ''),
(3, 'admin', 2, 'Admin/User/index', '用户', 1, ''),
(4, 'admin', 2, 'Admin/Addons/index', '插件', -1, ''),
(5, 'admin', 2, 'Admin/Config/group', '系统', 1, ''),
(7, 'admin', 1, 'Admin/article/add', '新增', -1, ''),
(8, 'admin', 1, 'Admin/article/edit', '编辑', -1, ''),
(9, 'admin', 1, 'Admin/article/setStatus', '改变状态', -1, ''),
(10, 'admin', 1, 'Admin/article/update', '保存', -1, ''),
(11, 'admin', 1, 'Admin/article/autoSave', '保存草稿', -1, ''),
(12, 'admin', 1, 'Admin/article/move', '移动', -1, ''),
(13, 'admin', 1, 'Admin/article/copy', '复制', -1, ''),
(14, 'admin', 1, 'Admin/article/paste', '粘贴', -1, ''),
(15, 'admin', 1, 'Admin/article/permit', '还原', -1, ''),
(16, 'admin', 1, 'Admin/article/clear', '清空', -1, ''),
(17, 'admin', 1, 'Admin/article/index', '文档列表', -1, ''),
(18, 'admin', 1, 'Admin/article/recycle', '回收站', -1, ''),
(19, 'admin', 1, 'Admin/User/addaction', '新增用户行为', 1, ''),
(20, 'admin', 1, 'Admin/User/editaction', '编辑用户行为', 1, ''),
(21, 'admin', 1, 'Admin/User/saveAction', '保存用户行为', 1, ''),
(22, 'admin', 1, 'Admin/User/setStatus', '变更行为状态', 1, ''),
(23, 'admin', 1, 'Admin/User/changeStatus?method=forbidUser', '禁用会员', 1, ''),
(24, 'admin', 1, 'Admin/User/changeStatus?method=resumeUser', '启用会员', 1, ''),
(25, 'admin', 1, 'Admin/User/changeStatus?method=deleteUser', '删除会员', 1, ''),
(26, 'admin', 1, 'Admin/User/index', '用户信息', 1, ''),
(27, 'admin', 1, 'Admin/User/action', '用户行为', 1, ''),
(28, 'admin', 1, 'Admin/AuthManager/changeStatus?method=deleteGroup', '删除', 1, ''),
(29, 'admin', 1, 'Admin/AuthManager/changeStatus?method=forbidGroup', '禁用', 1, ''),
(30, 'admin', 1, 'Admin/AuthManager/changeStatus?method=resumeGroup', '恢复', 1, ''),
(31, 'admin', 1, 'Admin/AuthManager/createGroup', '新增', 1, ''),
(32, 'admin', 1, 'Admin/AuthManager/editGroup', '编辑', 1, ''),
(33, 'admin', 1, 'Admin/AuthManager/writeGroup', '保存用户组', 1, ''),
(34, 'admin', 1, 'Admin/AuthManager/group', '授权', 1, ''),
(35, 'admin', 1, 'Admin/AuthManager/access', '访问授权', 1, ''),
(36, 'admin', 1, 'Admin/AuthManager/user', '成员授权', 1, ''),
(37, 'admin', 1, 'Admin/AuthManager/removeFromGroup', '解除授权', 1, ''),
(38, 'admin', 1, 'Admin/AuthManager/addToGroup', '保存成员授权', 1, ''),
(39, 'admin', 1, 'Admin/AuthManager/category', '分类授权', 1, ''),
(40, 'admin', 1, 'Admin/AuthManager/addToCategory', '保存分类授权', 1, ''),
(41, 'admin', 1, 'Admin/AuthManager/index', '权限管理', 1, ''),
(42, 'admin', 1, 'Admin/Addons/create', '创建', 1, ''),
(43, 'admin', 1, 'Admin/Addons/checkForm', '检测创建', 1, ''),
(44, 'admin', 1, 'Admin/Addons/preview', '预览', 1, ''),
(45, 'admin', 1, 'Admin/Addons/build', '快速生成插件', 1, ''),
(46, 'admin', 1, 'Admin/Addons/config', '设置', 1, ''),
(47, 'admin', 1, 'Admin/Addons/disable', '禁用', 1, ''),
(48, 'admin', 1, 'Admin/Addons/enable', '启用', 1, ''),
(49, 'admin', 1, 'Admin/Addons/install', '安装', 1, ''),
(50, 'admin', 1, 'Admin/Addons/uninstall', '卸载', 1, ''),
(51, 'admin', 1, 'Admin/Addons/saveconfig', '更新配置', 1, ''),
(52, 'admin', 1, 'Admin/Addons/adminList', '插件后台列表', 1, ''),
(53, 'admin', 1, 'Admin/Addons/execute', 'URL方式访问插件', 1, ''),
(54, 'admin', 1, 'Admin/Addons/index', '插件管理', 1, ''),
(55, 'admin', 1, 'Admin/Addons/hooks', '钩子管理', 1, ''),
(56, 'admin', 1, 'Admin/model/add', '新增', -1, ''),
(57, 'admin', 1, 'Admin/model/edit', '编辑', -1, ''),
(58, 'admin', 1, 'Admin/model/setStatus', '改变状态', -1, ''),
(59, 'admin', 1, 'Admin/model/update', '保存数据', -1, ''),
(60, 'admin', 1, 'Admin/Model/index', '模型管理', -1, ''),
(61, 'admin', 1, 'Admin/Config/edit', '编辑', 1, ''),
(62, 'admin', 1, 'Admin/Config/del', '删除', 1, ''),
(63, 'admin', 1, 'Admin/Config/add', '新增', 1, ''),
(64, 'admin', 1, 'Admin/Config/save', '保存', 1, ''),
(65, 'admin', 1, 'Admin/Config/group', '网站设置', 1, ''),
(66, 'admin', 1, 'Admin/Config/index', '配置管理', 1, ''),
(67, 'admin', 1, 'Admin/Channel/add', '新增', 1, ''),
(68, 'admin', 1, 'Admin/Channel/edit', '编辑', 1, ''),
(69, 'admin', 1, 'Admin/Channel/del', '删除', 1, ''),
(70, 'admin', 1, 'Admin/Channel/index', '导航管理', 1, ''),
(71, 'admin', 1, 'Admin/Category/edit', '编辑', -1, ''),
(72, 'admin', 1, 'Admin/Category/add', '新增', -1, ''),
(73, 'admin', 1, 'Admin/Category/remove', '删除', -1, ''),
(74, 'admin', 1, 'Admin/Category/index', '分类管理', -1, ''),
(75, 'admin', 1, 'Admin/file/upload', '上传控件', -1, ''),
(76, 'admin', 1, 'Admin/file/uploadPicture', '上传图片', -1, ''),
(77, 'admin', 1, 'Admin/file/download', '下载', -1, ''),
(94, 'admin', 1, 'Admin/AuthManager/modelauth', '模型授权', 1, ''),
(79, 'admin', 1, 'Admin/article/batchOperate', '导入', -1, ''),
(80, 'admin', 1, 'Admin/Database/index?type=export', '备份数据库', 1, ''),
(81, 'admin', 1, 'Admin/Database/index?type=import', '还原数据库', 1, ''),
(82, 'admin', 1, 'Admin/Database/export', '备份', 1, ''),
(83, 'admin', 1, 'Admin/Database/optimize', '优化表', 1, ''),
(84, 'admin', 1, 'Admin/Database/repair', '修复表', 1, ''),
(86, 'admin', 1, 'Admin/Database/import', '恢复', 1, ''),
(87, 'admin', 1, 'Admin/Database/del', '删除', 1, ''),
(88, 'admin', 1, 'Admin/User/add', '新增用户', -1, ''),
(89, 'admin', 1, 'Admin/Attribute/index', '属性管理', -1, ''),
(90, 'admin', 1, 'Admin/Attribute/add', '新增', -1, ''),
(91, 'admin', 1, 'Admin/Attribute/edit', '编辑', -1, ''),
(92, 'admin', 1, 'Admin/Attribute/setStatus', '改变状态', -1, ''),
(93, 'admin', 1, 'Admin/Attribute/update', '保存数据', -1, ''),
(95, 'admin', 1, 'Admin/AuthManager/addToModel', '保存模型授权', 1, ''),
(96, 'admin', 1, 'Admin/Category/move', '移动', -1, ''),
(97, 'admin', 1, 'Admin/Category/merge', '合并', -1, ''),
(98, 'admin', 1, 'Admin/Config/menu', '后台菜单管理', -1, ''),
(99, 'admin', 1, 'Admin/Article/mydocument', '内容', -1, ''),
(100, 'admin', 1, 'Admin/Menu/index', '菜单管理', 1, ''),
(101, 'admin', 1, 'Admin/other', '其他', -1, ''),
(102, 'admin', 1, 'Admin/Menu/add', '新增', 1, ''),
(103, 'admin', 1, 'Admin/Menu/edit', '编辑', 1, ''),
(104, 'admin', 1, 'Admin/Think/lists?model=article', '文章管理', -1, ''),
(105, 'admin', 1, 'Admin/Think/lists?model=download', '下载管理', -1, ''),
(106, 'admin', 1, 'Admin/Think/lists?model=config', '配置管理', -1, ''),
(107, 'admin', 1, 'Admin/Action/actionlog', '行为日志', 1, ''),
(108, 'admin', 1, 'Admin/User/updatePassword', '修改密码', 1, ''),
(109, 'admin', 1, 'Admin/User/updateNickname', '修改昵称', 1, ''),
(110, 'admin', 1, 'Admin/action/edit', '查看行为日志', 1, ''),
(205, 'admin', 1, 'Admin/think/add', '新增数据', -1, ''),
(111, 'admin', 2, 'Admin/article/index', '文档列表', -1, ''),
(112, 'admin', 2, 'Admin/article/add', '新增', -1, ''),
(113, 'admin', 2, 'Admin/article/edit', '编辑', -1, ''),
(114, 'admin', 2, 'Admin/article/setStatus', '改变状态', -1, ''),
(115, 'admin', 2, 'Admin/article/update', '保存', -1, ''),
(116, 'admin', 2, 'Admin/article/autoSave', '保存草稿', -1, ''),
(117, 'admin', 2, 'Admin/article/move', '移动', -1, ''),
(118, 'admin', 2, 'Admin/article/copy', '复制', -1, ''),
(119, 'admin', 2, 'Admin/article/paste', '粘贴', -1, ''),
(120, 'admin', 2, 'Admin/article/batchOperate', '导入', -1, ''),
(121, 'admin', 2, 'Admin/article/recycle', '回收站', -1, ''),
(122, 'admin', 2, 'Admin/article/permit', '还原', -1, ''),
(123, 'admin', 2, 'Admin/article/clear', '清空', -1, ''),
(124, 'admin', 2, 'Admin/User/add', '新增用户', -1, ''),
(125, 'admin', 2, 'Admin/User/action', '用户行为', -1, ''),
(126, 'admin', 2, 'Admin/User/addAction', '新增用户行为', -1, ''),
(127, 'admin', 2, 'Admin/User/editAction', '编辑用户行为', -1, ''),
(128, 'admin', 2, 'Admin/User/saveAction', '保存用户行为', -1, ''),
(129, 'admin', 2, 'Admin/User/setStatus', '变更行为状态', -1, ''),
(130, 'admin', 2, 'Admin/User/changeStatus?method=forbidUser', '禁用会员', -1, ''),
(131, 'admin', 2, 'Admin/User/changeStatus?method=resumeUser', '启用会员', -1, ''),
(132, 'admin', 2, 'Admin/User/changeStatus?method=deleteUser', '删除会员', -1, ''),
(133, 'admin', 2, 'Admin/AuthManager/index', '权限管理', -1, ''),
(134, 'admin', 2, 'Admin/AuthManager/changeStatus?method=deleteGroup', '删除', -1, ''),
(135, 'admin', 2, 'Admin/AuthManager/changeStatus?method=forbidGroup', '禁用', -1, ''),
(136, 'admin', 2, 'Admin/AuthManager/changeStatus?method=resumeGroup', '恢复', -1, ''),
(137, 'admin', 2, 'Admin/AuthManager/createGroup', '新增', -1, ''),
(138, 'admin', 2, 'Admin/AuthManager/editGroup', '编辑', -1, ''),
(139, 'admin', 2, 'Admin/AuthManager/writeGroup', '保存用户组', -1, ''),
(140, 'admin', 2, 'Admin/AuthManager/group', '授权', -1, ''),
(141, 'admin', 2, 'Admin/AuthManager/access', '访问授权', -1, ''),
(142, 'admin', 2, 'Admin/AuthManager/user', '成员授权', -1, ''),
(143, 'admin', 2, 'Admin/AuthManager/removeFromGroup', '解除授权', -1, ''),
(144, 'admin', 2, 'Admin/AuthManager/addToGroup', '保存成员授权', -1, ''),
(145, 'admin', 2, 'Admin/AuthManager/category', '分类授权', -1, ''),
(146, 'admin', 2, 'Admin/AuthManager/addToCategory', '保存分类授权', -1, ''),
(147, 'admin', 2, 'Admin/AuthManager/modelauth', '模型授权', -1, ''),
(148, 'admin', 2, 'Admin/AuthManager/addToModel', '保存模型授权', -1, ''),
(149, 'admin', 2, 'Admin/Addons/create', '创建', -1, ''),
(150, 'admin', 2, 'Admin/Addons/checkForm', '检测创建', -1, ''),
(151, 'admin', 2, 'Admin/Addons/preview', '预览', -1, ''),
(152, 'admin', 2, 'Admin/Addons/build', '快速生成插件', -1, ''),
(153, 'admin', 2, 'Admin/Addons/config', '设置', -1, ''),
(154, 'admin', 2, 'Admin/Addons/disable', '禁用', -1, ''),
(155, 'admin', 2, 'Admin/Addons/enable', '启用', -1, ''),
(156, 'admin', 2, 'Admin/Addons/install', '安装', -1, ''),
(157, 'admin', 2, 'Admin/Addons/uninstall', '卸载', -1, ''),
(158, 'admin', 2, 'Admin/Addons/saveconfig', '更新配置', -1, ''),
(159, 'admin', 2, 'Admin/Addons/adminList', '插件后台列表', -1, ''),
(160, 'admin', 2, 'Admin/Addons/execute', 'URL方式访问插件', -1, ''),
(161, 'admin', 2, 'Admin/Addons/hooks', '钩子管理', -1, ''),
(162, 'admin', 2, 'Admin/Model/index', '模型管理', -1, ''),
(163, 'admin', 2, 'Admin/model/add', '新增', -1, ''),
(164, 'admin', 2, 'Admin/model/edit', '编辑', -1, ''),
(165, 'admin', 2, 'Admin/model/setStatus', '改变状态', -1, ''),
(166, 'admin', 2, 'Admin/model/update', '保存数据', -1, ''),
(167, 'admin', 2, 'Admin/Attribute/index', '属性管理', -1, ''),
(168, 'admin', 2, 'Admin/Attribute/add', '新增', -1, ''),
(169, 'admin', 2, 'Admin/Attribute/edit', '编辑', -1, ''),
(170, 'admin', 2, 'Admin/Attribute/setStatus', '改变状态', -1, ''),
(171, 'admin', 2, 'Admin/Attribute/update', '保存数据', -1, ''),
(172, 'admin', 2, 'Admin/Config/index', '配置管理', -1, ''),
(173, 'admin', 2, 'Admin/Config/edit', '编辑', -1, ''),
(174, 'admin', 2, 'Admin/Config/del', '删除', -1, ''),
(175, 'admin', 2, 'Admin/Config/add', '新增', -1, ''),
(176, 'admin', 2, 'Admin/Config/save', '保存', -1, ''),
(177, 'admin', 2, 'Admin/Menu/index', '菜单管理', -1, ''),
(178, 'admin', 2, 'Admin/Channel/index', '导航管理', -1, ''),
(179, 'admin', 2, 'Admin/Channel/add', '新增', -1, ''),
(180, 'admin', 2, 'Admin/Channel/edit', '编辑', -1, ''),
(181, 'admin', 2, 'Admin/Channel/del', '删除', -1, ''),
(182, 'admin', 2, 'Admin/Category/index', '分类管理', -1, ''),
(183, 'admin', 2, 'Admin/Category/edit', '编辑', -1, ''),
(184, 'admin', 2, 'Admin/Category/add', '新增', -1, ''),
(185, 'admin', 2, 'Admin/Category/remove', '删除', -1, ''),
(186, 'admin', 2, 'Admin/Category/move', '移动', -1, ''),
(187, 'admin', 2, 'Admin/Category/merge', '合并', -1, ''),
(188, 'admin', 2, 'Admin/Database/index?type=export', '备份数据库', -1, ''),
(189, 'admin', 2, 'Admin/Database/export', '备份', -1, ''),
(190, 'admin', 2, 'Admin/Database/optimize', '优化表', -1, ''),
(191, 'admin', 2, 'Admin/Database/repair', '修复表', -1, ''),
(192, 'admin', 2, 'Admin/Database/index?type=import', '还原数据库', -1, ''),
(193, 'admin', 2, 'Admin/Database/import', '恢复', -1, ''),
(194, 'admin', 2, 'Admin/Database/del', '删除', -1, ''),
(195, 'admin', 2, 'Admin/other', '其他', -1, ''),
(196, 'admin', 2, 'Admin/Menu/add', '新增', -1, ''),
(197, 'admin', 2, 'Admin/Menu/edit', '编辑', -1, ''),
(198, 'admin', 2, 'Admin/Think/lists?model=article', '应用', -1, ''),
(199, 'admin', 2, 'Admin/Think/lists?model=download', '下载管理', -1, ''),
(200, 'admin', 2, 'Admin/Think/lists?model=config', '应用', -1, ''),
(201, 'admin', 2, 'Admin/Action/actionlog', '行为日志', -1, ''),
(202, 'admin', 2, 'Admin/User/updatePassword', '修改密码', -1, ''),
(203, 'admin', 2, 'Admin/User/updateNickname', '修改昵称', -1, ''),
(204, 'admin', 2, 'Admin/action/edit', '查看行为日志', -1, ''),
(206, 'admin', 1, 'Admin/think/edit', '编辑数据', -1, ''),
(207, 'admin', 1, 'Admin/Menu/import', '导入', 1, ''),
(208, 'admin', 1, 'Admin/Model/generate', '生成', -1, ''),
(209, 'admin', 1, 'Admin/Addons/addHook', '新增钩子', 1, ''),
(210, 'admin', 1, 'Admin/Addons/edithook', '编辑钩子', 1, ''),
(211, 'admin', 1, 'Admin/Article/sort', '文档排序', -1, ''),
(212, 'admin', 1, 'Admin/Config/sort', '排序', 1, ''),
(213, 'admin', 1, 'Admin/Menu/sort', '排序', 1, ''),
(214, 'admin', 1, 'Admin/Channel/sort', '排序', 1, ''),
(215, 'admin', 1, 'Admin/Category/operate/type/move', '移动', -1, ''),
(216, 'admin', 1, 'Admin/Category/operate/type/merge', '合并', -1, ''),
(224, 'admin', 1, 'Admin/SEO/editRule', '新增、编辑', 1, ''),
(225, 'admin', 1, 'Admin/SEO/sortRule', '排序', 1, ''),
(226, 'admin', 1, 'Admin/SEO/index', 'SEO规则管理', 1, ''),
(230, 'admin', 1, 'Admin/SEO/ruleTrash', 'SEO规则回收站', 1, ''),
(231, 'admin', 1, 'Admin/Rank/userList', '查看用户', 1, ''),
(232, 'admin', 1, 'Admin/Rank/userRankList', '用户头衔列表', 1, ''),
(233, 'admin', 1, 'Admin/Rank/userAddRank', '关联新头衔', 1, ''),
(234, 'admin', 1, 'Admin/Rank/userChangeRank', '编辑头衔关联', 1, ''),
(239, 'admin', 1, 'Admin/Rank/index', '头衔列表', 1, ''),
(242, 'admin', 1, 'Admin/Rank/editRank', '添加头衔', 1, ''),
(251, 'admin', 2, 'Admin/SEO/index', 'SEO', -1, ''),
(252, 'admin', 2, 'Admin/Rank/index', '头衔', -1, ''),
(255, 'admin', 1, 'Admin/User/profile', '扩展资料', 1, ''),
(256, 'admin', 1, 'Admin/User/editProfile', '添加、编辑分组', 1, ''),
(257, 'admin', 1, 'Admin/User/sortProfile', '分组排序', 1, ''),
(258, 'admin', 1, 'Admin/User/field', '字段列表', 1, ''),
(259, 'admin', 1, 'Admin/User/editFieldSetting', '添加、编辑字段', 1, ''),
(260, 'admin', 1, 'Admin/User/sortField', '字段排序', 1, ''),
(261, 'admin', 1, 'Admin/Update/quick', '全部补丁', 1, ''),
(262, 'admin', 1, 'Admin/Update/addpack', '新增补丁', 1, ''),
(263, 'admin', 1, 'Admin/User/expandinfo_select', '用户扩展资料列表', 1, ''),
(264, 'admin', 1, 'Admin/User/expandinfo_details', '扩展资料详情', 1, ''),
(278, 'admin', 1, 'Admin/Rank/rankVerify', '待审核用户头衔', 1, ''),
(279, 'admin', 1, 'Admin/Rank/rankVerifyFailure', '被驳回的头衔申请', 1, ''),
(297, 'Home', 1, 'deleteLocalComment', '删除本地评论', 1, ''),
(313, 'admin', 1, 'Admin/module/install', '模块安装', 1, ''),
(315, 'admin', 1, 'Admin/module/lists', '模块管理', 1, ''),
(316, 'admin', 1, 'Admin/module/uninstall', '卸载模块', 1, ''),
(317, 'admin', 1, 'Admin/AuthManager/addNode', '新增权限节点', 1, ''),
(318, 'admin', 1, 'Admin/AuthManager/accessUser', '前台权限管理', 1, ''),
(319, 'admin', 1, 'Admin/User/changeGroup', '转移用户组', 1, ''),
(320, 'admin', 1, 'Admin/AuthManager/deleteNode', '删除权限节点', 1, ''),
(322, 'admin', 2, 'Admin/module/lists', '模块管理', -1, ''),
(346, 'admin', 1, 'Admin/UserConfig/index', '用户注册配置', 1, ''),
(347, 'admin', 1, 'Admin/User/scoreList', '积分类型列表', 1, ''),
(348, 'admin', 1, 'Admin/user/editScoreType', '新增/编辑类型', 1, ''),
(349, 'admin', 1, 'Admin/user/recharge', '充值积分', 1, ''),
(350, 'admin', 1, 'Admin/Authorize/ssoSetting', '单点登录配置', 1, ''),
(351, 'admin', 1, 'Admin/Authorize/ssolist', '应用列表', 1, ''),
(352, 'admin', 1, 'Admin/authorize/editssoapp', '新增/编辑应用', 1, ''),
(353, 'admin', 1, 'Admin/ActionLimit/limitList', '行为限制列表', 1, ''),
(354, 'admin', 1, 'Admin/ActionLimit/editLimit', '新增/编辑行为限制', 1, ''),
(355, 'admin', 1, 'Admin/Role/index', '角色列表', 1, ''),
(356, 'admin', 1, 'Admin/Role/editRole', '编辑角色', 1, ''),
(357, 'admin', 1, 'Admin/Role/setStatus', '启用、禁用、删除角色', 1, ''),
(358, 'admin', 1, 'Admin/Role/sort', '角色排序', 1, ''),
(359, 'admin', 1, 'Admin/Role/configScore', '默认积分配置', 1, ''),
(360, 'admin', 1, 'Admin/Role/configAuth', '默认权限配置', 1, ''),
(361, 'admin', 1, 'Admin/Role/configAvatar', '默认头像配置', 1, ''),
(362, 'admin', 1, 'Admin/Role/configRank', '默认头衔配置', 1, ''),
(363, 'admin', 1, 'Admin/Role/configField', '默认字段管理', 1, ''),
(364, 'admin', 1, 'Admin/Role/group', '角色分组', 1, ''),
(365, 'admin', 1, 'Admin/Role/editGroup', '编辑分组', 1, ''),
(366, 'admin', 1, 'Admin/Role/deleteGroup', '删除分组', 1, ''),
(367, 'admin', 1, 'Admin/Role/config', '角色基本信息配置', 1, ''),
(368, 'admin', 1, 'Admin/Role/userList', '用户列表', 1, ''),
(369, 'admin', 1, 'Admin/Role/setUserStatus', '设置用户状态', 1, ''),
(370, 'admin', 1, 'Admin/Role/setUserAudit', '审核用户', 1, ''),
(371, 'admin', 1, 'Admin/Role/changeRole', '迁移用户', 1, ''),
(372, 'admin', 1, 'Admin/Role/uploadPicture', '上传默认头像', 1, ''),
(373, 'admin', 1, 'Admin/Invite/index', '类型管理', 1, ''),
(374, 'admin', 1, 'Admin/Invite/invite', '邀请码管理', 1, ''),
(375, 'admin', 1, 'Admin/Invite/config', '基础配置', 1, ''),
(376, 'admin', 1, 'Admin/Invite/buyLog', '兑换记录', 1, ''),
(377, 'admin', 1, 'Admin/Invite/inviteLog', '邀请记录', 1, ''),
(378, 'admin', 1, 'Admin/Invite/userInfo', '用户信息', 1, ''),
(379, 'admin', 1, 'Admin/Invite/edit', '编辑邀请注册类型', 1, ''),
(380, 'admin', 1, 'Admin/Invite/setStatus', '删除邀请', 1, ''),
(381, 'admin', 1, 'Admin/Invite/delete', '删除邀请码', 1, ''),
(382, 'admin', 1, 'Admin/Invite/createCode', '生成邀请码', 1, ''),
(383, 'admin', 1, 'Admin/Invite/deleteTrue', '删除无用邀请码', 1, ''),
(384, 'admin', 1, 'Admin/Invite/cvs', '导出cvs', 1, ''),
(385, 'admin', 1, 'Admin/Invite/editUserInfo', '用户信息编辑', 1, ''),
(386, 'admin', 1, 'Admin/Action/remove', '删除日志', 1, ''),
(387, 'admin', 1, 'Admin/Action/clear', '清空日志', 1, ''),
(388, 'admin', 1, 'Admin/User/setTypeStatus', '设置积分状态', 1, ''),
(389, 'admin', 1, 'Admin/User/delType', '删除积分类型', 1, ''),
(390, 'admin', 1, 'Admin/User/getNickname', '充值积分', 1, ''),
(391, 'admin', 1, 'Admin/Menu/del', '删除菜单', 1, ''),
(392, 'admin', 1, 'Admin/Menu/toogleDev', '设置开发者模式可见', 1, ''),
(393, 'admin', 1, 'Admin/Menu/toogleHide', '设置显示隐藏', 1, ''),
(394, 'admin', 1, 'Admin/ActionLimit/setLimitStatus', '行为限制启用、禁用、删除', 1, ''),
(395, 'admin', 1, 'Admin/SEO/setRuleStatus', '启用、禁用、删除、回收站还原', 1, ''),
(396, 'admin', 1, 'Admin/SEO/doClear', '回收站彻底删除', 1, ''),
(397, 'admin', 1, 'Admin/Role/initUnhaveUser', '初始化无角色用户', 1, ''),
(398, 'admin', 1, 'Admin/Addons/delHook', '删除钩子', 1, ''),
(399, 'admin', 1, 'Admin/Update/usePack', '使用补丁', 1, ''),
(400, 'admin', 1, 'Admin/Update/view', '查看补丁', 1, ''),
(401, 'admin', 1, 'Admin/Update/delPack', '删除补丁', 1, ''),
(402, 'admin', 1, 'Admin/UserTag/userTag', '标签列表', 1, ''),
(403, 'admin', 1, 'Admin/UserTag/add', '添加分类、标签', 1, ''),
(404, 'admin', 1, 'Admin/UserTag/setStatus', '设置分类、标签状态', 1, ''),
(405, 'admin', 1, 'Admin/UserTag/tagTrash', '分类、标签回收站', 1, ''),
(406, 'admin', 1, 'Admin/UserTag/userTagClear', '测底删除回收站内容', 1, ''),
(407, 'admin', 1, 'Admin/role/configusertag', '可拥有标签配置', 1, ''),
(408, 'admin', 1, 'Admin/Module/edit', '编辑模块', 1, ''),
(409, 'admin', 1, 'Admin/Config/website', '网站信息', 1, ''),
(410, 'admin', 1, 'Admin/Theme/setTheme', '使用主题', 1, ''),
(411, 'admin', 1, 'Admin/Theme/lookTheme', '查看主题', 1, ''),
(412, 'admin', 1, 'Admin/Theme/packageDownload', '主题打包下载', 1, ''),
(413, 'admin', 1, 'Admin/Theme/delete', '卸载删除主题', 1, ''),
(414, 'admin', 1, 'Admin/Theme/add', '上传安装主题', 1, ''),
(415, 'admin', 2, 'Admin/Home/config', '网站主页', 1, ''),
(416, 'admin', 1, 'Admin/Home/config', '基本设置', 1, ''),
(423, 'admin', 1, 'Admin/People/config', '基本设置', 1, ''),
(425, 'admin', 2, 'Admin/authorize/ssoSetting', '授权', 1, ''),
(426, 'admin', 2, 'Admin/Role/index', '角色', 1, ''),
(427, 'admin', 1, 'Admin/Theme/tpls', '主题管理', 1, ''),
(428, 'admin', 2, 'Admin/ActionLimit/limitList', '安全', 1, ''),
(430, 'admin', 2, 'Admin/People/config', '会员展示', 1, ''),
(431, 'admin', 1, 'Admin/Index/index', '后台入口', 1, ''),
(10000, 'Issue', 1, 'addIssueContent', '专辑投稿权限', 1, ''),
(10001, 'Issue', 1, 'editIssueContent', '编辑专辑内容（管理）', 1, ''),
(10024, 'Event', 1, 'Event/Index/shenhe', '活动报名审核（管理）', 1, ''),
(10023, 'Event', 1, 'Event/Index/doSign', '活动报名', 1, ''),
(10022, 'Event', 1, 'Event/Index/doDelEvent', '删除活动（管理）', 1, ''),
(10021, 'Event', 1, 'Event/Index/edit', '编辑活动（管理）', 1, ''),
(10020, 'Event', 1, 'Event/Index/add', '发布活动', 1, ''),
(10025, 'Event', 1, 'Event/Index/doEndEvent', '结束活动（管理）', 1, '');

-- --------------------------------------------------------

--
-- 表的结构 `ocenter_avatar`
--

CREATE TABLE `ocenter_avatar` (
  `id` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `path` varchar(200) NOT NULL,
  `driver` varchar(50) NOT NULL,
  `create_time` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `is_temp` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ocenter_channel`
--

CREATE TABLE `ocenter_channel` (
  `id` int(10) UNSIGNED NOT NULL COMMENT '频道ID',
  `pid` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '上级频道ID',
  `title` char(30) NOT NULL COMMENT '频道标题',
  `url` char(100) NOT NULL COMMENT '频道连接',
  `sort` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '导航排序',
  `create_time` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态',
  `target` tinyint(2) UNSIGNED NOT NULL DEFAULT '0' COMMENT '新窗口打开',
  `color` varchar(30) NOT NULL,
  `band_color` varchar(30) NOT NULL,
  `band_text` varchar(30) NOT NULL,
  `icon` varchar(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `ocenter_channel`
--

INSERT INTO `ocenter_channel` (`id`, `pid`, `title`, `url`, `sort`, `create_time`, `update_time`, `status`, `target`, `color`, `band_color`, `band_text`, `icon`) VALUES
(1, 0, '专辑', 'Issue/index/index', 1, 0, 0, 1, 0, '', '', '', ''),
(2, 0, '首页', 'Home/Index/index', 2, 0, 0, 1, 0, '#000000', '#000000', '', 'home'),
(3, 0, '找人', 'People/index/index', 3, 0, 0, 1, 0, '', '', '', 'group'),
(9, 0, '活动', 'Event/index/index', 100, 0, 0, 1, 0, '', '', '', 'map-marker'),
(10, 0, '评价', 'Appraise/index/index', 100, 0, 0, 1, 0, '', '', '', 'map-marker');

-- --------------------------------------------------------

--
-- 表的结构 `ocenter_checkin`
--

CREATE TABLE `ocenter_checkin` (
  `id` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `create_time` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ocenter_config`
--

CREATE TABLE `ocenter_config` (
  `id` int(10) UNSIGNED NOT NULL COMMENT '配置ID',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '配置名称',
  `type` tinyint(3) UNSIGNED NOT NULL DEFAULT '0' COMMENT '配置类型',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '配置说明',
  `group` tinyint(3) UNSIGNED NOT NULL DEFAULT '0' COMMENT '配置分组',
  `extra` varchar(255) NOT NULL DEFAULT '' COMMENT '配置值',
  `remark` varchar(500) NOT NULL COMMENT '配置说明',
  `create_time` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态',
  `value` text NOT NULL COMMENT '配置值',
  `sort` smallint(3) UNSIGNED NOT NULL DEFAULT '0' COMMENT '排序'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `ocenter_config`
--

INSERT INTO `ocenter_config` (`id`, `name`, `type`, `title`, `group`, `extra`, `remark`, `create_time`, `update_time`, `status`, `value`, `sort`) VALUES
(100, 'WEB_SITE_CLOSE', 4, '关闭站点', 1, '0:关闭,1:开启', '站点关闭后其他用户不能访问，管理员可以正常访问', 1378898976, 1379235296, 1, '1', 11),
(101, 'CONFIG_TYPE_LIST', 3, '配置类型列表', 4, '', '主要用于数据解析和页面表单的生成', 1378898976, 1379235348, 1, '0:数字\r\n1:字符\r\n2:文本\r\n3:数组\r\n4:枚举\r\n8:多选框', 8),
(102, 'CONFIG_GROUP_LIST', 3, '配置分组', 4, '', '配置分组', 1379228036, 1384418383, 1, '1:基本\r\n2:内容\r\n3:用户\r\n4:系统\r\n5:邮件', 15),
(103, 'HOOKS_TYPE', 3, '钩子的类型', 4, '', '类型 1-用于扩展显示内容，2-用于扩展业务处理', 1379313397, 1379313407, 1, '1:视图\r\n2:控制器', 17),
(104, 'AUTH_CONFIG', 3, 'Auth配置', 4, '', '自定义Auth.class.php类配置', 1379409310, 1379409564, 1, 'AUTH_ON:1\r\nAUTH_TYPE:2', 20),
(105, 'LIST_ROWS', 0, '后台每页记录数', 2, '', '后台数据每页显示记录数', 1379503896, 1380427745, 1, '10', 24),
(107, 'CODEMIRROR_THEME', 4, '预览插件的CodeMirror主题', 4, '3024-day:3024 day\r\n3024-night:3024 night\r\nambiance:ambiance\r\nbase16-dark:base16 dark\r\nbase16-light:base16 light\r\nblackboard:blackboard\r\ncobalt:cobalt\r\neclipse:eclipse\r\nelegant:elegant\r\nerlang-dark:erlang-dark\r\nlesser-dark:lesser-dark\r\nmidnight:midnight', '详情见CodeMirror官网', 1379814385, 1384740813, 1, 'ambiance', 13),
(108, 'DATA_BACKUP_PATH', 1, '数据库备份根路径', 4, '', '路径必须以 / 结尾', 1381482411, 1381482411, 1, './Data/Backup', 16),
(109, 'DATA_BACKUP_PART_SIZE', 0, '数据库备份卷大小', 4, '', '该值用于限制压缩后的分卷最大长度。单位：B；建议设置20M', 1381482488, 1381729564, 1, '20971520', 18),
(110, 'DATA_BACKUP_COMPRESS', 4, '数据库备份文件是否启用压缩', 4, '0:不压缩\r\n1:启用压缩', '压缩备份文件需要PHP环境支持gzopen,gzwrite函数', 1381713345, 1381729544, 1, '1', 22),
(111, 'DATA_BACKUP_COMPRESS_LEVEL', 4, '数据库备份文件压缩级别', 4, '1:普通\r\n4:一般\r\n9:最高', '数据库备份文件的压缩级别，该配置在开启压缩时生效', 1381713408, 1381713408, 1, '9', 25),
(112, 'DEVELOP_MODE', 4, '开启开发者模式', 4, '0:关闭\r\n1:开启', '是否开启开发者模式', 1383105995, 1383291877, 1, '1', 26),
(113, 'ALLOW_VISIT', 3, '不受限控制器方法', 0, '', '', 1386644047, 1386644741, 1, '0:article/draftbox\r\n1:article/mydocument\r\n2:Category/tree\r\n3:Index/verify\r\n4:file/upload\r\n5:file/download\r\n6:user/updatePassword\r\n7:user/updateNickname\r\n8:user/submitPassword\r\n9:user/submitNickname\r\n10:file/uploadpicture', 2),
(114, 'DENY_VISIT', 3, '超管专限控制器方法', 0, '', '仅超级管理员可访问的控制器方法', 1386644141, 1386644659, 1, '0:Addons/addhook\r\n1:Addons/edithook\r\n2:Addons/delhook\r\n3:Addons/updateHook\r\n4:Admin/getMenus\r\n5:Admin/recordList\r\n6:AuthManager/updateRules\r\n7:AuthManager/tree', 3),
(115, 'ADMIN_ALLOW_IP', 2, '后台允许访问IP', 4, '', '多个用逗号分隔，如果不配置表示不限制IP访问', 1387165454, 1387165553, 1, '', 27),
(116, 'SHOW_PAGE_TRACE', 4, '是否显示页面Trace', 4, '0:关闭\r\n1:开启', '是否显示页面Trace信息', 1387165685, 1387165685, 1, '0', 7),
(117, 'MAIL_TYPE', 4, '邮件类型', 5, '1:SMTP 模块发送\r\n2:mail() 函数发送', '如果您选择了采用服务器内置的 Mail 服务，您不需要填写下面的内容', 1388332882, 1388931416, 1, '1', 0),
(118, 'MAIL_SMTP_HOST', 1, 'SMTP 服务器', 5, '', 'SMTP服务器', 1388332932, 1388332932, 1, '', 0),
(119, 'MAIL_SMTP_PORT', 0, 'SMTP服务器端口', 5, '', '默认25', 1388332975, 1388332975, 1, '25', 0),
(120, 'MAIL_SMTP_USER', 1, 'SMTP服务器用户名', 5, '', '填写完整用户名', 1388333010, 1388333010, 1, '', 0),
(121, 'MAIL_SMTP_PASS', 6, 'SMTP服务器密码', 5, '', '填写您的密码', 1388333057, 1389187088, 1, '', 0),
(122, 'MAIL_USER_PASS', 5, '密码找回模板', 0, '', '支持HTML代码', 1388583989, 1388672614, 1, '密码找回111223333555111', 0),
(123, 'PIC_FILE_PATH', 1, '图片文件保存根目录', 4, '', '图片文件保存根目录./目录/', 1388673255, 1388673255, 1, './Uploads/', 0),
(124, 'COUNT_DAY', 0, '后台首页统计用户增长天数', 0, '', '默认统计最近半个月的用户数增长情况', 1420791945, 1420876261, 1, '2', 0),
(125, 'MAIL_USER_REG', 5, '注册邮件模板', 3, '', '支持HTML代码', 1388337307, 1389532335, 1, '<a href="http://www.opensns.cn" target="_blank">点击进入</a><span style="color:#E53333;">当您收到这封邮件，表明您已注册成功，以上为您的用户名和密码。。。。祝您生活愉快····</span>', 55),
(126, 'USER_NAME_BAOLIU', 1, '保留用户名和昵称', 3, '', '禁止注册用户名和昵称，包含这些即无法注册,用" , "号隔开，用户只能是英文，下划线_，数字等', 1388845937, 1388845937, 1, '管理员,测试,admin,垃圾', 0),
(128, 'VERIFY_OPEN', 8, '验证码配置', 4, 'reg:注册显示\r\nlogin:登陆显示\r\nreset:密码重置', '验证码配置', 1388500332, 1405561711, 1, '', 0),
(129, 'VERIFY_TYPE', 4, '验证码类型', 4, '1:中文\r\n2:英文\r\n3:数字\r\n4:英文+数字', '验证码类型', 1388500873, 1405561731, 1, '4', 0),
(130, 'NO_BODY_TLE', 2, '空白说明', 2, '', '空白说明', 1392216444, 1392981305, 1, '呵呵，暂时没有内容哦！！', 0),
(131, 'USER_RESPASS', 5, '密码找回模板', 3, '', '密码找回文本', 1396191234, 1396191234, 1, '<span style="color:#009900;">请点击以下链接找回密码，如无反应，请将链接地址复制到浏览器中打开(下次登录前有效)</span>', 0),
(132, 'COUNT_CODE', 2, '统计代码', 1, '', '用于统计网站访问量的第三方代码，推荐CNZZ统计', 1403058890, 1403058890, 1, '', 12),
(134, 'URL_MODEL', 4, 'URL模式', 4, '2:REWRITE模式(开启伪静态)\r\n3:兼容模式', '选择Rewrite模式则开启伪静态，在开启伪静态之前需要先<a href="http://v2.opensns.cn/index.php?s=/news/index/detail/id/128.html" target="_blank">设置伪静态</a>或者阅读/Rewrite/readme.txt中的说明，默认建议开启兼容模式', 1421027546, 1421027676, 1, '3', 0),
(135, 'DEFUALT_HOME_URL', 1, '登录前首页Url', 1, '', '支持形如weibo/index/index的ThinkPhp路由写法，支持普通的url写法，不填则显示默认聚合首页', 1417509438, 1427340006, 1, '', 1),
(137, 'WEB_SITE_CLOSE_HINT', 2, '关站提示文字', 1, '', '站点关闭后的提示文字。', 1433731248, 1433731287, 1, '网站正在更新维护，请稍候再试。', 4),
(138, 'SESSION_PREFIX', 1, '网站前台session前缀', 1, '', '当多个网站在同一个根域名下请保证每个网站的前缀不同', 1436923664, 1436923664, 1, 'opencenter', 20),
(139, 'COOKIE_PREFIX', 1, '网站前台cookie前缀', 1, '', '当多个网站在同一个根域名下请保证每个网站的前缀不同', 1436923664, 1436923664, 1, 'opencenter_', 21),
(140, 'MAIL_SMTP_CE', 1, '邮件发送测试', 5, '', '填写测试邮件地址', 1388334529, 1388584028, 1, '', 11),
(1000, '_USERCONFIG_REG_SWITCH', 0, '', 0, '', '', 1427094903, 1427094903, 1, 'username', 0),
(10000, '_CONFIG_WEB_SITE_NAME', 0, '', 0, '', '', 1452489485, 1452489485, 1, 'OpenCenter v2轻量化社交框架', 0),
(10001, '_CONFIG_ICP', 0, '', 0, '', '', 1452489485, 1452489485, 1, '沪ICP备12007XXX号', 0),
(10002, '_CONFIG_LOGO', 0, '', 0, '', '', 1452489485, 1452489485, 1, '1', 0),
(10003, '_CONFIG_QRCODE', 0, '', 0, '', '', 1452489485, 1452489485, 1, '', 0),
(10014, '_CONFIG_ABOUT_US', 0, '', 0, '', '', 1452489485, 1452489485, 1, '<p>&nbsp; 嘉兴想天信息科技有限公司是一家专注于为客户提供专业的社交方案。公司秉持简洁、高效、创新，不断为客户创造奇迹。旗下产品有OpenSNS开源社交系统和OpenCenter开源用户和后台管理系统。</p>', 0),
(10013, '_CONFIG_SUBSCRIB_US', 0, '', 0, '', '', 1452489485, 1452489485, 1, '<p>业务QQ：276905621</p><p>联系地址：浙江省桐乡市环城南路1号电子商务中心</p><p>联系电话：0573-88037510</p>', 0),
(10012, '_CONFIG_COPY_RIGHT', 0, '', 0, '', '', 1452489485, 1452489485, 1, '<p>Copyright ©2013-2014 <a href="http://www.ourstu.com" target="_blank">嘉兴想天信息科技有限公司</a></p>', 0),
(1008, '_HOME_LOGO', 0, '', 0, '', '', 1432791820, 1432791820, 1, '', 0),
(1009, '_HOME_ENTER_URL', 0, '', 0, '', '', 1432791820, 1432791820, 1, '', 0),
(1010, '_HOME_BLOCK', 0, '', 0, '', '', 1432791820, 1432791820, 1, '[{"data-id":"disable","title":"禁用","items":[]},{"data-id":"enable","title":"启用","items":[{"data-id":"slider","title":"轮播"},{"data-id":"Weibo","title":"微博"},{"data-id":"People","title":"会员展示"}]}]', 0),
(1011, '_HOME_PIC1', 0, '', 0, '', '', 1432791820, 1432791820, 1, '', 0),
(1012, '_HOME_URL1', 0, '', 0, '', '', 1432791820, 1432791820, 1, '', 0),
(1013, '_HOME_TITLE1', 0, '', 0, '', '', 1432791820, 1432791820, 1, '', 0),
(1014, '_HOME_PIC2', 0, '', 0, '', '', 1432791820, 1432791820, 1, '', 0),
(1015, '_HOME_URL2', 0, '', 0, '', '', 1432791820, 1432791820, 1, '', 0),
(1016, '_HOME_TITLE2', 0, '', 0, '', '', 1432791820, 1432791820, 1, '', 0),
(1017, '_HOME_PIC3', 0, '', 0, '', '', 1432791820, 1432791820, 1, '', 0),
(1018, '_HOME_URL3', 0, '', 0, '', '', 1432791820, 1432791820, 1, '', 0),
(1019, '_HOME_TITLE3', 0, '', 0, '', '', 1432791820, 1432791820, 1, '', 0),
(10004, '_CONFIG_JUMP_BACKGROUND', 0, '', 0, '', '', 1452489485, 1452489485, 1, '', 0),
(10005, '_CONFIG_SUCCESS_WAIT_TIME', 0, '', 0, '', '', 1452489485, 1452489485, 1, '2', 0),
(10006, '_CONFIG_ERROR_WAIT_TIME', 0, '', 0, '', '', 1452489485, 1452489485, 1, '5', 0),
(10007, '_CONFIG_OPEN_IM', 0, '', 0, '', '', 1452489485, 1452489485, 1, '1', 0),
(10008, '_CONFIG_GET_INFORMATION', 0, '', 0, '', '', 1452489485, 1452489485, 1, '1', 0),
(10009, '_CONFIG_GET_INFORMATION_INTERNAL', 0, '', 0, '', '', 1452489485, 1452489485, 1, '10', 0),
(10010, '_CONFIG_PICTURE_UPLOAD_DRIVER', 0, '', 0, '', '', 1452489485, 1452489485, 1, 'local', 0),
(10011, '_CONFIG_DOWNLOAD_UPLOAD_DRIVER', 0, '', 0, '', '', 1452489485, 1452489485, 1, 'local', 0);

-- --------------------------------------------------------

--
-- 表的结构 `ocenter_district`
--

CREATE TABLE `ocenter_district` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `fullName` varchar(255) NOT NULL DEFAULT '',
  `level` tinyint(4) UNSIGNED NOT NULL DEFAULT '0',
  `upid` mediumint(8) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='中国省市区乡镇数据表';

--
-- 转存表中的数据 `ocenter_district`
--

INSERT INTO `ocenter_district` (`id`, `name`, `fullName`, `level`, `upid`) VALUES
(110000, '北京市', '北京市', 1, 0),
(120000, '天津市', '天津市', 1, 0),
(130000, '河北省', '河北省', 1, 0),
(140000, '山西省', '山西省', 1, 0),
(150000, '内蒙古', '内蒙古', 1, 0),
(210000, '辽宁省', '辽宁省', 1, 0),
(220000, '吉林省', '吉林省', 1, 0),
(230000, '黑龙江', '黑龙江', 1, 0),
(310000, '上海市', '上海市', 1, 0),
(320000, '江苏省', '江苏省', 1, 0),
(330000, '浙江省', '浙江省', 1, 0),
(340000, '安徽省', '安徽省', 1, 0),
(350000, '福建省', '福建省', 1, 0),
(360000, '江西省', '江西省', 1, 0),
(370000, '山东省', '山东省', 1, 0),
(410000, '河南省', '河南省', 1, 0),
(420000, '湖北省', '湖北省', 1, 0),
(430000, '湖南省', '湖南省', 1, 0),
(440000, '广东省', '广东省', 1, 0),
(450000, '广西省', '广西省', 1, 0),
(460000, '海南省', '海南省', 1, 0),
(500000, '重庆市', '重庆市', 1, 0),
(510000, '四川省', '四川省', 1, 0),
(520000, '贵州省', '贵州省', 1, 0),
(530000, '云南省', '云南省', 1, 0),
(540000, '西　藏', '西藏', 1, 0),
(610000, '陕西省', '陕西省', 1, 0),
(620000, '甘肃省', '甘肃省', 1, 0),
(630000, '青海省', '青海省', 1, 0),
(640000, '宁　夏', '宁夏', 1, 0),
(650000, '新　疆', '新疆', 1, 0),
(710000, '台湾省', '台湾省', 1, 0),
(810000, '香　港', '香港', 1, 0),
(820000, '澳　门', '澳门', 1, 0),
(110100, '北京市', '北京市', 2, 110000),
(110200, '县', '北京市', 2, 110000),
(120100, '市辖区', '天津市', 2, 120000),
(120200, '县', '天津市', 2, 120000),
(130100, '石家庄市', '河北省石家庄市', 2, 130000),
(130200, '唐山市', '河北省唐山市', 2, 130000),
(130300, '秦皇岛市', '河北省秦皇岛市', 2, 130000),
(130400, '邯郸市', '河北省邯郸市', 2, 130000),
(130500, '邢台市', '河北省邢台市', 2, 130000),
(130600, '保定市', '河北省保定市', 2, 130000),
(130700, '张家口市', '河北省张家口市', 2, 130000),
(130800, '承德市', '河北省承德市', 2, 130000),
(130900, '沧州市', '河北省沧州市', 2, 130000),
(131000, '廊坊市', '河北省廊坊市', 2, 130000),
(131100, '衡水市', '河北省衡水市', 2, 130000),
(140100, '太原市', '山西省太原市', 2, 140000),
(140200, '大同市', '山西省大同市', 2, 140000),
(140300, '阳泉市', '山西省阳泉市', 2, 140000),
(140400, '长治市', '山西省长治市', 2, 140000),
(140500, '晋城市', '山西省晋城市', 2, 140000),
(140600, '朔州市', '山西省朔州市', 2, 140000),
(140700, '晋中市', '山西省晋中市', 2, 140000),
(140800, '运城市', '山西省运城市', 2, 140000),
(140900, '忻州市', '山西省忻州市', 2, 140000),
(141000, '临汾市', '山西省临汾市', 2, 140000),
(141100, '吕梁市', '山西省吕梁市', 2, 140000),
(150100, '呼和浩特市', '内蒙古呼和浩特市', 2, 150000),
(150200, '包头市', '内蒙古包头市', 2, 150000),
(150300, '乌海市', '内蒙古乌海市', 2, 150000),
(150400, '赤峰市', '内蒙古赤峰市', 2, 150000),
(150500, '通辽市', '内蒙古通辽市', 2, 150000),
(150600, '鄂尔多斯市', '内蒙古鄂尔多斯市', 2, 150000),
(150700, '呼伦贝尔市', '内蒙古呼伦贝尔市', 2, 150000),
(150800, '巴彦淖尔市', '内蒙古巴彦淖尔市', 2, 150000),
(150900, '乌兰察布市', '内蒙古乌兰察布市', 2, 150000),
(152200, '兴安盟', '内蒙古兴安盟', 2, 150000),
(152500, '锡林郭勒盟', '内蒙古锡林郭勒盟', 2, 150000),
(152900, '阿拉善盟', '内蒙古阿拉善盟', 2, 150000),
(210100, '沈阳市', '辽宁省沈阳市', 2, 210000),
(210200, '大连市', '辽宁省大连市', 2, 210000),
(210300, '鞍山市', '辽宁省鞍山市', 2, 210000),
(210400, '抚顺市', '辽宁省抚顺市', 2, 210000),
(210500, '本溪市', '辽宁省本溪市', 2, 210000),
(210600, '丹东市', '辽宁省丹东市', 2, 210000),
(210700, '锦州市', '辽宁省锦州市', 2, 210000),
(210800, '营口市', '辽宁省营口市', 2, 210000),
(210900, '阜新市', '辽宁省阜新市', 2, 210000),
(211000, '辽阳市', '辽宁省辽阳市', 2, 210000),
(211100, '盘锦市', '辽宁省盘锦市', 2, 210000),
(211200, '铁岭市', '辽宁省铁岭市', 2, 210000),
(211300, '朝阳市', '辽宁省朝阳市', 2, 210000),
(211400, '葫芦岛市', '辽宁省葫芦岛市', 2, 210000),
(220100, '长春市', '吉林省长春市', 2, 220000),
(220200, '吉林市', '吉林省吉林市', 2, 220000),
(220300, '四平市', '吉林省四平市', 2, 220000),
(220400, '辽源市', '吉林省辽源市', 2, 220000),
(220500, '通化市', '吉林省通化市', 2, 220000),
(220600, '白山市', '吉林省白山市', 2, 220000),
(220700, '松原市', '吉林省松原市', 2, 220000),
(220800, '白城市', '吉林省白城市', 2, 220000),
(222400, '延边朝鲜族自治州', '吉林省延边朝鲜族自治州', 2, 220000),
(230100, '哈尔滨市', '黑龙江哈尔滨市', 2, 230000),
(230200, '齐齐哈尔市', '黑龙江齐齐哈尔市', 2, 230000),
(230300, '鸡西市', '黑龙江鸡西市', 2, 230000),
(230400, '鹤岗市', '黑龙江鹤岗市', 2, 230000),
(230500, '双鸭山市', '黑龙江双鸭山市', 2, 230000),
(230600, '大庆市', '黑龙江大庆市', 2, 230000),
(230700, '伊春市', '黑龙江伊春市', 2, 230000),
(230800, '佳木斯市', '黑龙江佳木斯市', 2, 230000),
(230900, '七台河市', '黑龙江七台河市', 2, 230000),
(231000, '牡丹江市', '黑龙江牡丹江市', 2, 230000),
(231100, '黑河市', '黑龙江黑河市', 2, 230000),
(231200, '绥化市', '黑龙江绥化市', 2, 230000),
(232700, '大兴安岭地区', '黑龙江大兴安岭地区', 2, 230000),
(310100, '市辖区', '上海市', 2, 310000),
(310200, '县', '上海市', 2, 310000),
(320100, '南京市', '江苏省南京市', 2, 320000),
(320200, '无锡市', '江苏省无锡市', 2, 320000),
(320300, '徐州市', '江苏省徐州市', 2, 320000),
(320400, '常州市', '江苏省常州市', 2, 320000),
(320500, '苏州市', '江苏省苏州市', 2, 320000),
(320600, '南通市', '江苏省南通市', 2, 320000),
(320700, '连云港市', '江苏省连云港市', 2, 320000),
(320800, '淮安市', '江苏省淮安市', 2, 320000),
(320900, '盐城市', '江苏省盐城市', 2, 320000),
(321000, '扬州市', '江苏省扬州市', 2, 320000),
(321100, '镇江市', '江苏省镇江市', 2, 320000),
(321200, '泰州市', '江苏省泰州市', 2, 320000),
(321300, '宿迁市', '江苏省宿迁市', 2, 320000),
(330100, '杭州市', '浙江省杭州市', 2, 330000),
(330200, '宁波市', '浙江省宁波市', 2, 330000),
(330300, '温州市', '浙江省温州市', 2, 330000),
(330400, '嘉兴市', '浙江省嘉兴市', 2, 330000),
(330500, '湖州市', '浙江省湖州市', 2, 330000),
(330600, '绍兴市', '浙江省绍兴市', 2, 330000),
(330700, '金华市', '浙江省金华市', 2, 330000),
(330800, '衢州市', '浙江省衢州市', 2, 330000),
(330900, '舟山市', '浙江省舟山市', 2, 330000),
(331000, '台州市', '浙江省台州市', 2, 330000),
(331100, '丽水市', '浙江省丽水市', 2, 330000),
(340100, '合肥市', '安徽省合肥市', 2, 340000),
(340200, '芜湖市', '安徽省芜湖市', 2, 340000),
(340300, '蚌埠市', '安徽省蚌埠市', 2, 340000),
(340400, '淮南市', '安徽省淮南市', 2, 340000),
(340500, '马鞍山市', '安徽省马鞍山市', 2, 340000),
(340600, '淮北市', '安徽省淮北市', 2, 340000),
(340700, '铜陵市', '安徽省铜陵市', 2, 340000),
(340800, '安庆市', '安徽省安庆市', 2, 340000),
(341000, '黄山市', '安徽省黄山市', 2, 340000),
(341100, '滁州市', '安徽省滁州市', 2, 340000),
(341200, '阜阳市', '安徽省阜阳市', 2, 340000),
(341300, '宿州市', '安徽省宿州市', 2, 340000),
(341500, '六安市', '安徽省六安市', 2, 340000),
(341600, '亳州市', '安徽省亳州市', 2, 340000),
(341700, '池州市', '安徽省池州市', 2, 340000),
(341800, '宣城市', '安徽省宣城市', 2, 340000),
(350100, '福州市', '福建省福州市', 2, 350000),
(350200, '厦门市', '福建省厦门市', 2, 350000),
(350300, '莆田市', '福建省莆田市', 2, 350000),
(350400, '三明市', '福建省三明市', 2, 350000),
(350500, '泉州市', '福建省泉州市', 2, 350000),
(350600, '漳州市', '福建省漳州市', 2, 350000),
(350700, '南平市', '福建省南平市', 2, 350000),
(350800, '龙岩市', '福建省龙岩市', 2, 350000),
(350900, '宁德市', '福建省宁德市', 2, 350000),
(360100, '南昌市', '江西省南昌市', 2, 360000),
(360200, '景德镇市', '江西省景德镇市', 2, 360000),
(360300, '萍乡市', '江西省萍乡市', 2, 360000),
(360400, '九江市', '江西省九江市', 2, 360000),
(360500, '新余市', '江西省新余市', 2, 360000),
(360600, '鹰潭市', '江西省鹰潭市', 2, 360000),
(360700, '赣州市', '江西省赣州市', 2, 360000),
(360800, '吉安市', '江西省吉安市', 2, 360000),
(360900, '宜春市', '江西省宜春市', 2, 360000),
(361000, '抚州市', '江西省抚州市', 2, 360000),
(361100, '上饶市', '江西省上饶市', 2, 360000),
(370100, '济南市', '山东省济南市', 2, 370000),
(370200, '青岛市', '山东省青岛市', 2, 370000),
(370300, '淄博市', '山东省淄博市', 2, 370000),
(370400, '枣庄市', '山东省枣庄市', 2, 370000),
(370500, '东营市', '山东省东营市', 2, 370000),
(370600, '烟台市', '山东省烟台市', 2, 370000),
(370700, '潍坊市', '山东省潍坊市', 2, 370000),
(370800, '济宁市', '山东省济宁市', 2, 370000),
(370900, '泰安市', '山东省泰安市', 2, 370000),
(371000, '威海市', '山东省威海市', 2, 370000),
(371100, '日照市', '山东省日照市', 2, 370000),
(371200, '莱芜市', '山东省莱芜市', 2, 370000),
(371300, '临沂市', '山东省临沂市', 2, 370000),
(371400, '德州市', '山东省德州市', 2, 370000),
(371500, '聊城市', '山东省聊城市', 2, 370000),
(371600, '滨州市', '山东省滨州市', 2, 370000),
(371700, '菏泽市', '山东省菏泽市', 2, 370000),
(410100, '郑州市', '河南省郑州市', 2, 410000),
(410200, '开封市', '河南省开封市', 2, 410000),
(410300, '洛阳市', '河南省洛阳市', 2, 410000),
(410400, '平顶山市', '河南省平顶山市', 2, 410000),
(410500, '安阳市', '河南省安阳市', 2, 410000),
(410600, '鹤壁市', '河南省鹤壁市', 2, 410000),
(410700, '新乡市', '河南省新乡市', 2, 410000),
(410800, '焦作市', '河南省焦作市', 2, 410000),
(410900, '濮阳市', '河南省濮阳市', 2, 410000),
(411000, '许昌市', '河南省许昌市', 2, 410000),
(411100, '漯河市', '河南省漯河市', 2, 410000),
(411200, '三门峡市', '河南省三门峡市', 2, 410000),
(411300, '南阳市', '河南省南阳市', 2, 410000),
(411400, '商丘市', '河南省商丘市', 2, 410000),
(411500, '信阳市', '河南省信阳市', 2, 410000),
(411600, '周口市', '河南省周口市', 2, 410000),
(411700, '驻马店市', '河南省驻马店市', 2, 410000),
(420100, '武汉市', '湖北省武汉市', 2, 420000),
(420200, '黄石市', '湖北省黄石市', 2, 420000),
(420300, '十堰市', '湖北省十堰市', 2, 420000),
(420500, '宜昌市', '湖北省宜昌市', 2, 420000),
(420600, '襄樊市', '湖北省襄樊市', 2, 420000),
(420700, '鄂州市', '湖北省鄂州市', 2, 420000),
(420800, '荆门市', '湖北省荆门市', 2, 420000),
(420900, '孝感市', '湖北省孝感市', 2, 420000),
(421000, '荆州市', '湖北省荆州市', 2, 420000),
(421100, '黄冈市', '湖北省黄冈市', 2, 420000),
(421200, '咸宁市', '湖北省咸宁市', 2, 420000),
(421300, '随州市', '湖北省随州市', 2, 420000),
(422800, '恩施土家族苗族自治州', '湖北省恩施土家族苗族自治州', 2, 420000),
(429000, '省直辖行政单位', '湖北省省直辖行政单位', 2, 420000),
(430100, '长沙市', '湖南省长沙市', 2, 430000),
(430200, '株洲市', '湖南省株洲市', 2, 430000),
(430300, '湘潭市', '湖南省湘潭市', 2, 430000),
(430400, '衡阳市', '湖南省衡阳市', 2, 430000),
(430500, '邵阳市', '湖南省邵阳市', 2, 430000),
(430600, '岳阳市', '湖南省岳阳市', 2, 430000),
(430700, '常德市', '湖南省常德市', 2, 430000),
(430800, '张家界市', '湖南省张家界市', 2, 430000),
(430900, '益阳市', '湖南省益阳市', 2, 430000),
(431000, '郴州市', '湖南省郴州市', 2, 430000),
(431100, '永州市', '湖南省永州市', 2, 430000),
(431200, '怀化市', '湖南省怀化市', 2, 430000),
(431300, '娄底市', '湖南省娄底市', 2, 430000),
(433100, '湘西土家族苗族自治州', '湖南省湘西土家族苗族自治州', 2, 430000),
(440100, '广州市', '广东省广州市', 2, 440000),
(440200, '韶关市', '广东省韶关市', 2, 440000),
(440300, '深圳市', '广东省深圳市', 2, 440000),
(440400, '珠海市', '广东省珠海市', 2, 440000),
(440500, '汕头市', '广东省汕头市', 2, 440000),
(440600, '佛山市', '广东省佛山市', 2, 440000),
(440700, '江门市', '广东省江门市', 2, 440000),
(440800, '湛江市', '广东省湛江市', 2, 440000),
(440900, '茂名市', '广东省茂名市', 2, 440000),
(441200, '肇庆市', '广东省肇庆市', 2, 440000),
(441300, '惠州市', '广东省惠州市', 2, 440000),
(441400, '梅州市', '广东省梅州市', 2, 440000),
(441500, '汕尾市', '广东省汕尾市', 2, 440000),
(441600, '河源市', '广东省河源市', 2, 440000),
(441700, '阳江市', '广东省阳江市', 2, 440000),
(441800, '清远市', '广东省清远市', 2, 440000),
(441900, '东莞市', '广东省东莞市', 2, 440000),
(442000, '中山市', '广东省中山市', 2, 440000),
(445100, '潮州市', '广东省潮州市', 2, 440000),
(445200, '揭阳市', '广东省揭阳市', 2, 440000),
(445300, '云浮市', '广东省云浮市', 2, 440000),
(450100, '南宁市', '广西省南宁市', 2, 450000),
(450200, '柳州市', '广西省柳州市', 2, 450000),
(450300, '桂林市', '广西省桂林市', 2, 450000),
(450400, '梧州市', '广西省梧州市', 2, 450000),
(450500, '北海市', '广西省北海市', 2, 450000),
(450600, '防城港市', '广西省防城港市', 2, 450000),
(450700, '钦州市', '广西省钦州市', 2, 450000),
(450800, '贵港市', '广西省贵港市', 2, 450000),
(450900, '玉林市', '广西省玉林市', 2, 450000),
(451000, '百色市', '广西省百色市', 2, 450000),
(451100, '贺州市', '广西省贺州市', 2, 450000),
(451200, '河池市', '广西省河池市', 2, 450000),
(451300, '来宾市', '广西省来宾市', 2, 450000),
(451400, '崇左市', '广西省崇左市', 2, 450000),
(460100, '海口市', '海南省海口市', 2, 460000),
(460200, '三亚市', '海南省三亚市', 2, 460000),
(469000, '省直辖县级行政单位', '海南省', 2, 460000),
(500100, '市辖区', '重庆市', 2, 500000),
(500200, '县', '重庆市', 2, 500000),
(500300, '市', '重庆市', 2, 500000),
(510100, '成都市', '四川省成都市', 2, 510000),
(510300, '自贡市', '四川省自贡市', 2, 510000),
(510400, '攀枝花市', '四川省攀枝花市', 2, 510000),
(510500, '泸州市', '四川省泸州市', 2, 510000),
(510600, '德阳市', '四川省德阳市', 2, 510000),
(510700, '绵阳市', '四川省绵阳市', 2, 510000),
(510800, '广元市', '四川省广元市', 2, 510000),
(510900, '遂宁市', '四川省遂宁市', 2, 510000),
(511000, '内江市', '四川省内江市', 2, 510000),
(511100, '乐山市', '四川省乐山市', 2, 510000),
(511300, '南充市', '四川省南充市', 2, 510000),
(511400, '眉山市', '四川省眉山市', 2, 510000),
(511500, '宜宾市', '四川省宜宾市', 2, 510000),
(511600, '广安市', '四川省广安市', 2, 510000),
(511700, '达州市', '四川省达州市', 2, 510000),
(511800, '雅安市', '四川省雅安市', 2, 510000),
(511900, '巴中市', '四川省巴中市', 2, 510000),
(512000, '资阳市', '四川省资阳市', 2, 510000),
(513200, '阿坝藏族羌族自治州', '四川省阿坝藏族羌族自治州', 2, 510000),
(513300, '甘孜藏族自治州', '四川省甘孜藏族自治州', 2, 510000),
(513400, '凉山彝族自治州', '四川省凉山彝族自治州', 2, 510000),
(520100, '贵阳市', '贵州省贵阳市', 2, 520000),
(520200, '六盘水市', '贵州省六盘水市', 2, 520000),
(520300, '遵义市', '贵州省遵义市', 2, 520000),
(520400, '安顺市', '贵州省安顺市', 2, 520000),
(522200, '铜仁地区', '贵州省铜仁地区', 2, 520000),
(522300, '黔西南布依族苗族自治州', '贵州省黔西南布依族苗族自治州', 2, 520000),
(522400, '毕节地区', '贵州省毕节地区', 2, 520000),
(522600, '黔东南苗族侗族自治州', '贵州省黔东南苗族侗族自治州', 2, 520000),
(522700, '黔南布依族苗族自治州', '贵州省黔南布依族苗族自治州', 2, 520000),
(530100, '昆明市', '云南省昆明市', 2, 530000),
(530300, '曲靖市', '云南省曲靖市', 2, 530000),
(530400, '玉溪市', '云南省玉溪市', 2, 530000),
(530500, '保山市', '云南省保山市', 2, 530000),
(530600, '昭通市', '云南省昭通市', 2, 530000),
(530700, '丽江市', '云南省丽江市', 2, 530000),
(530800, '思茅市', '云南省思茅市', 2, 530000),
(530900, '临沧市', '云南省临沧市', 2, 530000),
(532300, '楚雄彝族自治州', '云南省楚雄彝族自治州', 2, 530000),
(532500, '红河哈尼族彝族自治州', '云南省红河哈尼族彝族自治州', 2, 530000),
(532600, '文山壮族苗族自治州', '云南省文山壮族苗族自治州', 2, 530000),
(532800, '西双版纳傣族自治州', '云南省西双版纳傣族自治州', 2, 530000),
(532900, '大理白族自治州', '云南省大理白族自治州', 2, 530000),
(533100, '德宏傣族景颇族自治州', '云南省德宏傣族景颇族自治州', 2, 530000),
(533300, '怒江傈僳族自治州', '云南省怒江傈僳族自治州', 2, 530000),
(533400, '迪庆藏族自治州', '云南省迪庆藏族自治州', 2, 530000),
(540100, '拉萨市', '西藏拉萨市', 2, 540000),
(542100, '昌都地区', '西藏昌都地区', 2, 540000),
(542200, '山南地区', '西藏山南地区', 2, 540000),
(542300, '日喀则地区', '西藏日喀则地区', 2, 540000),
(542400, '那曲地区', '西藏那曲地区', 2, 540000),
(542500, '阿里地区', '西藏阿里地区', 2, 540000),
(542600, '林芝地区', '西藏林芝地区', 2, 540000),
(610100, '西安市', '陕西省西安市', 2, 610000),
(610200, '铜川市', '陕西省铜川市', 2, 610000),
(610300, '宝鸡市', '陕西省宝鸡市', 2, 610000),
(610400, '咸阳市', '陕西省咸阳市', 2, 610000),
(610500, '渭南市', '陕西省渭南市', 2, 610000),
(610600, '延安市', '陕西省延安市', 2, 610000),
(610700, '汉中市', '陕西省汉中市', 2, 610000),
(610800, '榆林市', '陕西省榆林市', 2, 610000),
(610900, '安康市', '陕西省安康市', 2, 610000),
(611000, '商洛市', '陕西省商洛市', 2, 610000),
(620100, '兰州市', '甘肃省兰州市', 2, 620000),
(620200, '嘉峪关市', '甘肃省嘉峪关市', 2, 620000),
(620300, '金昌市', '甘肃省金昌市', 2, 620000),
(620400, '白银市', '甘肃省白银市', 2, 620000),
(620500, '天水市', '甘肃省天水市', 2, 620000),
(620600, '武威市', '甘肃省武威市', 2, 620000),
(620700, '张掖市', '甘肃省张掖市', 2, 620000),
(620800, '平凉市', '甘肃省平凉市', 2, 620000),
(620900, '酒泉市', '甘肃省酒泉市', 2, 620000),
(621000, '庆阳市', '甘肃省庆阳市', 2, 620000),
(621100, '定西市', '甘肃省定西市', 2, 620000),
(621200, '陇南市', '甘肃省陇南市', 2, 620000),
(622900, '临夏回族自治州', '甘肃省临夏回族自治州', 2, 620000),
(623000, '甘南藏族自治州', '甘肃省甘南藏族自治州', 2, 620000),
(630100, '西宁市', '青海省西宁市', 2, 630000),
(632100, '海东地区', '青海省海东地区', 2, 630000),
(632200, '海北藏族自治州', '青海省海北藏族自治州', 2, 630000),
(632300, '黄南藏族自治州', '青海省黄南藏族自治州', 2, 630000),
(632500, '海南藏族自治州', '青海省海南藏族自治州', 2, 630000),
(632600, '果洛藏族自治州', '青海省果洛藏族自治州', 2, 630000),
(632700, '玉树藏族自治州', '青海省玉树藏族自治州', 2, 630000),
(632800, '海西蒙古族藏族自治州', '青海省海西蒙古族藏族自治州', 2, 630000),
(640100, '银川市', '宁夏银川市', 2, 640000),
(640200, '石嘴山市', '宁夏石嘴山市', 2, 640000),
(640300, '吴忠市', '宁夏吴忠市', 2, 640000),
(640400, '固原市', '宁夏固原市', 2, 640000),
(640500, '中卫市', '宁夏中卫市', 2, 640000),
(650100, '乌鲁木齐市', '新疆乌鲁木齐市', 2, 650000),
(650200, '克拉玛依市', '新疆克拉玛依市', 2, 650000),
(652100, '吐鲁番地区', '新疆吐鲁番地区', 2, 650000),
(652200, '哈密地区', '新疆哈密地区', 2, 650000),
(652300, '昌吉回族自治州', '新疆昌吉回族自治州', 2, 650000),
(652700, '博尔塔拉蒙古自治州', '新疆博尔塔拉蒙古自治州', 2, 650000),
(652800, '巴音郭楞蒙古自治州', '新疆巴音郭楞蒙古自治州', 2, 650000),
(652900, '阿克苏地区', '新疆阿克苏地区', 2, 650000),
(653000, '克孜勒苏柯尔克孜自治州', '新疆克孜勒苏柯尔克孜自治州', 2, 650000),
(653100, '喀什地区', '新疆喀什地区', 2, 650000),
(653200, '和田地区', '新疆和田地区', 2, 650000),
(654000, '伊犁哈萨克自治州', '新疆伊犁哈萨克自治州', 2, 650000),
(654200, '塔城地区', '新疆塔城地区', 2, 650000),
(654300, '阿勒泰地区', '新疆阿勒泰地区', 2, 650000),
(659000, '省直辖行政单位', '新疆', 2, 650000),
(110101, '东城区', '北京市东城区', 3, 110100),
(110102, '西城区', '北京市西城区', 3, 110100),
(110103, '崇文区', '北京市崇文区', 3, 110100),
(110104, '宣武区', '北京市宣武区', 3, 110100),
(110105, '朝阳区', '北京市朝阳区', 3, 110100),
(110106, '丰台区', '北京市丰台区', 3, 110100),
(110107, '石景山区', '北京市石景山区', 3, 110100),
(110108, '海淀区', '北京市海淀区', 3, 110100),
(110109, '门头沟区', '北京市门头沟区', 3, 110100),
(110111, '房山区', '北京市房山区', 3, 110100),
(110112, '通州区', '北京市通州区', 3, 110100),
(110113, '顺义区', '北京市顺义区', 3, 110100),
(110114, '昌平区', '北京市昌平区', 3, 110100),
(110115, '大兴区', '北京市大兴区', 3, 110100),
(110116, '怀柔区', '北京市怀柔区', 3, 110100),
(110117, '平谷区', '北京市平谷区', 3, 110100),
(110228, '密云县', '北京市密云县', 3, 110200),
(110229, '延庆县', '北京市延庆县', 3, 110200),
(120101, '和平区', '天津市和平区', 3, 120100),
(120102, '河东区', '天津市河东区', 3, 120100),
(120103, '河西区', '天津市河西区', 3, 120100),
(120104, '南开区', '天津市南开区', 3, 120100),
(120105, '河北区', '天津市河北区', 3, 120100),
(120106, '红桥区', '天津市红桥区', 3, 120100),
(120107, '塘沽区', '天津市塘沽区', 3, 120100),
(120108, '汉沽区', '天津市汉沽区', 3, 120100),
(120109, '大港区', '天津市大港区', 3, 120100),
(120110, '东丽区', '天津市东丽区', 3, 120100),
(120111, '西青区', '天津市西青区', 3, 120100),
(120112, '津南区', '天津市津南区', 3, 120100),
(120113, '北辰区', '天津市北辰区', 3, 120100),
(120114, '武清区', '天津市武清区', 3, 120100),
(120115, '宝坻区', '天津市宝坻区', 3, 120100),
(120221, '宁河县', '天津市宁河县', 3, 120200),
(120223, '静海县', '天津市静海县', 3, 120200),
(120225, '蓟　县', '天津市蓟县', 3, 120200),
(130101, '市辖区', '河北省石家庄市市辖区', 3, 130100),
(130102, '长安区', '河北省石家庄市长安区', 3, 130100),
(130103, '桥东区', '河北省石家庄市桥东区', 3, 130100),
(130104, '桥西区', '河北省石家庄市桥西区', 3, 130100),
(130105, '新华区', '河北省石家庄市新华区', 3, 130100),
(130107, '井陉矿区', '河北省石家庄市井陉矿区', 3, 130100),
(130108, '裕华区', '河北省石家庄市裕华区', 3, 130100),
(130121, '井陉县', '河北省石家庄市井陉县', 3, 130100),
(130123, '正定县', '河北省石家庄市正定县', 3, 130100),
(130124, '栾城县', '河北省石家庄市栾城县', 3, 130100),
(130125, '行唐县', '河北省石家庄市行唐县', 3, 130100),
(130126, '灵寿县', '河北省石家庄市灵寿县', 3, 130100),
(130127, '高邑县', '河北省石家庄市高邑县', 3, 130100),
(130128, '深泽县', '河北省石家庄市深泽县', 3, 130100),
(130129, '赞皇县', '河北省石家庄市赞皇县', 3, 130100),
(130130, '无极县', '河北省石家庄市无极县', 3, 130100),
(130131, '平山县', '河北省石家庄市平山县', 3, 130100),
(130132, '元氏县', '河北省石家庄市元氏县', 3, 130100),
(130133, '赵　县', '河北省石家庄市赵县', 3, 130100),
(130181, '辛集市', '河北省石家庄市辛集市', 3, 130100),
(130182, '藁城市', '河北省石家庄市藁城市', 3, 130100),
(130183, '晋州市', '河北省石家庄市晋州市', 3, 130100),
(130184, '新乐市', '河北省石家庄市新乐市', 3, 130100),
(130185, '鹿泉市', '河北省石家庄市鹿泉市', 3, 130100),
(130201, '市辖区', '河北省唐山市市辖区', 3, 130200),
(130202, '路南区', '河北省唐山市路南区', 3, 130200),
(130203, '路北区', '河北省唐山市路北区', 3, 130200),
(130204, '古冶区', '河北省唐山市古冶区', 3, 130200),
(130205, '开平区', '河北省唐山市开平区', 3, 130200),
(130207, '丰南区', '河北省唐山市丰南区', 3, 130200),
(130208, '丰润区', '河北省唐山市丰润区', 3, 130200),
(130223, '滦　县', '河北省唐山市滦县', 3, 130200),
(130224, '滦南县', '河北省唐山市滦南县', 3, 130200),
(130225, '乐亭县', '河北省唐山市乐亭县', 3, 130200),
(130227, '迁西县', '河北省唐山市迁西县', 3, 130200),
(130229, '玉田县', '河北省唐山市玉田县', 3, 130200),
(130230, '唐海县', '河北省唐山市唐海县', 3, 130200),
(130281, '遵化市', '河北省唐山市遵化市', 3, 130200),
(130283, '迁安市', '河北省唐山市迁安市', 3, 130200),
(130301, '市辖区', '河北省秦皇岛市市辖区', 3, 130300),
(130302, '海港区', '河北省秦皇岛市海港区', 3, 130300),
(130303, '山海关区', '河北省秦皇岛市山海关区', 3, 130300),
(130304, '北戴河区', '河北省秦皇岛市北戴河区', 3, 130300),
(130321, '青龙满族自治县', '河北省秦皇岛市青龙满族自治县', 3, 130300),
(130322, '昌黎县', '河北省秦皇岛市昌黎县', 3, 130300),
(130323, '抚宁县', '河北省秦皇岛市抚宁县', 3, 130300),
(130324, '卢龙县', '河北省秦皇岛市卢龙县', 3, 130300),
(130401, '市辖区', '河北省邯郸市市辖区', 3, 130400),
(130402, '邯山区', '河北省邯郸市邯山区', 3, 130400),
(130403, '丛台区', '河北省邯郸市丛台区', 3, 130400),
(130404, '复兴区', '河北省邯郸市复兴区', 3, 130400),
(130406, '峰峰矿区', '河北省邯郸市峰峰矿区', 3, 130400),
(130421, '邯郸县', '河北省邯郸市邯郸县', 3, 130400),
(130423, '临漳县', '河北省邯郸市临漳县', 3, 130400),
(130424, '成安县', '河北省邯郸市成安县', 3, 130400),
(130425, '大名县', '河北省邯郸市大名县', 3, 130400),
(130426, '涉　县', '河北省邯郸市涉县', 3, 130400),
(130427, '磁　县', '河北省邯郸市磁县', 3, 130400),
(130428, '肥乡县', '河北省邯郸市肥乡县', 3, 130400),
(130429, '永年县', '河北省邯郸市永年县', 3, 130400),
(130430, '邱　县', '河北省邯郸市邱县', 3, 130400),
(130431, '鸡泽县', '河北省邯郸市鸡泽县', 3, 130400),
(130432, '广平县', '河北省邯郸市广平县', 3, 130400),
(130433, '馆陶县', '河北省邯郸市馆陶县', 3, 130400),
(130434, '魏　县', '河北省邯郸市魏县', 3, 130400),
(130435, '曲周县', '河北省邯郸市曲周县', 3, 130400),
(130481, '武安市', '河北省邯郸市武安市', 3, 130400),
(130501, '市辖区', '河北省邢台市市辖区', 3, 130500),
(130502, '桥东区', '河北省邢台市桥东区', 3, 130500),
(130503, '桥西区', '河北省邢台市桥西区', 3, 130500),
(130521, '邢台县', '河北省邢台市邢台县', 3, 130500),
(130522, '临城县', '河北省邢台市临城县', 3, 130500),
(130523, '内丘县', '河北省邢台市内丘县', 3, 130500),
(130524, '柏乡县', '河北省邢台市柏乡县', 3, 130500),
(130525, '隆尧县', '河北省邢台市隆尧县', 3, 130500),
(130526, '任　县', '河北省邢台市任县', 3, 130500),
(130527, '南和县', '河北省邢台市南和县', 3, 130500),
(130528, '宁晋县', '河北省邢台市宁晋县', 3, 130500),
(130529, '巨鹿县', '河北省邢台市巨鹿县', 3, 130500),
(130530, '新河县', '河北省邢台市新河县', 3, 130500),
(130531, '广宗县', '河北省邢台市广宗县', 3, 130500),
(130532, '平乡县', '河北省邢台市平乡县', 3, 130500),
(130533, '威　县', '河北省邢台市威县', 3, 130500),
(130534, '清河县', '河北省邢台市清河县', 3, 130500),
(130535, '临西县', '河北省邢台市临西县', 3, 130500),
(130581, '南宫市', '河北省邢台市南宫市', 3, 130500),
(130582, '沙河市', '河北省邢台市沙河市', 3, 130500),
(130601, '市辖区', '河北省保定市市辖区', 3, 130600),
(130602, '新市区', '河北省保定市新市区', 3, 130600),
(130603, '北市区', '河北省保定市北市区', 3, 130600),
(130604, '南市区', '河北省保定市南市区', 3, 130600),
(130621, '满城县', '河北省保定市满城县', 3, 130600),
(130622, '清苑县', '河北省保定市清苑县', 3, 130600),
(130623, '涞水县', '河北省保定市涞水县', 3, 130600),
(130624, '阜平县', '河北省保定市阜平县', 3, 130600),
(130625, '徐水县', '河北省保定市徐水县', 3, 130600),
(130626, '定兴县', '河北省保定市定兴县', 3, 130600),
(130627, '唐　县', '河北省保定市唐县', 3, 130600),
(130628, '高阳县', '河北省保定市高阳县', 3, 130600),
(130629, '容城县', '河北省保定市容城县', 3, 130600),
(130630, '涞源县', '河北省保定市涞源县', 3, 130600),
(130631, '望都县', '河北省保定市望都县', 3, 130600),
(130632, '安新县', '河北省保定市安新县', 3, 130600),
(130633, '易　县', '河北省保定市易县', 3, 130600),
(130634, '曲阳县', '河北省保定市曲阳县', 3, 130600),
(130635, '蠡　县', '河北省保定市蠡县', 3, 130600),
(130636, '顺平县', '河北省保定市顺平县', 3, 130600),
(130637, '博野县', '河北省保定市博野县', 3, 130600),
(130638, '雄　县', '河北省保定市雄县', 3, 130600),
(130681, '涿州市', '河北省保定市涿州市', 3, 130600),
(130682, '定州市', '河北省保定市定州市', 3, 130600),
(130683, '安国市', '河北省保定市安国市', 3, 130600),
(130684, '高碑店市', '河北省保定市高碑店市', 3, 130600),
(130701, '市辖区', '河北省张家口市市辖区', 3, 130700),
(130702, '桥东区', '河北省张家口市桥东区', 3, 130700),
(130703, '桥西区', '河北省张家口市桥西区', 3, 130700),
(130705, '宣化区', '河北省张家口市宣化区', 3, 130700),
(130706, '下花园区', '河北省张家口市下花园区', 3, 130700),
(130721, '宣化县', '河北省张家口市宣化县', 3, 130700),
(130722, '张北县', '河北省张家口市张北县', 3, 130700),
(130723, '康保县', '河北省张家口市康保县', 3, 130700),
(130724, '沽源县', '河北省张家口市沽源县', 3, 130700),
(130725, '尚义县', '河北省张家口市尚义县', 3, 130700),
(130726, '蔚　县', '河北省张家口市蔚县', 3, 130700),
(130727, '阳原县', '河北省张家口市阳原县', 3, 130700),
(130728, '怀安县', '河北省张家口市怀安县', 3, 130700),
(130729, '万全县', '河北省张家口市万全县', 3, 130700),
(130730, '怀来县', '河北省张家口市怀来县', 3, 130700),
(130731, '涿鹿县', '河北省张家口市涿鹿县', 3, 130700),
(130732, '赤城县', '河北省张家口市赤城县', 3, 130700),
(130733, '崇礼县', '河北省张家口市崇礼县', 3, 130700),
(130801, '市辖区', '河北省承德市市辖区', 3, 130800),
(130802, '双桥区', '河北省承德市双桥区', 3, 130800),
(130803, '双滦区', '河北省承德市双滦区', 3, 130800),
(130804, '鹰手营子矿区', '河北省承德市鹰手营子矿区', 3, 130800),
(130821, '承德县', '河北省承德市承德县', 3, 130800),
(130822, '兴隆县', '河北省承德市兴隆县', 3, 130800),
(130823, '平泉县', '河北省承德市平泉县', 3, 130800),
(130824, '滦平县', '河北省承德市滦平县', 3, 130800),
(130825, '隆化县', '河北省承德市隆化县', 3, 130800),
(130826, '丰宁满族自治县', '河北省承德市丰宁满族自治县', 3, 130800),
(130827, '宽城满族自治县', '河北省承德市宽城满族自治县', 3, 130800),
(130828, '围场满族蒙古族自治县', '河北省承德市围场满族蒙古族自治县', 3, 130800),
(130901, '市辖区', '河北省沧州市市辖区', 3, 130900),
(130902, '新华区', '河北省沧州市新华区', 3, 130900),
(130903, '运河区', '河北省沧州市运河区', 3, 130900),
(130921, '沧　县', '河北省沧州市沧县', 3, 130900),
(130922, '青　县', '河北省沧州市青县', 3, 130900),
(130923, '东光县', '河北省沧州市东光县', 3, 130900),
(130924, '海兴县', '河北省沧州市海兴县', 3, 130900),
(130925, '盐山县', '河北省沧州市盐山县', 3, 130900),
(130926, '肃宁县', '河北省沧州市肃宁县', 3, 130900),
(130927, '南皮县', '河北省沧州市南皮县', 3, 130900),
(130928, '吴桥县', '河北省沧州市吴桥县', 3, 130900),
(130929, '献　县', '河北省沧州市献县', 3, 130900),
(130930, '孟村回族自治县', '河北省沧州市孟村回族自治县', 3, 130900),
(130981, '泊头市', '河北省沧州市泊头市', 3, 130900),
(130982, '任丘市', '河北省沧州市任丘市', 3, 130900),
(130983, '黄骅市', '河北省沧州市黄骅市', 3, 130900),
(130984, '河间市', '河北省沧州市河间市', 3, 130900),
(131001, '市辖区', '河北省廊坊市市辖区', 3, 131000),
(131002, '安次区', '河北省廊坊市安次区', 3, 131000),
(131003, '广阳区', '河北省廊坊市广阳区', 3, 131000),
(131022, '固安县', '河北省廊坊市固安县', 3, 131000),
(131023, '永清县', '河北省廊坊市永清县', 3, 131000),
(131024, '香河县', '河北省廊坊市香河县', 3, 131000),
(131025, '大城县', '河北省廊坊市大城县', 3, 131000),
(131026, '文安县', '河北省廊坊市文安县', 3, 131000),
(131028, '大厂回族自治县', '河北省廊坊市大厂回族自治县', 3, 131000),
(131081, '霸州市', '河北省廊坊市霸州市', 3, 131000),
(131082, '三河市', '河北省廊坊市三河市', 3, 131000),
(131101, '市辖区', '河北省衡水市市辖区', 3, 131100),
(131102, '桃城区', '河北省衡水市桃城区', 3, 131100),
(131121, '枣强县', '河北省衡水市枣强县', 3, 131100),
(131122, '武邑县', '河北省衡水市武邑县', 3, 131100),
(131123, '武强县', '河北省衡水市武强县', 3, 131100),
(131124, '饶阳县', '河北省衡水市饶阳县', 3, 131100),
(131125, '安平县', '河北省衡水市安平县', 3, 131100),
(131126, '故城县', '河北省衡水市故城县', 3, 131100),
(131127, '景　县', '河北省衡水市景县', 3, 131100),
(131128, '阜城县', '河北省衡水市阜城县', 3, 131100),
(131181, '冀州市', '河北省衡水市冀州市', 3, 131100),
(131182, '深州市', '河北省衡水市深州市', 3, 131100),
(140101, '市辖区', '山西省太原市市辖区', 3, 140100),
(140105, '小店区', '山西省太原市小店区', 3, 140100),
(140106, '迎泽区', '山西省太原市迎泽区', 3, 140100),
(140107, '杏花岭区', '山西省太原市杏花岭区', 3, 140100),
(140108, '尖草坪区', '山西省太原市尖草坪区', 3, 140100),
(140109, '万柏林区', '山西省太原市万柏林区', 3, 140100),
(140110, '晋源区', '山西省太原市晋源区', 3, 140100),
(140121, '清徐县', '山西省太原市清徐县', 3, 140100),
(140122, '阳曲县', '山西省太原市阳曲县', 3, 140100),
(140123, '娄烦县', '山西省太原市娄烦县', 3, 140100),
(140181, '古交市', '山西省太原市古交市', 3, 140100),
(140201, '市辖区', '山西省大同市市辖区', 3, 140200),
(140202, '城　区', '山西省大同市城区', 3, 140200),
(140203, '矿　区', '山西省大同市矿区', 3, 140200),
(140211, '南郊区', '山西省大同市南郊区', 3, 140200),
(140212, '新荣区', '山西省大同市新荣区', 3, 140200),
(140221, '阳高县', '山西省大同市阳高县', 3, 140200),
(140222, '天镇县', '山西省大同市天镇县', 3, 140200),
(140223, '广灵县', '山西省大同市广灵县', 3, 140200),
(140224, '灵丘县', '山西省大同市灵丘县', 3, 140200),
(140225, '浑源县', '山西省大同市浑源县', 3, 140200),
(140226, '左云县', '山西省大同市左云县', 3, 140200),
(140227, '大同县', '山西省大同市大同县', 3, 140200),
(140301, '市辖区', '山西省阳泉市市辖区', 3, 140300),
(140302, '城　区', '山西省阳泉市城区', 3, 140300),
(140303, '矿　区', '山西省阳泉市矿区', 3, 140300),
(140311, '郊　区', '山西省阳泉市郊区', 3, 140300),
(140321, '平定县', '山西省阳泉市平定县', 3, 140300),
(140322, '盂　县', '山西省阳泉市盂县', 3, 140300),
(140401, '市辖区', '山西省长治市市辖区', 3, 140400),
(140402, '城　区', '山西省长治市城区', 3, 140400),
(140411, '郊　区', '山西省长治市郊区', 3, 140400),
(140421, '长治县', '山西省长治市长治县', 3, 140400),
(140423, '襄垣县', '山西省长治市襄垣县', 3, 140400),
(140424, '屯留县', '山西省长治市屯留县', 3, 140400),
(140425, '平顺县', '山西省长治市平顺县', 3, 140400),
(140426, '黎城县', '山西省长治市黎城县', 3, 140400),
(140427, '壶关县', '山西省长治市壶关县', 3, 140400),
(140428, '长子县', '山西省长治市长子县', 3, 140400),
(140429, '武乡县', '山西省长治市武乡县', 3, 140400),
(140430, '沁　县', '山西省长治市沁县', 3, 140400),
(140431, '沁源县', '山西省长治市沁源县', 3, 140400),
(140481, '潞城市', '山西省长治市潞城市', 3, 140400),
(140501, '市辖区', '山西省晋城市市辖区', 3, 140500),
(140502, '城　区', '山西省晋城市城区', 3, 140500),
(140521, '沁水县', '山西省晋城市沁水县', 3, 140500),
(140522, '阳城县', '山西省晋城市阳城县', 3, 140500),
(140524, '陵川县', '山西省晋城市陵川县', 3, 140500),
(140525, '泽州县', '山西省晋城市泽州县', 3, 140500),
(140581, '高平市', '山西省晋城市高平市', 3, 140500),
(140601, '市辖区', '山西省朔州市市辖区', 3, 140600),
(140602, '朔城区', '山西省朔州市朔城区', 3, 140600),
(140603, '平鲁区', '山西省朔州市平鲁区', 3, 140600),
(140621, '山阴县', '山西省朔州市山阴县', 3, 140600),
(140622, '应　县', '山西省朔州市应县', 3, 140600),
(140623, '右玉县', '山西省朔州市右玉县', 3, 140600),
(140624, '怀仁县', '山西省朔州市怀仁县', 3, 140600),
(140701, '市辖区', '山西省晋中市市辖区', 3, 140700),
(140702, '榆次区', '山西省晋中市榆次区', 3, 140700),
(140721, '榆社县', '山西省晋中市榆社县', 3, 140700),
(140722, '左权县', '山西省晋中市左权县', 3, 140700),
(140723, '和顺县', '山西省晋中市和顺县', 3, 140700),
(140724, '昔阳县', '山西省晋中市昔阳县', 3, 140700),
(140725, '寿阳县', '山西省晋中市寿阳县', 3, 140700),
(140726, '太谷县', '山西省晋中市太谷县', 3, 140700),
(140727, '祁　县', '山西省晋中市祁县', 3, 140700),
(140728, '平遥县', '山西省晋中市平遥县', 3, 140700),
(140729, '灵石县', '山西省晋中市灵石县', 3, 140700),
(140781, '介休市', '山西省晋中市介休市', 3, 140700),
(140801, '市辖区', '山西省运城市市辖区', 3, 140800),
(140802, '盐湖区', '山西省运城市盐湖区', 3, 140800),
(140821, '临猗县', '山西省运城市临猗县', 3, 140800),
(140822, '万荣县', '山西省运城市万荣县', 3, 140800),
(140823, '闻喜县', '山西省运城市闻喜县', 3, 140800),
(140824, '稷山县', '山西省运城市稷山县', 3, 140800),
(140825, '新绛县', '山西省运城市新绛县', 3, 140800),
(140826, '绛　县', '山西省运城市绛县', 3, 140800),
(140827, '垣曲县', '山西省运城市垣曲县', 3, 140800),
(140828, '夏　县', '山西省运城市夏县', 3, 140800),
(140829, '平陆县', '山西省运城市平陆县', 3, 140800),
(140830, '芮城县', '山西省运城市芮城县', 3, 140800),
(140881, '永济市', '山西省运城市永济市', 3, 140800),
(140882, '河津市', '山西省运城市河津市', 3, 140800),
(140901, '市辖区', '山西省忻州市市辖区', 3, 140900),
(140902, '忻府区', '山西省忻州市忻府区', 3, 140900),
(140921, '定襄县', '山西省忻州市定襄县', 3, 140900),
(140922, '五台县', '山西省忻州市五台县', 3, 140900),
(140923, '代　县', '山西省忻州市代县', 3, 140900),
(140924, '繁峙县', '山西省忻州市繁峙县', 3, 140900),
(140925, '宁武县', '山西省忻州市宁武县', 3, 140900),
(140926, '静乐县', '山西省忻州市静乐县', 3, 140900),
(140927, '神池县', '山西省忻州市神池县', 3, 140900),
(140928, '五寨县', '山西省忻州市五寨县', 3, 140900),
(140929, '岢岚县', '山西省忻州市岢岚县', 3, 140900),
(140930, '河曲县', '山西省忻州市河曲县', 3, 140900),
(140931, '保德县', '山西省忻州市保德县', 3, 140900),
(140932, '偏关县', '山西省忻州市偏关县', 3, 140900),
(140981, '原平市', '山西省忻州市原平市', 3, 140900),
(141001, '市辖区', '山西省临汾市市辖区', 3, 141000),
(141002, '尧都区', '山西省临汾市尧都区', 3, 141000),
(141021, '曲沃县', '山西省临汾市曲沃县', 3, 141000),
(141022, '翼城县', '山西省临汾市翼城县', 3, 141000),
(141023, '襄汾县', '山西省临汾市襄汾县', 3, 141000),
(141024, '洪洞县', '山西省临汾市洪洞县', 3, 141000),
(141025, '古　县', '山西省临汾市古县', 3, 141000),
(141026, '安泽县', '山西省临汾市安泽县', 3, 141000),
(141027, '浮山县', '山西省临汾市浮山县', 3, 141000),
(141028, '吉　县', '山西省临汾市吉县', 3, 141000),
(141029, '乡宁县', '山西省临汾市乡宁县', 3, 141000),
(141030, '大宁县', '山西省临汾市大宁县', 3, 141000),
(141031, '隰　县', '山西省临汾市隰县', 3, 141000),
(141032, '永和县', '山西省临汾市永和县', 3, 141000),
(141033, '蒲　县', '山西省临汾市蒲县', 3, 141000),
(141034, '汾西县', '山西省临汾市汾西县', 3, 141000),
(141081, '侯马市', '山西省临汾市侯马市', 3, 141000),
(141082, '霍州市', '山西省临汾市霍州市', 3, 141000),
(141101, '市辖区', '山西省吕梁市市辖区', 3, 141100),
(141102, '离石区', '山西省吕梁市离石区', 3, 141100),
(141121, '文水县', '山西省吕梁市文水县', 3, 141100),
(141122, '交城县', '山西省吕梁市交城县', 3, 141100),
(141123, '兴　县', '山西省吕梁市兴县', 3, 141100),
(141124, '临　县', '山西省吕梁市临县', 3, 141100),
(141125, '柳林县', '山西省吕梁市柳林县', 3, 141100),
(141126, '石楼县', '山西省吕梁市石楼县', 3, 141100),
(141127, '岚　县', '山西省吕梁市岚县', 3, 141100),
(141128, '方山县', '山西省吕梁市方山县', 3, 141100),
(141129, '中阳县', '山西省吕梁市中阳县', 3, 141100),
(141130, '交口县', '山西省吕梁市交口县', 3, 141100),
(141181, '孝义市', '山西省吕梁市孝义市', 3, 141100),
(141182, '汾阳市', '山西省吕梁市汾阳市', 3, 141100),
(150101, '市辖区', '内蒙古呼和浩特市市辖区', 3, 150100),
(150102, '新城区', '内蒙古呼和浩特市新城区', 3, 150100),
(150103, '回民区', '内蒙古呼和浩特市回民区', 3, 150100),
(150104, '玉泉区', '内蒙古呼和浩特市玉泉区', 3, 150100),
(150105, '赛罕区', '内蒙古呼和浩特市赛罕区', 3, 150100),
(150121, '土默特左旗', '内蒙古呼和浩特市土默特左旗', 3, 150100),
(150122, '托克托县', '内蒙古呼和浩特市托克托县', 3, 150100),
(150123, '和林格尔县', '内蒙古呼和浩特市和林格尔县', 3, 150100),
(150124, '清水河县', '内蒙古呼和浩特市清水河县', 3, 150100),
(150125, '武川县', '内蒙古呼和浩特市武川县', 3, 150100),
(150201, '市辖区', '内蒙古包头市市辖区', 3, 150200),
(150202, '东河区', '内蒙古包头市东河区', 3, 150200),
(150203, '昆都仑区', '内蒙古包头市昆都仑区', 3, 150200),
(150204, '青山区', '内蒙古包头市青山区', 3, 150200),
(150205, '石拐区', '内蒙古包头市石拐区', 3, 150200),
(150206, '白云矿区', '内蒙古包头市白云矿区', 3, 150200),
(150207, '九原区', '内蒙古包头市九原区', 3, 150200),
(150221, '土默特右旗', '内蒙古包头市土默特右旗', 3, 150200),
(150222, '固阳县', '内蒙古包头市固阳县', 3, 150200),
(150223, '达尔罕茂明安联合旗', '内蒙古包头市达尔罕茂明安联合旗', 3, 150200),
(150301, '市辖区', '内蒙古乌海市市辖区', 3, 150300),
(150302, '海勃湾区', '内蒙古乌海市海勃湾区', 3, 150300),
(150303, '海南区', '内蒙古乌海市海南区', 3, 150300),
(150304, '乌达区', '内蒙古乌海市乌达区', 3, 150300),
(150401, '市辖区', '内蒙古赤峰市市辖区', 3, 150400),
(150402, '红山区', '内蒙古赤峰市红山区', 3, 150400),
(150403, '元宝山区', '内蒙古赤峰市元宝山区', 3, 150400),
(150404, '松山区', '内蒙古赤峰市松山区', 3, 150400),
(150421, '阿鲁科尔沁旗', '内蒙古赤峰市阿鲁科尔沁旗', 3, 150400),
(150422, '巴林左旗', '内蒙古赤峰市巴林左旗', 3, 150400),
(150423, '巴林右旗', '内蒙古赤峰市巴林右旗', 3, 150400),
(150424, '林西县', '内蒙古赤峰市林西县', 3, 150400),
(150425, '克什克腾旗', '内蒙古赤峰市克什克腾旗', 3, 150400),
(150426, '翁牛特旗', '内蒙古赤峰市翁牛特旗', 3, 150400),
(150428, '喀喇沁旗', '内蒙古赤峰市喀喇沁旗', 3, 150400),
(150429, '宁城县', '内蒙古赤峰市宁城县', 3, 150400),
(150430, '敖汉旗', '内蒙古赤峰市敖汉旗', 3, 150400),
(150501, '市辖区', '内蒙古通辽市市辖区', 3, 150500),
(150502, '科尔沁区', '内蒙古通辽市科尔沁区', 3, 150500),
(150521, '科尔沁左翼中旗', '内蒙古通辽市科尔沁左翼中旗', 3, 150500),
(150522, '科尔沁左翼后旗', '内蒙古通辽市科尔沁左翼后旗', 3, 150500),
(150523, '开鲁县', '内蒙古通辽市开鲁县', 3, 150500),
(150524, '库伦旗', '内蒙古通辽市库伦旗', 3, 150500),
(150525, '奈曼旗', '内蒙古通辽市奈曼旗', 3, 150500),
(150526, '扎鲁特旗', '内蒙古通辽市扎鲁特旗', 3, 150500),
(150581, '霍林郭勒市', '内蒙古通辽市霍林郭勒市', 3, 150500),
(150602, '东胜区', '内蒙古鄂尔多斯市东胜区', 3, 150600),
(150621, '达拉特旗', '内蒙古鄂尔多斯市达拉特旗', 3, 150600),
(150622, '准格尔旗', '内蒙古鄂尔多斯市准格尔旗', 3, 150600),
(150623, '鄂托克前旗', '内蒙古鄂尔多斯市鄂托克前旗', 3, 150600),
(150624, '鄂托克旗', '内蒙古鄂尔多斯市鄂托克旗', 3, 150600),
(150625, '杭锦旗', '内蒙古鄂尔多斯市杭锦旗', 3, 150600),
(150626, '乌审旗', '内蒙古鄂尔多斯市乌审旗', 3, 150600),
(150627, '伊金霍洛旗', '内蒙古鄂尔多斯市伊金霍洛旗', 3, 150600),
(150701, '市辖区', '内蒙古呼伦贝尔市市辖区', 3, 150700),
(150702, '海拉尔区', '内蒙古呼伦贝尔市海拉尔区', 3, 150700),
(150721, '阿荣旗', '内蒙古呼伦贝尔市阿荣旗', 3, 150700),
(150722, '莫力达瓦达斡尔族自治旗', '内蒙古呼伦贝尔市莫力达瓦达斡尔族自治旗', 3, 150700),
(150723, '鄂伦春自治旗', '内蒙古呼伦贝尔市鄂伦春自治旗', 3, 150700),
(150724, '鄂温克族自治旗', '内蒙古呼伦贝尔市鄂温克族自治旗', 3, 150700),
(150725, '陈巴尔虎旗', '内蒙古呼伦贝尔市陈巴尔虎旗', 3, 150700),
(150726, '新巴尔虎左旗', '内蒙古呼伦贝尔市新巴尔虎左旗', 3, 150700),
(150727, '新巴尔虎右旗', '内蒙古呼伦贝尔市新巴尔虎右旗', 3, 150700),
(150781, '满洲里市', '内蒙古呼伦贝尔市满洲里市', 3, 150700),
(150782, '牙克石市', '内蒙古呼伦贝尔市牙克石市', 3, 150700),
(150783, '扎兰屯市', '内蒙古呼伦贝尔市扎兰屯市', 3, 150700),
(150784, '额尔古纳市', '内蒙古呼伦贝尔市额尔古纳市', 3, 150700),
(150785, '根河市', '内蒙古呼伦贝尔市根河市', 3, 150700),
(150801, '市辖区', '内蒙古巴彦淖尔市市辖区', 3, 150800),
(150802, '临河区', '内蒙古巴彦淖尔市临河区', 3, 150800),
(150821, '五原县', '内蒙古巴彦淖尔市五原县', 3, 150800),
(150822, '磴口县', '内蒙古巴彦淖尔市磴口县', 3, 150800),
(150823, '乌拉特前旗', '内蒙古巴彦淖尔市乌拉特前旗', 3, 150800),
(150824, '乌拉特中旗', '内蒙古巴彦淖尔市乌拉特中旗', 3, 150800),
(150825, '乌拉特后旗', '内蒙古巴彦淖尔市乌拉特后旗', 3, 150800),
(150826, '杭锦后旗', '内蒙古巴彦淖尔市杭锦后旗', 3, 150800),
(150901, '市辖区', '内蒙古乌兰察布市市辖区', 3, 150900),
(150902, '集宁区', '内蒙古乌兰察布市集宁区', 3, 150900),
(150921, '卓资县', '内蒙古乌兰察布市卓资县', 3, 150900),
(150922, '化德县', '内蒙古乌兰察布市化德县', 3, 150900),
(150923, '商都县', '内蒙古乌兰察布市商都县', 3, 150900),
(150924, '兴和县', '内蒙古乌兰察布市兴和县', 3, 150900),
(150925, '凉城县', '内蒙古乌兰察布市凉城县', 3, 150900),
(150926, '察哈尔右翼前旗', '内蒙古乌兰察布市察哈尔右翼前旗', 3, 150900),
(150927, '察哈尔右翼中旗', '内蒙古乌兰察布市察哈尔右翼中旗', 3, 150900),
(150928, '察哈尔右翼后旗', '内蒙古乌兰察布市察哈尔右翼后旗', 3, 150900),
(150929, '四子王旗', '内蒙古乌兰察布市四子王旗', 3, 150900),
(150981, '丰镇市', '内蒙古乌兰察布市丰镇市', 3, 150900),
(152201, '乌兰浩特市', '内蒙古兴安盟乌兰浩特市', 3, 152200),
(152202, '阿尔山市', '内蒙古兴安盟阿尔山市', 3, 152200),
(152221, '科尔沁右翼前旗', '内蒙古兴安盟科尔沁右翼前旗', 3, 152200),
(152222, '科尔沁右翼中旗', '内蒙古兴安盟科尔沁右翼中旗', 3, 152200),
(152223, '扎赉特旗', '内蒙古兴安盟扎赉特旗', 3, 152200),
(152224, '突泉县', '内蒙古兴安盟突泉县', 3, 152200),
(152501, '二连浩特市', '内蒙古锡林郭勒盟二连浩特市', 3, 152500),
(152502, '锡林浩特市', '内蒙古锡林郭勒盟锡林浩特市', 3, 152500),
(152522, '阿巴嘎旗', '内蒙古锡林郭勒盟阿巴嘎旗', 3, 152500),
(152523, '苏尼特左旗', '内蒙古锡林郭勒盟苏尼特左旗', 3, 152500),
(152524, '苏尼特右旗', '内蒙古锡林郭勒盟苏尼特右旗', 3, 152500),
(152525, '东乌珠穆沁旗', '内蒙古锡林郭勒盟东乌珠穆沁旗', 3, 152500),
(152526, '西乌珠穆沁旗', '内蒙古锡林郭勒盟西乌珠穆沁旗', 3, 152500),
(152527, '太仆寺旗', '内蒙古锡林郭勒盟太仆寺旗', 3, 152500),
(152528, '镶黄旗', '内蒙古锡林郭勒盟镶黄旗', 3, 152500),
(152529, '正镶白旗', '内蒙古锡林郭勒盟正镶白旗', 3, 152500),
(152530, '正蓝旗', '内蒙古锡林郭勒盟正蓝旗', 3, 152500),
(152531, '多伦县', '内蒙古锡林郭勒盟多伦县', 3, 152500),
(152921, '阿拉善左旗', '内蒙古阿拉善盟阿拉善左旗', 3, 152900),
(152922, '阿拉善右旗', '内蒙古阿拉善盟阿拉善右旗', 3, 152900),
(152923, '额济纳旗', '内蒙古阿拉善盟额济纳旗', 3, 152900),
(210101, '市辖区', '辽宁省沈阳市市辖区', 3, 210100),
(210102, '和平区', '辽宁省沈阳市和平区', 3, 210100),
(210103, '沈河区', '辽宁省沈阳市沈河区', 3, 210100),
(210104, '大东区', '辽宁省沈阳市大东区', 3, 210100),
(210105, '皇姑区', '辽宁省沈阳市皇姑区', 3, 210100),
(210106, '铁西区', '辽宁省沈阳市铁西区', 3, 210100),
(210111, '苏家屯区', '辽宁省沈阳市苏家屯区', 3, 210100),
(210112, '东陵区', '辽宁省沈阳市东陵区', 3, 210100),
(210113, '新城子区', '辽宁省沈阳市新城子区', 3, 210100),
(210114, '于洪区', '辽宁省沈阳市于洪区', 3, 210100),
(210122, '辽中县', '辽宁省沈阳市辽中县', 3, 210100),
(210123, '康平县', '辽宁省沈阳市康平县', 3, 210100),
(210124, '法库县', '辽宁省沈阳市法库县', 3, 210100),
(210181, '新民市', '辽宁省沈阳市新民市', 3, 210100),
(210201, '市辖区', '辽宁省大连市市辖区', 3, 210200),
(210202, '中山区', '辽宁省大连市中山区', 3, 210200),
(210203, '西岗区', '辽宁省大连市西岗区', 3, 210200),
(210204, '沙河口区', '辽宁省大连市沙河口区', 3, 210200),
(210211, '甘井子区', '辽宁省大连市甘井子区', 3, 210200),
(210212, '旅顺口区', '辽宁省大连市旅顺口区', 3, 210200),
(210213, '金州区', '辽宁省大连市金州区', 3, 210200),
(210224, '长海县', '辽宁省大连市长海县', 3, 210200),
(210281, '瓦房店市', '辽宁省大连市瓦房店市', 3, 210200),
(210282, '普兰店市', '辽宁省大连市普兰店市', 3, 210200),
(210283, '庄河市', '辽宁省大连市庄河市', 3, 210200),
(210301, '市辖区', '辽宁省鞍山市市辖区', 3, 210300),
(210302, '铁东区', '辽宁省鞍山市铁东区', 3, 210300),
(210303, '铁西区', '辽宁省鞍山市铁西区', 3, 210300),
(210304, '立山区', '辽宁省鞍山市立山区', 3, 210300),
(210311, '千山区', '辽宁省鞍山市千山区', 3, 210300),
(210321, '台安县', '辽宁省鞍山市台安县', 3, 210300),
(210323, '岫岩满族自治县', '辽宁省鞍山市岫岩满族自治县', 3, 210300),
(210381, '海城市', '辽宁省鞍山市海城市', 3, 210300),
(210401, '市辖区', '辽宁省抚顺市市辖区', 3, 210400),
(210402, '新抚区', '辽宁省抚顺市新抚区', 3, 210400),
(210403, '东洲区', '辽宁省抚顺市东洲区', 3, 210400),
(210404, '望花区', '辽宁省抚顺市望花区', 3, 210400),
(210411, '顺城区', '辽宁省抚顺市顺城区', 3, 210400),
(210421, '抚顺县', '辽宁省抚顺市抚顺县', 3, 210400),
(210422, '新宾满族自治县', '辽宁省抚顺市新宾满族自治县', 3, 210400),
(210423, '清原满族自治县', '辽宁省抚顺市清原满族自治县', 3, 210400),
(210501, '市辖区', '辽宁省本溪市市辖区', 3, 210500),
(210502, '平山区', '辽宁省本溪市平山区', 3, 210500),
(210503, '溪湖区', '辽宁省本溪市溪湖区', 3, 210500),
(210504, '明山区', '辽宁省本溪市明山区', 3, 210500),
(210505, '南芬区', '辽宁省本溪市南芬区', 3, 210500),
(210521, '本溪满族自治县', '辽宁省本溪市本溪满族自治县', 3, 210500),
(210522, '桓仁满族自治县', '辽宁省本溪市桓仁满族自治县', 3, 210500),
(210601, '市辖区', '辽宁省丹东市市辖区', 3, 210600),
(210602, '元宝区', '辽宁省丹东市元宝区', 3, 210600),
(210603, '振兴区', '辽宁省丹东市振兴区', 3, 210600),
(210604, '振安区', '辽宁省丹东市振安区', 3, 210600),
(210624, '宽甸满族自治县', '辽宁省丹东市宽甸满族自治县', 3, 210600),
(210681, '东港市', '辽宁省丹东市东港市', 3, 210600),
(210682, '凤城市', '辽宁省丹东市凤城市', 3, 210600),
(210701, '市辖区', '辽宁省锦州市市辖区', 3, 210700),
(210702, '古塔区', '辽宁省锦州市古塔区', 3, 210700),
(210703, '凌河区', '辽宁省锦州市凌河区', 3, 210700),
(210711, '太和区', '辽宁省锦州市太和区', 3, 210700),
(210726, '黑山县', '辽宁省锦州市黑山县', 3, 210700),
(210727, '义　县', '辽宁省锦州市义县', 3, 210700),
(210781, '凌海市', '辽宁省锦州市凌海市', 3, 210700),
(210782, '北宁市', '辽宁省锦州市北宁市', 3, 210700),
(210801, '市辖区', '辽宁省营口市市辖区', 3, 210800),
(210802, '站前区', '辽宁省营口市站前区', 3, 210800),
(210803, '西市区', '辽宁省营口市西市区', 3, 210800),
(210804, '鲅鱼圈区', '辽宁省营口市鲅鱼圈区', 3, 210800),
(210811, '老边区', '辽宁省营口市老边区', 3, 210800),
(210881, '盖州市', '辽宁省营口市盖州市', 3, 210800),
(210882, '大石桥市', '辽宁省营口市大石桥市', 3, 210800),
(210901, '市辖区', '辽宁省阜新市市辖区', 3, 210900),
(210902, '海州区', '辽宁省阜新市海州区', 3, 210900),
(210903, '新邱区', '辽宁省阜新市新邱区', 3, 210900),
(210904, '太平区', '辽宁省阜新市太平区', 3, 210900),
(210905, '清河门区', '辽宁省阜新市清河门区', 3, 210900),
(210911, '细河区', '辽宁省阜新市细河区', 3, 210900),
(210921, '阜新蒙古族自治县', '辽宁省阜新市阜新蒙古族自治县', 3, 210900),
(210922, '彰武县', '辽宁省阜新市彰武县', 3, 210900),
(211001, '市辖区', '辽宁省辽阳市市辖区', 3, 211000),
(211002, '白塔区', '辽宁省辽阳市白塔区', 3, 211000),
(211003, '文圣区', '辽宁省辽阳市文圣区', 3, 211000),
(211004, '宏伟区', '辽宁省辽阳市宏伟区', 3, 211000),
(211005, '弓长岭区', '辽宁省辽阳市弓长岭区', 3, 211000),
(211011, '太子河区', '辽宁省辽阳市太子河区', 3, 211000),
(211021, '辽阳县', '辽宁省辽阳市辽阳县', 3, 211000),
(211081, '灯塔市', '辽宁省辽阳市灯塔市', 3, 211000),
(211101, '市辖区', '辽宁省盘锦市市辖区', 3, 211100),
(211102, '双台子区', '辽宁省盘锦市双台子区', 3, 211100),
(211103, '兴隆台区', '辽宁省盘锦市兴隆台区', 3, 211100),
(211121, '大洼县', '辽宁省盘锦市大洼县', 3, 211100),
(211122, '盘山县', '辽宁省盘锦市盘山县', 3, 211100),
(211201, '市辖区', '辽宁省铁岭市市辖区', 3, 211200),
(211202, '银州区', '辽宁省铁岭市银州区', 3, 211200),
(211204, '清河区', '辽宁省铁岭市清河区', 3, 211200),
(211221, '铁岭县', '辽宁省铁岭市铁岭县', 3, 211200),
(211223, '西丰县', '辽宁省铁岭市西丰县', 3, 211200),
(211224, '昌图县', '辽宁省铁岭市昌图县', 3, 211200),
(211281, '调兵山市', '辽宁省铁岭市调兵山市', 3, 211200),
(211282, '开原市', '辽宁省铁岭市开原市', 3, 211200),
(211301, '市辖区', '辽宁省朝阳市市辖区', 3, 211300),
(211302, '双塔区', '辽宁省朝阳市双塔区', 3, 211300),
(211303, '龙城区', '辽宁省朝阳市龙城区', 3, 211300),
(211321, '朝阳县', '辽宁省朝阳市朝阳县', 3, 211300),
(211322, '建平县', '辽宁省朝阳市建平县', 3, 211300),
(211324, '喀喇沁左翼蒙古族自治县', '辽宁省朝阳市喀喇沁左翼蒙古族自治县', 3, 211300),
(211381, '北票市', '辽宁省朝阳市北票市', 3, 211300),
(211382, '凌源市', '辽宁省朝阳市凌源市', 3, 211300),
(211401, '市辖区', '辽宁省葫芦岛市市辖区', 3, 211400),
(211402, '连山区', '辽宁省葫芦岛市连山区', 3, 211400),
(211403, '龙港区', '辽宁省葫芦岛市龙港区', 3, 211400),
(211404, '南票区', '辽宁省葫芦岛市南票区', 3, 211400),
(211421, '绥中县', '辽宁省葫芦岛市绥中县', 3, 211400),
(211422, '建昌县', '辽宁省葫芦岛市建昌县', 3, 211400),
(211481, '兴城市', '辽宁省葫芦岛市兴城市', 3, 211400),
(220101, '市辖区', '吉林省长春市市辖区', 3, 220100),
(220102, '南关区', '吉林省长春市南关区', 3, 220100),
(220103, '宽城区', '吉林省长春市宽城区', 3, 220100),
(220104, '朝阳区', '吉林省长春市朝阳区', 3, 220100),
(220105, '二道区', '吉林省长春市二道区', 3, 220100),
(220106, '绿园区', '吉林省长春市绿园区', 3, 220100),
(220112, '双阳区', '吉林省长春市双阳区', 3, 220100),
(220122, '农安县', '吉林省长春市农安县', 3, 220100),
(220181, '九台市', '吉林省长春市九台市', 3, 220100),
(220182, '榆树市', '吉林省长春市榆树市', 3, 220100),
(220183, '德惠市', '吉林省长春市德惠市', 3, 220100),
(220201, '市辖区', '吉林省吉林市市辖区', 3, 220200),
(220202, '昌邑区', '吉林省吉林市昌邑区', 3, 220200),
(220203, '龙潭区', '吉林省吉林市龙潭区', 3, 220200),
(220204, '船营区', '吉林省吉林市船营区', 3, 220200),
(220211, '丰满区', '吉林省吉林市丰满区', 3, 220200),
(220221, '永吉县', '吉林省吉林市永吉县', 3, 220200),
(220281, '蛟河市', '吉林省吉林市蛟河市', 3, 220200),
(220282, '桦甸市', '吉林省吉林市桦甸市', 3, 220200),
(220283, '舒兰市', '吉林省吉林市舒兰市', 3, 220200),
(220284, '磐石市', '吉林省吉林市磐石市', 3, 220200),
(220301, '市辖区', '吉林省四平市市辖区', 3, 220300),
(220302, '铁西区', '吉林省四平市铁西区', 3, 220300),
(220303, '铁东区', '吉林省四平市铁东区', 3, 220300),
(220322, '梨树县', '吉林省四平市梨树县', 3, 220300),
(220323, '伊通满族自治县', '吉林省四平市伊通满族自治县', 3, 220300),
(220381, '公主岭市', '吉林省四平市公主岭市', 3, 220300),
(220382, '双辽市', '吉林省四平市双辽市', 3, 220300),
(220401, '市辖区', '吉林省辽源市市辖区', 3, 220400),
(220402, '龙山区', '吉林省辽源市龙山区', 3, 220400),
(220403, '西安区', '吉林省辽源市西安区', 3, 220400),
(220421, '东丰县', '吉林省辽源市东丰县', 3, 220400),
(220422, '东辽县', '吉林省辽源市东辽县', 3, 220400),
(220501, '市辖区', '吉林省通化市市辖区', 3, 220500),
(220502, '东昌区', '吉林省通化市东昌区', 3, 220500),
(220503, '二道江区', '吉林省通化市二道江区', 3, 220500),
(220521, '通化县', '吉林省通化市通化县', 3, 220500),
(220523, '辉南县', '吉林省通化市辉南县', 3, 220500),
(220524, '柳河县', '吉林省通化市柳河县', 3, 220500),
(220581, '梅河口市', '吉林省通化市梅河口市', 3, 220500),
(220582, '集安市', '吉林省通化市集安市', 3, 220500),
(220601, '市辖区', '吉林省白山市市辖区', 3, 220600),
(220602, '八道江区', '吉林省白山市八道江区', 3, 220600),
(220621, '抚松县', '吉林省白山市抚松县', 3, 220600),
(220622, '靖宇县', '吉林省白山市靖宇县', 3, 220600),
(220623, '长白朝鲜族自治县', '吉林省白山市长白朝鲜族自治县', 3, 220600),
(220625, '江源县', '吉林省白山市江源县', 3, 220600),
(220681, '临江市', '吉林省白山市临江市', 3, 220600),
(220701, '市辖区', '吉林省松原市市辖区', 3, 220700),
(220702, '宁江区', '吉林省松原市宁江区', 3, 220700),
(220721, '前郭尔罗斯蒙古族自治县', '吉林省松原市前郭尔罗斯蒙古族自治县', 3, 220700),
(220722, '长岭县', '吉林省松原市长岭县', 3, 220700),
(220723, '乾安县', '吉林省松原市乾安县', 3, 220700),
(220724, '扶余县', '吉林省松原市扶余县', 3, 220700),
(220801, '市辖区', '吉林省白城市市辖区', 3, 220800),
(220802, '洮北区', '吉林省白城市洮北区', 3, 220800),
(220821, '镇赉县', '吉林省白城市镇赉县', 3, 220800),
(220822, '通榆县', '吉林省白城市通榆县', 3, 220800),
(220881, '洮南市', '吉林省白城市洮南市', 3, 220800),
(220882, '大安市', '吉林省白城市大安市', 3, 220800),
(222401, '延吉市', '吉林省延边朝鲜族自治州延吉市', 3, 222400),
(222402, '图们市', '吉林省延边朝鲜族自治州图们市', 3, 222400),
(222403, '敦化市', '吉林省延边朝鲜族自治州敦化市', 3, 222400),
(222404, '珲春市', '吉林省延边朝鲜族自治州珲春市', 3, 222400),
(222405, '龙井市', '吉林省延边朝鲜族自治州龙井市', 3, 222400),
(222406, '和龙市', '吉林省延边朝鲜族自治州和龙市', 3, 222400),
(222424, '汪清县', '吉林省延边朝鲜族自治州汪清县', 3, 222400),
(222426, '安图县', '吉林省延边朝鲜族自治州安图县', 3, 222400),
(230101, '市辖区', '黑龙江哈尔滨市市辖区', 3, 230100),
(230102, '道里区', '黑龙江哈尔滨市道里区', 3, 230100),
(230103, '南岗区', '黑龙江哈尔滨市南岗区', 3, 230100),
(230104, '道外区', '黑龙江哈尔滨市道外区', 3, 230100),
(230106, '香坊区', '黑龙江哈尔滨市香坊区', 3, 230100),
(230107, '动力区', '黑龙江哈尔滨市动力区', 3, 230100),
(230108, '平房区', '黑龙江哈尔滨市平房区', 3, 230100),
(230109, '松北区', '黑龙江哈尔滨市松北区', 3, 230100),
(230111, '呼兰区', '黑龙江哈尔滨市呼兰区', 3, 230100),
(230123, '依兰县', '黑龙江哈尔滨市依兰县', 3, 230100),
(230124, '方正县', '黑龙江哈尔滨市方正县', 3, 230100),
(230125, '宾　县', '黑龙江哈尔滨市宾县', 3, 230100),
(230126, '巴彦县', '黑龙江哈尔滨市巴彦县', 3, 230100),
(230127, '木兰县', '黑龙江哈尔滨市木兰县', 3, 230100),
(230128, '通河县', '黑龙江哈尔滨市通河县', 3, 230100),
(230129, '延寿县', '黑龙江哈尔滨市延寿县', 3, 230100),
(230181, '阿城市', '黑龙江哈尔滨市阿城市', 3, 230100),
(230182, '双城市', '黑龙江哈尔滨市双城市', 3, 230100),
(230183, '尚志市', '黑龙江哈尔滨市尚志市', 3, 230100),
(230184, '五常市', '黑龙江哈尔滨市五常市', 3, 230100),
(230201, '市辖区', '黑龙江齐齐哈尔市市辖区', 3, 230200),
(230202, '龙沙区', '黑龙江齐齐哈尔市龙沙区', 3, 230200),
(230203, '建华区', '黑龙江齐齐哈尔市建华区', 3, 230200),
(230204, '铁锋区', '黑龙江齐齐哈尔市铁锋区', 3, 230200),
(230205, '昂昂溪区', '黑龙江齐齐哈尔市昂昂溪区', 3, 230200),
(230206, '富拉尔基区', '黑龙江齐齐哈尔市富拉尔基区', 3, 230200),
(230207, '碾子山区', '黑龙江齐齐哈尔市碾子山区', 3, 230200),
(230208, '梅里斯达斡尔族区', '黑龙江齐齐哈尔市梅里斯达斡尔族区', 3, 230200),
(230221, '龙江县', '黑龙江齐齐哈尔市龙江县', 3, 230200),
(230223, '依安县', '黑龙江齐齐哈尔市依安县', 3, 230200),
(230224, '泰来县', '黑龙江齐齐哈尔市泰来县', 3, 230200),
(230225, '甘南县', '黑龙江齐齐哈尔市甘南县', 3, 230200),
(230227, '富裕县', '黑龙江齐齐哈尔市富裕县', 3, 230200),
(230229, '克山县', '黑龙江齐齐哈尔市克山县', 3, 230200),
(230230, '克东县', '黑龙江齐齐哈尔市克东县', 3, 230200),
(230231, '拜泉县', '黑龙江齐齐哈尔市拜泉县', 3, 230200),
(230281, '讷河市', '黑龙江齐齐哈尔市讷河市', 3, 230200),
(230301, '市辖区', '黑龙江鸡西市市辖区', 3, 230300),
(230302, '鸡冠区', '黑龙江鸡西市鸡冠区', 3, 230300),
(230303, '恒山区', '黑龙江鸡西市恒山区', 3, 230300),
(230304, '滴道区', '黑龙江鸡西市滴道区', 3, 230300),
(230305, '梨树区', '黑龙江鸡西市梨树区', 3, 230300),
(230306, '城子河区', '黑龙江鸡西市城子河区', 3, 230300),
(230307, '麻山区', '黑龙江鸡西市麻山区', 3, 230300),
(230321, '鸡东县', '黑龙江鸡西市鸡东县', 3, 230300),
(230381, '虎林市', '黑龙江鸡西市虎林市', 3, 230300),
(230382, '密山市', '黑龙江鸡西市密山市', 3, 230300),
(230401, '市辖区', '黑龙江鹤岗市市辖区', 3, 230400),
(230402, '向阳区', '黑龙江鹤岗市向阳区', 3, 230400),
(230403, '工农区', '黑龙江鹤岗市工农区', 3, 230400),
(230404, '南山区', '黑龙江鹤岗市南山区', 3, 230400),
(230405, '兴安区', '黑龙江鹤岗市兴安区', 3, 230400),
(230406, '东山区', '黑龙江鹤岗市东山区', 3, 230400),
(230407, '兴山区', '黑龙江鹤岗市兴山区', 3, 230400),
(230421, '萝北县', '黑龙江鹤岗市萝北县', 3, 230400),
(230422, '绥滨县', '黑龙江鹤岗市绥滨县', 3, 230400),
(230501, '市辖区', '黑龙江双鸭山市市辖区', 3, 230500),
(230502, '尖山区', '黑龙江双鸭山市尖山区', 3, 230500),
(230503, '岭东区', '黑龙江双鸭山市岭东区', 3, 230500),
(230505, '四方台区', '黑龙江双鸭山市四方台区', 3, 230500),
(230506, '宝山区', '黑龙江双鸭山市宝山区', 3, 230500),
(230521, '集贤县', '黑龙江双鸭山市集贤县', 3, 230500),
(230522, '友谊县', '黑龙江双鸭山市友谊县', 3, 230500),
(230523, '宝清县', '黑龙江双鸭山市宝清县', 3, 230500),
(230524, '饶河县', '黑龙江双鸭山市饶河县', 3, 230500),
(230601, '市辖区', '黑龙江大庆市市辖区', 3, 230600),
(230602, '萨尔图区', '黑龙江大庆市萨尔图区', 3, 230600),
(230603, '龙凤区', '黑龙江大庆市龙凤区', 3, 230600),
(230604, '让胡路区', '黑龙江大庆市让胡路区', 3, 230600),
(230605, '红岗区', '黑龙江大庆市红岗区', 3, 230600),
(230606, '大同区', '黑龙江大庆市大同区', 3, 230600),
(230621, '肇州县', '黑龙江大庆市肇州县', 3, 230600),
(230622, '肇源县', '黑龙江大庆市肇源县', 3, 230600),
(230623, '林甸县', '黑龙江大庆市林甸县', 3, 230600),
(230624, '杜尔伯特蒙古族自治县', '黑龙江大庆市杜尔伯特蒙古族自治县', 3, 230600),
(230701, '市辖区', '黑龙江伊春市市辖区', 3, 230700),
(230702, '伊春区', '黑龙江伊春市伊春区', 3, 230700),
(230703, '南岔区', '黑龙江伊春市南岔区', 3, 230700),
(230704, '友好区', '黑龙江伊春市友好区', 3, 230700),
(230705, '西林区', '黑龙江伊春市西林区', 3, 230700),
(230706, '翠峦区', '黑龙江伊春市翠峦区', 3, 230700),
(230707, '新青区', '黑龙江伊春市新青区', 3, 230700),
(230708, '美溪区', '黑龙江伊春市美溪区', 3, 230700),
(230709, '金山屯区', '黑龙江伊春市金山屯区', 3, 230700),
(230710, '五营区', '黑龙江伊春市五营区', 3, 230700),
(230711, '乌马河区', '黑龙江伊春市乌马河区', 3, 230700),
(230712, '汤旺河区', '黑龙江伊春市汤旺河区', 3, 230700),
(230713, '带岭区', '黑龙江伊春市带岭区', 3, 230700),
(230714, '乌伊岭区', '黑龙江伊春市乌伊岭区', 3, 230700),
(230715, '红星区', '黑龙江伊春市红星区', 3, 230700),
(230716, '上甘岭区', '黑龙江伊春市上甘岭区', 3, 230700),
(230722, '嘉荫县', '黑龙江伊春市嘉荫县', 3, 230700),
(230781, '铁力市', '黑龙江伊春市铁力市', 3, 230700),
(230801, '市辖区', '黑龙江佳木斯市市辖区', 3, 230800),
(230802, '永红区', '黑龙江佳木斯市永红区', 3, 230800),
(230803, '向阳区', '黑龙江佳木斯市向阳区', 3, 230800),
(230804, '前进区', '黑龙江佳木斯市前进区', 3, 230800),
(230805, '东风区', '黑龙江佳木斯市东风区', 3, 230800),
(230811, '郊　区', '黑龙江佳木斯市郊区', 3, 230800),
(230822, '桦南县', '黑龙江佳木斯市桦南县', 3, 230800),
(230826, '桦川县', '黑龙江佳木斯市桦川县', 3, 230800),
(230828, '汤原县', '黑龙江佳木斯市汤原县', 3, 230800),
(230833, '抚远县', '黑龙江佳木斯市抚远县', 3, 230800),
(230881, '同江市', '黑龙江佳木斯市同江市', 3, 230800),
(230882, '富锦市', '黑龙江佳木斯市富锦市', 3, 230800),
(230901, '市辖区', '黑龙江七台河市市辖区', 3, 230900),
(230902, '新兴区', '黑龙江七台河市新兴区', 3, 230900),
(230903, '桃山区', '黑龙江七台河市桃山区', 3, 230900),
(230904, '茄子河区', '黑龙江七台河市茄子河区', 3, 230900),
(230921, '勃利县', '黑龙江七台河市勃利县', 3, 230900),
(231001, '市辖区', '黑龙江牡丹江市市辖区', 3, 231000),
(231002, '东安区', '黑龙江牡丹江市东安区', 3, 231000),
(231003, '阳明区', '黑龙江牡丹江市阳明区', 3, 231000),
(231004, '爱民区', '黑龙江牡丹江市爱民区', 3, 231000),
(231005, '西安区', '黑龙江牡丹江市西安区', 3, 231000),
(231024, '东宁县', '黑龙江牡丹江市东宁县', 3, 231000),
(231025, '林口县', '黑龙江牡丹江市林口县', 3, 231000),
(231081, '绥芬河市', '黑龙江牡丹江市绥芬河市', 3, 231000),
(231083, '海林市', '黑龙江牡丹江市海林市', 3, 231000),
(231084, '宁安市', '黑龙江牡丹江市宁安市', 3, 231000),
(231085, '穆棱市', '黑龙江牡丹江市穆棱市', 3, 231000),
(231101, '市辖区', '黑龙江黑河市市辖区', 3, 231100),
(231102, '爱辉区', '黑龙江黑河市爱辉区', 3, 231100),
(231121, '嫩江县', '黑龙江黑河市嫩江县', 3, 231100),
(231123, '逊克县', '黑龙江黑河市逊克县', 3, 231100),
(231124, '孙吴县', '黑龙江黑河市孙吴县', 3, 231100),
(231181, '北安市', '黑龙江黑河市北安市', 3, 231100),
(231182, '五大连池市', '黑龙江黑河市五大连池市', 3, 231100),
(231201, '市辖区', '黑龙江绥化市市辖区', 3, 231200),
(231202, '北林区', '黑龙江绥化市北林区', 3, 231200),
(231221, '望奎县', '黑龙江绥化市望奎县', 3, 231200),
(231222, '兰西县', '黑龙江绥化市兰西县', 3, 231200),
(231223, '青冈县', '黑龙江绥化市青冈县', 3, 231200),
(231224, '庆安县', '黑龙江绥化市庆安县', 3, 231200),
(231225, '明水县', '黑龙江绥化市明水县', 3, 231200),
(231226, '绥棱县', '黑龙江绥化市绥棱县', 3, 231200),
(231281, '安达市', '黑龙江绥化市安达市', 3, 231200),
(231282, '肇东市', '黑龙江绥化市肇东市', 3, 231200),
(231283, '海伦市', '黑龙江绥化市海伦市', 3, 231200),
(232721, '呼玛县', '黑龙江大兴安岭地区呼玛县', 3, 232700),
(232722, '塔河县', '黑龙江大兴安岭地区塔河县', 3, 232700),
(232723, '漠河县', '黑龙江大兴安岭地区漠河县', 3, 232700),
(310101, '黄浦区', '上海市黄浦区', 3, 310100),
(310103, '卢湾区', '上海市卢湾区', 3, 310100),
(310104, '徐汇区', '上海市徐汇区', 3, 310100),
(310105, '长宁区', '上海市长宁区', 3, 310100),
(310106, '静安区', '上海市静安区', 3, 310100),
(310107, '普陀区', '上海市普陀区', 3, 310100),
(310108, '闸北区', '上海市闸北区', 3, 310100),
(310109, '虹口区', '上海市虹口区', 3, 310100),
(310110, '杨浦区', '上海市杨浦区', 3, 310100),
(310112, '闵行区', '上海市闵行区', 3, 310100),
(310113, '宝山区', '上海市宝山区', 3, 310100),
(310114, '嘉定区', '上海市嘉定区', 3, 310100),
(310115, '浦东新区', '上海市浦东新区', 3, 310100),
(310116, '金山区', '上海市金山区', 3, 310100),
(310117, '松江区', '上海市松江区', 3, 310100),
(310118, '青浦区', '上海市青浦区', 3, 310100),
(310119, '南汇区', '上海市南汇区', 3, 310100),
(310120, '奉贤区', '上海市奉贤区', 3, 310100),
(310230, '崇明县', '上海市崇明县', 3, 310200),
(320101, '市辖区', '江苏省南京市市辖区', 3, 320100),
(320102, '玄武区', '江苏省南京市玄武区', 3, 320100),
(320103, '白下区', '江苏省南京市白下区', 3, 320100),
(320104, '秦淮区', '江苏省南京市秦淮区', 3, 320100),
(320105, '建邺区', '江苏省南京市建邺区', 3, 320100),
(320106, '鼓楼区', '江苏省南京市鼓楼区', 3, 320100),
(320107, '下关区', '江苏省南京市下关区', 3, 320100),
(320111, '浦口区', '江苏省南京市浦口区', 3, 320100),
(320113, '栖霞区', '江苏省南京市栖霞区', 3, 320100),
(320114, '雨花台区', '江苏省南京市雨花台区', 3, 320100),
(320115, '江宁区', '江苏省南京市江宁区', 3, 320100),
(320116, '六合区', '江苏省南京市六合区', 3, 320100),
(320124, '溧水县', '江苏省南京市溧水县', 3, 320100),
(320125, '高淳县', '江苏省南京市高淳县', 3, 320100),
(320201, '市辖区', '江苏省无锡市市辖区', 3, 320200),
(320202, '崇安区', '江苏省无锡市崇安区', 3, 320200),
(320203, '南长区', '江苏省无锡市南长区', 3, 320200),
(320204, '北塘区', '江苏省无锡市北塘区', 3, 320200),
(320205, '锡山区', '江苏省无锡市锡山区', 3, 320200),
(320206, '惠山区', '江苏省无锡市惠山区', 3, 320200),
(320211, '滨湖区', '江苏省无锡市滨湖区', 3, 320200),
(320281, '江阴市', '江苏省无锡市江阴市', 3, 320200),
(320282, '宜兴市', '江苏省无锡市宜兴市', 3, 320200),
(320301, '市辖区', '江苏省徐州市市辖区', 3, 320300),
(320302, '鼓楼区', '江苏省徐州市鼓楼区', 3, 320300),
(320303, '云龙区', '江苏省徐州市云龙区', 3, 320300),
(320304, '九里区', '江苏省徐州市九里区', 3, 320300),
(320305, '贾汪区', '江苏省徐州市贾汪区', 3, 320300),
(320311, '泉山区', '江苏省徐州市泉山区', 3, 320300),
(320321, '丰　县', '江苏省徐州市丰县', 3, 320300),
(320322, '沛　县', '江苏省徐州市沛县', 3, 320300),
(320323, '铜山县', '江苏省徐州市铜山县', 3, 320300),
(320324, '睢宁县', '江苏省徐州市睢宁县', 3, 320300),
(320381, '新沂市', '江苏省徐州市新沂市', 3, 320300),
(320382, '邳州市', '江苏省徐州市邳州市', 3, 320300),
(320401, '市辖区', '江苏省常州市市辖区', 3, 320400),
(320402, '天宁区', '江苏省常州市天宁区', 3, 320400),
(320404, '钟楼区', '江苏省常州市钟楼区', 3, 320400),
(320405, '戚墅堰区', '江苏省常州市戚墅堰区', 3, 320400),
(320411, '新北区', '江苏省常州市新北区', 3, 320400),
(320412, '武进区', '江苏省常州市武进区', 3, 320400),
(320481, '溧阳市', '江苏省常州市溧阳市', 3, 320400),
(320482, '金坛市', '江苏省常州市金坛市', 3, 320400),
(320501, '市辖区', '江苏省苏州市市辖区', 3, 320500),
(320502, '沧浪区', '江苏省苏州市沧浪区', 3, 320500),
(320503, '平江区', '江苏省苏州市平江区', 3, 320500),
(320504, '金阊区', '江苏省苏州市金阊区', 3, 320500),
(320505, '虎丘区', '江苏省苏州市虎丘区', 3, 320500),
(320506, '吴中区', '江苏省苏州市吴中区', 3, 320500),
(320507, '相城区', '江苏省苏州市相城区', 3, 320500),
(320581, '常熟市', '江苏省苏州市常熟市', 3, 320500),
(320582, '张家港市', '江苏省苏州市张家港市', 3, 320500),
(320583, '昆山市', '江苏省苏州市昆山市', 3, 320500),
(320584, '吴江市', '江苏省苏州市吴江市', 3, 320500),
(320585, '太仓市', '江苏省苏州市太仓市', 3, 320500),
(320601, '市辖区', '江苏省南通市市辖区', 3, 320600),
(320602, '崇川区', '江苏省南通市崇川区', 3, 320600),
(320611, '港闸区', '江苏省南通市港闸区', 3, 320600),
(320621, '海安县', '江苏省南通市海安县', 3, 320600),
(320623, '如东县', '江苏省南通市如东县', 3, 320600),
(320681, '启东市', '江苏省南通市启东市', 3, 320600),
(320682, '如皋市', '江苏省南通市如皋市', 3, 320600),
(320683, '通州市', '江苏省南通市通州市', 3, 320600),
(320684, '海门市', '江苏省南通市海门市', 3, 320600),
(320701, '市辖区', '江苏省连云港市市辖区', 3, 320700),
(320703, '连云区', '江苏省连云港市连云区', 3, 320700),
(320705, '新浦区', '江苏省连云港市新浦区', 3, 320700),
(320706, '海州区', '江苏省连云港市海州区', 3, 320700),
(320721, '赣榆县', '江苏省连云港市赣榆县', 3, 320700),
(320722, '东海县', '江苏省连云港市东海县', 3, 320700),
(320723, '灌云县', '江苏省连云港市灌云县', 3, 320700),
(320724, '灌南县', '江苏省连云港市灌南县', 3, 320700),
(320801, '市辖区', '江苏省淮安市市辖区', 3, 320800),
(320802, '清河区', '江苏省淮安市清河区', 3, 320800),
(320803, '楚州区', '江苏省淮安市楚州区', 3, 320800),
(320804, '淮阴区', '江苏省淮安市淮阴区', 3, 320800),
(320811, '清浦区', '江苏省淮安市清浦区', 3, 320800),
(320826, '涟水县', '江苏省淮安市涟水县', 3, 320800),
(320829, '洪泽县', '江苏省淮安市洪泽县', 3, 320800),
(320830, '盱眙县', '江苏省淮安市盱眙县', 3, 320800),
(320831, '金湖县', '江苏省淮安市金湖县', 3, 320800),
(320901, '市辖区', '江苏省盐城市市辖区', 3, 320900),
(320902, '亭湖区', '江苏省盐城市亭湖区', 3, 320900),
(320903, '盐都区', '江苏省盐城市盐都区', 3, 320900),
(320921, '响水县', '江苏省盐城市响水县', 3, 320900),
(320922, '滨海县', '江苏省盐城市滨海县', 3, 320900),
(320923, '阜宁县', '江苏省盐城市阜宁县', 3, 320900),
(320924, '射阳县', '江苏省盐城市射阳县', 3, 320900),
(320925, '建湖县', '江苏省盐城市建湖县', 3, 320900),
(320981, '东台市', '江苏省盐城市东台市', 3, 320900),
(320982, '大丰市', '江苏省盐城市大丰市', 3, 320900),
(321001, '市辖区', '江苏省扬州市市辖区', 3, 321000),
(321002, '广陵区', '江苏省扬州市广陵区', 3, 321000),
(321003, '邗江区', '江苏省扬州市邗江区', 3, 321000),
(321011, '郊　区', '江苏省扬州市郊区', 3, 321000),
(321023, '宝应县', '江苏省扬州市宝应县', 3, 321000),
(321081, '仪征市', '江苏省扬州市仪征市', 3, 321000),
(321084, '高邮市', '江苏省扬州市高邮市', 3, 321000),
(321088, '江都市', '江苏省扬州市江都市', 3, 321000),
(321101, '市辖区', '江苏省镇江市市辖区', 3, 321100),
(321102, '京口区', '江苏省镇江市京口区', 3, 321100),
(321111, '润州区', '江苏省镇江市润州区', 3, 321100),
(321112, '丹徒区', '江苏省镇江市丹徒区', 3, 321100),
(321181, '丹阳市', '江苏省镇江市丹阳市', 3, 321100),
(321182, '扬中市', '江苏省镇江市扬中市', 3, 321100),
(321183, '句容市', '江苏省镇江市句容市', 3, 321100),
(321201, '市辖区', '江苏省泰州市市辖区', 3, 321200),
(321202, '海陵区', '江苏省泰州市海陵区', 3, 321200),
(321203, '高港区', '江苏省泰州市高港区', 3, 321200);
INSERT INTO `ocenter_district` (`id`, `name`, `fullName`, `level`, `upid`) VALUES
(321281, '兴化市', '江苏省泰州市兴化市', 3, 321200),
(321282, '靖江市', '江苏省泰州市靖江市', 3, 321200),
(321283, '泰兴市', '江苏省泰州市泰兴市', 3, 321200),
(321284, '姜堰市', '江苏省泰州市姜堰市', 3, 321200),
(321301, '市辖区', '江苏省宿迁市市辖区', 3, 321300),
(321302, '宿城区', '江苏省宿迁市宿城区', 3, 321300),
(321311, '宿豫区', '江苏省宿迁市宿豫区', 3, 321300),
(321322, '沭阳县', '江苏省宿迁市沭阳县', 3, 321300),
(321323, '泗阳县', '江苏省宿迁市泗阳县', 3, 321300),
(321324, '泗洪县', '江苏省宿迁市泗洪县', 3, 321300),
(330101, '市辖区', '浙江省杭州市市辖区', 3, 330100),
(330102, '上城区', '浙江省杭州市上城区', 3, 330100),
(330103, '下城区', '浙江省杭州市下城区', 3, 330100),
(330104, '江干区', '浙江省杭州市江干区', 3, 330100),
(330105, '拱墅区', '浙江省杭州市拱墅区', 3, 330100),
(330106, '西湖区', '浙江省杭州市西湖区', 3, 330100),
(330108, '滨江区', '浙江省杭州市滨江区', 3, 330100),
(330109, '萧山区', '浙江省杭州市萧山区', 3, 330100),
(330110, '余杭区', '浙江省杭州市余杭区', 3, 330100),
(330122, '桐庐县', '浙江省杭州市桐庐县', 3, 330100),
(330127, '淳安县', '浙江省杭州市淳安县', 3, 330100),
(330182, '建德市', '浙江省杭州市建德市', 3, 330100),
(330183, '富阳市', '浙江省杭州市富阳市', 3, 330100),
(330185, '临安市', '浙江省杭州市临安市', 3, 330100),
(330201, '市辖区', '浙江省宁波市市辖区', 3, 330200),
(330203, '海曙区', '浙江省宁波市海曙区', 3, 330200),
(330204, '江东区', '浙江省宁波市江东区', 3, 330200),
(330205, '江北区', '浙江省宁波市江北区', 3, 330200),
(330206, '北仑区', '浙江省宁波市北仑区', 3, 330200),
(330211, '镇海区', '浙江省宁波市镇海区', 3, 330200),
(330212, '鄞州区', '浙江省宁波市鄞州区', 3, 330200),
(330225, '象山县', '浙江省宁波市象山县', 3, 330200),
(330226, '宁海县', '浙江省宁波市宁海县', 3, 330200),
(330281, '余姚市', '浙江省宁波市余姚市', 3, 330200),
(330282, '慈溪市', '浙江省宁波市慈溪市', 3, 330200),
(330283, '奉化市', '浙江省宁波市奉化市', 3, 330200),
(330301, '市辖区', '浙江省温州市市辖区', 3, 330300),
(330302, '鹿城区', '浙江省温州市鹿城区', 3, 330300),
(330303, '龙湾区', '浙江省温州市龙湾区', 3, 330300),
(330304, '瓯海区', '浙江省温州市瓯海区', 3, 330300),
(330322, '洞头县', '浙江省温州市洞头县', 3, 330300),
(330324, '永嘉县', '浙江省温州市永嘉县', 3, 330300),
(330326, '平阳县', '浙江省温州市平阳县', 3, 330300),
(330327, '苍南县', '浙江省温州市苍南县', 3, 330300),
(330328, '文成县', '浙江省温州市文成县', 3, 330300),
(330329, '泰顺县', '浙江省温州市泰顺县', 3, 330300),
(330381, '瑞安市', '浙江省温州市瑞安市', 3, 330300),
(330382, '乐清市', '浙江省温州市乐清市', 3, 330300),
(330401, '市辖区', '浙江省嘉兴市市辖区', 3, 330400),
(330402, '秀城区', '浙江省嘉兴市秀城区', 3, 330400),
(330411, '秀洲区', '浙江省嘉兴市秀洲区', 3, 330400),
(330421, '嘉善县', '浙江省嘉兴市嘉善县', 3, 330400),
(330424, '海盐县', '浙江省嘉兴市海盐县', 3, 330400),
(330481, '海宁市', '浙江省嘉兴市海宁市', 3, 330400),
(330482, '平湖市', '浙江省嘉兴市平湖市', 3, 330400),
(330483, '桐乡市', '浙江省嘉兴市桐乡市', 3, 330400),
(330501, '市辖区', '浙江省湖州市市辖区', 3, 330500),
(330502, '吴兴区', '浙江省湖州市吴兴区', 3, 330500),
(330503, '南浔区', '浙江省湖州市南浔区', 3, 330500),
(330521, '德清县', '浙江省湖州市德清县', 3, 330500),
(330522, '长兴县', '浙江省湖州市长兴县', 3, 330500),
(330523, '安吉县', '浙江省湖州市安吉县', 3, 330500),
(330601, '市辖区', '浙江省绍兴市市辖区', 3, 330600),
(330602, '越城区', '浙江省绍兴市越城区', 3, 330600),
(330621, '绍兴县', '浙江省绍兴市绍兴县', 3, 330600),
(330624, '新昌县', '浙江省绍兴市新昌县', 3, 330600),
(330681, '诸暨市', '浙江省绍兴市诸暨市', 3, 330600),
(330682, '上虞市', '浙江省绍兴市上虞市', 3, 330600),
(330683, '嵊州市', '浙江省绍兴市嵊州市', 3, 330600),
(330701, '市辖区', '浙江省金华市市辖区', 3, 330700),
(330702, '婺城区', '浙江省金华市婺城区', 3, 330700),
(330703, '金东区', '浙江省金华市金东区', 3, 330700),
(330723, '武义县', '浙江省金华市武义县', 3, 330700),
(330726, '浦江县', '浙江省金华市浦江县', 3, 330700),
(330727, '磐安县', '浙江省金华市磐安县', 3, 330700),
(330781, '兰溪市', '浙江省金华市兰溪市', 3, 330700),
(330782, '义乌市', '浙江省金华市义乌市', 3, 330700),
(330783, '东阳市', '浙江省金华市东阳市', 3, 330700),
(330784, '永康市', '浙江省金华市永康市', 3, 330700),
(330801, '市辖区', '浙江省衢州市市辖区', 3, 330800),
(330802, '柯城区', '浙江省衢州市柯城区', 3, 330800),
(330803, '衢江区', '浙江省衢州市衢江区', 3, 330800),
(330822, '常山县', '浙江省衢州市常山县', 3, 330800),
(330824, '开化县', '浙江省衢州市开化县', 3, 330800),
(330825, '龙游县', '浙江省衢州市龙游县', 3, 330800),
(330881, '江山市', '浙江省衢州市江山市', 3, 330800),
(330901, '市辖区', '浙江省舟山市市辖区', 3, 330900),
(330902, '定海区', '浙江省舟山市定海区', 3, 330900),
(330903, '普陀区', '浙江省舟山市普陀区', 3, 330900),
(330921, '岱山县', '浙江省舟山市岱山县', 3, 330900),
(330922, '嵊泗县', '浙江省舟山市嵊泗县', 3, 330900),
(331001, '市辖区', '浙江省台州市市辖区', 3, 331000),
(331002, '椒江区', '浙江省台州市椒江区', 3, 331000),
(331003, '黄岩区', '浙江省台州市黄岩区', 3, 331000),
(331004, '路桥区', '浙江省台州市路桥区', 3, 331000),
(331021, '玉环县', '浙江省台州市玉环县', 3, 331000),
(331022, '三门县', '浙江省台州市三门县', 3, 331000),
(331023, '天台县', '浙江省台州市天台县', 3, 331000),
(331024, '仙居县', '浙江省台州市仙居县', 3, 331000),
(331081, '温岭市', '浙江省台州市温岭市', 3, 331000),
(331082, '临海市', '浙江省台州市临海市', 3, 331000),
(331101, '市辖区', '浙江省丽水市市辖区', 3, 331100),
(331102, '莲都区', '浙江省丽水市莲都区', 3, 331100),
(331121, '青田县', '浙江省丽水市青田县', 3, 331100),
(331122, '缙云县', '浙江省丽水市缙云县', 3, 331100),
(331123, '遂昌县', '浙江省丽水市遂昌县', 3, 331100),
(331124, '松阳县', '浙江省丽水市松阳县', 3, 331100),
(331125, '云和县', '浙江省丽水市云和县', 3, 331100),
(331126, '庆元县', '浙江省丽水市庆元县', 3, 331100),
(331127, '景宁畲族自治县', '浙江省丽水市景宁畲族自治县', 3, 331100),
(331181, '龙泉市', '浙江省丽水市龙泉市', 3, 331100),
(340101, '市辖区', '安徽省合肥市市辖区', 3, 340100),
(340102, '瑶海区', '安徽省合肥市瑶海区', 3, 340100),
(340103, '庐阳区', '安徽省合肥市庐阳区', 3, 340100),
(340104, '蜀山区', '安徽省合肥市蜀山区', 3, 340100),
(340111, '包河区', '安徽省合肥市包河区', 3, 340100),
(340121, '长丰县', '安徽省合肥市长丰县', 3, 340100),
(340122, '肥东县', '安徽省合肥市肥东县', 3, 340100),
(340123, '肥西县', '安徽省合肥市肥西县', 3, 340100),
(340201, '市辖区', '安徽省芜湖市市辖区', 3, 340200),
(340202, '镜湖区', '安徽省芜湖市镜湖区', 3, 340200),
(340203, '马塘区', '安徽省芜湖市马塘区', 3, 340200),
(340204, '新芜区', '安徽省芜湖市新芜区', 3, 340200),
(340207, '鸠江区', '安徽省芜湖市鸠江区', 3, 340200),
(340221, '芜湖县', '安徽省芜湖市芜湖县', 3, 340200),
(340222, '繁昌县', '安徽省芜湖市繁昌县', 3, 340200),
(340223, '南陵县', '安徽省芜湖市南陵县', 3, 340200),
(340301, '市辖区', '安徽省蚌埠市市辖区', 3, 340300),
(340302, '龙子湖区', '安徽省蚌埠市龙子湖区', 3, 340300),
(340303, '蚌山区', '安徽省蚌埠市蚌山区', 3, 340300),
(340304, '禹会区', '安徽省蚌埠市禹会区', 3, 340300),
(340311, '淮上区', '安徽省蚌埠市淮上区', 3, 340300),
(340321, '怀远县', '安徽省蚌埠市怀远县', 3, 340300),
(340322, '五河县', '安徽省蚌埠市五河县', 3, 340300),
(340323, '固镇县', '安徽省蚌埠市固镇县', 3, 340300),
(340401, '市辖区', '安徽省淮南市市辖区', 3, 340400),
(340402, '大通区', '安徽省淮南市大通区', 3, 340400),
(340403, '田家庵区', '安徽省淮南市田家庵区', 3, 340400),
(340404, '谢家集区', '安徽省淮南市谢家集区', 3, 340400),
(340405, '八公山区', '安徽省淮南市八公山区', 3, 340400),
(340406, '潘集区', '安徽省淮南市潘集区', 3, 340400),
(340421, '凤台县', '安徽省淮南市凤台县', 3, 340400),
(340501, '市辖区', '安徽省马鞍山市市辖区', 3, 340500),
(340502, '金家庄区', '安徽省马鞍山市金家庄区', 3, 340500),
(340503, '花山区', '安徽省马鞍山市花山区', 3, 340500),
(340504, '雨山区', '安徽省马鞍山市雨山区', 3, 340500),
(340521, '当涂县', '安徽省马鞍山市当涂县', 3, 340500),
(340601, '市辖区', '安徽省淮北市市辖区', 3, 340600),
(340602, '杜集区', '安徽省淮北市杜集区', 3, 340600),
(340603, '相山区', '安徽省淮北市相山区', 3, 340600),
(340604, '烈山区', '安徽省淮北市烈山区', 3, 340600),
(340621, '濉溪县', '安徽省淮北市濉溪县', 3, 340600),
(340701, '市辖区', '安徽省铜陵市市辖区', 3, 340700),
(340702, '铜官山区', '安徽省铜陵市铜官山区', 3, 340700),
(340703, '狮子山区', '安徽省铜陵市狮子山区', 3, 340700),
(340711, '郊　区', '安徽省铜陵市郊区', 3, 340700),
(340721, '铜陵县', '安徽省铜陵市铜陵县', 3, 340700),
(340801, '市辖区', '安徽省安庆市市辖区', 3, 340800),
(340802, '迎江区', '安徽省安庆市迎江区', 3, 340800),
(340803, '大观区', '安徽省安庆市大观区', 3, 340800),
(340811, '郊　区', '安徽省安庆市郊区', 3, 340800),
(340822, '怀宁县', '安徽省安庆市怀宁县', 3, 340800),
(340823, '枞阳县', '安徽省安庆市枞阳县', 3, 340800),
(340824, '潜山县', '安徽省安庆市潜山县', 3, 340800),
(340825, '太湖县', '安徽省安庆市太湖县', 3, 340800),
(340826, '宿松县', '安徽省安庆市宿松县', 3, 340800),
(340827, '望江县', '安徽省安庆市望江县', 3, 340800),
(340828, '岳西县', '安徽省安庆市岳西县', 3, 340800),
(340881, '桐城市', '安徽省安庆市桐城市', 3, 340800),
(341001, '市辖区', '安徽省黄山市市辖区', 3, 341000),
(341002, '屯溪区', '安徽省黄山市屯溪区', 3, 341000),
(341003, '黄山区', '安徽省黄山市黄山区', 3, 341000),
(341004, '徽州区', '安徽省黄山市徽州区', 3, 341000),
(341021, '歙　县', '安徽省黄山市歙县', 3, 341000),
(341022, '休宁县', '安徽省黄山市休宁县', 3, 341000),
(341023, '黟　县', '安徽省黄山市黟县', 3, 341000),
(341024, '祁门县', '安徽省黄山市祁门县', 3, 341000),
(341101, '市辖区', '安徽省滁州市市辖区', 3, 341100),
(341102, '琅琊区', '安徽省滁州市琅琊区', 3, 341100),
(341103, '南谯区', '安徽省滁州市南谯区', 3, 341100),
(341122, '来安县', '安徽省滁州市来安县', 3, 341100),
(341124, '全椒县', '安徽省滁州市全椒县', 3, 341100),
(341125, '定远县', '安徽省滁州市定远县', 3, 341100),
(341126, '凤阳县', '安徽省滁州市凤阳县', 3, 341100),
(341181, '天长市', '安徽省滁州市天长市', 3, 341100),
(341182, '明光市', '安徽省滁州市明光市', 3, 341100),
(341201, '市辖区', '安徽省阜阳市市辖区', 3, 341200),
(341202, '颍州区', '安徽省阜阳市颍州区', 3, 341200),
(341203, '颍东区', '安徽省阜阳市颍东区', 3, 341200),
(341204, '颍泉区', '安徽省阜阳市颍泉区', 3, 341200),
(341221, '临泉县', '安徽省阜阳市临泉县', 3, 341200),
(341222, '太和县', '安徽省阜阳市太和县', 3, 341200),
(341225, '阜南县', '安徽省阜阳市阜南县', 3, 341200),
(341226, '颍上县', '安徽省阜阳市颍上县', 3, 341200),
(341282, '界首市', '安徽省阜阳市界首市', 3, 341200),
(341301, '市辖区', '安徽省宿州市市辖区', 3, 341300),
(341302, '墉桥区', '安徽省宿州市墉桥区', 3, 341300),
(341321, '砀山县', '安徽省宿州市砀山县', 3, 341300),
(341322, '萧　县', '安徽省宿州市萧县', 3, 341300),
(341323, '灵璧县', '安徽省宿州市灵璧县', 3, 341300),
(341324, '泗　县', '安徽省宿州市泗县', 3, 341300),
(341401, '庐江县', '安徽省合肥市庐江县', 3, 340100),
(341402, '巢湖市', '安徽省合肥市巢湖市', 3, 340100),
(341422, '无为县', '安徽省芜湖市无为县', 3, 340200),
(341423, '含山县', '安徽省马鞍山市含山县', 3, 340500),
(341424, '和　县', '安徽省马鞍山市和县', 3, 340500),
(341501, '市辖区', '安徽省六安市市辖区', 3, 341500),
(341502, '金安区', '安徽省六安市金安区', 3, 341500),
(341503, '裕安区', '安徽省六安市裕安区', 3, 341500),
(341521, '寿　县', '安徽省六安市寿县', 3, 341500),
(341522, '霍邱县', '安徽省六安市霍邱县', 3, 341500),
(341523, '舒城县', '安徽省六安市舒城县', 3, 341500),
(341524, '金寨县', '安徽省六安市金寨县', 3, 341500),
(341525, '霍山县', '安徽省六安市霍山县', 3, 341500),
(341601, '市辖区', '安徽省亳州市市辖区', 3, 341600),
(341602, '谯城区', '安徽省亳州市谯城区', 3, 341600),
(341621, '涡阳县', '安徽省亳州市涡阳县', 3, 341600),
(341622, '蒙城县', '安徽省亳州市蒙城县', 3, 341600),
(341623, '利辛县', '安徽省亳州市利辛县', 3, 341600),
(341701, '市辖区', '安徽省池州市市辖区', 3, 341700),
(341702, '贵池区', '安徽省池州市贵池区', 3, 341700),
(341721, '东至县', '安徽省池州市东至县', 3, 341700),
(341722, '石台县', '安徽省池州市石台县', 3, 341700),
(341723, '青阳县', '安徽省池州市青阳县', 3, 341700),
(341801, '市辖区', '安徽省宣城市市辖区', 3, 341800),
(341802, '宣州区', '安徽省宣城市宣州区', 3, 341800),
(341821, '郎溪县', '安徽省宣城市郎溪县', 3, 341800),
(341822, '广德县', '安徽省宣城市广德县', 3, 341800),
(341823, '泾　县', '安徽省宣城市泾县', 3, 341800),
(341824, '绩溪县', '安徽省宣城市绩溪县', 3, 341800),
(341825, '旌德县', '安徽省宣城市旌德县', 3, 341800),
(341881, '宁国市', '安徽省宣城市宁国市', 3, 341800),
(350101, '市辖区', '福建省福州市市辖区', 3, 350100),
(350102, '鼓楼区', '福建省福州市鼓楼区', 3, 350100),
(350103, '台江区', '福建省福州市台江区', 3, 350100),
(350104, '仓山区', '福建省福州市仓山区', 3, 350100),
(350105, '马尾区', '福建省福州市马尾区', 3, 350100),
(350111, '晋安区', '福建省福州市晋安区', 3, 350100),
(350121, '闽侯县', '福建省福州市闽侯县', 3, 350100),
(350122, '连江县', '福建省福州市连江县', 3, 350100),
(350123, '罗源县', '福建省福州市罗源县', 3, 350100),
(350124, '闽清县', '福建省福州市闽清县', 3, 350100),
(350125, '永泰县', '福建省福州市永泰县', 3, 350100),
(350128, '平潭县', '福建省福州市平潭县', 3, 350100),
(350181, '福清市', '福建省福州市福清市', 3, 350100),
(350182, '长乐市', '福建省福州市长乐市', 3, 350100),
(350201, '市辖区', '福建省厦门市市辖区', 3, 350200),
(350203, '思明区', '福建省厦门市思明区', 3, 350200),
(350205, '海沧区', '福建省厦门市海沧区', 3, 350200),
(350206, '湖里区', '福建省厦门市湖里区', 3, 350200),
(350211, '集美区', '福建省厦门市集美区', 3, 350200),
(350212, '同安区', '福建省厦门市同安区', 3, 350200),
(350213, '翔安区', '福建省厦门市翔安区', 3, 350200),
(350301, '市辖区', '福建省莆田市市辖区', 3, 350300),
(350302, '城厢区', '福建省莆田市城厢区', 3, 350300),
(350303, '涵江区', '福建省莆田市涵江区', 3, 350300),
(350304, '荔城区', '福建省莆田市荔城区', 3, 350300),
(350305, '秀屿区', '福建省莆田市秀屿区', 3, 350300),
(350322, '仙游县', '福建省莆田市仙游县', 3, 350300),
(350401, '市辖区', '福建省三明市市辖区', 3, 350400),
(350402, '梅列区', '福建省三明市梅列区', 3, 350400),
(350403, '三元区', '福建省三明市三元区', 3, 350400),
(350421, '明溪县', '福建省三明市明溪县', 3, 350400),
(350423, '清流县', '福建省三明市清流县', 3, 350400),
(350424, '宁化县', '福建省三明市宁化县', 3, 350400),
(350425, '大田县', '福建省三明市大田县', 3, 350400),
(350426, '尤溪县', '福建省三明市尤溪县', 3, 350400),
(350427, '沙　县', '福建省三明市沙县', 3, 350400),
(350428, '将乐县', '福建省三明市将乐县', 3, 350400),
(350429, '泰宁县', '福建省三明市泰宁县', 3, 350400),
(350430, '建宁县', '福建省三明市建宁县', 3, 350400),
(350481, '永安市', '福建省三明市永安市', 3, 350400),
(350501, '市辖区', '福建省泉州市市辖区', 3, 350500),
(350502, '鲤城区', '福建省泉州市鲤城区', 3, 350500),
(350503, '丰泽区', '福建省泉州市丰泽区', 3, 350500),
(350504, '洛江区', '福建省泉州市洛江区', 3, 350500),
(350505, '泉港区', '福建省泉州市泉港区', 3, 350500),
(350521, '惠安县', '福建省泉州市惠安县', 3, 350500),
(350524, '安溪县', '福建省泉州市安溪县', 3, 350500),
(350525, '永春县', '福建省泉州市永春县', 3, 350500),
(350526, '德化县', '福建省泉州市德化县', 3, 350500),
(350527, '金门县', '福建省泉州市金门县', 3, 350500),
(350581, '石狮市', '福建省泉州市石狮市', 3, 350500),
(350582, '晋江市', '福建省泉州市晋江市', 3, 350500),
(350583, '南安市', '福建省泉州市南安市', 3, 350500),
(350601, '市辖区', '福建省漳州市市辖区', 3, 350600),
(350602, '芗城区', '福建省漳州市芗城区', 3, 350600),
(350603, '龙文区', '福建省漳州市龙文区', 3, 350600),
(350622, '云霄县', '福建省漳州市云霄县', 3, 350600),
(350623, '漳浦县', '福建省漳州市漳浦县', 3, 350600),
(350624, '诏安县', '福建省漳州市诏安县', 3, 350600),
(350625, '长泰县', '福建省漳州市长泰县', 3, 350600),
(350626, '东山县', '福建省漳州市东山县', 3, 350600),
(350627, '南靖县', '福建省漳州市南靖县', 3, 350600),
(350628, '平和县', '福建省漳州市平和县', 3, 350600),
(350629, '华安县', '福建省漳州市华安县', 3, 350600),
(350681, '龙海市', '福建省漳州市龙海市', 3, 350600),
(350701, '市辖区', '福建省南平市市辖区', 3, 350700),
(350702, '延平区', '福建省南平市延平区', 3, 350700),
(350721, '顺昌县', '福建省南平市顺昌县', 3, 350700),
(350722, '浦城县', '福建省南平市浦城县', 3, 350700),
(350723, '光泽县', '福建省南平市光泽县', 3, 350700),
(350724, '松溪县', '福建省南平市松溪县', 3, 350700),
(350725, '政和县', '福建省南平市政和县', 3, 350700),
(350781, '邵武市', '福建省南平市邵武市', 3, 350700),
(350782, '武夷山市', '福建省南平市武夷山市', 3, 350700),
(350783, '建瓯市', '福建省南平市建瓯市', 3, 350700),
(350784, '建阳市', '福建省南平市建阳市', 3, 350700),
(350801, '市辖区', '福建省龙岩市市辖区', 3, 350800),
(350802, '新罗区', '福建省龙岩市新罗区', 3, 350800),
(350821, '长汀县', '福建省龙岩市长汀县', 3, 350800),
(350822, '永定县', '福建省龙岩市永定县', 3, 350800),
(350823, '上杭县', '福建省龙岩市上杭县', 3, 350800),
(350824, '武平县', '福建省龙岩市武平县', 3, 350800),
(350825, '连城县', '福建省龙岩市连城县', 3, 350800),
(350881, '漳平市', '福建省龙岩市漳平市', 3, 350800),
(350901, '市辖区', '福建省宁德市市辖区', 3, 350900),
(350902, '蕉城区', '福建省宁德市蕉城区', 3, 350900),
(350921, '霞浦县', '福建省宁德市霞浦县', 3, 350900),
(350922, '古田县', '福建省宁德市古田县', 3, 350900),
(350923, '屏南县', '福建省宁德市屏南县', 3, 350900),
(350924, '寿宁县', '福建省宁德市寿宁县', 3, 350900),
(350925, '周宁县', '福建省宁德市周宁县', 3, 350900),
(350926, '柘荣县', '福建省宁德市柘荣县', 3, 350900),
(350981, '福安市', '福建省宁德市福安市', 3, 350900),
(350982, '福鼎市', '福建省宁德市福鼎市', 3, 350900),
(360101, '市辖区', '江西省南昌市市辖区', 3, 360100),
(360102, '东湖区', '江西省南昌市东湖区', 3, 360100),
(360103, '西湖区', '江西省南昌市西湖区', 3, 360100),
(360104, '青云谱区', '江西省南昌市青云谱区', 3, 360100),
(360105, '湾里区', '江西省南昌市湾里区', 3, 360100),
(360111, '青山湖区', '江西省南昌市青山湖区', 3, 360100),
(360121, '南昌县', '江西省南昌市南昌县', 3, 360100),
(360122, '新建县', '江西省南昌市新建县', 3, 360100),
(360123, '安义县', '江西省南昌市安义县', 3, 360100),
(360124, '进贤县', '江西省南昌市进贤县', 3, 360100),
(360201, '市辖区', '江西省景德镇市市辖区', 3, 360200),
(360202, '昌江区', '江西省景德镇市昌江区', 3, 360200),
(360203, '珠山区', '江西省景德镇市珠山区', 3, 360200),
(360222, '浮梁县', '江西省景德镇市浮梁县', 3, 360200),
(360281, '乐平市', '江西省景德镇市乐平市', 3, 360200),
(360301, '市辖区', '江西省萍乡市市辖区', 3, 360300),
(360302, '安源区', '江西省萍乡市安源区', 3, 360300),
(360313, '湘东区', '江西省萍乡市湘东区', 3, 360300),
(360321, '莲花县', '江西省萍乡市莲花县', 3, 360300),
(360322, '上栗县', '江西省萍乡市上栗县', 3, 360300),
(360323, '芦溪县', '江西省萍乡市芦溪县', 3, 360300),
(360401, '市辖区', '江西省九江市市辖区', 3, 360400),
(360402, '庐山区', '江西省九江市庐山区', 3, 360400),
(360403, '浔阳区', '江西省九江市浔阳区', 3, 360400),
(360421, '九江县', '江西省九江市九江县', 3, 360400),
(360423, '武宁县', '江西省九江市武宁县', 3, 360400),
(360424, '修水县', '江西省九江市修水县', 3, 360400),
(360425, '永修县', '江西省九江市永修县', 3, 360400),
(360426, '德安县', '江西省九江市德安县', 3, 360400),
(360427, '星子县', '江西省九江市星子县', 3, 360400),
(360428, '都昌县', '江西省九江市都昌县', 3, 360400),
(360429, '湖口县', '江西省九江市湖口县', 3, 360400),
(360430, '彭泽县', '江西省九江市彭泽县', 3, 360400),
(360481, '瑞昌市', '江西省九江市瑞昌市', 3, 360400),
(360501, '市辖区', '江西省新余市市辖区', 3, 360500),
(360502, '渝水区', '江西省新余市渝水区', 3, 360500),
(360521, '分宜县', '江西省新余市分宜县', 3, 360500),
(360601, '市辖区', '江西省鹰潭市市辖区', 3, 360600),
(360602, '月湖区', '江西省鹰潭市月湖区', 3, 360600),
(360622, '余江县', '江西省鹰潭市余江县', 3, 360600),
(360681, '贵溪市', '江西省鹰潭市贵溪市', 3, 360600),
(360701, '市辖区', '江西省赣州市市辖区', 3, 360700),
(360702, '章贡区', '江西省赣州市章贡区', 3, 360700),
(360721, '赣　县', '江西省赣州市赣县', 3, 360700),
(360722, '信丰县', '江西省赣州市信丰县', 3, 360700),
(360723, '大余县', '江西省赣州市大余县', 3, 360700),
(360724, '上犹县', '江西省赣州市上犹县', 3, 360700),
(360725, '崇义县', '江西省赣州市崇义县', 3, 360700),
(360726, '安远县', '江西省赣州市安远县', 3, 360700),
(360727, '龙南县', '江西省赣州市龙南县', 3, 360700),
(360728, '定南县', '江西省赣州市定南县', 3, 360700),
(360729, '全南县', '江西省赣州市全南县', 3, 360700),
(360730, '宁都县', '江西省赣州市宁都县', 3, 360700),
(360731, '于都县', '江西省赣州市于都县', 3, 360700),
(360732, '兴国县', '江西省赣州市兴国县', 3, 360700),
(360733, '会昌县', '江西省赣州市会昌县', 3, 360700),
(360734, '寻乌县', '江西省赣州市寻乌县', 3, 360700),
(360735, '石城县', '江西省赣州市石城县', 3, 360700),
(360781, '瑞金市', '江西省赣州市瑞金市', 3, 360700),
(360782, '南康市', '江西省赣州市南康市', 3, 360700),
(360801, '市辖区', '江西省吉安市市辖区', 3, 360800),
(360802, '吉州区', '江西省吉安市吉州区', 3, 360800),
(360803, '青原区', '江西省吉安市青原区', 3, 360800),
(360821, '吉安县', '江西省吉安市吉安县', 3, 360800),
(360822, '吉水县', '江西省吉安市吉水县', 3, 360800),
(360823, '峡江县', '江西省吉安市峡江县', 3, 360800),
(360824, '新干县', '江西省吉安市新干县', 3, 360800),
(360825, '永丰县', '江西省吉安市永丰县', 3, 360800),
(360826, '泰和县', '江西省吉安市泰和县', 3, 360800),
(360827, '遂川县', '江西省吉安市遂川县', 3, 360800),
(360828, '万安县', '江西省吉安市万安县', 3, 360800),
(360829, '安福县', '江西省吉安市安福县', 3, 360800),
(360830, '永新县', '江西省吉安市永新县', 3, 360800),
(360881, '井冈山市', '江西省吉安市井冈山市', 3, 360800),
(360901, '市辖区', '江西省宜春市市辖区', 3, 360900),
(360902, '袁州区', '江西省宜春市袁州区', 3, 360900),
(360921, '奉新县', '江西省宜春市奉新县', 3, 360900),
(360922, '万载县', '江西省宜春市万载县', 3, 360900),
(360923, '上高县', '江西省宜春市上高县', 3, 360900),
(360924, '宜丰县', '江西省宜春市宜丰县', 3, 360900),
(360925, '靖安县', '江西省宜春市靖安县', 3, 360900),
(360926, '铜鼓县', '江西省宜春市铜鼓县', 3, 360900),
(360981, '丰城市', '江西省宜春市丰城市', 3, 360900),
(360982, '樟树市', '江西省宜春市樟树市', 3, 360900),
(360983, '高安市', '江西省宜春市高安市', 3, 360900),
(361001, '市辖区', '江西省抚州市市辖区', 3, 361000),
(361002, '临川区', '江西省抚州市临川区', 3, 361000),
(361021, '南城县', '江西省抚州市南城县', 3, 361000),
(361022, '黎川县', '江西省抚州市黎川县', 3, 361000),
(361023, '南丰县', '江西省抚州市南丰县', 3, 361000),
(361024, '崇仁县', '江西省抚州市崇仁县', 3, 361000),
(361025, '乐安县', '江西省抚州市乐安县', 3, 361000),
(361026, '宜黄县', '江西省抚州市宜黄县', 3, 361000),
(361027, '金溪县', '江西省抚州市金溪县', 3, 361000),
(361028, '资溪县', '江西省抚州市资溪县', 3, 361000),
(361029, '东乡县', '江西省抚州市东乡县', 3, 361000),
(361030, '广昌县', '江西省抚州市广昌县', 3, 361000),
(361101, '市辖区', '江西省上饶市市辖区', 3, 361100),
(361102, '信州区', '江西省上饶市信州区', 3, 361100),
(361121, '上饶县', '江西省上饶市上饶县', 3, 361100),
(361122, '广丰县', '江西省上饶市广丰县', 3, 361100),
(361123, '玉山县', '江西省上饶市玉山县', 3, 361100),
(361124, '铅山县', '江西省上饶市铅山县', 3, 361100),
(361125, '横峰县', '江西省上饶市横峰县', 3, 361100),
(361126, '弋阳县', '江西省上饶市弋阳县', 3, 361100),
(361127, '余干县', '江西省上饶市余干县', 3, 361100),
(361128, '鄱阳县', '江西省上饶市鄱阳县', 3, 361100),
(361129, '万年县', '江西省上饶市万年县', 3, 361100),
(361130, '婺源县', '江西省上饶市婺源县', 3, 361100),
(361181, '德兴市', '江西省上饶市德兴市', 3, 361100),
(370101, '市辖区', '山东省济南市市辖区', 3, 370100),
(370102, '历下区', '山东省济南市历下区', 3, 370100),
(370103, '市中区', '山东省济南市市中区', 3, 370100),
(370104, '槐荫区', '山东省济南市槐荫区', 3, 370100),
(370105, '天桥区', '山东省济南市天桥区', 3, 370100),
(370112, '历城区', '山东省济南市历城区', 3, 370100),
(370113, '长清区', '山东省济南市长清区', 3, 370100),
(370124, '平阴县', '山东省济南市平阴县', 3, 370100),
(370125, '济阳县', '山东省济南市济阳县', 3, 370100),
(370126, '商河县', '山东省济南市商河县', 3, 370100),
(370181, '章丘市', '山东省济南市章丘市', 3, 370100),
(370201, '市辖区', '山东省青岛市市辖区', 3, 370200),
(370202, '市南区', '山东省青岛市市南区', 3, 370200),
(370203, '市北区', '山东省青岛市市北区', 3, 370200),
(370205, '四方区', '山东省青岛市四方区', 3, 370200),
(370211, '黄岛区', '山东省青岛市黄岛区', 3, 370200),
(370212, '崂山区', '山东省青岛市崂山区', 3, 370200),
(370213, '李沧区', '山东省青岛市李沧区', 3, 370200),
(370214, '城阳区', '山东省青岛市城阳区', 3, 370200),
(370281, '胶州市', '山东省青岛市胶州市', 3, 370200),
(370282, '即墨市', '山东省青岛市即墨市', 3, 370200),
(370283, '平度市', '山东省青岛市平度市', 3, 370200),
(370284, '胶南市', '山东省青岛市胶南市', 3, 370200),
(370285, '莱西市', '山东省青岛市莱西市', 3, 370200),
(370301, '市辖区', '山东省淄博市市辖区', 3, 370300),
(370302, '淄川区', '山东省淄博市淄川区', 3, 370300),
(370303, '张店区', '山东省淄博市张店区', 3, 370300),
(370304, '博山区', '山东省淄博市博山区', 3, 370300),
(370305, '临淄区', '山东省淄博市临淄区', 3, 370300),
(370306, '周村区', '山东省淄博市周村区', 3, 370300),
(370321, '桓台县', '山东省淄博市桓台县', 3, 370300),
(370322, '高青县', '山东省淄博市高青县', 3, 370300),
(370323, '沂源县', '山东省淄博市沂源县', 3, 370300),
(370401, '市辖区', '山东省枣庄市市辖区', 3, 370400),
(370402, '市中区', '山东省枣庄市市中区', 3, 370400),
(370403, '薛城区', '山东省枣庄市薛城区', 3, 370400),
(370404, '峄城区', '山东省枣庄市峄城区', 3, 370400),
(370405, '台儿庄区', '山东省枣庄市台儿庄区', 3, 370400),
(370406, '山亭区', '山东省枣庄市山亭区', 3, 370400),
(370481, '滕州市', '山东省枣庄市滕州市', 3, 370400),
(370501, '市辖区', '山东省东营市市辖区', 3, 370500),
(370502, '东营区', '山东省东营市东营区', 3, 370500),
(370503, '河口区', '山东省东营市河口区', 3, 370500),
(370521, '垦利县', '山东省东营市垦利县', 3, 370500),
(370522, '利津县', '山东省东营市利津县', 3, 370500),
(370523, '广饶县', '山东省东营市广饶县', 3, 370500),
(370601, '市辖区', '山东省烟台市市辖区', 3, 370600),
(370602, '芝罘区', '山东省烟台市芝罘区', 3, 370600),
(370611, '福山区', '山东省烟台市福山区', 3, 370600),
(370612, '牟平区', '山东省烟台市牟平区', 3, 370600),
(370613, '莱山区', '山东省烟台市莱山区', 3, 370600),
(370634, '长岛县', '山东省烟台市长岛县', 3, 370600),
(370681, '龙口市', '山东省烟台市龙口市', 3, 370600),
(370682, '莱阳市', '山东省烟台市莱阳市', 3, 370600),
(370683, '莱州市', '山东省烟台市莱州市', 3, 370600),
(370684, '蓬莱市', '山东省烟台市蓬莱市', 3, 370600),
(370685, '招远市', '山东省烟台市招远市', 3, 370600),
(370686, '栖霞市', '山东省烟台市栖霞市', 3, 370600),
(370687, '海阳市', '山东省烟台市海阳市', 3, 370600),
(370701, '市辖区', '山东省潍坊市市辖区', 3, 370700),
(370702, '潍城区', '山东省潍坊市潍城区', 3, 370700),
(370703, '寒亭区', '山东省潍坊市寒亭区', 3, 370700),
(370704, '坊子区', '山东省潍坊市坊子区', 3, 370700),
(370705, '奎文区', '山东省潍坊市奎文区', 3, 370700),
(370724, '临朐县', '山东省潍坊市临朐县', 3, 370700),
(370725, '昌乐县', '山东省潍坊市昌乐县', 3, 370700),
(370781, '青州市', '山东省潍坊市青州市', 3, 370700),
(370782, '诸城市', '山东省潍坊市诸城市', 3, 370700),
(370783, '寿光市', '山东省潍坊市寿光市', 3, 370700),
(370784, '安丘市', '山东省潍坊市安丘市', 3, 370700),
(370785, '高密市', '山东省潍坊市高密市', 3, 370700),
(370786, '昌邑市', '山东省潍坊市昌邑市', 3, 370700),
(370801, '市辖区', '山东省济宁市市辖区', 3, 370800),
(370802, '市中区', '山东省济宁市市中区', 3, 370800),
(370811, '任城区', '山东省济宁市任城区', 3, 370800),
(370826, '微山县', '山东省济宁市微山县', 3, 370800),
(370827, '鱼台县', '山东省济宁市鱼台县', 3, 370800),
(370828, '金乡县', '山东省济宁市金乡县', 3, 370800),
(370829, '嘉祥县', '山东省济宁市嘉祥县', 3, 370800),
(370830, '汶上县', '山东省济宁市汶上县', 3, 370800),
(370831, '泗水县', '山东省济宁市泗水县', 3, 370800),
(370832, '梁山县', '山东省济宁市梁山县', 3, 370800),
(370881, '曲阜市', '山东省济宁市曲阜市', 3, 370800),
(370882, '兖州市', '山东省济宁市兖州市', 3, 370800),
(370883, '邹城市', '山东省济宁市邹城市', 3, 370800),
(370901, '市辖区', '山东省泰安市市辖区', 3, 370900),
(370902, '泰山区', '山东省泰安市泰山区', 3, 370900),
(370903, '岱岳区', '山东省泰安市岱岳区', 3, 370900),
(370921, '宁阳县', '山东省泰安市宁阳县', 3, 370900),
(370923, '东平县', '山东省泰安市东平县', 3, 370900),
(370982, '新泰市', '山东省泰安市新泰市', 3, 370900),
(370983, '肥城市', '山东省泰安市肥城市', 3, 370900),
(371001, '市辖区', '山东省威海市市辖区', 3, 371000),
(371002, '环翠区', '山东省威海市环翠区', 3, 371000),
(371081, '文登市', '山东省威海市文登市', 3, 371000),
(371082, '荣成市', '山东省威海市荣成市', 3, 371000),
(371083, '乳山市', '山东省威海市乳山市', 3, 371000),
(371101, '市辖区', '山东省日照市市辖区', 3, 371100),
(371102, '东港区', '山东省日照市东港区', 3, 371100),
(371103, '岚山区', '山东省日照市岚山区', 3, 371100),
(371121, '五莲县', '山东省日照市五莲县', 3, 371100),
(371122, '莒　县', '山东省日照市莒县', 3, 371100),
(371201, '市辖区', '山东省莱芜市市辖区', 3, 371200),
(371202, '莱城区', '山东省莱芜市莱城区', 3, 371200),
(371203, '钢城区', '山东省莱芜市钢城区', 3, 371200),
(371301, '市辖区', '山东省临沂市市辖区', 3, 371300),
(371302, '兰山区', '山东省临沂市兰山区', 3, 371300),
(371311, '罗庄区', '山东省临沂市罗庄区', 3, 371300),
(371312, '河东区', '山东省临沂市河东区', 3, 371300),
(371321, '沂南县', '山东省临沂市沂南县', 3, 371300),
(371322, '郯城县', '山东省临沂市郯城县', 3, 371300),
(371323, '沂水县', '山东省临沂市沂水县', 3, 371300),
(371324, '苍山县', '山东省临沂市苍山县', 3, 371300),
(371325, '费　县', '山东省临沂市费县', 3, 371300),
(371326, '平邑县', '山东省临沂市平邑县', 3, 371300),
(371327, '莒南县', '山东省临沂市莒南县', 3, 371300),
(371328, '蒙阴县', '山东省临沂市蒙阴县', 3, 371300),
(371329, '临沭县', '山东省临沂市临沭县', 3, 371300),
(371401, '市辖区', '山东省德州市市辖区', 3, 371400),
(371402, '德城区', '山东省德州市德城区', 3, 371400),
(371421, '陵　县', '山东省德州市陵县', 3, 371400),
(371422, '宁津县', '山东省德州市宁津县', 3, 371400),
(371423, '庆云县', '山东省德州市庆云县', 3, 371400),
(371424, '临邑县', '山东省德州市临邑县', 3, 371400),
(371425, '齐河县', '山东省德州市齐河县', 3, 371400),
(371426, '平原县', '山东省德州市平原县', 3, 371400),
(371427, '夏津县', '山东省德州市夏津县', 3, 371400),
(371428, '武城县', '山东省德州市武城县', 3, 371400),
(371481, '乐陵市', '山东省德州市乐陵市', 3, 371400),
(371482, '禹城市', '山东省德州市禹城市', 3, 371400),
(371501, '市辖区', '山东省聊城市市辖区', 3, 371500),
(371502, '东昌府区', '山东省聊城市东昌府区', 3, 371500),
(371521, '阳谷县', '山东省聊城市阳谷县', 3, 371500),
(371522, '莘　县', '山东省聊城市莘县', 3, 371500),
(371523, '茌平县', '山东省聊城市茌平县', 3, 371500),
(371524, '东阿县', '山东省聊城市东阿县', 3, 371500),
(371525, '冠　县', '山东省聊城市冠县', 3, 371500),
(371526, '高唐县', '山东省聊城市高唐县', 3, 371500),
(371581, '临清市', '山东省聊城市临清市', 3, 371500),
(371601, '市辖区', '山东省滨州市市辖区', 3, 371600),
(371602, '滨城区', '山东省滨州市滨城区', 3, 371600),
(371621, '惠民县', '山东省滨州市惠民县', 3, 371600),
(371622, '阳信县', '山东省滨州市阳信县', 3, 371600),
(371623, '无棣县', '山东省滨州市无棣县', 3, 371600),
(371624, '沾化县', '山东省滨州市沾化县', 3, 371600),
(371625, '博兴县', '山东省滨州市博兴县', 3, 371600),
(371626, '邹平县', '山东省滨州市邹平县', 3, 371600),
(371701, '市辖区', '山东省菏泽市市辖区', 3, 371700),
(371702, '牡丹区', '山东省菏泽市牡丹区', 3, 371700),
(371721, '曹　县', '山东省菏泽市曹县', 3, 371700),
(371722, '单　县', '山东省菏泽市单县', 3, 371700),
(371723, '成武县', '山东省菏泽市成武县', 3, 371700),
(371724, '巨野县', '山东省菏泽市巨野县', 3, 371700),
(371725, '郓城县', '山东省菏泽市郓城县', 3, 371700),
(371726, '鄄城县', '山东省菏泽市鄄城县', 3, 371700),
(371727, '定陶县', '山东省菏泽市定陶县', 3, 371700),
(371728, '东明县', '山东省菏泽市东明县', 3, 371700),
(410101, '市辖区', '河南省郑州市市辖区', 3, 410100),
(410102, '中原区', '河南省郑州市中原区', 3, 410100),
(410103, '二七区', '河南省郑州市二七区', 3, 410100),
(410104, '管城回族区', '河南省郑州市管城回族区', 3, 410100),
(410105, '金水区', '河南省郑州市金水区', 3, 410100),
(410106, '上街区', '河南省郑州市上街区', 3, 410100),
(410108, '邙山区', '河南省郑州市邙山区', 3, 410100),
(410122, '中牟县', '河南省郑州市中牟县', 3, 410100),
(410181, '巩义市', '河南省郑州市巩义市', 3, 410100),
(410182, '荥阳市', '河南省郑州市荥阳市', 3, 410100),
(410183, '新密市', '河南省郑州市新密市', 3, 410100),
(410184, '新郑市', '河南省郑州市新郑市', 3, 410100),
(410185, '登封市', '河南省郑州市登封市', 3, 410100),
(410201, '市辖区', '河南省开封市市辖区', 3, 410200),
(410202, '龙亭区', '河南省开封市龙亭区', 3, 410200),
(410203, '顺河回族区', '河南省开封市顺河回族区', 3, 410200),
(410204, '鼓楼区', '河南省开封市鼓楼区', 3, 410200),
(410205, '南关区', '河南省开封市南关区', 3, 410200),
(410211, '郊　区', '河南省开封市郊区', 3, 410200),
(410221, '杞　县', '河南省开封市杞县', 3, 410200),
(410222, '通许县', '河南省开封市通许县', 3, 410200),
(410223, '尉氏县', '河南省开封市尉氏县', 3, 410200),
(410224, '开封县', '河南省开封市开封县', 3, 410200),
(410225, '兰考县', '河南省开封市兰考县', 3, 410200),
(410301, '市辖区', '河南省洛阳市市辖区', 3, 410300),
(410302, '老城区', '河南省洛阳市老城区', 3, 410300),
(410303, '西工区', '河南省洛阳市西工区', 3, 410300),
(410304, '廛河回族区', '河南省洛阳市廛河回族区', 3, 410300),
(410305, '涧西区', '河南省洛阳市涧西区', 3, 410300),
(410306, '吉利区', '河南省洛阳市吉利区', 3, 410300),
(410307, '洛龙区', '河南省洛阳市洛龙区', 3, 410300),
(410322, '孟津县', '河南省洛阳市孟津县', 3, 410300),
(410323, '新安县', '河南省洛阳市新安县', 3, 410300),
(410324, '栾川县', '河南省洛阳市栾川县', 3, 410300),
(410325, '嵩　县', '河南省洛阳市嵩县', 3, 410300),
(410326, '汝阳县', '河南省洛阳市汝阳县', 3, 410300),
(410327, '宜阳县', '河南省洛阳市宜阳县', 3, 410300),
(410328, '洛宁县', '河南省洛阳市洛宁县', 3, 410300),
(410329, '伊川县', '河南省洛阳市伊川县', 3, 410300),
(410381, '偃师市', '河南省洛阳市偃师市', 3, 410300),
(410401, '市辖区', '河南省平顶山市市辖区', 3, 410400),
(410402, '新华区', '河南省平顶山市新华区', 3, 410400),
(410403, '卫东区', '河南省平顶山市卫东区', 3, 410400),
(410404, '石龙区', '河南省平顶山市石龙区', 3, 410400),
(410411, '湛河区', '河南省平顶山市湛河区', 3, 410400),
(410421, '宝丰县', '河南省平顶山市宝丰县', 3, 410400),
(410422, '叶　县', '河南省平顶山市叶县', 3, 410400),
(410423, '鲁山县', '河南省平顶山市鲁山县', 3, 410400),
(410425, '郏　县', '河南省平顶山市郏县', 3, 410400),
(410481, '舞钢市', '河南省平顶山市舞钢市', 3, 410400),
(410482, '汝州市', '河南省平顶山市汝州市', 3, 410400),
(410501, '市辖区', '河南省安阳市市辖区', 3, 410500),
(410502, '文峰区', '河南省安阳市文峰区', 3, 410500),
(410503, '北关区', '河南省安阳市北关区', 3, 410500),
(410505, '殷都区', '河南省安阳市殷都区', 3, 410500),
(410506, '龙安区', '河南省安阳市龙安区', 3, 410500),
(410522, '安阳县', '河南省安阳市安阳县', 3, 410500),
(410523, '汤阴县', '河南省安阳市汤阴县', 3, 410500),
(410526, '滑　县', '河南省安阳市滑县', 3, 410500),
(410527, '内黄县', '河南省安阳市内黄县', 3, 410500),
(410581, '林州市', '河南省安阳市林州市', 3, 410500),
(410601, '市辖区', '河南省鹤壁市市辖区', 3, 410600),
(410602, '鹤山区', '河南省鹤壁市鹤山区', 3, 410600),
(410603, '山城区', '河南省鹤壁市山城区', 3, 410600),
(410611, '淇滨区', '河南省鹤壁市淇滨区', 3, 410600),
(410621, '浚　县', '河南省鹤壁市浚县', 3, 410600),
(410622, '淇　县', '河南省鹤壁市淇县', 3, 410600),
(410701, '市辖区', '河南省新乡市市辖区', 3, 410700),
(410702, '红旗区', '河南省新乡市红旗区', 3, 410700),
(410703, '卫滨区', '河南省新乡市卫滨区', 3, 410700),
(410704, '凤泉区', '河南省新乡市凤泉区', 3, 410700),
(410711, '牧野区', '河南省新乡市牧野区', 3, 410700),
(410721, '新乡县', '河南省新乡市新乡县', 3, 410700),
(410724, '获嘉县', '河南省新乡市获嘉县', 3, 410700),
(410725, '原阳县', '河南省新乡市原阳县', 3, 410700),
(410726, '延津县', '河南省新乡市延津县', 3, 410700),
(410727, '封丘县', '河南省新乡市封丘县', 3, 410700),
(410728, '长垣县', '河南省新乡市长垣县', 3, 410700),
(410781, '卫辉市', '河南省新乡市卫辉市', 3, 410700),
(410782, '辉县市', '河南省新乡市辉县市', 3, 410700),
(410801, '市辖区', '河南省焦作市市辖区', 3, 410800),
(410802, '解放区', '河南省焦作市解放区', 3, 410800),
(410803, '中站区', '河南省焦作市中站区', 3, 410800),
(410804, '马村区', '河南省焦作市马村区', 3, 410800),
(410811, '山阳区', '河南省焦作市山阳区', 3, 410800),
(410821, '修武县', '河南省焦作市修武县', 3, 410800),
(410822, '博爱县', '河南省焦作市博爱县', 3, 410800),
(410823, '武陟县', '河南省焦作市武陟县', 3, 410800),
(410825, '温　县', '河南省焦作市温县', 3, 410800),
(410881, '济源市', '河南省焦作市济源市', 3, 410800),
(410882, '沁阳市', '河南省焦作市沁阳市', 3, 410800),
(410883, '孟州市', '河南省焦作市孟州市', 3, 410800),
(410901, '市辖区', '河南省濮阳市市辖区', 3, 410900),
(410902, '华龙区', '河南省濮阳市华龙区', 3, 410900),
(410922, '清丰县', '河南省濮阳市清丰县', 3, 410900),
(410923, '南乐县', '河南省濮阳市南乐县', 3, 410900),
(410926, '范　县', '河南省濮阳市范县', 3, 410900),
(410927, '台前县', '河南省濮阳市台前县', 3, 410900),
(410928, '濮阳县', '河南省濮阳市濮阳县', 3, 410900),
(411001, '市辖区', '河南省许昌市市辖区', 3, 411000),
(411002, '魏都区', '河南省许昌市魏都区', 3, 411000),
(411023, '许昌县', '河南省许昌市许昌县', 3, 411000),
(411024, '鄢陵县', '河南省许昌市鄢陵县', 3, 411000),
(411025, '襄城县', '河南省许昌市襄城县', 3, 411000),
(411081, '禹州市', '河南省许昌市禹州市', 3, 411000),
(411082, '长葛市', '河南省许昌市长葛市', 3, 411000),
(411101, '市辖区', '河南省漯河市市辖区', 3, 411100),
(411102, '源汇区', '河南省漯河市源汇区', 3, 411100),
(411103, '郾城区', '河南省漯河市郾城区', 3, 411100),
(411104, '召陵区', '河南省漯河市召陵区', 3, 411100),
(411121, '舞阳县', '河南省漯河市舞阳县', 3, 411100),
(411122, '临颍县', '河南省漯河市临颍县', 3, 411100),
(411201, '市辖区', '河南省三门峡市市辖区', 3, 411200),
(411202, '湖滨区', '河南省三门峡市湖滨区', 3, 411200),
(411221, '渑池县', '河南省三门峡市渑池县', 3, 411200),
(411222, '陕　县', '河南省三门峡市陕县', 3, 411200),
(411224, '卢氏县', '河南省三门峡市卢氏县', 3, 411200),
(411281, '义马市', '河南省三门峡市义马市', 3, 411200),
(411282, '灵宝市', '河南省三门峡市灵宝市', 3, 411200),
(411301, '市辖区', '河南省南阳市市辖区', 3, 411300),
(411302, '宛城区', '河南省南阳市宛城区', 3, 411300),
(411303, '卧龙区', '河南省南阳市卧龙区', 3, 411300),
(411321, '南召县', '河南省南阳市南召县', 3, 411300),
(411322, '方城县', '河南省南阳市方城县', 3, 411300),
(411323, '西峡县', '河南省南阳市西峡县', 3, 411300),
(411324, '镇平县', '河南省南阳市镇平县', 3, 411300),
(411325, '内乡县', '河南省南阳市内乡县', 3, 411300),
(411326, '淅川县', '河南省南阳市淅川县', 3, 411300),
(411327, '社旗县', '河南省南阳市社旗县', 3, 411300),
(411328, '唐河县', '河南省南阳市唐河县', 3, 411300),
(411329, '新野县', '河南省南阳市新野县', 3, 411300),
(411330, '桐柏县', '河南省南阳市桐柏县', 3, 411300),
(411381, '邓州市', '河南省南阳市邓州市', 3, 411300),
(411401, '市辖区', '河南省商丘市市辖区', 3, 411400),
(411402, '梁园区', '河南省商丘市梁园区', 3, 411400),
(411403, '睢阳区', '河南省商丘市睢阳区', 3, 411400),
(411421, '民权县', '河南省商丘市民权县', 3, 411400),
(411422, '睢　县', '河南省商丘市睢县', 3, 411400),
(411423, '宁陵县', '河南省商丘市宁陵县', 3, 411400),
(411424, '柘城县', '河南省商丘市柘城县', 3, 411400),
(411425, '虞城县', '河南省商丘市虞城县', 3, 411400),
(411426, '夏邑县', '河南省商丘市夏邑县', 3, 411400),
(411481, '永城市', '河南省商丘市永城市', 3, 411400),
(411501, '市辖区', '河南省信阳市市辖区', 3, 411500),
(411502, '师河区', '河南省信阳市师河区', 3, 411500),
(411503, '平桥区', '河南省信阳市平桥区', 3, 411500),
(411521, '罗山县', '河南省信阳市罗山县', 3, 411500),
(411522, '光山县', '河南省信阳市光山县', 3, 411500),
(411523, '新　县', '河南省信阳市新县', 3, 411500),
(411524, '商城县', '河南省信阳市商城县', 3, 411500),
(411525, '固始县', '河南省信阳市固始县', 3, 411500),
(411526, '潢川县', '河南省信阳市潢川县', 3, 411500),
(411527, '淮滨县', '河南省信阳市淮滨县', 3, 411500),
(411528, '息　县', '河南省信阳市息县', 3, 411500),
(411601, '市辖区', '河南省周口市市辖区', 3, 411600),
(411602, '川汇区', '河南省周口市川汇区', 3, 411600),
(411621, '扶沟县', '河南省周口市扶沟县', 3, 411600),
(411622, '西华县', '河南省周口市西华县', 3, 411600),
(411623, '商水县', '河南省周口市商水县', 3, 411600),
(411624, '沈丘县', '河南省周口市沈丘县', 3, 411600),
(411625, '郸城县', '河南省周口市郸城县', 3, 411600),
(411626, '淮阳县', '河南省周口市淮阳县', 3, 411600),
(411627, '太康县', '河南省周口市太康县', 3, 411600),
(411628, '鹿邑县', '河南省周口市鹿邑县', 3, 411600),
(411681, '项城市', '河南省周口市项城市', 3, 411600),
(411701, '市辖区', '河南省驻马店市市辖区', 3, 411700),
(411702, '驿城区', '河南省驻马店市驿城区', 3, 411700),
(411721, '西平县', '河南省驻马店市西平县', 3, 411700),
(411722, '上蔡县', '河南省驻马店市上蔡县', 3, 411700),
(411723, '平舆县', '河南省驻马店市平舆县', 3, 411700),
(411724, '正阳县', '河南省驻马店市正阳县', 3, 411700),
(411725, '确山县', '河南省驻马店市确山县', 3, 411700),
(411726, '泌阳县', '河南省驻马店市泌阳县', 3, 411700),
(411727, '汝南县', '河南省驻马店市汝南县', 3, 411700),
(411728, '遂平县', '河南省驻马店市遂平县', 3, 411700),
(411729, '新蔡县', '河南省驻马店市新蔡县', 3, 411700),
(420101, '市辖区', '湖北省武汉市市辖区', 3, 420100),
(420102, '江岸区', '湖北省武汉市江岸区', 3, 420100),
(420103, '江汉区', '湖北省武汉市江汉区', 3, 420100),
(420104, '乔口区', '湖北省武汉市乔口区', 3, 420100),
(420105, '汉阳区', '湖北省武汉市汉阳区', 3, 420100),
(420106, '武昌区', '湖北省武汉市武昌区', 3, 420100),
(420107, '青山区', '湖北省武汉市青山区', 3, 420100),
(420111, '洪山区', '湖北省武汉市洪山区', 3, 420100),
(420112, '东西湖区', '湖北省武汉市东西湖区', 3, 420100),
(420113, '汉南区', '湖北省武汉市汉南区', 3, 420100),
(420114, '蔡甸区', '湖北省武汉市蔡甸区', 3, 420100),
(420115, '江夏区', '湖北省武汉市江夏区', 3, 420100),
(420116, '黄陂区', '湖北省武汉市黄陂区', 3, 420100),
(420117, '新洲区', '湖北省武汉市新洲区', 3, 420100),
(420201, '市辖区', '湖北省黄石市市辖区', 3, 420200),
(420202, '黄石港区', '湖北省黄石市黄石港区', 3, 420200),
(420203, '西塞山区', '湖北省黄石市西塞山区', 3, 420200),
(420204, '下陆区', '湖北省黄石市下陆区', 3, 420200),
(420205, '铁山区', '湖北省黄石市铁山区', 3, 420200),
(420222, '阳新县', '湖北省黄石市阳新县', 3, 420200),
(420281, '大冶市', '湖北省黄石市大冶市', 3, 420200),
(420301, '市辖区', '湖北省十堰市市辖区', 3, 420300),
(420302, '茅箭区', '湖北省十堰市茅箭区', 3, 420300),
(420303, '张湾区', '湖北省十堰市张湾区', 3, 420300),
(420321, '郧　县', '湖北省十堰市郧县', 3, 420300),
(420322, '郧西县', '湖北省十堰市郧西县', 3, 420300),
(420323, '竹山县', '湖北省十堰市竹山县', 3, 420300),
(420324, '竹溪县', '湖北省十堰市竹溪县', 3, 420300),
(420325, '房　县', '湖北省十堰市房县', 3, 420300),
(420381, '丹江口市', '湖北省十堰市丹江口市', 3, 420300),
(420501, '市辖区', '湖北省宜昌市市辖区', 3, 420500),
(420502, '西陵区', '湖北省宜昌市西陵区', 3, 420500),
(420503, '伍家岗区', '湖北省宜昌市伍家岗区', 3, 420500),
(420504, '点军区', '湖北省宜昌市点军区', 3, 420500),
(420505, '猇亭区', '湖北省宜昌市猇亭区', 3, 420500),
(420506, '夷陵区', '湖北省宜昌市夷陵区', 3, 420500),
(420525, '远安县', '湖北省宜昌市远安县', 3, 420500),
(420526, '兴山县', '湖北省宜昌市兴山县', 3, 420500),
(420527, '秭归县', '湖北省宜昌市秭归县', 3, 420500),
(420528, '长阳土家族自治县', '湖北省宜昌市长阳土家族自治县', 3, 420500),
(420529, '五峰土家族自治县', '湖北省宜昌市五峰土家族自治县', 3, 420500),
(420581, '宜都市', '湖北省宜昌市宜都市', 3, 420500),
(420582, '当阳市', '湖北省宜昌市当阳市', 3, 420500),
(420583, '枝江市', '湖北省宜昌市枝江市', 3, 420500),
(420601, '市辖区', '湖北省襄樊市市辖区', 3, 420600),
(420602, '襄城区', '湖北省襄樊市襄城区', 3, 420600),
(420606, '樊城区', '湖北省襄樊市樊城区', 3, 420600),
(420607, '襄阳区', '湖北省襄樊市襄阳区', 3, 420600),
(420624, '南漳县', '湖北省襄樊市南漳县', 3, 420600),
(420625, '谷城县', '湖北省襄樊市谷城县', 3, 420600),
(420626, '保康县', '湖北省襄樊市保康县', 3, 420600),
(420682, '老河口市', '湖北省襄樊市老河口市', 3, 420600),
(420683, '枣阳市', '湖北省襄樊市枣阳市', 3, 420600),
(420684, '宜城市', '湖北省襄樊市宜城市', 3, 420600),
(420701, '市辖区', '湖北省鄂州市市辖区', 3, 420700),
(420702, '梁子湖区', '湖北省鄂州市梁子湖区', 3, 420700),
(420703, '华容区', '湖北省鄂州市华容区', 3, 420700),
(420704, '鄂城区', '湖北省鄂州市鄂城区', 3, 420700),
(420801, '市辖区', '湖北省荆门市市辖区', 3, 420800),
(420802, '东宝区', '湖北省荆门市东宝区', 3, 420800),
(420804, '掇刀区', '湖北省荆门市掇刀区', 3, 420800),
(420821, '京山县', '湖北省荆门市京山县', 3, 420800),
(420822, '沙洋县', '湖北省荆门市沙洋县', 3, 420800),
(420881, '钟祥市', '湖北省荆门市钟祥市', 3, 420800),
(420901, '市辖区', '湖北省孝感市市辖区', 3, 420900),
(420902, '孝南区', '湖北省孝感市孝南区', 3, 420900),
(420921, '孝昌县', '湖北省孝感市孝昌县', 3, 420900),
(420922, '大悟县', '湖北省孝感市大悟县', 3, 420900),
(420923, '云梦县', '湖北省孝感市云梦县', 3, 420900),
(420981, '应城市', '湖北省孝感市应城市', 3, 420900),
(420982, '安陆市', '湖北省孝感市安陆市', 3, 420900),
(420984, '汉川市', '湖北省孝感市汉川市', 3, 420900),
(421001, '市辖区', '湖北省荆州市市辖区', 3, 421000),
(421002, '沙市区', '湖北省荆州市沙市区', 3, 421000),
(421003, '荆州区', '湖北省荆州市荆州区', 3, 421000),
(421022, '公安县', '湖北省荆州市公安县', 3, 421000),
(421023, '监利县', '湖北省荆州市监利县', 3, 421000),
(421024, '江陵县', '湖北省荆州市江陵县', 3, 421000),
(421081, '石首市', '湖北省荆州市石首市', 3, 421000),
(421083, '洪湖市', '湖北省荆州市洪湖市', 3, 421000),
(421087, '松滋市', '湖北省荆州市松滋市', 3, 421000),
(421101, '市辖区', '湖北省黄冈市市辖区', 3, 421100),
(421102, '黄州区', '湖北省黄冈市黄州区', 3, 421100),
(421121, '团风县', '湖北省黄冈市团风县', 3, 421100),
(421122, '红安县', '湖北省黄冈市红安县', 3, 421100),
(421123, '罗田县', '湖北省黄冈市罗田县', 3, 421100),
(421124, '英山县', '湖北省黄冈市英山县', 3, 421100),
(421125, '浠水县', '湖北省黄冈市浠水县', 3, 421100),
(421126, '蕲春县', '湖北省黄冈市蕲春县', 3, 421100),
(421127, '黄梅县', '湖北省黄冈市黄梅县', 3, 421100),
(421181, '麻城市', '湖北省黄冈市麻城市', 3, 421100),
(421182, '武穴市', '湖北省黄冈市武穴市', 3, 421100),
(421201, '市辖区', '湖北省咸宁市市辖区', 3, 421200),
(421202, '咸安区', '湖北省咸宁市咸安区', 3, 421200),
(421221, '嘉鱼县', '湖北省咸宁市嘉鱼县', 3, 421200),
(421222, '通城县', '湖北省咸宁市通城县', 3, 421200),
(421223, '崇阳县', '湖北省咸宁市崇阳县', 3, 421200),
(421224, '通山县', '湖北省咸宁市通山县', 3, 421200),
(421281, '赤壁市', '湖北省咸宁市赤壁市', 3, 421200),
(421301, '市辖区', '湖北省随州市市辖区', 3, 421300),
(421302, '曾都区', '湖北省随州市曾都区', 3, 421300),
(421381, '广水市', '湖北省随州市广水市', 3, 421300),
(422801, '恩施市', '湖北省恩施土家族苗族自治州恩施市', 3, 422800),
(422802, '利川市', '湖北省恩施土家族苗族自治州利川市', 3, 422800),
(422822, '建始县', '湖北省恩施土家族苗族自治州建始县', 3, 422800),
(422823, '巴东县', '湖北省恩施土家族苗族自治州巴东县', 3, 422800),
(422825, '宣恩县', '湖北省恩施土家族苗族自治州宣恩县', 3, 422800),
(422826, '咸丰县', '湖北省恩施土家族苗族自治州咸丰县', 3, 422800),
(422827, '来凤县', '湖北省恩施土家族苗族自治州来凤县', 3, 422800),
(422828, '鹤峰县', '湖北省恩施土家族苗族自治州鹤峰县', 3, 422800),
(429004, '仙桃市', '湖北省省直辖行政单位仙桃市', 3, 429000),
(429005, '潜江市', '湖北省省直辖行政单位潜江市', 3, 429000),
(429006, '天门市', '湖北省省直辖行政单位天门市', 3, 429000),
(429021, '神农架林区', '湖北省省直辖行政单位神农架林区', 3, 429000),
(430101, '市辖区', '湖南省长沙市市辖区', 3, 430100),
(430102, '芙蓉区', '湖南省长沙市芙蓉区', 3, 430100),
(430103, '天心区', '湖南省长沙市天心区', 3, 430100),
(430104, '岳麓区', '湖南省长沙市岳麓区', 3, 430100),
(430105, '开福区', '湖南省长沙市开福区', 3, 430100),
(430111, '雨花区', '湖南省长沙市雨花区', 3, 430100),
(430121, '长沙县', '湖南省长沙市长沙县', 3, 430100),
(430122, '望城县', '湖南省长沙市望城县', 3, 430100),
(430124, '宁乡县', '湖南省长沙市宁乡县', 3, 430100),
(430181, '浏阳市', '湖南省长沙市浏阳市', 3, 430100),
(430201, '市辖区', '湖南省株洲市市辖区', 3, 430200),
(430202, '荷塘区', '湖南省株洲市荷塘区', 3, 430200),
(430203, '芦淞区', '湖南省株洲市芦淞区', 3, 430200),
(430204, '石峰区', '湖南省株洲市石峰区', 3, 430200),
(430211, '天元区', '湖南省株洲市天元区', 3, 430200),
(430221, '株洲县', '湖南省株洲市株洲县', 3, 430200),
(430223, '攸　县', '湖南省株洲市攸县', 3, 430200),
(430224, '茶陵县', '湖南省株洲市茶陵县', 3, 430200),
(430225, '炎陵县', '湖南省株洲市炎陵县', 3, 430200),
(430281, '醴陵市', '湖南省株洲市醴陵市', 3, 430200),
(430301, '市辖区', '湖南省湘潭市市辖区', 3, 430300),
(430302, '雨湖区', '湖南省湘潭市雨湖区', 3, 430300),
(430304, '岳塘区', '湖南省湘潭市岳塘区', 3, 430300),
(430321, '湘潭县', '湖南省湘潭市湘潭县', 3, 430300),
(430381, '湘乡市', '湖南省湘潭市湘乡市', 3, 430300),
(430382, '韶山市', '湖南省湘潭市韶山市', 3, 430300),
(430401, '市辖区', '湖南省衡阳市市辖区', 3, 430400),
(430405, '珠晖区', '湖南省衡阳市珠晖区', 3, 430400),
(430406, '雁峰区', '湖南省衡阳市雁峰区', 3, 430400),
(430407, '石鼓区', '湖南省衡阳市石鼓区', 3, 430400),
(430408, '蒸湘区', '湖南省衡阳市蒸湘区', 3, 430400),
(430412, '南岳区', '湖南省衡阳市南岳区', 3, 430400),
(430421, '衡阳县', '湖南省衡阳市衡阳县', 3, 430400),
(430422, '衡南县', '湖南省衡阳市衡南县', 3, 430400),
(430423, '衡山县', '湖南省衡阳市衡山县', 3, 430400),
(430424, '衡东县', '湖南省衡阳市衡东县', 3, 430400),
(430426, '祁东县', '湖南省衡阳市祁东县', 3, 430400),
(430481, '耒阳市', '湖南省衡阳市耒阳市', 3, 430400),
(430482, '常宁市', '湖南省衡阳市常宁市', 3, 430400),
(430501, '市辖区', '湖南省邵阳市市辖区', 3, 430500),
(430502, '双清区', '湖南省邵阳市双清区', 3, 430500),
(430503, '大祥区', '湖南省邵阳市大祥区', 3, 430500),
(430511, '北塔区', '湖南省邵阳市北塔区', 3, 430500),
(430521, '邵东县', '湖南省邵阳市邵东县', 3, 430500),
(430522, '新邵县', '湖南省邵阳市新邵县', 3, 430500),
(430523, '邵阳县', '湖南省邵阳市邵阳县', 3, 430500),
(430524, '隆回县', '湖南省邵阳市隆回县', 3, 430500),
(430525, '洞口县', '湖南省邵阳市洞口县', 3, 430500),
(430527, '绥宁县', '湖南省邵阳市绥宁县', 3, 430500),
(430528, '新宁县', '湖南省邵阳市新宁县', 3, 430500),
(430529, '城步苗族自治县', '湖南省邵阳市城步苗族自治县', 3, 430500),
(430581, '武冈市', '湖南省邵阳市武冈市', 3, 430500),
(430601, '市辖区', '湖南省岳阳市市辖区', 3, 430600),
(430602, '岳阳楼区', '湖南省岳阳市岳阳楼区', 3, 430600),
(430603, '云溪区', '湖南省岳阳市云溪区', 3, 430600),
(430611, '君山区', '湖南省岳阳市君山区', 3, 430600),
(430621, '岳阳县', '湖南省岳阳市岳阳县', 3, 430600),
(430623, '华容县', '湖南省岳阳市华容县', 3, 430600),
(430624, '湘阴县', '湖南省岳阳市湘阴县', 3, 430600),
(430626, '平江县', '湖南省岳阳市平江县', 3, 430600),
(430681, '汨罗市', '湖南省岳阳市汨罗市', 3, 430600),
(430682, '临湘市', '湖南省岳阳市临湘市', 3, 430600),
(430701, '市辖区', '湖南省常德市市辖区', 3, 430700),
(430702, '武陵区', '湖南省常德市武陵区', 3, 430700),
(430703, '鼎城区', '湖南省常德市鼎城区', 3, 430700),
(430721, '安乡县', '湖南省常德市安乡县', 3, 430700),
(430722, '汉寿县', '湖南省常德市汉寿县', 3, 430700),
(430723, '澧　县', '湖南省常德市澧县', 3, 430700),
(430724, '临澧县', '湖南省常德市临澧县', 3, 430700),
(430725, '桃源县', '湖南省常德市桃源县', 3, 430700),
(430726, '石门县', '湖南省常德市石门县', 3, 430700),
(430781, '津市市', '湖南省常德市津市市', 3, 430700),
(430801, '市辖区', '湖南省张家界市市辖区', 3, 430800),
(430802, '永定区', '湖南省张家界市永定区', 3, 430800),
(430811, '武陵源区', '湖南省张家界市武陵源区', 3, 430800),
(430821, '慈利县', '湖南省张家界市慈利县', 3, 430800),
(430822, '桑植县', '湖南省张家界市桑植县', 3, 430800),
(430901, '市辖区', '湖南省益阳市市辖区', 3, 430900),
(430902, '资阳区', '湖南省益阳市资阳区', 3, 430900),
(430903, '赫山区', '湖南省益阳市赫山区', 3, 430900),
(430921, '南　县', '湖南省益阳市南县', 3, 430900),
(430922, '桃江县', '湖南省益阳市桃江县', 3, 430900),
(430923, '安化县', '湖南省益阳市安化县', 3, 430900),
(430981, '沅江市', '湖南省益阳市沅江市', 3, 430900),
(431001, '市辖区', '湖南省郴州市市辖区', 3, 431000),
(431002, '北湖区', '湖南省郴州市北湖区', 3, 431000),
(431003, '苏仙区', '湖南省郴州市苏仙区', 3, 431000),
(431021, '桂阳县', '湖南省郴州市桂阳县', 3, 431000),
(431022, '宜章县', '湖南省郴州市宜章县', 3, 431000),
(431023, '永兴县', '湖南省郴州市永兴县', 3, 431000),
(431024, '嘉禾县', '湖南省郴州市嘉禾县', 3, 431000),
(431025, '临武县', '湖南省郴州市临武县', 3, 431000),
(431026, '汝城县', '湖南省郴州市汝城县', 3, 431000),
(431027, '桂东县', '湖南省郴州市桂东县', 3, 431000),
(431028, '安仁县', '湖南省郴州市安仁县', 3, 431000),
(431081, '资兴市', '湖南省郴州市资兴市', 3, 431000),
(431101, '市辖区', '湖南省永州市市辖区', 3, 431100),
(431102, '芝山区', '湖南省永州市芝山区', 3, 431100),
(431103, '冷水滩区', '湖南省永州市冷水滩区', 3, 431100),
(431121, '祁阳县', '湖南省永州市祁阳县', 3, 431100),
(431122, '东安县', '湖南省永州市东安县', 3, 431100),
(431123, '双牌县', '湖南省永州市双牌县', 3, 431100),
(431124, '道　县', '湖南省永州市道县', 3, 431100),
(431125, '江永县', '湖南省永州市江永县', 3, 431100),
(431126, '宁远县', '湖南省永州市宁远县', 3, 431100),
(431127, '蓝山县', '湖南省永州市蓝山县', 3, 431100),
(431128, '新田县', '湖南省永州市新田县', 3, 431100),
(431129, '江华瑶族自治县', '湖南省永州市江华瑶族自治县', 3, 431100),
(431201, '市辖区', '湖南省怀化市市辖区', 3, 431200),
(431202, '鹤城区', '湖南省怀化市鹤城区', 3, 431200),
(431221, '中方县', '湖南省怀化市中方县', 3, 431200),
(431222, '沅陵县', '湖南省怀化市沅陵县', 3, 431200),
(431223, '辰溪县', '湖南省怀化市辰溪县', 3, 431200),
(431224, '溆浦县', '湖南省怀化市溆浦县', 3, 431200),
(431225, '会同县', '湖南省怀化市会同县', 3, 431200),
(431226, '麻阳苗族自治县', '湖南省怀化市麻阳苗族自治县', 3, 431200),
(431227, '新晃侗族自治县', '湖南省怀化市新晃侗族自治县', 3, 431200),
(431228, '芷江侗族自治县', '湖南省怀化市芷江侗族自治县', 3, 431200),
(431229, '靖州苗族侗族自治县', '湖南省怀化市靖州苗族侗族自治县', 3, 431200),
(431230, '通道侗族自治县', '湖南省怀化市通道侗族自治县', 3, 431200),
(431281, '洪江市', '湖南省怀化市洪江市', 3, 431200),
(431301, '市辖区', '湖南省娄底市市辖区', 3, 431300),
(431302, '娄星区', '湖南省娄底市娄星区', 3, 431300),
(431321, '双峰县', '湖南省娄底市双峰县', 3, 431300),
(431322, '新化县', '湖南省娄底市新化县', 3, 431300),
(431381, '冷水江市', '湖南省娄底市冷水江市', 3, 431300),
(431382, '涟源市', '湖南省娄底市涟源市', 3, 431300),
(433101, '吉首市', '湖南省湘西土家族苗族自治州吉首市', 3, 433100),
(433122, '泸溪县', '湖南省湘西土家族苗族自治州泸溪县', 3, 433100),
(433123, '凤凰县', '湖南省湘西土家族苗族自治州凤凰县', 3, 433100),
(433124, '花垣县', '湖南省湘西土家族苗族自治州花垣县', 3, 433100),
(433125, '保靖县', '湖南省湘西土家族苗族自治州保靖县', 3, 433100),
(433126, '古丈县', '湖南省湘西土家族苗族自治州古丈县', 3, 433100),
(433127, '永顺县', '湖南省湘西土家族苗族自治州永顺县', 3, 433100),
(433130, '龙山县', '湖南省湘西土家族苗族自治州龙山县', 3, 433100),
(440101, '市辖区', '广东省广州市市辖区', 3, 440100),
(440102, '东山区', '广东省广州市东山区', 3, 440100),
(440103, '荔湾区', '广东省广州市荔湾区', 3, 440100),
(440104, '越秀区', '广东省广州市越秀区', 3, 440100),
(440105, '海珠区', '广东省广州市海珠区', 3, 440100),
(440106, '天河区', '广东省广州市天河区', 3, 440100),
(440107, '芳村区', '广东省广州市芳村区', 3, 440100),
(440111, '白云区', '广东省广州市白云区', 3, 440100),
(440112, '黄埔区', '广东省广州市黄埔区', 3, 440100),
(440113, '番禺区', '广东省广州市番禺区', 3, 440100),
(440114, '花都区', '广东省广州市花都区', 3, 440100),
(440183, '增城市', '广东省广州市增城市', 3, 440100),
(440184, '从化市', '广东省广州市从化市', 3, 440100),
(440201, '市辖区', '广东省韶关市市辖区', 3, 440200),
(440203, '武江区', '广东省韶关市武江区', 3, 440200),
(440204, '浈江区', '广东省韶关市浈江区', 3, 440200),
(440205, '曲江区', '广东省韶关市曲江区', 3, 440200),
(440222, '始兴县', '广东省韶关市始兴县', 3, 440200),
(440224, '仁化县', '广东省韶关市仁化县', 3, 440200),
(440229, '翁源县', '广东省韶关市翁源县', 3, 440200),
(440232, '乳源瑶族自治县', '广东省韶关市乳源瑶族自治县', 3, 440200),
(440233, '新丰县', '广东省韶关市新丰县', 3, 440200),
(440281, '乐昌市', '广东省韶关市乐昌市', 3, 440200),
(440282, '南雄市', '广东省韶关市南雄市', 3, 440200),
(440301, '市辖区', '广东省深圳市市辖区', 3, 440300),
(440303, '罗湖区', '广东省深圳市罗湖区', 3, 440300),
(440304, '福田区', '广东省深圳市福田区', 3, 440300),
(440305, '南山区', '广东省深圳市南山区', 3, 440300),
(440306, '宝安区', '广东省深圳市宝安区', 3, 440300),
(440307, '龙岗区', '广东省深圳市龙岗区', 3, 440300),
(440308, '盐田区', '广东省深圳市盐田区', 3, 440300),
(440401, '市辖区', '广东省珠海市市辖区', 3, 440400),
(440402, '香洲区', '广东省珠海市香洲区', 3, 440400),
(440403, '斗门区', '广东省珠海市斗门区', 3, 440400),
(440404, '金湾区', '广东省珠海市金湾区', 3, 440400),
(440501, '市辖区', '广东省汕头市市辖区', 3, 440500),
(440507, '龙湖区', '广东省汕头市龙湖区', 3, 440500),
(440511, '金平区', '广东省汕头市金平区', 3, 440500),
(440512, '濠江区', '广东省汕头市濠江区', 3, 440500),
(440513, '潮阳区', '广东省汕头市潮阳区', 3, 440500),
(440514, '潮南区', '广东省汕头市潮南区', 3, 440500),
(440515, '澄海区', '广东省汕头市澄海区', 3, 440500),
(440523, '南澳县', '广东省汕头市南澳县', 3, 440500),
(440601, '市辖区', '广东省佛山市市辖区', 3, 440600),
(440604, '禅城区', '广东省佛山市禅城区', 3, 440600),
(440605, '南海区', '广东省佛山市南海区', 3, 440600),
(440606, '顺德区', '广东省佛山市顺德区', 3, 440600),
(440607, '三水区', '广东省佛山市三水区', 3, 440600),
(440608, '高明区', '广东省佛山市高明区', 3, 440600),
(440701, '市辖区', '广东省江门市市辖区', 3, 440700),
(440703, '蓬江区', '广东省江门市蓬江区', 3, 440700),
(440704, '江海区', '广东省江门市江海区', 3, 440700),
(440705, '新会区', '广东省江门市新会区', 3, 440700),
(440781, '台山市', '广东省江门市台山市', 3, 440700),
(440783, '开平市', '广东省江门市开平市', 3, 440700),
(440784, '鹤山市', '广东省江门市鹤山市', 3, 440700),
(440785, '恩平市', '广东省江门市恩平市', 3, 440700),
(440801, '市辖区', '广东省湛江市市辖区', 3, 440800),
(440802, '赤坎区', '广东省湛江市赤坎区', 3, 440800),
(440803, '霞山区', '广东省湛江市霞山区', 3, 440800),
(440804, '坡头区', '广东省湛江市坡头区', 3, 440800),
(440811, '麻章区', '广东省湛江市麻章区', 3, 440800),
(440823, '遂溪县', '广东省湛江市遂溪县', 3, 440800),
(440825, '徐闻县', '广东省湛江市徐闻县', 3, 440800),
(440881, '廉江市', '广东省湛江市廉江市', 3, 440800),
(440882, '雷州市', '广东省湛江市雷州市', 3, 440800),
(440883, '吴川市', '广东省湛江市吴川市', 3, 440800),
(440901, '市辖区', '广东省茂名市市辖区', 3, 440900),
(440902, '茂南区', '广东省茂名市茂南区', 3, 440900),
(440903, '茂港区', '广东省茂名市茂港区', 3, 440900),
(440923, '电白县', '广东省茂名市电白县', 3, 440900),
(440981, '高州市', '广东省茂名市高州市', 3, 440900),
(440982, '化州市', '广东省茂名市化州市', 3, 440900),
(440983, '信宜市', '广东省茂名市信宜市', 3, 440900),
(441201, '市辖区', '广东省肇庆市市辖区', 3, 441200),
(441202, '端州区', '广东省肇庆市端州区', 3, 441200),
(441203, '鼎湖区', '广东省肇庆市鼎湖区', 3, 441200),
(441223, '广宁县', '广东省肇庆市广宁县', 3, 441200),
(441224, '怀集县', '广东省肇庆市怀集县', 3, 441200),
(441225, '封开县', '广东省肇庆市封开县', 3, 441200),
(441226, '德庆县', '广东省肇庆市德庆县', 3, 441200),
(441283, '高要市', '广东省肇庆市高要市', 3, 441200),
(441284, '四会市', '广东省肇庆市四会市', 3, 441200),
(441301, '市辖区', '广东省惠州市市辖区', 3, 441300),
(441302, '惠城区', '广东省惠州市惠城区', 3, 441300),
(441303, '惠阳区', '广东省惠州市惠阳区', 3, 441300),
(441322, '博罗县', '广东省惠州市博罗县', 3, 441300),
(441323, '惠东县', '广东省惠州市惠东县', 3, 441300),
(441324, '龙门县', '广东省惠州市龙门县', 3, 441300),
(441401, '市辖区', '广东省梅州市市辖区', 3, 441400),
(441402, '梅江区', '广东省梅州市梅江区', 3, 441400),
(441421, '梅　县', '广东省梅州市梅县', 3, 441400),
(441422, '大埔县', '广东省梅州市大埔县', 3, 441400),
(441423, '丰顺县', '广东省梅州市丰顺县', 3, 441400),
(441424, '五华县', '广东省梅州市五华县', 3, 441400),
(441426, '平远县', '广东省梅州市平远县', 3, 441400),
(441427, '蕉岭县', '广东省梅州市蕉岭县', 3, 441400),
(441481, '兴宁市', '广东省梅州市兴宁市', 3, 441400),
(441501, '市辖区', '广东省汕尾市市辖区', 3, 441500),
(441502, '城　区', '广东省汕尾市城区', 3, 441500),
(441521, '海丰县', '广东省汕尾市海丰县', 3, 441500),
(441523, '陆河县', '广东省汕尾市陆河县', 3, 441500),
(441581, '陆丰市', '广东省汕尾市陆丰市', 3, 441500),
(441601, '市辖区', '广东省河源市市辖区', 3, 441600),
(441602, '源城区', '广东省河源市源城区', 3, 441600),
(441621, '紫金县', '广东省河源市紫金县', 3, 441600),
(441622, '龙川县', '广东省河源市龙川县', 3, 441600),
(441623, '连平县', '广东省河源市连平县', 3, 441600),
(441624, '和平县', '广东省河源市和平县', 3, 441600),
(441625, '东源县', '广东省河源市东源县', 3, 441600),
(441701, '市辖区', '广东省阳江市市辖区', 3, 441700),
(441702, '江城区', '广东省阳江市江城区', 3, 441700),
(441721, '阳西县', '广东省阳江市阳西县', 3, 441700),
(441723, '阳东县', '广东省阳江市阳东县', 3, 441700),
(441781, '阳春市', '广东省阳江市阳春市', 3, 441700),
(441801, '市辖区', '广东省清远市市辖区', 3, 441800),
(441802, '清城区', '广东省清远市清城区', 3, 441800),
(441821, '佛冈县', '广东省清远市佛冈县', 3, 441800),
(441823, '阳山县', '广东省清远市阳山县', 3, 441800),
(441825, '连山壮族瑶族自治县', '广东省清远市连山壮族瑶族自治县', 3, 441800),
(441826, '连南瑶族自治县', '广东省清远市连南瑶族自治县', 3, 441800),
(441827, '清新县', '广东省清远市清新县', 3, 441800),
(441881, '英德市', '广东省清远市英德市', 3, 441800),
(441882, '连州市', '广东省清远市连州市', 3, 441800),
(445101, '市辖区', '广东省潮州市市辖区', 3, 445100),
(445102, '湘桥区', '广东省潮州市湘桥区', 3, 445100),
(445121, '潮安县', '广东省潮州市潮安县', 3, 445100),
(445122, '饶平县', '广东省潮州市饶平县', 3, 445100),
(445201, '市辖区', '广东省揭阳市市辖区', 3, 445200),
(445202, '榕城区', '广东省揭阳市榕城区', 3, 445200),
(445221, '揭东县', '广东省揭阳市揭东县', 3, 445200),
(445222, '揭西县', '广东省揭阳市揭西县', 3, 445200),
(445224, '惠来县', '广东省揭阳市惠来县', 3, 445200),
(445281, '普宁市', '广东省揭阳市普宁市', 3, 445200),
(445301, '市辖区', '广东省云浮市市辖区', 3, 445300),
(445302, '云城区', '广东省云浮市云城区', 3, 445300),
(445321, '新兴县', '广东省云浮市新兴县', 3, 445300),
(445322, '郁南县', '广东省云浮市郁南县', 3, 445300),
(445323, '云安县', '广东省云浮市云安县', 3, 445300),
(445381, '罗定市', '广东省云浮市罗定市', 3, 445300),
(450101, '市辖区', '广西省南宁市市辖区', 3, 450100),
(450102, '兴宁区', '广西省南宁市兴宁区', 3, 450100),
(450103, '青秀区', '广西省南宁市青秀区', 3, 450100),
(450105, '江南区', '广西省南宁市江南区', 3, 450100),
(450107, '西乡塘区', '广西省南宁市西乡塘区', 3, 450100),
(450108, '良庆区', '广西省南宁市良庆区', 3, 450100),
(450109, '邕宁区', '广西省南宁市邕宁区', 3, 450100),
(450122, '武鸣县', '广西省南宁市武鸣县', 3, 450100),
(450123, '隆安县', '广西省南宁市隆安县', 3, 450100),
(450124, '马山县', '广西省南宁市马山县', 3, 450100),
(450125, '上林县', '广西省南宁市上林县', 3, 450100),
(450126, '宾阳县', '广西省南宁市宾阳县', 3, 450100),
(450127, '横　县', '广西省南宁市横县', 3, 450100),
(450201, '市辖区', '广西省柳州市市辖区', 3, 450200),
(450202, '城中区', '广西省柳州市城中区', 3, 450200),
(450203, '鱼峰区', '广西省柳州市鱼峰区', 3, 450200),
(450204, '柳南区', '广西省柳州市柳南区', 3, 450200),
(450205, '柳北区', '广西省柳州市柳北区', 3, 450200),
(450221, '柳江县', '广西省柳州市柳江县', 3, 450200),
(450222, '柳城县', '广西省柳州市柳城县', 3, 450200),
(450223, '鹿寨县', '广西省柳州市鹿寨县', 3, 450200),
(450224, '融安县', '广西省柳州市融安县', 3, 450200),
(450225, '融水苗族自治县', '广西省柳州市融水苗族自治县', 3, 450200),
(450226, '三江侗族自治县', '广西省柳州市三江侗族自治县', 3, 450200),
(450301, '市辖区', '广西省桂林市市辖区', 3, 450300),
(450302, '秀峰区', '广西省桂林市秀峰区', 3, 450300),
(450303, '叠彩区', '广西省桂林市叠彩区', 3, 450300),
(450304, '象山区', '广西省桂林市象山区', 3, 450300),
(450305, '七星区', '广西省桂林市七星区', 3, 450300),
(450311, '雁山区', '广西省桂林市雁山区', 3, 450300),
(450321, '阳朔县', '广西省桂林市阳朔县', 3, 450300),
(450322, '临桂县', '广西省桂林市临桂县', 3, 450300),
(450323, '灵川县', '广西省桂林市灵川县', 3, 450300),
(450324, '全州县', '广西省桂林市全州县', 3, 450300),
(450325, '兴安县', '广西省桂林市兴安县', 3, 450300),
(450326, '永福县', '广西省桂林市永福县', 3, 450300),
(450327, '灌阳县', '广西省桂林市灌阳县', 3, 450300),
(450328, '龙胜各族自治县', '广西省桂林市龙胜各族自治县', 3, 450300),
(450329, '资源县', '广西省桂林市资源县', 3, 450300),
(450330, '平乐县', '广西省桂林市平乐县', 3, 450300),
(450331, '荔蒲县', '广西省桂林市荔蒲县', 3, 450300),
(450332, '恭城瑶族自治县', '广西省桂林市恭城瑶族自治县', 3, 450300),
(450401, '市辖区', '广西省梧州市市辖区', 3, 450400),
(450403, '万秀区', '广西省梧州市万秀区', 3, 450400),
(450404, '蝶山区', '广西省梧州市蝶山区', 3, 450400),
(450405, '长洲区', '广西省梧州市长洲区', 3, 450400),
(450421, '苍梧县', '广西省梧州市苍梧县', 3, 450400),
(450422, '藤　县', '广西省梧州市藤县', 3, 450400),
(450423, '蒙山县', '广西省梧州市蒙山县', 3, 450400),
(450481, '岑溪市', '广西省梧州市岑溪市', 3, 450400),
(450501, '市辖区', '广西省北海市市辖区', 3, 450500),
(450502, '海城区', '广西省北海市海城区', 3, 450500),
(450503, '银海区', '广西省北海市银海区', 3, 450500),
(450512, '铁山港区', '广西省北海市铁山港区', 3, 450500),
(450521, '合浦县', '广西省北海市合浦县', 3, 450500),
(450601, '市辖区', '广西省防城港市市辖区', 3, 450600),
(450602, '港口区', '广西省防城港市港口区', 3, 450600),
(450603, '防城区', '广西省防城港市防城区', 3, 450600),
(450621, '上思县', '广西省防城港市上思县', 3, 450600),
(450681, '东兴市', '广西省防城港市东兴市', 3, 450600),
(450701, '市辖区', '广西省钦州市市辖区', 3, 450700),
(450702, '钦南区', '广西省钦州市钦南区', 3, 450700),
(450703, '钦北区', '广西省钦州市钦北区', 3, 450700),
(450721, '灵山县', '广西省钦州市灵山县', 3, 450700),
(450722, '浦北县', '广西省钦州市浦北县', 3, 450700),
(450801, '市辖区', '广西省贵港市市辖区', 3, 450800),
(450802, '港北区', '广西省贵港市港北区', 3, 450800),
(450803, '港南区', '广西省贵港市港南区', 3, 450800),
(450804, '覃塘区', '广西省贵港市覃塘区', 3, 450800),
(450821, '平南县', '广西省贵港市平南县', 3, 450800),
(450881, '桂平市', '广西省贵港市桂平市', 3, 450800),
(450901, '市辖区', '广西省玉林市市辖区', 3, 450900),
(450902, '玉州区', '广西省玉林市玉州区', 3, 450900),
(450921, '容　县', '广西省玉林市容县', 3, 450900),
(450922, '陆川县', '广西省玉林市陆川县', 3, 450900),
(450923, '博白县', '广西省玉林市博白县', 3, 450900),
(450924, '兴业县', '广西省玉林市兴业县', 3, 450900),
(450981, '北流市', '广西省玉林市北流市', 3, 450900),
(451001, '市辖区', '广西省百色市市辖区', 3, 451000),
(451002, '右江区', '广西省百色市右江区', 3, 451000),
(451021, '田阳县', '广西省百色市田阳县', 3, 451000),
(451022, '田东县', '广西省百色市田东县', 3, 451000),
(451023, '平果县', '广西省百色市平果县', 3, 451000),
(451024, '德保县', '广西省百色市德保县', 3, 451000),
(451025, '靖西县', '广西省百色市靖西县', 3, 451000),
(451026, '那坡县', '广西省百色市那坡县', 3, 451000),
(451027, '凌云县', '广西省百色市凌云县', 3, 451000),
(451028, '乐业县', '广西省百色市乐业县', 3, 451000),
(451029, '田林县', '广西省百色市田林县', 3, 451000),
(451030, '西林县', '广西省百色市西林县', 3, 451000),
(451031, '隆林各族自治县', '广西省百色市隆林各族自治县', 3, 451000),
(451101, '市辖区', '广西省贺州市市辖区', 3, 451100),
(451102, '八步区', '广西省贺州市八步区', 3, 451100),
(451121, '昭平县', '广西省贺州市昭平县', 3, 451100),
(451122, '钟山县', '广西省贺州市钟山县', 3, 451100),
(451123, '富川瑶族自治县', '广西省贺州市富川瑶族自治县', 3, 451100),
(451201, '市辖区', '广西省河池市市辖区', 3, 451200),
(451202, '金城江区', '广西省河池市金城江区', 3, 451200),
(451221, '南丹县', '广西省河池市南丹县', 3, 451200),
(451222, '天峨县', '广西省河池市天峨县', 3, 451200),
(451223, '凤山县', '广西省河池市凤山县', 3, 451200),
(451224, '东兰县', '广西省河池市东兰县', 3, 451200),
(451225, '罗城仫佬族自治县', '广西省河池市罗城仫佬族自治县', 3, 451200),
(451226, '环江毛南族自治县', '广西省河池市环江毛南族自治县', 3, 451200),
(451227, '巴马瑶族自治县', '广西省河池市巴马瑶族自治县', 3, 451200),
(451228, '都安瑶族自治县', '广西省河池市都安瑶族自治县', 3, 451200),
(451229, '大化瑶族自治县', '广西省河池市大化瑶族自治县', 3, 451200),
(451281, '宜州市', '广西省河池市宜州市', 3, 451200),
(451301, '市辖区', '广西省来宾市市辖区', 3, 451300),
(451302, '兴宾区', '广西省来宾市兴宾区', 3, 451300),
(451321, '忻城县', '广西省来宾市忻城县', 3, 451300);
INSERT INTO `ocenter_district` (`id`, `name`, `fullName`, `level`, `upid`) VALUES
(451322, '象州县', '广西省来宾市象州县', 3, 451300),
(451323, '武宣县', '广西省来宾市武宣县', 3, 451300),
(451324, '金秀瑶族自治县', '广西省来宾市金秀瑶族自治县', 3, 451300),
(451381, '合山市', '广西省来宾市合山市', 3, 451300),
(451401, '市辖区', '广西省崇左市市辖区', 3, 451400),
(451402, '江洲区', '广西省崇左市江洲区', 3, 451400),
(451421, '扶绥县', '广西省崇左市扶绥县', 3, 451400),
(451422, '宁明县', '广西省崇左市宁明县', 3, 451400),
(451423, '龙州县', '广西省崇左市龙州县', 3, 451400),
(451424, '大新县', '广西省崇左市大新县', 3, 451400),
(451425, '天等县', '广西省崇左市天等县', 3, 451400),
(451481, '凭祥市', '广西省崇左市凭祥市', 3, 451400),
(460101, '市辖区', '海南省海口市市辖区', 3, 460100),
(460105, '秀英区', '海南省海口市秀英区', 3, 460100),
(460106, '龙华区', '海南省海口市龙华区', 3, 460100),
(460107, '琼山区', '海南省海口市琼山区', 3, 460100),
(460108, '美兰区', '海南省海口市美兰区', 3, 460100),
(460201, '市辖区', '海南省三亚市市辖区', 3, 460200),
(469001, '五指山市', '海南省五指山市', 3, 469000),
(469002, '琼海市', '海南省琼海市', 3, 469000),
(469003, '儋州市', '海南省儋州市', 3, 469000),
(469005, '文昌市', '海南省文昌市', 3, 469000),
(469006, '万宁市', '海南省万宁市', 3, 469000),
(469007, '东方市', '海南省东方市', 3, 469000),
(469025, '定安县', '海南省定安县', 3, 469000),
(469026, '屯昌县', '海南省屯昌县', 3, 469000),
(469027, '澄迈县', '海南省澄迈县', 3, 469000),
(469028, '临高县', '海南省临高县', 3, 469000),
(469030, '白沙黎族自治县', '海南省白沙黎族自治县', 3, 469000),
(469031, '昌江黎族自治县', '海南省昌江黎族自治县', 3, 469000),
(469033, '乐东黎族自治县', '海南省乐东黎族自治县', 3, 469000),
(469034, '陵水黎族自治县', '海南省陵水黎族自治县', 3, 469000),
(469035, '保亭黎族苗族自治县', '海南省保亭黎族苗族自治县', 3, 469000),
(469036, '琼中黎族苗族自治县', '海南省琼中黎族苗族自治县', 3, 469000),
(469037, '西沙群岛', '海南省西沙群岛', 3, 469000),
(469038, '南沙群岛', '海南省南沙群岛', 3, 469000),
(469039, '中沙群岛的岛礁及其海域', '海南省中沙群岛的岛礁及其海域', 3, 469000),
(500101, '万州区', '重庆市万州区', 3, 500100),
(500102, '涪陵区', '重庆市涪陵区', 3, 500100),
(500103, '渝中区', '重庆市渝中区', 3, 500100),
(500104, '大渡口区', '重庆市大渡口区', 3, 500100),
(500105, '江北区', '重庆市江北区', 3, 500100),
(500106, '沙坪坝区', '重庆市沙坪坝区', 3, 500100),
(500107, '九龙坡区', '重庆市九龙坡区', 3, 500100),
(500108, '南岸区', '重庆市南岸区', 3, 500100),
(500109, '北碚区', '重庆市北碚区', 3, 500100),
(500110, '万盛区', '重庆市万盛区', 3, 500100),
(500111, '双桥区', '重庆市双桥区', 3, 500100),
(500112, '渝北区', '重庆市渝北区', 3, 500100),
(500113, '巴南区', '重庆市巴南区', 3, 500100),
(500114, '黔江区', '重庆市黔江区', 3, 500100),
(500115, '长寿区', '重庆市长寿区', 3, 500100),
(500222, '綦江县', '重庆市綦江县', 3, 500200),
(500223, '潼南县', '重庆市潼南县', 3, 500200),
(500224, '铜梁县', '重庆市铜梁县', 3, 500200),
(500225, '大足县', '重庆市大足县', 3, 500200),
(500226, '荣昌县', '重庆市荣昌县', 3, 500200),
(500227, '璧山县', '重庆市璧山县', 3, 500200),
(500228, '梁平县', '重庆市梁平县', 3, 500200),
(500229, '城口县', '重庆市城口县', 3, 500200),
(500230, '丰都县', '重庆市丰都县', 3, 500200),
(500231, '垫江县', '重庆市垫江县', 3, 500200),
(500232, '武隆县', '重庆市武隆县', 3, 500200),
(500233, '忠　县', '重庆市忠县', 3, 500200),
(500234, '开　县', '重庆市开县', 3, 500200),
(500235, '云阳县', '重庆市云阳县', 3, 500200),
(500236, '奉节县', '重庆市奉节县', 3, 500200),
(500237, '巫山县', '重庆市巫山县', 3, 500200),
(500238, '巫溪县', '重庆市巫溪县', 3, 500200),
(500240, '石柱土家族自治县', '重庆市石柱土家族自治县', 3, 500200),
(500241, '秀山土家族苗族自治县', '重庆市秀山土家族苗族自治县', 3, 500200),
(500242, '酉阳土家族苗族自治县', '重庆市酉阳土家族苗族自治县', 3, 500200),
(500243, '彭水苗族土家族自治县', '重庆市彭水苗族土家族自治县', 3, 500200),
(500381, '江津市', '重庆市江津市', 3, 500300),
(500382, '合川市', '重庆市合川市', 3, 500300),
(500383, '永川市', '重庆市永川市', 3, 500300),
(500384, '南川市', '重庆市南川市', 3, 500300),
(510101, '市辖区', '四川省成都市市辖区', 3, 510100),
(510104, '锦江区', '四川省成都市锦江区', 3, 510100),
(510105, '青羊区', '四川省成都市青羊区', 3, 510100),
(510106, '金牛区', '四川省成都市金牛区', 3, 510100),
(510107, '武侯区', '四川省成都市武侯区', 3, 510100),
(510108, '成华区', '四川省成都市成华区', 3, 510100),
(510112, '龙泉驿区', '四川省成都市龙泉驿区', 3, 510100),
(510113, '青白江区', '四川省成都市青白江区', 3, 510100),
(510114, '新都区', '四川省成都市新都区', 3, 510100),
(510115, '温江区', '四川省成都市温江区', 3, 510100),
(510121, '金堂县', '四川省成都市金堂县', 3, 510100),
(510122, '双流县', '四川省成都市双流县', 3, 510100),
(510124, '郫　县', '四川省成都市郫县', 3, 510100),
(510129, '大邑县', '四川省成都市大邑县', 3, 510100),
(510131, '蒲江县', '四川省成都市蒲江县', 3, 510100),
(510132, '新津县', '四川省成都市新津县', 3, 510100),
(510181, '都江堰市', '四川省成都市都江堰市', 3, 510100),
(510182, '彭州市', '四川省成都市彭州市', 3, 510100),
(510183, '邛崃市', '四川省成都市邛崃市', 3, 510100),
(510184, '崇州市', '四川省成都市崇州市', 3, 510100),
(510301, '市辖区', '四川省自贡市市辖区', 3, 510300),
(510302, '自流井区', '四川省自贡市自流井区', 3, 510300),
(510303, '贡井区', '四川省自贡市贡井区', 3, 510300),
(510304, '大安区', '四川省自贡市大安区', 3, 510300),
(510311, '沿滩区', '四川省自贡市沿滩区', 3, 510300),
(510321, '荣　县', '四川省自贡市荣县', 3, 510300),
(510322, '富顺县', '四川省自贡市富顺县', 3, 510300),
(510401, '市辖区', '四川省攀枝花市市辖区', 3, 510400),
(510402, '东　区', '四川省攀枝花市东区', 3, 510400),
(510403, '西　区', '四川省攀枝花市西区', 3, 510400),
(510411, '仁和区', '四川省攀枝花市仁和区', 3, 510400),
(510421, '米易县', '四川省攀枝花市米易县', 3, 510400),
(510422, '盐边县', '四川省攀枝花市盐边县', 3, 510400),
(510501, '市辖区', '四川省泸州市市辖区', 3, 510500),
(510502, '江阳区', '四川省泸州市江阳区', 3, 510500),
(510503, '纳溪区', '四川省泸州市纳溪区', 3, 510500),
(510504, '龙马潭区', '四川省泸州市龙马潭区', 3, 510500),
(510521, '泸　县', '四川省泸州市泸县', 3, 510500),
(510522, '合江县', '四川省泸州市合江县', 3, 510500),
(510524, '叙永县', '四川省泸州市叙永县', 3, 510500),
(510525, '古蔺县', '四川省泸州市古蔺县', 3, 510500),
(510601, '市辖区', '四川省德阳市市辖区', 3, 510600),
(510603, '旌阳区', '四川省德阳市旌阳区', 3, 510600),
(510623, '中江县', '四川省德阳市中江县', 3, 510600),
(510626, '罗江县', '四川省德阳市罗江县', 3, 510600),
(510681, '广汉市', '四川省德阳市广汉市', 3, 510600),
(510682, '什邡市', '四川省德阳市什邡市', 3, 510600),
(510683, '绵竹市', '四川省德阳市绵竹市', 3, 510600),
(510701, '市辖区', '四川省绵阳市市辖区', 3, 510700),
(510703, '涪城区', '四川省绵阳市涪城区', 3, 510700),
(510704, '游仙区', '四川省绵阳市游仙区', 3, 510700),
(510722, '三台县', '四川省绵阳市三台县', 3, 510700),
(510723, '盐亭县', '四川省绵阳市盐亭县', 3, 510700),
(510724, '安　县', '四川省绵阳市安县', 3, 510700),
(510725, '梓潼县', '四川省绵阳市梓潼县', 3, 510700),
(510726, '北川羌族自治县', '四川省绵阳市北川羌族自治县', 3, 510700),
(510727, '平武县', '四川省绵阳市平武县', 3, 510700),
(510781, '江油市', '四川省绵阳市江油市', 3, 510700),
(510801, '市辖区', '四川省广元市市辖区', 3, 510800),
(510802, '市中区', '四川省广元市市中区', 3, 510800),
(510811, '元坝区', '四川省广元市元坝区', 3, 510800),
(510812, '朝天区', '四川省广元市朝天区', 3, 510800),
(510821, '旺苍县', '四川省广元市旺苍县', 3, 510800),
(510822, '青川县', '四川省广元市青川县', 3, 510800),
(510823, '剑阁县', '四川省广元市剑阁县', 3, 510800),
(510824, '苍溪县', '四川省广元市苍溪县', 3, 510800),
(510901, '市辖区', '四川省遂宁市市辖区', 3, 510900),
(510903, '船山区', '四川省遂宁市船山区', 3, 510900),
(510904, '安居区', '四川省遂宁市安居区', 3, 510900),
(510921, '蓬溪县', '四川省遂宁市蓬溪县', 3, 510900),
(510922, '射洪县', '四川省遂宁市射洪县', 3, 510900),
(510923, '大英县', '四川省遂宁市大英县', 3, 510900),
(511001, '市辖区', '四川省内江市市辖区', 3, 511000),
(511002, '市中区', '四川省内江市市中区', 3, 511000),
(511011, '东兴区', '四川省内江市东兴区', 3, 511000),
(511024, '威远县', '四川省内江市威远县', 3, 511000),
(511025, '资中县', '四川省内江市资中县', 3, 511000),
(511028, '隆昌县', '四川省内江市隆昌县', 3, 511000),
(511101, '市辖区', '四川省乐山市市辖区', 3, 511100),
(511102, '市中区', '四川省乐山市市中区', 3, 511100),
(511111, '沙湾区', '四川省乐山市沙湾区', 3, 511100),
(511112, '五通桥区', '四川省乐山市五通桥区', 3, 511100),
(511113, '金口河区', '四川省乐山市金口河区', 3, 511100),
(511123, '犍为县', '四川省乐山市犍为县', 3, 511100),
(511124, '井研县', '四川省乐山市井研县', 3, 511100),
(511126, '夹江县', '四川省乐山市夹江县', 3, 511100),
(511129, '沐川县', '四川省乐山市沐川县', 3, 511100),
(511132, '峨边彝族自治县', '四川省乐山市峨边彝族自治县', 3, 511100),
(511133, '马边彝族自治县', '四川省乐山市马边彝族自治县', 3, 511100),
(511181, '峨眉山市', '四川省乐山市峨眉山市', 3, 511100),
(511301, '市辖区', '四川省南充市市辖区', 3, 511300),
(511302, '顺庆区', '四川省南充市顺庆区', 3, 511300),
(511303, '高坪区', '四川省南充市高坪区', 3, 511300),
(511304, '嘉陵区', '四川省南充市嘉陵区', 3, 511300),
(511321, '南部县', '四川省南充市南部县', 3, 511300),
(511322, '营山县', '四川省南充市营山县', 3, 511300),
(511323, '蓬安县', '四川省南充市蓬安县', 3, 511300),
(511324, '仪陇县', '四川省南充市仪陇县', 3, 511300),
(511325, '西充县', '四川省南充市西充县', 3, 511300),
(511381, '阆中市', '四川省南充市阆中市', 3, 511300),
(511401, '市辖区', '四川省眉山市市辖区', 3, 511400),
(511402, '东坡区', '四川省眉山市东坡区', 3, 511400),
(511421, '仁寿县', '四川省眉山市仁寿县', 3, 511400),
(511422, '彭山县', '四川省眉山市彭山县', 3, 511400),
(511423, '洪雅县', '四川省眉山市洪雅县', 3, 511400),
(511424, '丹棱县', '四川省眉山市丹棱县', 3, 511400),
(511425, '青神县', '四川省眉山市青神县', 3, 511400),
(511501, '市辖区', '四川省宜宾市市辖区', 3, 511500),
(511502, '翠屏区', '四川省宜宾市翠屏区', 3, 511500),
(511521, '宜宾县', '四川省宜宾市宜宾县', 3, 511500),
(511522, '南溪县', '四川省宜宾市南溪县', 3, 511500),
(511523, '江安县', '四川省宜宾市江安县', 3, 511500),
(511524, '长宁县', '四川省宜宾市长宁县', 3, 511500),
(511525, '高　县', '四川省宜宾市高县', 3, 511500),
(511526, '珙　县', '四川省宜宾市珙县', 3, 511500),
(511527, '筠连县', '四川省宜宾市筠连县', 3, 511500),
(511528, '兴文县', '四川省宜宾市兴文县', 3, 511500),
(511529, '屏山县', '四川省宜宾市屏山县', 3, 511500),
(511601, '市辖区', '四川省广安市市辖区', 3, 511600),
(511602, '广安区', '四川省广安市广安区', 3, 511600),
(511621, '岳池县', '四川省广安市岳池县', 3, 511600),
(511622, '武胜县', '四川省广安市武胜县', 3, 511600),
(511623, '邻水县', '四川省广安市邻水县', 3, 511600),
(511681, '华莹市', '四川省广安市华莹市', 3, 511600),
(511701, '市辖区', '四川省达州市市辖区', 3, 511700),
(511702, '通川区', '四川省达州市通川区', 3, 511700),
(511721, '达　县', '四川省达州市达县', 3, 511700),
(511722, '宣汉县', '四川省达州市宣汉县', 3, 511700),
(511723, '开江县', '四川省达州市开江县', 3, 511700),
(511724, '大竹县', '四川省达州市大竹县', 3, 511700),
(511725, '渠　县', '四川省达州市渠县', 3, 511700),
(511781, '万源市', '四川省达州市万源市', 3, 511700),
(511801, '市辖区', '四川省雅安市市辖区', 3, 511800),
(511802, '雨城区', '四川省雅安市雨城区', 3, 511800),
(511821, '名山县', '四川省雅安市名山县', 3, 511800),
(511822, '荥经县', '四川省雅安市荥经县', 3, 511800),
(511823, '汉源县', '四川省雅安市汉源县', 3, 511800),
(511824, '石棉县', '四川省雅安市石棉县', 3, 511800),
(511825, '天全县', '四川省雅安市天全县', 3, 511800),
(511826, '芦山县', '四川省雅安市芦山县', 3, 511800),
(511827, '宝兴县', '四川省雅安市宝兴县', 3, 511800),
(511901, '市辖区', '四川省巴中市市辖区', 3, 511900),
(511902, '巴州区', '四川省巴中市巴州区', 3, 511900),
(511921, '通江县', '四川省巴中市通江县', 3, 511900),
(511922, '南江县', '四川省巴中市南江县', 3, 511900),
(511923, '平昌县', '四川省巴中市平昌县', 3, 511900),
(512001, '市辖区', '四川省资阳市市辖区', 3, 512000),
(512002, '雁江区', '四川省资阳市雁江区', 3, 512000),
(512021, '安岳县', '四川省资阳市安岳县', 3, 512000),
(512022, '乐至县', '四川省资阳市乐至县', 3, 512000),
(512081, '简阳市', '四川省资阳市简阳市', 3, 512000),
(513221, '汶川县', '四川省阿坝藏族羌族自治州汶川县', 3, 513200),
(513222, '理　县', '四川省阿坝藏族羌族自治州理县', 3, 513200),
(513223, '茂　县', '四川省阿坝藏族羌族自治州茂县', 3, 513200),
(513224, '松潘县', '四川省阿坝藏族羌族自治州松潘县', 3, 513200),
(513225, '九寨沟县', '四川省阿坝藏族羌族自治州九寨沟县', 3, 513200),
(513226, '金川县', '四川省阿坝藏族羌族自治州金川县', 3, 513200),
(513227, '小金县', '四川省阿坝藏族羌族自治州小金县', 3, 513200),
(513228, '黑水县', '四川省阿坝藏族羌族自治州黑水县', 3, 513200),
(513229, '马尔康县', '四川省阿坝藏族羌族自治州马尔康县', 3, 513200),
(513230, '壤塘县', '四川省阿坝藏族羌族自治州壤塘县', 3, 513200),
(513231, '阿坝县', '四川省阿坝藏族羌族自治州阿坝县', 3, 513200),
(513232, '若尔盖县', '四川省阿坝藏族羌族自治州若尔盖县', 3, 513200),
(513233, '红原县', '四川省阿坝藏族羌族自治州红原县', 3, 513200),
(513321, '康定县', '四川省甘孜藏族自治州康定县', 3, 513300),
(513322, '泸定县', '四川省甘孜藏族自治州泸定县', 3, 513300),
(513323, '丹巴县', '四川省甘孜藏族自治州丹巴县', 3, 513300),
(513324, '九龙县', '四川省甘孜藏族自治州九龙县', 3, 513300),
(513325, '雅江县', '四川省甘孜藏族自治州雅江县', 3, 513300),
(513326, '道孚县', '四川省甘孜藏族自治州道孚县', 3, 513300),
(513327, '炉霍县', '四川省甘孜藏族自治州炉霍县', 3, 513300),
(513328, '甘孜县', '四川省甘孜藏族自治州甘孜县', 3, 513300),
(513329, '新龙县', '四川省甘孜藏族自治州新龙县', 3, 513300),
(513330, '德格县', '四川省甘孜藏族自治州德格县', 3, 513300),
(513331, '白玉县', '四川省甘孜藏族自治州白玉县', 3, 513300),
(513332, '石渠县', '四川省甘孜藏族自治州石渠县', 3, 513300),
(513333, '色达县', '四川省甘孜藏族自治州色达县', 3, 513300),
(513334, '理塘县', '四川省甘孜藏族自治州理塘县', 3, 513300),
(513335, '巴塘县', '四川省甘孜藏族自治州巴塘县', 3, 513300),
(513336, '乡城县', '四川省甘孜藏族自治州乡城县', 3, 513300),
(513337, '稻城县', '四川省甘孜藏族自治州稻城县', 3, 513300),
(513338, '得荣县', '四川省甘孜藏族自治州得荣县', 3, 513300),
(513401, '西昌市', '四川省凉山彝族自治州西昌市', 3, 513400),
(513422, '木里藏族自治县', '四川省凉山彝族自治州木里藏族自治县', 3, 513400),
(513423, '盐源县', '四川省凉山彝族自治州盐源县', 3, 513400),
(513424, '德昌县', '四川省凉山彝族自治州德昌县', 3, 513400),
(513425, '会理县', '四川省凉山彝族自治州会理县', 3, 513400),
(513426, '会东县', '四川省凉山彝族自治州会东县', 3, 513400),
(513427, '宁南县', '四川省凉山彝族自治州宁南县', 3, 513400),
(513428, '普格县', '四川省凉山彝族自治州普格县', 3, 513400),
(513429, '布拖县', '四川省凉山彝族自治州布拖县', 3, 513400),
(513430, '金阳县', '四川省凉山彝族自治州金阳县', 3, 513400),
(513431, '昭觉县', '四川省凉山彝族自治州昭觉县', 3, 513400),
(513432, '喜德县', '四川省凉山彝族自治州喜德县', 3, 513400),
(513433, '冕宁县', '四川省凉山彝族自治州冕宁县', 3, 513400),
(513434, '越西县', '四川省凉山彝族自治州越西县', 3, 513400),
(513435, '甘洛县', '四川省凉山彝族自治州甘洛县', 3, 513400),
(513436, '美姑县', '四川省凉山彝族自治州美姑县', 3, 513400),
(513437, '雷波县', '四川省凉山彝族自治州雷波县', 3, 513400),
(520101, '市辖区', '贵州省贵阳市市辖区', 3, 520100),
(520102, '南明区', '贵州省贵阳市南明区', 3, 520100),
(520103, '云岩区', '贵州省贵阳市云岩区', 3, 520100),
(520111, '花溪区', '贵州省贵阳市花溪区', 3, 520100),
(520112, '乌当区', '贵州省贵阳市乌当区', 3, 520100),
(520113, '白云区', '贵州省贵阳市白云区', 3, 520100),
(520114, '小河区', '贵州省贵阳市小河区', 3, 520100),
(520121, '开阳县', '贵州省贵阳市开阳县', 3, 520100),
(520122, '息烽县', '贵州省贵阳市息烽县', 3, 520100),
(520123, '修文县', '贵州省贵阳市修文县', 3, 520100),
(520181, '清镇市', '贵州省贵阳市清镇市', 3, 520100),
(520201, '钟山区', '贵州省六盘水市钟山区', 3, 520200),
(520203, '六枝特区', '贵州省六盘水市六枝特区', 3, 520200),
(520221, '水城县', '贵州省六盘水市水城县', 3, 520200),
(520222, '盘　县', '贵州省六盘水市盘县', 3, 520200),
(520301, '市辖区', '贵州省遵义市市辖区', 3, 520300),
(520302, '红花岗区', '贵州省遵义市红花岗区', 3, 520300),
(520303, '汇川区', '贵州省遵义市汇川区', 3, 520300),
(520321, '遵义县', '贵州省遵义市遵义县', 3, 520300),
(520322, '桐梓县', '贵州省遵义市桐梓县', 3, 520300),
(520323, '绥阳县', '贵州省遵义市绥阳县', 3, 520300),
(520324, '正安县', '贵州省遵义市正安县', 3, 520300),
(520325, '道真仡佬族苗族自治县', '贵州省遵义市道真仡佬族苗族自治县', 3, 520300),
(520326, '务川仡佬族苗族自治县', '贵州省遵义市务川仡佬族苗族自治县', 3, 520300),
(520327, '凤冈县', '贵州省遵义市凤冈县', 3, 520300),
(520328, '湄潭县', '贵州省遵义市湄潭县', 3, 520300),
(520329, '余庆县', '贵州省遵义市余庆县', 3, 520300),
(520330, '习水县', '贵州省遵义市习水县', 3, 520300),
(520381, '赤水市', '贵州省遵义市赤水市', 3, 520300),
(520382, '仁怀市', '贵州省遵义市仁怀市', 3, 520300),
(520401, '市辖区', '贵州省安顺市市辖区', 3, 520400),
(520402, '西秀区', '贵州省安顺市西秀区', 3, 520400),
(520421, '平坝县', '贵州省安顺市平坝县', 3, 520400),
(520422, '普定县', '贵州省安顺市普定县', 3, 520400),
(520423, '镇宁布依族苗族自治县', '贵州省安顺市镇宁布依族苗族自治县', 3, 520400),
(520424, '关岭布依族苗族自治县', '贵州省安顺市关岭布依族苗族自治县', 3, 520400),
(520425, '紫云苗族布依族自治县', '贵州省安顺市紫云苗族布依族自治县', 3, 520400),
(522201, '铜仁市', '贵州省铜仁地区铜仁市', 3, 522200),
(522222, '江口县', '贵州省铜仁地区江口县', 3, 522200),
(522223, '玉屏侗族自治县', '贵州省铜仁地区玉屏侗族自治县', 3, 522200),
(522224, '石阡县', '贵州省铜仁地区石阡县', 3, 522200),
(522225, '思南县', '贵州省铜仁地区思南县', 3, 522200),
(522226, '印江土家族苗族自治县', '贵州省铜仁地区印江土家族苗族自治县', 3, 522200),
(522227, '德江县', '贵州省铜仁地区德江县', 3, 522200),
(522228, '沿河土家族自治县', '贵州省铜仁地区沿河土家族自治县', 3, 522200),
(522229, '松桃苗族自治县', '贵州省铜仁地区松桃苗族自治县', 3, 522200),
(522230, '万山特区', '贵州省铜仁地区万山特区', 3, 522200),
(522301, '兴义市', '贵州省黔西南布依族苗族自治州兴义市', 3, 522300),
(522322, '兴仁县', '贵州省黔西南布依族苗族自治州兴仁县', 3, 522300),
(522323, '普安县', '贵州省黔西南布依族苗族自治州普安县', 3, 522300),
(522324, '晴隆县', '贵州省黔西南布依族苗族自治州晴隆县', 3, 522300),
(522325, '贞丰县', '贵州省黔西南布依族苗族自治州贞丰县', 3, 522300),
(522326, '望谟县', '贵州省黔西南布依族苗族自治州望谟县', 3, 522300),
(522327, '册亨县', '贵州省黔西南布依族苗族自治州册亨县', 3, 522300),
(522328, '安龙县', '贵州省黔西南布依族苗族自治州安龙县', 3, 522300),
(522401, '毕节市', '贵州省毕节地区毕节市', 3, 522400),
(522422, '大方县', '贵州省毕节地区大方县', 3, 522400),
(522423, '黔西县', '贵州省毕节地区黔西县', 3, 522400),
(522424, '金沙县', '贵州省毕节地区金沙县', 3, 522400),
(522425, '织金县', '贵州省毕节地区织金县', 3, 522400),
(522426, '纳雍县', '贵州省毕节地区纳雍县', 3, 522400),
(522427, '威宁彝族回族苗族自治县', '贵州省毕节地区威宁彝族回族苗族自治县', 3, 522400),
(522428, '赫章县', '贵州省毕节地区赫章县', 3, 522400),
(522601, '凯里市', '贵州省黔东南苗族侗族自治州凯里市', 3, 522600),
(522622, '黄平县', '贵州省黔东南苗族侗族自治州黄平县', 3, 522600),
(522623, '施秉县', '贵州省黔东南苗族侗族自治州施秉县', 3, 522600),
(522624, '三穗县', '贵州省黔东南苗族侗族自治州三穗县', 3, 522600),
(522625, '镇远县', '贵州省黔东南苗族侗族自治州镇远县', 3, 522600),
(522626, '岑巩县', '贵州省黔东南苗族侗族自治州岑巩县', 3, 522600),
(522627, '天柱县', '贵州省黔东南苗族侗族自治州天柱县', 3, 522600),
(522628, '锦屏县', '贵州省黔东南苗族侗族自治州锦屏县', 3, 522600),
(522629, '剑河县', '贵州省黔东南苗族侗族自治州剑河县', 3, 522600),
(522630, '台江县', '贵州省黔东南苗族侗族自治州台江县', 3, 522600),
(522631, '黎平县', '贵州省黔东南苗族侗族自治州黎平县', 3, 522600),
(522632, '榕江县', '贵州省黔东南苗族侗族自治州榕江县', 3, 522600),
(522633, '从江县', '贵州省黔东南苗族侗族自治州从江县', 3, 522600),
(522634, '雷山县', '贵州省黔东南苗族侗族自治州雷山县', 3, 522600),
(522635, '麻江县', '贵州省黔东南苗族侗族自治州麻江县', 3, 522600),
(522636, '丹寨县', '贵州省黔东南苗族侗族自治州丹寨县', 3, 522600),
(522701, '都匀市', '贵州省黔南布依族苗族自治州都匀市', 3, 522700),
(522702, '福泉市', '贵州省黔南布依族苗族自治州福泉市', 3, 522700),
(522722, '荔波县', '贵州省黔南布依族苗族自治州荔波县', 3, 522700),
(522723, '贵定县', '贵州省黔南布依族苗族自治州贵定县', 3, 522700),
(522725, '瓮安县', '贵州省黔南布依族苗族自治州瓮安县', 3, 522700),
(522726, '独山县', '贵州省黔南布依族苗族自治州独山县', 3, 522700),
(522727, '平塘县', '贵州省黔南布依族苗族自治州平塘县', 3, 522700),
(522728, '罗甸县', '贵州省黔南布依族苗族自治州罗甸县', 3, 522700),
(522729, '长顺县', '贵州省黔南布依族苗族自治州长顺县', 3, 522700),
(522730, '龙里县', '贵州省黔南布依族苗族自治州龙里县', 3, 522700),
(522731, '惠水县', '贵州省黔南布依族苗族自治州惠水县', 3, 522700),
(522732, '三都水族自治县', '贵州省黔南布依族苗族自治州三都水族自治县', 3, 522700),
(530101, '市辖区', '云南省昆明市市辖区', 3, 530100),
(530102, '五华区', '云南省昆明市五华区', 3, 530100),
(530103, '盘龙区', '云南省昆明市盘龙区', 3, 530100),
(530111, '官渡区', '云南省昆明市官渡区', 3, 530100),
(530112, '西山区', '云南省昆明市西山区', 3, 530100),
(530113, '东川区', '云南省昆明市东川区', 3, 530100),
(530121, '呈贡县', '云南省昆明市呈贡县', 3, 530100),
(530122, '晋宁县', '云南省昆明市晋宁县', 3, 530100),
(530124, '富民县', '云南省昆明市富民县', 3, 530100),
(530125, '宜良县', '云南省昆明市宜良县', 3, 530100),
(530126, '石林彝族自治县', '云南省昆明市石林彝族自治县', 3, 530100),
(530127, '嵩明县', '云南省昆明市嵩明县', 3, 530100),
(530128, '禄劝彝族苗族自治县', '云南省昆明市禄劝彝族苗族自治县', 3, 530100),
(530129, '寻甸回族彝族自治县', '云南省昆明市寻甸回族彝族自治县', 3, 530100),
(530181, '安宁市', '云南省昆明市安宁市', 3, 530100),
(530301, '市辖区', '云南省曲靖市市辖区', 3, 530300),
(530302, '麒麟区', '云南省曲靖市麒麟区', 3, 530300),
(530321, '马龙县', '云南省曲靖市马龙县', 3, 530300),
(530322, '陆良县', '云南省曲靖市陆良县', 3, 530300),
(530323, '师宗县', '云南省曲靖市师宗县', 3, 530300),
(530324, '罗平县', '云南省曲靖市罗平县', 3, 530300),
(530325, '富源县', '云南省曲靖市富源县', 3, 530300),
(530326, '会泽县', '云南省曲靖市会泽县', 3, 530300),
(530328, '沾益县', '云南省曲靖市沾益县', 3, 530300),
(530381, '宣威市', '云南省曲靖市宣威市', 3, 530300),
(530401, '市辖区', '云南省玉溪市市辖区', 3, 530400),
(530402, '红塔区', '云南省玉溪市红塔区', 3, 530400),
(530421, '江川县', '云南省玉溪市江川县', 3, 530400),
(530422, '澄江县', '云南省玉溪市澄江县', 3, 530400),
(530423, '通海县', '云南省玉溪市通海县', 3, 530400),
(530424, '华宁县', '云南省玉溪市华宁县', 3, 530400),
(530425, '易门县', '云南省玉溪市易门县', 3, 530400),
(530426, '峨山彝族自治县', '云南省玉溪市峨山彝族自治县', 3, 530400),
(530427, '新平彝族傣族自治县', '云南省玉溪市新平彝族傣族自治县', 3, 530400),
(530428, '元江哈尼族彝族傣族自治县', '云南省玉溪市元江哈尼族彝族傣族自治县', 3, 530400),
(530501, '市辖区', '云南省保山市市辖区', 3, 530500),
(530502, '隆阳区', '云南省保山市隆阳区', 3, 530500),
(530521, '施甸县', '云南省保山市施甸县', 3, 530500),
(530522, '腾冲县', '云南省保山市腾冲县', 3, 530500),
(530523, '龙陵县', '云南省保山市龙陵县', 3, 530500),
(530524, '昌宁县', '云南省保山市昌宁县', 3, 530500),
(530601, '市辖区', '云南省昭通市市辖区', 3, 530600),
(530602, '昭阳区', '云南省昭通市昭阳区', 3, 530600),
(530621, '鲁甸县', '云南省昭通市鲁甸县', 3, 530600),
(530622, '巧家县', '云南省昭通市巧家县', 3, 530600),
(530623, '盐津县', '云南省昭通市盐津县', 3, 530600),
(530624, '大关县', '云南省昭通市大关县', 3, 530600),
(530625, '永善县', '云南省昭通市永善县', 3, 530600),
(530626, '绥江县', '云南省昭通市绥江县', 3, 530600),
(530627, '镇雄县', '云南省昭通市镇雄县', 3, 530600),
(530628, '彝良县', '云南省昭通市彝良县', 3, 530600),
(530629, '威信县', '云南省昭通市威信县', 3, 530600),
(530630, '水富县', '云南省昭通市水富县', 3, 530600),
(530701, '市辖区', '云南省丽江市市辖区', 3, 530700),
(530702, '古城区', '云南省丽江市古城区', 3, 530700),
(530721, '玉龙纳西族自治县', '云南省丽江市玉龙纳西族自治县', 3, 530700),
(530722, '永胜县', '云南省丽江市永胜县', 3, 530700),
(530723, '华坪县', '云南省丽江市华坪县', 3, 530700),
(530724, '宁蒗彝族自治县', '云南省丽江市宁蒗彝族自治县', 3, 530700),
(530801, '市辖区', '云南省思茅市市辖区', 3, 530800),
(530802, '翠云区', '云南省思茅市翠云区', 3, 530800),
(530821, '普洱哈尼族彝族自治县', '云南省思茅市普洱哈尼族彝族自治县', 3, 530800),
(530822, '墨江哈尼族自治县', '云南省思茅市墨江哈尼族自治县', 3, 530800),
(530823, '景东彝族自治县', '云南省思茅市景东彝族自治县', 3, 530800),
(530824, '景谷傣族彝族自治县', '云南省思茅市景谷傣族彝族自治县', 3, 530800),
(530825, '镇沅彝族哈尼族拉祜族自治县', '云南省思茅市镇沅彝族哈尼族拉祜族自治县', 3, 530800),
(530826, '江城哈尼族彝族自治县', '云南省思茅市江城哈尼族彝族自治县', 3, 530800),
(530827, '孟连傣族拉祜族佤族自治县', '云南省思茅市孟连傣族拉祜族佤族自治县', 3, 530800),
(530828, '澜沧拉祜族自治县', '云南省思茅市澜沧拉祜族自治县', 3, 530800),
(530829, '西盟佤族自治县', '云南省思茅市西盟佤族自治县', 3, 530800),
(530901, '市辖区', '云南省临沧市市辖区', 3, 530900),
(530902, '临翔区', '云南省临沧市临翔区', 3, 530900),
(530921, '凤庆县', '云南省临沧市凤庆县', 3, 530900),
(530922, '云　县', '云南省临沧市云县', 3, 530900),
(530923, '永德县', '云南省临沧市永德县', 3, 530900),
(530924, '镇康县', '云南省临沧市镇康县', 3, 530900),
(530925, '双江拉祜族佤族布朗族傣族自治县', '云南省临沧市双江拉祜族佤族布朗族傣族自治县', 3, 530900),
(530926, '耿马傣族佤族自治县', '云南省临沧市耿马傣族佤族自治县', 3, 530900),
(530927, '沧源佤族自治县', '云南省临沧市沧源佤族自治县', 3, 530900),
(532301, '楚雄市', '云南省楚雄彝族自治州楚雄市', 3, 532300),
(532322, '双柏县', '云南省楚雄彝族自治州双柏县', 3, 532300),
(532323, '牟定县', '云南省楚雄彝族自治州牟定县', 3, 532300),
(532324, '南华县', '云南省楚雄彝族自治州南华县', 3, 532300),
(532325, '姚安县', '云南省楚雄彝族自治州姚安县', 3, 532300),
(532326, '大姚县', '云南省楚雄彝族自治州大姚县', 3, 532300),
(532327, '永仁县', '云南省楚雄彝族自治州永仁县', 3, 532300),
(532328, '元谋县', '云南省楚雄彝族自治州元谋县', 3, 532300),
(532329, '武定县', '云南省楚雄彝族自治州武定县', 3, 532300),
(532331, '禄丰县', '云南省楚雄彝族自治州禄丰县', 3, 532300),
(532501, '个旧市', '云南省红河哈尼族彝族自治州个旧市', 3, 532500),
(532502, '开远市', '云南省红河哈尼族彝族自治州开远市', 3, 532500),
(532522, '蒙自县', '云南省红河哈尼族彝族自治州蒙自县', 3, 532500),
(532523, '屏边苗族自治县', '云南省红河哈尼族彝族自治州屏边苗族自治县', 3, 532500),
(532524, '建水县', '云南省红河哈尼族彝族自治州建水县', 3, 532500),
(532525, '石屏县', '云南省红河哈尼族彝族自治州石屏县', 3, 532500),
(532526, '弥勒县', '云南省红河哈尼族彝族自治州弥勒县', 3, 532500),
(532527, '泸西县', '云南省红河哈尼族彝族自治州泸西县', 3, 532500),
(532528, '元阳县', '云南省红河哈尼族彝族自治州元阳县', 3, 532500),
(532529, '红河县', '云南省红河哈尼族彝族自治州红河县', 3, 532500),
(532530, '金平苗族瑶族傣族自治县', '云南省红河哈尼族彝族自治州金平苗族瑶族傣族自治县', 3, 532500),
(532531, '绿春县', '云南省红河哈尼族彝族自治州绿春县', 3, 532500),
(532532, '河口瑶族自治县', '云南省红河哈尼族彝族自治州河口瑶族自治县', 3, 532500),
(532621, '文山县', '云南省文山壮族苗族自治州文山县', 3, 532600),
(532622, '砚山县', '云南省文山壮族苗族自治州砚山县', 3, 532600),
(532623, '西畴县', '云南省文山壮族苗族自治州西畴县', 3, 532600),
(532624, '麻栗坡县', '云南省文山壮族苗族自治州麻栗坡县', 3, 532600),
(532625, '马关县', '云南省文山壮族苗族自治州马关县', 3, 532600),
(532626, '丘北县', '云南省文山壮族苗族自治州丘北县', 3, 532600),
(532627, '广南县', '云南省文山壮族苗族自治州广南县', 3, 532600),
(532628, '富宁县', '云南省文山壮族苗族自治州富宁县', 3, 532600),
(532801, '景洪市', '云南省西双版纳傣族自治州景洪市', 3, 532800),
(532822, '勐海县', '云南省西双版纳傣族自治州勐海县', 3, 532800),
(532823, '勐腊县', '云南省西双版纳傣族自治州勐腊县', 3, 532800),
(532901, '大理市', '云南省大理白族自治州大理市', 3, 532900),
(532922, '漾濞彝族自治县', '云南省大理白族自治州漾濞彝族自治县', 3, 532900),
(532923, '祥云县', '云南省大理白族自治州祥云县', 3, 532900),
(532924, '宾川县', '云南省大理白族自治州宾川县', 3, 532900),
(532925, '弥渡县', '云南省大理白族自治州弥渡县', 3, 532900),
(532926, '南涧彝族自治县', '云南省大理白族自治州南涧彝族自治县', 3, 532900),
(532927, '巍山彝族回族自治县', '云南省大理白族自治州巍山彝族回族自治县', 3, 532900),
(532928, '永平县', '云南省大理白族自治州永平县', 3, 532900),
(532929, '云龙县', '云南省大理白族自治州云龙县', 3, 532900),
(532930, '洱源县', '云南省大理白族自治州洱源县', 3, 532900),
(532931, '剑川县', '云南省大理白族自治州剑川县', 3, 532900),
(532932, '鹤庆县', '云南省大理白族自治州鹤庆县', 3, 532900),
(533102, '瑞丽市', '云南省德宏傣族景颇族自治州瑞丽市', 3, 533100),
(533103, '潞西市', '云南省德宏傣族景颇族自治州潞西市', 3, 533100),
(533122, '梁河县', '云南省德宏傣族景颇族自治州梁河县', 3, 533100),
(533123, '盈江县', '云南省德宏傣族景颇族自治州盈江县', 3, 533100),
(533124, '陇川县', '云南省德宏傣族景颇族自治州陇川县', 3, 533100),
(533321, '泸水县', '云南省怒江傈僳族自治州泸水县', 3, 533300),
(533323, '福贡县', '云南省怒江傈僳族自治州福贡县', 3, 533300),
(533324, '贡山独龙族怒族自治县', '云南省怒江傈僳族自治州贡山独龙族怒族自治县', 3, 533300),
(533325, '兰坪白族普米族自治县', '云南省怒江傈僳族自治州兰坪白族普米族自治县', 3, 533300),
(533421, '香格里拉县', '云南省迪庆藏族自治州香格里拉县', 3, 533400),
(533422, '德钦县', '云南省迪庆藏族自治州德钦县', 3, 533400),
(533423, '维西傈僳族自治县', '云南省迪庆藏族自治州维西傈僳族自治县', 3, 533400),
(540101, '市辖区', '西藏拉萨市市辖区', 3, 540100),
(540102, '城关区', '西藏拉萨市城关区', 3, 540100),
(540121, '林周县', '西藏拉萨市林周县', 3, 540100),
(540122, '当雄县', '西藏拉萨市当雄县', 3, 540100),
(540123, '尼木县', '西藏拉萨市尼木县', 3, 540100),
(540124, '曲水县', '西藏拉萨市曲水县', 3, 540100),
(540125, '堆龙德庆县', '西藏拉萨市堆龙德庆县', 3, 540100),
(540126, '达孜县', '西藏拉萨市达孜县', 3, 540100),
(540127, '墨竹工卡县', '西藏拉萨市墨竹工卡县', 3, 540100),
(542121, '昌都县', '西藏昌都地区昌都县', 3, 542100),
(542122, '江达县', '西藏昌都地区江达县', 3, 542100),
(542123, '贡觉县', '西藏昌都地区贡觉县', 3, 542100),
(542124, '类乌齐县', '西藏昌都地区类乌齐县', 3, 542100),
(542125, '丁青县', '西藏昌都地区丁青县', 3, 542100),
(542126, '察雅县', '西藏昌都地区察雅县', 3, 542100),
(542127, '八宿县', '西藏昌都地区八宿县', 3, 542100),
(542128, '左贡县', '西藏昌都地区左贡县', 3, 542100),
(542129, '芒康县', '西藏昌都地区芒康县', 3, 542100),
(542132, '洛隆县', '西藏昌都地区洛隆县', 3, 542100),
(542133, '边坝县', '西藏昌都地区边坝县', 3, 542100),
(542221, '乃东县', '西藏山南地区乃东县', 3, 542200),
(542222, '扎囊县', '西藏山南地区扎囊县', 3, 542200),
(542223, '贡嘎县', '西藏山南地区贡嘎县', 3, 542200),
(542224, '桑日县', '西藏山南地区桑日县', 3, 542200),
(542225, '琼结县', '西藏山南地区琼结县', 3, 542200),
(542226, '曲松县', '西藏山南地区曲松县', 3, 542200),
(542227, '措美县', '西藏山南地区措美县', 3, 542200),
(542228, '洛扎县', '西藏山南地区洛扎县', 3, 542200),
(542229, '加查县', '西藏山南地区加查县', 3, 542200),
(542231, '隆子县', '西藏山南地区隆子县', 3, 542200),
(542232, '错那县', '西藏山南地区错那县', 3, 542200),
(542233, '浪卡子县', '西藏山南地区浪卡子县', 3, 542200),
(542301, '日喀则市', '西藏日喀则地区日喀则市', 3, 542300),
(542322, '南木林县', '西藏日喀则地区南木林县', 3, 542300),
(542323, '江孜县', '西藏日喀则地区江孜县', 3, 542300),
(542324, '定日县', '西藏日喀则地区定日县', 3, 542300),
(542325, '萨迦县', '西藏日喀则地区萨迦县', 3, 542300),
(542326, '拉孜县', '西藏日喀则地区拉孜县', 3, 542300),
(542327, '昂仁县', '西藏日喀则地区昂仁县', 3, 542300),
(542328, '谢通门县', '西藏日喀则地区谢通门县', 3, 542300),
(542329, '白朗县', '西藏日喀则地区白朗县', 3, 542300),
(542330, '仁布县', '西藏日喀则地区仁布县', 3, 542300),
(542331, '康马县', '西藏日喀则地区康马县', 3, 542300),
(542332, '定结县', '西藏日喀则地区定结县', 3, 542300),
(542333, '仲巴县', '西藏日喀则地区仲巴县', 3, 542300),
(542334, '亚东县', '西藏日喀则地区亚东县', 3, 542300),
(542335, '吉隆县', '西藏日喀则地区吉隆县', 3, 542300),
(542336, '聂拉木县', '西藏日喀则地区聂拉木县', 3, 542300),
(542337, '萨嘎县', '西藏日喀则地区萨嘎县', 3, 542300),
(542338, '岗巴县', '西藏日喀则地区岗巴县', 3, 542300),
(542421, '那曲县', '西藏那曲地区那曲县', 3, 542400),
(542422, '嘉黎县', '西藏那曲地区嘉黎县', 3, 542400),
(542423, '比如县', '西藏那曲地区比如县', 3, 542400),
(542424, '聂荣县', '西藏那曲地区聂荣县', 3, 542400),
(542425, '安多县', '西藏那曲地区安多县', 3, 542400),
(542426, '申扎县', '西藏那曲地区申扎县', 3, 542400),
(542427, '索　县', '西藏那曲地区索县', 3, 542400),
(542428, '班戈县', '西藏那曲地区班戈县', 3, 542400),
(542429, '巴青县', '西藏那曲地区巴青县', 3, 542400),
(542430, '尼玛县', '西藏那曲地区尼玛县', 3, 542400),
(542521, '普兰县', '西藏阿里地区普兰县', 3, 542500),
(542522, '札达县', '西藏阿里地区札达县', 3, 542500),
(542523, '噶尔县', '西藏阿里地区噶尔县', 3, 542500),
(542524, '日土县', '西藏阿里地区日土县', 3, 542500),
(542525, '革吉县', '西藏阿里地区革吉县', 3, 542500),
(542526, '改则县', '西藏阿里地区改则县', 3, 542500),
(542527, '措勤县', '西藏阿里地区措勤县', 3, 542500),
(542621, '林芝县', '西藏林芝地区林芝县', 3, 542600),
(542622, '工布江达县', '西藏林芝地区工布江达县', 3, 542600),
(542623, '米林县', '西藏林芝地区米林县', 3, 542600),
(542624, '墨脱县', '西藏林芝地区墨脱县', 3, 542600),
(542625, '波密县', '西藏林芝地区波密县', 3, 542600),
(542626, '察隅县', '西藏林芝地区察隅县', 3, 542600),
(542627, '朗　县', '西藏林芝地区朗县', 3, 542600),
(610101, '市辖区', '陕西省西安市市辖区', 3, 610100),
(610102, '新城区', '陕西省西安市新城区', 3, 610100),
(610103, '碑林区', '陕西省西安市碑林区', 3, 610100),
(610104, '莲湖区', '陕西省西安市莲湖区', 3, 610100),
(610111, '灞桥区', '陕西省西安市灞桥区', 3, 610100),
(610112, '未央区', '陕西省西安市未央区', 3, 610100),
(610113, '雁塔区', '陕西省西安市雁塔区', 3, 610100),
(610114, '阎良区', '陕西省西安市阎良区', 3, 610100),
(610115, '临潼区', '陕西省西安市临潼区', 3, 610100),
(610116, '长安区', '陕西省西安市长安区', 3, 610100),
(610122, '蓝田县', '陕西省西安市蓝田县', 3, 610100),
(610124, '周至县', '陕西省西安市周至县', 3, 610100),
(610125, '户　县', '陕西省西安市户县', 3, 610100),
(610126, '高陵县', '陕西省西安市高陵县', 3, 610100),
(610201, '市辖区', '陕西省铜川市市辖区', 3, 610200),
(610202, '王益区', '陕西省铜川市王益区', 3, 610200),
(610203, '印台区', '陕西省铜川市印台区', 3, 610200),
(610204, '耀州区', '陕西省铜川市耀州区', 3, 610200),
(610222, '宜君县', '陕西省铜川市宜君县', 3, 610200),
(610301, '市辖区', '陕西省宝鸡市市辖区', 3, 610300),
(610302, '渭滨区', '陕西省宝鸡市渭滨区', 3, 610300),
(610303, '金台区', '陕西省宝鸡市金台区', 3, 610300),
(610304, '陈仓区', '陕西省宝鸡市陈仓区', 3, 610300),
(610322, '凤翔县', '陕西省宝鸡市凤翔县', 3, 610300),
(610323, '岐山县', '陕西省宝鸡市岐山县', 3, 610300),
(610324, '扶风县', '陕西省宝鸡市扶风县', 3, 610300),
(610326, '眉　县', '陕西省宝鸡市眉县', 3, 610300),
(610327, '陇　县', '陕西省宝鸡市陇县', 3, 610300),
(610328, '千阳县', '陕西省宝鸡市千阳县', 3, 610300),
(610329, '麟游县', '陕西省宝鸡市麟游县', 3, 610300),
(610330, '凤　县', '陕西省宝鸡市凤县', 3, 610300),
(610331, '太白县', '陕西省宝鸡市太白县', 3, 610300),
(610401, '市辖区', '陕西省咸阳市市辖区', 3, 610400),
(610402, '秦都区', '陕西省咸阳市秦都区', 3, 610400),
(610403, '杨凌区', '陕西省咸阳市杨凌区', 3, 610400),
(610404, '渭城区', '陕西省咸阳市渭城区', 3, 610400),
(610422, '三原县', '陕西省咸阳市三原县', 3, 610400),
(610423, '泾阳县', '陕西省咸阳市泾阳县', 3, 610400),
(610424, '乾　县', '陕西省咸阳市乾县', 3, 610400),
(610425, '礼泉县', '陕西省咸阳市礼泉县', 3, 610400),
(610426, '永寿县', '陕西省咸阳市永寿县', 3, 610400),
(610427, '彬　县', '陕西省咸阳市彬县', 3, 610400),
(610428, '长武县', '陕西省咸阳市长武县', 3, 610400),
(610429, '旬邑县', '陕西省咸阳市旬邑县', 3, 610400),
(610430, '淳化县', '陕西省咸阳市淳化县', 3, 610400),
(610431, '武功县', '陕西省咸阳市武功县', 3, 610400),
(610481, '兴平市', '陕西省咸阳市兴平市', 3, 610400),
(610501, '市辖区', '陕西省渭南市市辖区', 3, 610500),
(610502, '临渭区', '陕西省渭南市临渭区', 3, 610500),
(610521, '华　县', '陕西省渭南市华县', 3, 610500),
(610522, '潼关县', '陕西省渭南市潼关县', 3, 610500),
(610523, '大荔县', '陕西省渭南市大荔县', 3, 610500),
(610524, '合阳县', '陕西省渭南市合阳县', 3, 610500),
(610525, '澄城县', '陕西省渭南市澄城县', 3, 610500),
(610526, '蒲城县', '陕西省渭南市蒲城县', 3, 610500),
(610527, '白水县', '陕西省渭南市白水县', 3, 610500),
(610528, '富平县', '陕西省渭南市富平县', 3, 610500),
(610581, '韩城市', '陕西省渭南市韩城市', 3, 610500),
(610582, '华阴市', '陕西省渭南市华阴市', 3, 610500),
(610601, '市辖区', '陕西省延安市市辖区', 3, 610600),
(610602, '宝塔区', '陕西省延安市宝塔区', 3, 610600),
(610621, '延长县', '陕西省延安市延长县', 3, 610600),
(610622, '延川县', '陕西省延安市延川县', 3, 610600),
(610623, '子长县', '陕西省延安市子长县', 3, 610600),
(610624, '安塞县', '陕西省延安市安塞县', 3, 610600),
(610625, '志丹县', '陕西省延安市志丹县', 3, 610600),
(610626, '吴旗县', '陕西省延安市吴旗县', 3, 610600),
(610627, '甘泉县', '陕西省延安市甘泉县', 3, 610600),
(610628, '富　县', '陕西省延安市富县', 3, 610600),
(610629, '洛川县', '陕西省延安市洛川县', 3, 610600),
(610630, '宜川县', '陕西省延安市宜川县', 3, 610600),
(610631, '黄龙县', '陕西省延安市黄龙县', 3, 610600),
(610632, '黄陵县', '陕西省延安市黄陵县', 3, 610600),
(610701, '市辖区', '陕西省汉中市市辖区', 3, 610700),
(610702, '汉台区', '陕西省汉中市汉台区', 3, 610700),
(610721, '南郑县', '陕西省汉中市南郑县', 3, 610700),
(610722, '城固县', '陕西省汉中市城固县', 3, 610700),
(610723, '洋　县', '陕西省汉中市洋县', 3, 610700),
(610724, '西乡县', '陕西省汉中市西乡县', 3, 610700),
(610725, '勉　县', '陕西省汉中市勉县', 3, 610700),
(610726, '宁强县', '陕西省汉中市宁强县', 3, 610700),
(610727, '略阳县', '陕西省汉中市略阳县', 3, 610700),
(610728, '镇巴县', '陕西省汉中市镇巴县', 3, 610700),
(610729, '留坝县', '陕西省汉中市留坝县', 3, 610700),
(610730, '佛坪县', '陕西省汉中市佛坪县', 3, 610700),
(610801, '市辖区', '陕西省榆林市市辖区', 3, 610800),
(610802, '榆阳区', '陕西省榆林市榆阳区', 3, 610800),
(610821, '神木县', '陕西省榆林市神木县', 3, 610800),
(610822, '府谷县', '陕西省榆林市府谷县', 3, 610800),
(610823, '横山县', '陕西省榆林市横山县', 3, 610800),
(610824, '靖边县', '陕西省榆林市靖边县', 3, 610800),
(610825, '定边县', '陕西省榆林市定边县', 3, 610800),
(610826, '绥德县', '陕西省榆林市绥德县', 3, 610800),
(610827, '米脂县', '陕西省榆林市米脂县', 3, 610800),
(610828, '佳　县', '陕西省榆林市佳县', 3, 610800),
(610829, '吴堡县', '陕西省榆林市吴堡县', 3, 610800),
(610830, '清涧县', '陕西省榆林市清涧县', 3, 610800),
(610831, '子洲县', '陕西省榆林市子洲县', 3, 610800),
(610901, '市辖区', '陕西省安康市市辖区', 3, 610900),
(610902, '汉滨区', '陕西省安康市汉滨区', 3, 610900),
(610921, '汉阴县', '陕西省安康市汉阴县', 3, 610900),
(610922, '石泉县', '陕西省安康市石泉县', 3, 610900),
(610923, '宁陕县', '陕西省安康市宁陕县', 3, 610900),
(610924, '紫阳县', '陕西省安康市紫阳县', 3, 610900),
(610925, '岚皋县', '陕西省安康市岚皋县', 3, 610900),
(610926, '平利县', '陕西省安康市平利县', 3, 610900),
(610927, '镇坪县', '陕西省安康市镇坪县', 3, 610900),
(610928, '旬阳县', '陕西省安康市旬阳县', 3, 610900),
(610929, '白河县', '陕西省安康市白河县', 3, 610900),
(611001, '市辖区', '陕西省商洛市市辖区', 3, 611000),
(611002, '商州区', '陕西省商洛市商州区', 3, 611000),
(611021, '洛南县', '陕西省商洛市洛南县', 3, 611000),
(611022, '丹凤县', '陕西省商洛市丹凤县', 3, 611000),
(611023, '商南县', '陕西省商洛市商南县', 3, 611000),
(611024, '山阳县', '陕西省商洛市山阳县', 3, 611000),
(611025, '镇安县', '陕西省商洛市镇安县', 3, 611000),
(611026, '柞水县', '陕西省商洛市柞水县', 3, 611000),
(620101, '市辖区', '甘肃省兰州市市辖区', 3, 620100),
(620102, '城关区', '甘肃省兰州市城关区', 3, 620100),
(620103, '七里河区', '甘肃省兰州市七里河区', 3, 620100),
(620104, '西固区', '甘肃省兰州市西固区', 3, 620100),
(620105, '安宁区', '甘肃省兰州市安宁区', 3, 620100),
(620111, '红古区', '甘肃省兰州市红古区', 3, 620100),
(620121, '永登县', '甘肃省兰州市永登县', 3, 620100),
(620122, '皋兰县', '甘肃省兰州市皋兰县', 3, 620100),
(620123, '榆中县', '甘肃省兰州市榆中县', 3, 620100),
(620201, '市辖区', '甘肃省嘉峪关市市辖区', 3, 620200),
(620301, '市辖区', '甘肃省金昌市市辖区', 3, 620300),
(620302, '金川区', '甘肃省金昌市金川区', 3, 620300),
(620321, '永昌县', '甘肃省金昌市永昌县', 3, 620300),
(620401, '市辖区', '甘肃省白银市市辖区', 3, 620400),
(620402, '白银区', '甘肃省白银市白银区', 3, 620400),
(620403, '平川区', '甘肃省白银市平川区', 3, 620400),
(620421, '靖远县', '甘肃省白银市靖远县', 3, 620400),
(620422, '会宁县', '甘肃省白银市会宁县', 3, 620400),
(620423, '景泰县', '甘肃省白银市景泰县', 3, 620400),
(620501, '市辖区', '甘肃省天水市市辖区', 3, 620500),
(620502, '秦城区', '甘肃省天水市秦城区', 3, 620500),
(620503, '北道区', '甘肃省天水市北道区', 3, 620500),
(620521, '清水县', '甘肃省天水市清水县', 3, 620500),
(620522, '秦安县', '甘肃省天水市秦安县', 3, 620500),
(620523, '甘谷县', '甘肃省天水市甘谷县', 3, 620500),
(620524, '武山县', '甘肃省天水市武山县', 3, 620500),
(620525, '张家川回族自治县', '甘肃省天水市张家川回族自治县', 3, 620500),
(620601, '市辖区', '甘肃省武威市市辖区', 3, 620600),
(620602, '凉州区', '甘肃省武威市凉州区', 3, 620600),
(620621, '民勤县', '甘肃省武威市民勤县', 3, 620600),
(620622, '古浪县', '甘肃省武威市古浪县', 3, 620600),
(620623, '天祝藏族自治县', '甘肃省武威市天祝藏族自治县', 3, 620600),
(620701, '市辖区', '甘肃省张掖市市辖区', 3, 620700),
(620702, '甘州区', '甘肃省张掖市甘州区', 3, 620700),
(620721, '肃南裕固族自治县', '甘肃省张掖市肃南裕固族自治县', 3, 620700),
(620722, '民乐县', '甘肃省张掖市民乐县', 3, 620700),
(620723, '临泽县', '甘肃省张掖市临泽县', 3, 620700),
(620724, '高台县', '甘肃省张掖市高台县', 3, 620700),
(620725, '山丹县', '甘肃省张掖市山丹县', 3, 620700),
(620801, '市辖区', '甘肃省平凉市市辖区', 3, 620800),
(620802, '崆峒区', '甘肃省平凉市崆峒区', 3, 620800),
(620821, '泾川县', '甘肃省平凉市泾川县', 3, 620800),
(620822, '灵台县', '甘肃省平凉市灵台县', 3, 620800),
(620823, '崇信县', '甘肃省平凉市崇信县', 3, 620800),
(620824, '华亭县', '甘肃省平凉市华亭县', 3, 620800),
(620825, '庄浪县', '甘肃省平凉市庄浪县', 3, 620800),
(620826, '静宁县', '甘肃省平凉市静宁县', 3, 620800),
(620901, '市辖区', '甘肃省酒泉市市辖区', 3, 620900),
(620902, '肃州区', '甘肃省酒泉市肃州区', 3, 620900),
(620921, '金塔县', '甘肃省酒泉市金塔县', 3, 620900),
(620922, '安西县', '甘肃省酒泉市安西县', 3, 620900),
(620923, '肃北蒙古族自治县', '甘肃省酒泉市肃北蒙古族自治县', 3, 620900),
(620924, '阿克塞哈萨克族自治县', '甘肃省酒泉市阿克塞哈萨克族自治县', 3, 620900),
(620981, '玉门市', '甘肃省酒泉市玉门市', 3, 620900),
(620982, '敦煌市', '甘肃省酒泉市敦煌市', 3, 620900),
(621001, '市辖区', '甘肃省庆阳市市辖区', 3, 621000),
(621002, '西峰区', '甘肃省庆阳市西峰区', 3, 621000),
(621021, '庆城县', '甘肃省庆阳市庆城县', 3, 621000),
(621022, '环　县', '甘肃省庆阳市环县', 3, 621000),
(621023, '华池县', '甘肃省庆阳市华池县', 3, 621000),
(621024, '合水县', '甘肃省庆阳市合水县', 3, 621000),
(621025, '正宁县', '甘肃省庆阳市正宁县', 3, 621000),
(621026, '宁　县', '甘肃省庆阳市宁县', 3, 621000),
(621027, '镇原县', '甘肃省庆阳市镇原县', 3, 621000),
(621101, '市辖区', '甘肃省定西市市辖区', 3, 621100),
(621102, '安定区', '甘肃省定西市安定区', 3, 621100),
(621121, '通渭县', '甘肃省定西市通渭县', 3, 621100),
(621122, '陇西县', '甘肃省定西市陇西县', 3, 621100),
(621123, '渭源县', '甘肃省定西市渭源县', 3, 621100),
(621124, '临洮县', '甘肃省定西市临洮县', 3, 621100),
(621125, '漳　县', '甘肃省定西市漳县', 3, 621100),
(621126, '岷　县', '甘肃省定西市岷县', 3, 621100),
(621201, '市辖区', '甘肃省陇南市市辖区', 3, 621200),
(621202, '武都区', '甘肃省陇南市武都区', 3, 621200),
(621221, '成　县', '甘肃省陇南市成县', 3, 621200),
(621222, '文　县', '甘肃省陇南市文县', 3, 621200),
(621223, '宕昌县', '甘肃省陇南市宕昌县', 3, 621200),
(621224, '康　县', '甘肃省陇南市康县', 3, 621200),
(621225, '西和县', '甘肃省陇南市西和县', 3, 621200),
(621226, '礼　县', '甘肃省陇南市礼县', 3, 621200),
(621227, '徽　县', '甘肃省陇南市徽县', 3, 621200),
(621228, '两当县', '甘肃省陇南市两当县', 3, 621200),
(622901, '临夏市', '甘肃省临夏回族自治州临夏市', 3, 622900),
(622921, '临夏县', '甘肃省临夏回族自治州临夏县', 3, 622900),
(622922, '康乐县', '甘肃省临夏回族自治州康乐县', 3, 622900),
(622923, '永靖县', '甘肃省临夏回族自治州永靖县', 3, 622900),
(622924, '广河县', '甘肃省临夏回族自治州广河县', 3, 622900),
(622925, '和政县', '甘肃省临夏回族自治州和政县', 3, 622900),
(622926, '东乡族自治县', '甘肃省临夏回族自治州东乡族自治县', 3, 622900),
(622927, '积石山保安族东乡族撒拉族自治县', '甘肃省临夏回族自治州积石山保安族东乡族撒拉族自治县', 3, 622900),
(623001, '合作市', '甘肃省甘南藏族自治州合作市', 3, 623000),
(623021, '临潭县', '甘肃省甘南藏族自治州临潭县', 3, 623000),
(623022, '卓尼县', '甘肃省甘南藏族自治州卓尼县', 3, 623000),
(623023, '舟曲县', '甘肃省甘南藏族自治州舟曲县', 3, 623000),
(623024, '迭部县', '甘肃省甘南藏族自治州迭部县', 3, 623000),
(623025, '玛曲县', '甘肃省甘南藏族自治州玛曲县', 3, 623000),
(623026, '碌曲县', '甘肃省甘南藏族自治州碌曲县', 3, 623000),
(623027, '夏河县', '甘肃省甘南藏族自治州夏河县', 3, 623000),
(630101, '市辖区', '青海省西宁市市辖区', 3, 630100),
(630102, '城东区', '青海省西宁市城东区', 3, 630100),
(630103, '城中区', '青海省西宁市城中区', 3, 630100),
(630104, '城西区', '青海省西宁市城西区', 3, 630100),
(630105, '城北区', '青海省西宁市城北区', 3, 630100),
(630121, '大通回族土族自治县', '青海省西宁市大通回族土族自治县', 3, 630100),
(630122, '湟中县', '青海省西宁市湟中县', 3, 630100),
(630123, '湟源县', '青海省西宁市湟源县', 3, 630100),
(632121, '平安县', '青海省海东地区平安县', 3, 632100),
(632122, '民和回族土族自治县', '青海省海东地区民和回族土族自治县', 3, 632100),
(632123, '乐都县', '青海省海东地区乐都县', 3, 632100),
(632126, '互助土族自治县', '青海省海东地区互助土族自治县', 3, 632100),
(632127, '化隆回族自治县', '青海省海东地区化隆回族自治县', 3, 632100),
(632128, '循化撒拉族自治县', '青海省海东地区循化撒拉族自治县', 3, 632100),
(632221, '门源回族自治县', '青海省海北藏族自治州门源回族自治县', 3, 632200),
(632222, '祁连县', '青海省海北藏族自治州祁连县', 3, 632200),
(632223, '海晏县', '青海省海北藏族自治州海晏县', 3, 632200),
(632224, '刚察县', '青海省海北藏族自治州刚察县', 3, 632200),
(632321, '同仁县', '青海省黄南藏族自治州同仁县', 3, 632300),
(632322, '尖扎县', '青海省黄南藏族自治州尖扎县', 3, 632300),
(632323, '泽库县', '青海省黄南藏族自治州泽库县', 3, 632300),
(632324, '河南蒙古族自治县', '青海省黄南藏族自治州河南蒙古族自治县', 3, 632300),
(632521, '共和县', '青海省海南藏族自治州共和县', 3, 632500),
(632522, '同德县', '青海省海南藏族自治州同德县', 3, 632500),
(632523, '贵德县', '青海省海南藏族自治州贵德县', 3, 632500),
(632524, '兴海县', '青海省海南藏族自治州兴海县', 3, 632500),
(632525, '贵南县', '青海省海南藏族自治州贵南县', 3, 632500),
(632621, '玛沁县', '青海省果洛藏族自治州玛沁县', 3, 632600),
(632622, '班玛县', '青海省果洛藏族自治州班玛县', 3, 632600),
(632623, '甘德县', '青海省果洛藏族自治州甘德县', 3, 632600),
(632624, '达日县', '青海省果洛藏族自治州达日县', 3, 632600),
(632625, '久治县', '青海省果洛藏族自治州久治县', 3, 632600),
(632626, '玛多县', '青海省果洛藏族自治州玛多县', 3, 632600),
(632721, '玉树县', '青海省玉树藏族自治州玉树县', 3, 632700),
(632722, '杂多县', '青海省玉树藏族自治州杂多县', 3, 632700),
(632723, '称多县', '青海省玉树藏族自治州称多县', 3, 632700),
(632724, '治多县', '青海省玉树藏族自治州治多县', 3, 632700),
(632725, '囊谦县', '青海省玉树藏族自治州囊谦县', 3, 632700),
(632726, '曲麻莱县', '青海省玉树藏族自治州曲麻莱县', 3, 632700),
(632801, '格尔木市', '青海省海西蒙古族藏族自治州格尔木市', 3, 632800),
(632802, '德令哈市', '青海省海西蒙古族藏族自治州德令哈市', 3, 632800),
(632821, '乌兰县', '青海省海西蒙古族藏族自治州乌兰县', 3, 632800),
(632822, '都兰县', '青海省海西蒙古族藏族自治州都兰县', 3, 632800),
(632823, '天峻县', '青海省海西蒙古族藏族自治州天峻县', 3, 632800),
(640101, '市辖区', '宁夏银川市市辖区', 3, 640100),
(640104, '兴庆区', '宁夏银川市兴庆区', 3, 640100),
(640105, '西夏区', '宁夏银川市西夏区', 3, 640100),
(640106, '金凤区', '宁夏银川市金凤区', 3, 640100),
(640121, '永宁县', '宁夏银川市永宁县', 3, 640100),
(640122, '贺兰县', '宁夏银川市贺兰县', 3, 640100),
(640181, '灵武市', '宁夏银川市灵武市', 3, 640100),
(640201, '市辖区', '宁夏石嘴山市市辖区', 3, 640200),
(640202, '大武口区', '宁夏石嘴山市大武口区', 3, 640200),
(640205, '惠农区', '宁夏石嘴山市惠农区', 3, 640200),
(640221, '平罗县', '宁夏石嘴山市平罗县', 3, 640200),
(640301, '市辖区', '宁夏吴忠市市辖区', 3, 640300),
(640302, '利通区', '宁夏吴忠市利通区', 3, 640300),
(640323, '盐池县', '宁夏吴忠市盐池县', 3, 640300),
(640324, '同心县', '宁夏吴忠市同心县', 3, 640300),
(640381, '青铜峡市', '宁夏吴忠市青铜峡市', 3, 640300),
(640401, '市辖区', '宁夏固原市市辖区', 3, 640400),
(640402, '原州区', '宁夏固原市原州区', 3, 640400),
(640422, '西吉县', '宁夏固原市西吉县', 3, 640400),
(640423, '隆德县', '宁夏固原市隆德县', 3, 640400),
(640424, '泾源县', '宁夏固原市泾源县', 3, 640400),
(640425, '彭阳县', '宁夏固原市彭阳县', 3, 640400),
(640501, '市辖区', '宁夏中卫市市辖区', 3, 640500),
(640502, '沙坡头区', '宁夏中卫市沙坡头区', 3, 640500),
(640521, '中宁县', '宁夏中卫市中宁县', 3, 640500),
(640522, '海原县', '宁夏中卫市海原县', 3, 640500),
(650101, '市辖区', '新疆乌鲁木齐市市辖区', 3, 650100),
(650102, '天山区', '新疆乌鲁木齐市天山区', 3, 650100),
(650103, '沙依巴克区', '新疆乌鲁木齐市沙依巴克区', 3, 650100),
(650104, '新市区', '新疆乌鲁木齐市新市区', 3, 650100),
(650105, '水磨沟区', '新疆乌鲁木齐市水磨沟区', 3, 650100),
(650106, '头屯河区', '新疆乌鲁木齐市头屯河区', 3, 650100),
(650107, '达坂城区', '新疆乌鲁木齐市达坂城区', 3, 650100),
(650108, '东山区', '新疆乌鲁木齐市东山区', 3, 650100),
(650121, '乌鲁木齐县', '新疆乌鲁木齐市乌鲁木齐县', 3, 650100),
(650201, '市辖区', '新疆克拉玛依市市辖区', 3, 650200),
(650202, '独山子区', '新疆克拉玛依市独山子区', 3, 650200),
(650203, '克拉玛依区', '新疆克拉玛依市克拉玛依区', 3, 650200),
(650204, '白碱滩区', '新疆克拉玛依市白碱滩区', 3, 650200),
(650205, '乌尔禾区', '新疆克拉玛依市乌尔禾区', 3, 650200),
(652101, '吐鲁番市', '新疆吐鲁番地区吐鲁番市', 3, 652100),
(652122, '鄯善县', '新疆吐鲁番地区鄯善县', 3, 652100),
(652123, '托克逊县', '新疆吐鲁番地区托克逊县', 3, 652100),
(652201, '哈密市', '新疆哈密地区哈密市', 3, 652200),
(652222, '巴里坤哈萨克自治县', '新疆哈密地区巴里坤哈萨克自治县', 3, 652200),
(652223, '伊吾县', '新疆哈密地区伊吾县', 3, 652200),
(652301, '昌吉市', '新疆昌吉回族自治州昌吉市', 3, 652300),
(652302, '阜康市', '新疆昌吉回族自治州阜康市', 3, 652300),
(652303, '米泉市', '新疆昌吉回族自治州米泉市', 3, 652300),
(652323, '呼图壁县', '新疆昌吉回族自治州呼图壁县', 3, 652300),
(652324, '玛纳斯县', '新疆昌吉回族自治州玛纳斯县', 3, 652300),
(652325, '奇台县', '新疆昌吉回族自治州奇台县', 3, 652300),
(652327, '吉木萨尔县', '新疆昌吉回族自治州吉木萨尔县', 3, 652300),
(652328, '木垒哈萨克自治县', '新疆昌吉回族自治州木垒哈萨克自治县', 3, 652300),
(652701, '博乐市', '新疆博尔塔拉蒙古自治州博乐市', 3, 652700),
(652722, '精河县', '新疆博尔塔拉蒙古自治州精河县', 3, 652700),
(652723, '温泉县', '新疆博尔塔拉蒙古自治州温泉县', 3, 652700),
(652801, '库尔勒市', '新疆巴音郭楞蒙古自治州库尔勒市', 3, 652800),
(652822, '轮台县', '新疆巴音郭楞蒙古自治州轮台县', 3, 652800),
(652823, '尉犁县', '新疆巴音郭楞蒙古自治州尉犁县', 3, 652800),
(652824, '若羌县', '新疆巴音郭楞蒙古自治州若羌县', 3, 652800),
(652825, '且末县', '新疆巴音郭楞蒙古自治州且末县', 3, 652800),
(652826, '焉耆回族自治县', '新疆巴音郭楞蒙古自治州焉耆回族自治县', 3, 652800),
(652827, '和静县', '新疆巴音郭楞蒙古自治州和静县', 3, 652800),
(652828, '和硕县', '新疆巴音郭楞蒙古自治州和硕县', 3, 652800),
(652829, '博湖县', '新疆巴音郭楞蒙古自治州博湖县', 3, 652800),
(652901, '阿克苏市', '新疆阿克苏地区阿克苏市', 3, 652900),
(652922, '温宿县', '新疆阿克苏地区温宿县', 3, 652900),
(652923, '库车县', '新疆阿克苏地区库车县', 3, 652900),
(652924, '沙雅县', '新疆阿克苏地区沙雅县', 3, 652900),
(652925, '新和县', '新疆阿克苏地区新和县', 3, 652900),
(652926, '拜城县', '新疆阿克苏地区拜城县', 3, 652900),
(652927, '乌什县', '新疆阿克苏地区乌什县', 3, 652900),
(652928, '阿瓦提县', '新疆阿克苏地区阿瓦提县', 3, 652900),
(652929, '柯坪县', '新疆阿克苏地区柯坪县', 3, 652900),
(653001, '阿图什市', '新疆克孜勒苏柯尔克孜自治州阿图什市', 3, 653000),
(653022, '阿克陶县', '新疆克孜勒苏柯尔克孜自治州阿克陶县', 3, 653000),
(653023, '阿合奇县', '新疆克孜勒苏柯尔克孜自治州阿合奇县', 3, 653000),
(653024, '乌恰县', '新疆克孜勒苏柯尔克孜自治州乌恰县', 3, 653000),
(653101, '喀什市', '新疆喀什地区喀什市', 3, 653100),
(653121, '疏附县', '新疆喀什地区疏附县', 3, 653100),
(653122, '疏勒县', '新疆喀什地区疏勒县', 3, 653100),
(653123, '英吉沙县', '新疆喀什地区英吉沙县', 3, 653100),
(653124, '泽普县', '新疆喀什地区泽普县', 3, 653100),
(653125, '莎车县', '新疆喀什地区莎车县', 3, 653100),
(653126, '叶城县', '新疆喀什地区叶城县', 3, 653100),
(653127, '麦盖提县', '新疆喀什地区麦盖提县', 3, 653100),
(653128, '岳普湖县', '新疆喀什地区岳普湖县', 3, 653100),
(653129, '伽师县', '新疆喀什地区伽师县', 3, 653100),
(653130, '巴楚县', '新疆喀什地区巴楚县', 3, 653100),
(653131, '塔什库尔干塔吉克自治县', '新疆喀什地区塔什库尔干塔吉克自治县', 3, 653100),
(653201, '和田市', '新疆和田地区和田市', 3, 653200),
(653221, '和田县', '新疆和田地区和田县', 3, 653200),
(653222, '墨玉县', '新疆和田地区墨玉县', 3, 653200),
(653223, '皮山县', '新疆和田地区皮山县', 3, 653200),
(653224, '洛浦县', '新疆和田地区洛浦县', 3, 653200),
(653225, '策勒县', '新疆和田地区策勒县', 3, 653200),
(653226, '于田县', '新疆和田地区于田县', 3, 653200),
(653227, '民丰县', '新疆和田地区民丰县', 3, 653200),
(654002, '伊宁市', '新疆伊犁哈萨克自治州伊宁市', 3, 654000),
(654003, '奎屯市', '新疆伊犁哈萨克自治州奎屯市', 3, 654000),
(654021, '伊宁县', '新疆伊犁哈萨克自治州伊宁县', 3, 654000),
(654022, '察布查尔锡伯自治县', '新疆伊犁哈萨克自治州察布查尔锡伯自治县', 3, 654000),
(654023, '霍城县', '新疆伊犁哈萨克自治州霍城县', 3, 654000),
(654024, '巩留县', '新疆伊犁哈萨克自治州巩留县', 3, 654000),
(654025, '新源县', '新疆伊犁哈萨克自治州新源县', 3, 654000),
(654026, '昭苏县', '新疆伊犁哈萨克自治州昭苏县', 3, 654000),
(654027, '特克斯县', '新疆伊犁哈萨克自治州特克斯县', 3, 654000),
(654028, '尼勒克县', '新疆伊犁哈萨克自治州尼勒克县', 3, 654000),
(654201, '塔城市', '新疆塔城地区塔城市', 3, 654200),
(654202, '乌苏市', '新疆塔城地区乌苏市', 3, 654200),
(654221, '额敏县', '新疆塔城地区额敏县', 3, 654200),
(654223, '沙湾县', '新疆塔城地区沙湾县', 3, 654200),
(654224, '托里县', '新疆塔城地区托里县', 3, 654200),
(654225, '裕民县', '新疆塔城地区裕民县', 3, 654200),
(654226, '和布克赛尔蒙古自治县', '新疆塔城地区和布克赛尔蒙古自治县', 3, 654200),
(654301, '阿勒泰市', '新疆阿勒泰地区阿勒泰市', 3, 654300),
(654321, '布尔津县', '新疆阿勒泰地区布尔津县', 3, 654300),
(654322, '富蕴县', '新疆阿勒泰地区富蕴县', 3, 654300),
(654323, '福海县', '新疆阿勒泰地区福海县', 3, 654300),
(654324, '哈巴河县', '新疆阿勒泰地区哈巴河县', 3, 654300),
(654325, '青河县', '新疆阿勒泰地区青河县', 3, 654300),
(654326, '吉木乃县', '新疆阿勒泰地区吉木乃县', 3, 654300),
(659001, '石河子市', '新疆石河子市', 3, 659000),
(659002, '阿拉尔市', '新疆阿拉尔市', 3, 659000),
(659003, '图木舒克市', '新疆图木舒克市', 3, 659000),
(659004, '五家渠市', '新疆五家渠市', 3, 659000),
(810001, '香港', '香港', 2, 810000),
(810002, '中西区', '香港香港中西区', 3, 810001),
(810003, '九龙城区', '香港香港九龙城区', 3, 810001),
(810004, '南区', '香港香港南区', 3, 810001),
(810005, '黄大仙区', '香港香港黄大仙区', 3, 810001),
(810006, '油尖旺区', '香港香港油尖旺区', 3, 810001),
(810007, '葵青区', '香港香港葵青区', 3, 810001),
(810008, '西贡区', '香港香港西贡区', 3, 810001),
(810009, '屯门区', '香港香港屯门区', 3, 810001),
(810010, '荃湾区', '香港香港荃湾区', 3, 810001),
(810011, '东区', '香港香港东区', 3, 810001),
(810012, '观塘区', '香港香港观塘区', 3, 810001),
(810013, '深水步区', '香港香港深水步区', 3, 810001),
(810014, '湾仔区', '香港香港湾仔区', 3, 810001),
(810015, '离岛区', '香港香港离岛区', 3, 810001),
(810016, '北区', '香港香港北区', 3, 810001),
(810017, '沙田区', '香港香港沙田区', 3, 810001),
(810018, '大埔区', '香港香港大埔区', 3, 810001),
(810019, '元朗区', '香港香港元朗区', 3, 810001),
(820001, '澳门', '澳门', 2, 820000),
(820002, '澳门', '澳门', 3, 820001),
(710001, '台北市', '台湾省台北市', 2, 710000),
(710002, '台北县', '台湾省台北市台北县', 3, 710001),
(710003, '基隆市', '台湾省基隆市', 2, 710000),
(910005, '中山市', '广东省中山市中山市', 3, 442000),
(710004, '花莲县', '台湾省基隆市花莲县', 3, 710003),
(910006, '东莞市', '广东省东莞市东莞市', 3, 441900);

-- --------------------------------------------------------

--
-- 表的结构 `ocenter_event`
--

CREATE TABLE `ocenter_event` (
  `id` int(11) NOT NULL,
  `uid` int(11) NOT NULL COMMENT '发起人',
  `title` varchar(255) NOT NULL COMMENT '活动名称',
  `explain` text NOT NULL COMMENT '详细内容',
  `sTime` int(11) NOT NULL COMMENT '活动开始时间',
  `eTime` int(11) NOT NULL COMMENT '活动结束时间',
  `district` mediumint(8) UNSIGNED NOT NULL COMMENT '地址id',
  `address` varchar(255) NOT NULL COMMENT '活动地点',
  `create_time` int(11) NOT NULL COMMENT '创建时间',
  `limitCount` int(11) NOT NULL COMMENT '限制人数',
  `cover_id` int(11) NOT NULL COMMENT '封面ID',
  `deadline` int(11) NOT NULL,
  `attentionCount` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `update_time` int(11) NOT NULL,
  `view_count` int(11) NOT NULL,
  `reply_count` int(11) NOT NULL,
  `type_id` int(11) NOT NULL,
  `signCount` int(11) NOT NULL,
  `is_recommend` tinyint(4) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `ocenter_event`
--

INSERT INTO `ocenter_event` (`id`, `uid`, `title`, `explain`, `sTime`, `eTime`, `district`, `address`, `create_time`, `limitCount`, `cover_id`, `deadline`, `attentionCount`, `status`, `update_time`, `view_count`, `reply_count`, `type_id`, `signCount`, `is_recommend`) VALUES
(9, 1, 'sdfsdf', '<p>sdfsdfsdfsdf</p>', 1457625600, 1458748800, 150302, 'sdfsdf', 1457598147, 123, 4, 1458015900, 1, 1, 1457598147, 8, 0, 1, 2, 0),
(10, 1, '士大夫似的', '<p>是对方发的发</p>', 1459267200, 1459872000, 411628, '随碟附送d', 1459329847, 54, 6, 1459849800, 1, 1, 1459329847, 2, 0, 1, 1, 0);

-- --------------------------------------------------------

--
-- 表的结构 `ocenter_event_attend`
--

CREATE TABLE `ocenter_event_attend` (
  `id` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `event_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `phone` bigint(20) NOT NULL,
  `info` text NOT NULL,
  `create_time` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL COMMENT '0为报名，1为参加'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `ocenter_event_attend`
--

INSERT INTO `ocenter_event_attend` (`id`, `uid`, `event_id`, `name`, `phone`, `info`, `create_time`, `status`) VALUES
(1, 1, 9, '', 0, '', 1457598147, 1),
(2, 100, 9, 'sdfsd', 0, 'sdfsdfsdfsfasdf\r\nsdfsdf', 1457598456, 0),
(3, 1, 10, '', 0, '', 1459329847, 1);

-- --------------------------------------------------------

--
-- 表的结构 `ocenter_event_type`
--

CREATE TABLE `ocenter_event_type` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `create_time` int(11) NOT NULL,
  `update_time` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `allow_post` tinyint(4) NOT NULL,
  `pid` int(11) NOT NULL,
  `sort` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `ocenter_event_type`
--

INSERT INTO `ocenter_event_type` (`id`, `title`, `create_time`, `update_time`, `status`, `allow_post`, `pid`, `sort`) VALUES
(1, '慈善活动', 1403859500, 1403859485, 1, 0, 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `ocenter_field`
--

CREATE TABLE `ocenter_field` (
  `id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `field_id` int(11) NOT NULL,
  `field_data` varchar(1000) NOT NULL,
  `createTime` int(11) NOT NULL,
  `changeTime` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ocenter_field_group`
--

CREATE TABLE `ocenter_field_group` (
  `id` int(11) NOT NULL,
  `profile_name` varchar(25) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `createTime` int(11) NOT NULL,
  `sort` int(11) NOT NULL,
  `visiable` tinyint(4) NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `ocenter_field_group`
--

INSERT INTO `ocenter_field_group` (`id`, `profile_name`, `status`, `createTime`, `sort`, `visiable`) VALUES
(1, '个人资料', 1, 1403847366, 0, 1),
(2, '开发者资料', 1, 1423537648, 0, 0),
(3, '开源中国资料', 1, 1423538446, 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `ocenter_field_setting`
--

CREATE TABLE `ocenter_field_setting` (
  `id` int(11) NOT NULL,
  `field_name` varchar(25) NOT NULL,
  `profile_group_id` int(11) NOT NULL,
  `visiable` tinyint(4) NOT NULL DEFAULT '1',
  `required` tinyint(4) NOT NULL DEFAULT '0',
  `sort` int(11) NOT NULL,
  `form_type` varchar(25) NOT NULL,
  `form_default_value` varchar(200) NOT NULL,
  `validation` varchar(25) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `createTime` int(11) NOT NULL,
  `child_form_type` varchar(25) NOT NULL,
  `input_tips` varchar(100) NOT NULL COMMENT '输入提示'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `ocenter_field_setting`
--

INSERT INTO `ocenter_field_setting` (`id`, `field_name`, `profile_group_id`, `visiable`, `required`, `sort`, `form_type`, `form_default_value`, `validation`, `status`, `createTime`, `child_form_type`, `input_tips`) VALUES
(1, 'qq', 1, 1, 1, 0, 'input', '', '', 1, 1409045825, 'string', ''),
(2, '生日', 1, 1, 1, 0, 'time', '', '', 1, 1423537409, '', ''),
(3, '擅长语言', 2, 1, 1, 0, 'select', 'Java|C++|Python|php|object c|ruby', '', 1, 1423537693, '', ''),
(4, '承接项目', 2, 1, 1, 0, 'radio', '是|否', '', 1, 1423537733, '', ''),
(5, '简介', 2, 1, 1, 0, 'textarea', '', '', 1, 1423537770, '', '简单介绍入行以来的工作经验，项目经验'),
(6, '其他技能', 2, 1, 1, 0, 'checkbox', 'PhotoShop|Flash', '', 1, 1423537834, '', ''),
(7, '昵称', 3, 1, 1, 0, 'input', '', '', 1, 1423704462, 'string', 'OSC账号昵称');

-- --------------------------------------------------------

--
-- 表的结构 `ocenter_file`
--

CREATE TABLE `ocenter_file` (
  `id` int(10) UNSIGNED NOT NULL COMMENT '文件ID',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '原始文件名',
  `savename` varchar(100) NOT NULL DEFAULT '' COMMENT '保存名称',
  `savepath` varchar(255) NOT NULL DEFAULT '' COMMENT '文件保存路径',
  `ext` char(5) NOT NULL DEFAULT '' COMMENT '文件后缀',
  `mime` char(40) NOT NULL DEFAULT '' COMMENT '文件mime类型',
  `size` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '文件大小',
  `md5` char(32) NOT NULL DEFAULT '' COMMENT '文件md5',
  `sha1` char(40) NOT NULL DEFAULT '' COMMENT '文件 sha1编码',
  `location` tinyint(3) UNSIGNED NOT NULL DEFAULT '0' COMMENT '文件保存位置',
  `create_time` int(10) UNSIGNED NOT NULL COMMENT '上传时间',
  `driver` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='文件表';

-- --------------------------------------------------------

--
-- 表的结构 `ocenter_follow`
--

CREATE TABLE `ocenter_follow` (
  `id` int(11) NOT NULL COMMENT 'id',
  `follow_who` int(11) NOT NULL COMMENT '关注谁',
  `who_follow` int(11) NOT NULL COMMENT '谁关注',
  `create_time` int(11) NOT NULL,
  `alias` varchar(40) NOT NULL COMMENT '备注',
  `group_id` int(11) NOT NULL COMMENT '分组ID'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='关注表';

-- --------------------------------------------------------

--
-- 表的结构 `ocenter_hooks`
--

CREATE TABLE `ocenter_hooks` (
  `id` int(10) UNSIGNED NOT NULL COMMENT '主键',
  `name` varchar(40) NOT NULL DEFAULT '' COMMENT '钩子名称',
  `description` text NOT NULL COMMENT '描述',
  `type` tinyint(1) UNSIGNED NOT NULL DEFAULT '1' COMMENT '类型',
  `update_time` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '更新时间',
  `addons` varchar(255) NOT NULL DEFAULT '' COMMENT '钩子挂载的插件 ''，''分割'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `ocenter_hooks`
--

INSERT INTO `ocenter_hooks` (`id`, `name`, `description`, `type`, `update_time`, `addons`) VALUES
(38, 'pageHeader', '页面header钩子，一般用于加载插件CSS文件和代码', 1, 0, ''),
(39, 'pageFooter', '页面footer钩子，一般用于加载插件JS文件和JS代码', 1, 0, 'SuperLinks'),
(40, 'adminEditor', '后台内容编辑页编辑器', 1, 1378982734, 'EditorForAdmin'),
(41, 'AdminIndex', '首页小格子个性化显示', 1, 1382596073, 'SiteStat,SyncLogin,DevTeam,SystemInfo,LocalComment'),
(42, 'topicComment', '评论提交方式扩展钩子。', 1, 1380163518, ''),
(43, 'app_begin', '应用开始', 2, 1384481614, 'Iswaf'),
(44, 'checkIn', '签到', 1, 1395371353, 'CheckIn'),
(45, 'Rank', '签到排名钩子', 1, 1395387442, 'Rank_checkin'),
(46, 'support', '赞', 1, 1398264759, 'Support'),
(47, 'localComment', '本地评论插件', 1, 1399440321, 'LocalComment'),
(48, 'weiboType', '微博类型', 1, 1409121894, ''),
(49, 'repost', '转发钩子', 1, 1403668286, ''),
(50, 'syncLogin', '第三方登陆位置', 1, 1403700579, 'SyncLogin'),
(51, 'syncMeta', '第三方登陆meta接口', 1, 1403700633, 'SyncLogin'),
(52, 'J_China_City', '每个系统都需要的一个中国省市区三级联动插件。', 1, 1403841931, 'ChinaCity'),
(54, 'imageSlider', '图片轮播钩子', 1, 1407144022, ''),
(55, 'friendLink', '友情链接插件', 1, 1407156413, 'SuperLinks'),
(56, 'beforeSendWeibo', '在发微博之前预处理微博', 2, 1408084504, 'InsertFile'),
(57, 'beforeSendRepost', '转发微博前的预处理钩子', 2, 1408085689, ''),
(58, 'parseWeiboContent', '解析微博内容钩子', 2, 1409121261, ''),
(59, 'userConfig', '用户配置页面钩子', 1, 1417137557, 'SyncLogin'),
(60, 'weiboSide', '微博侧边钩子', 1, 1417063425, 'Retopic,Recommend'),
(61, 'personalMenus', '顶部导航栏个人下拉菜单', 1, 1417146501, ''),
(62, 'dealPicture', '上传图片处理', 2, 1417139975, ''),
(63, 'ucenterSideMenu', '用户中心左侧菜单', 1, 1417161205, ''),
(64, 'afterTop', '顶部导航之后的钩子，调用公告等', 1, 1429671392, ''),
(65, 'report', '举报钩子', 1, 1429511732, 'Report'),
(66, 'handleAction', '行为的额外操作', 2, 1433300260, 'CheckIn'),
(67, 'uploadDriver', '附件图片上传引擎', 2, 1435306269, ''),
(68, 'sms', '短信插件钩子', 2, 1437382105, ''),
(69, 'filterHtmlContent', '渲染富文本', 2, 1441951420, ''),
(70, 'parseContent', '解析内容', 2, 1445828128, 'Sensitive'),
(71, 'tool', '返回顶部，右下角工具栏', 1, 1445828128, '');

-- --------------------------------------------------------

--
-- 表的结构 `ocenter_invite`
--

CREATE TABLE `ocenter_invite` (
  `id` int(11) NOT NULL COMMENT 'PRIMARY_KEY',
  `invite_type` int(11) NOT NULL COMMENT '邀请类型id',
  `code` varchar(25) NOT NULL COMMENT '邀请码',
  `uid` int(11) NOT NULL COMMENT '用户id',
  `can_num` int(10) NOT NULL COMMENT '可以注册用户（含升级）',
  `already_num` int(10) NOT NULL COMMENT '已经注册用户（含升级）',
  `end_time` int(11) NOT NULL COMMENT '有效期至',
  `status` tinyint(2) NOT NULL COMMENT '0：已用完，1：还可注册，2：用户取消邀请，-1：管理员删除',
  `create_time` int(11) NOT NULL COMMENT '创建时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='邀请码表';

-- --------------------------------------------------------

--
-- 表的结构 `ocenter_invite_buy_log`
--

CREATE TABLE `ocenter_invite_buy_log` (
  `id` int(11) NOT NULL COMMENT 'PRIMARY_KEY',
  `invite_type` int(11) NOT NULL COMMENT '邀请类型id',
  `uid` int(11) NOT NULL COMMENT '用户id',
  `num` int(10) NOT NULL COMMENT '可邀请名额',
  `content` varchar(200) NOT NULL COMMENT '记录信息',
  `create_time` int(11) NOT NULL COMMENT '创建时间（做频率用）'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户购买邀请名额记录';

-- --------------------------------------------------------

--
-- 表的结构 `ocenter_invite_log`
--

CREATE TABLE `ocenter_invite_log` (
  `id` int(11) NOT NULL COMMENT 'PRIMARY_KEY',
  `uid` int(11) NOT NULL COMMENT '用户id',
  `inviter_id` int(11) NOT NULL COMMENT '邀请人id',
  `invite_id` int(11) NOT NULL COMMENT '邀请码id',
  `content` varchar(200) NOT NULL COMMENT '记录内容',
  `create_time` int(11) NOT NULL COMMENT '创建时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='邀请注册成功记录表';

-- --------------------------------------------------------

--
-- 表的结构 `ocenter_invite_type`
--

CREATE TABLE `ocenter_invite_type` (
  `id` int(11) NOT NULL COMMENT 'PRIMARY_KEY',
  `title` varchar(25) NOT NULL COMMENT '标题',
  `length` int(10) NOT NULL DEFAULT '11' COMMENT '验证码长度',
  `time` varchar(50) NOT NULL COMMENT '有效时长，带单位的时间',
  `cycle_num` int(10) NOT NULL COMMENT '周期内可购买个数',
  `cycle_time` varchar(50) NOT NULL COMMENT '周期时长，带单位的时间',
  `roles` varchar(50) NOT NULL COMMENT '绑定角色ids',
  `auth_groups` varchar(50) NOT NULL COMMENT '允许购买的用户组ids',
  `pay_score` int(10) NOT NULL COMMENT '购买消耗积分',
  `pay_score_type` int(11) NOT NULL COMMENT '购买消耗积分类型',
  `income_score` int(10) NOT NULL COMMENT '每邀请成功一个用户，邀请者增加积分',
  `income_score_type` int(11) NOT NULL COMMENT '邀请成功后增加积分类型id',
  `is_follow` tinyint(2) NOT NULL COMMENT '邀请成功后是否互相关注',
  `status` tinyint(2) NOT NULL,
  `create_time` int(11) NOT NULL COMMENT '创建时间',
  `update_time` int(11) NOT NULL COMMENT '更新时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='邀请注册码类型表';

-- --------------------------------------------------------

--
-- 表的结构 `ocenter_invite_user_info`
--

CREATE TABLE `ocenter_invite_user_info` (
  `id` int(11) NOT NULL COMMENT 'PRIMARY_KEY',
  `invite_type` int(11) NOT NULL COMMENT '邀请类型id',
  `uid` int(11) NOT NULL COMMENT '用户id',
  `num` int(11) NOT NULL COMMENT '可邀请名额',
  `already_num` int(11) NOT NULL COMMENT '已邀请名额',
  `success_num` int(11) NOT NULL COMMENT '成功邀请名额'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='邀请注册用户信息';

-- --------------------------------------------------------

--
-- 表的结构 `ocenter_issue`
--

CREATE TABLE `ocenter_issue` (
  `id` int(11) NOT NULL,
  `title` varchar(40) NOT NULL,
  `create_time` int(11) NOT NULL,
  `update_time` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `allow_post` tinyint(4) NOT NULL,
  `pid` int(11) NOT NULL,
  `sort` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `ocenter_issue`
--

INSERT INTO `ocenter_issue` (`id`, `title`, `create_time`, `update_time`, `status`, `allow_post`, `pid`, `sort`) VALUES
(13, '默认专辑', 1409712474, 1409712467, 1, 0, 0, 0),
(14, '默认二级', 1409712480, 1409712475, 1, 0, 13, 0);

-- --------------------------------------------------------

--
-- 表的结构 `ocenter_issue_content`
--

CREATE TABLE `ocenter_issue_content` (
  `id` int(11) NOT NULL,
  `title` varchar(50) NOT NULL COMMENT '标题',
  `content` text NOT NULL COMMENT '内容',
  `view_count` int(11) NOT NULL COMMENT '阅读数量',
  `cover_id` int(11) NOT NULL COMMENT '封面图片id',
  `issue_id` int(11) NOT NULL COMMENT '所在专辑',
  `uid` int(11) NOT NULL COMMENT '发布者id',
  `reply_count` int(11) NOT NULL,
  `create_time` int(11) NOT NULL,
  `update_time` int(11) NOT NULL,
  `status` tinyint(11) NOT NULL,
  `url` varchar(200) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='专辑内容表';

--
-- 转存表中的数据 `ocenter_issue_content`
--

INSERT INTO `ocenter_issue_content` (`id`, `title`, `content`, `view_count`, `cover_id`, `issue_id`, `uid`, `reply_count`, `create_time`, `update_time`, `status`, `url`) VALUES
(29, 'OpenSNS官方订制门店', '<p><span style="color: rgb(53, 53, 53); font-family: &#39;Microsoft YaHei&#39;; font-size: 13px; line-height: 20px; background-color: rgb(255, 255, 255);">嘉兴奕想信息技术有限公司，opensns官方子公司，是嘉兴想天信息科技有限公司为opensns二次开发专门申请的公司。</span></p>', 7, 3, 14, 1, 0, 1430704938, 1452479973, 1, 'http://os.opensns.cn/appstore/index/shop/id/102.html'),
(30, 'OpenSNS官方旗舰店', '<p>OpenCenter和OpenSNS开发商-嘉兴想天信息科技有限公司 官方店，提供卓越品质的服务，服务内容包含二次开发。</p><pre class="brush:php;toolbar:false">public&nbsp;function&nbsp;reload(){\r\n&nbsp;&nbsp;$modules&nbsp;=&nbsp;$this-&gt;select();\r\n&nbsp;&nbsp;foreach&nbsp;($modules&nbsp;as&nbsp;$m)&nbsp;{\r\n&nbsp;&nbsp;&nbsp;&nbsp;if&nbsp;(file_exists(APP_PATH&nbsp;.&nbsp;&#39;/&#39;&nbsp;.&nbsp;$m[&#39;name&#39;]&nbsp;.&nbsp;&#39;/Info/info.php&#39;))&nbsp;{\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;$info&nbsp;=&nbsp;array_merge($m,&nbsp;$this-&gt;getInfo($m[&#39;name&#39;]));&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;$this-&gt;save($info);&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\r\n&nbsp;&nbsp;&nbsp;&nbsp;}&nbsp;&nbsp;&nbsp;&nbsp;\r\n&nbsp;&nbsp;}&nbsp;&nbsp;&nbsp;&nbsp;\r\n&nbsp;&nbsp;$this-&gt;cleanModulesCache();\r\n}</pre>', 13, 2, 14, 1, 0, 1430705543, 1452480316, 1, 'http://os.opensns.cn/appstore/index/shop/id/1.html');

-- --------------------------------------------------------

--
-- 表的结构 `ocenter_local_comment`
--

CREATE TABLE `ocenter_local_comment` (
  `id` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `app` text NOT NULL,
  `mod` text NOT NULL,
  `row_id` int(11) NOT NULL,
  `parse` int(11) NOT NULL,
  `content` varchar(1000) NOT NULL,
  `create_time` int(11) NOT NULL,
  `pid` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `ip` bigint(20) NOT NULL,
  `area` varchar(30) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ocenter_member`
--

CREATE TABLE `ocenter_member` (
  `uid` int(10) UNSIGNED NOT NULL COMMENT '用户ID',
  `nickname` char(32) NOT NULL DEFAULT '' COMMENT '昵称',
  `sex` tinyint(3) UNSIGNED NOT NULL DEFAULT '0' COMMENT '性别',
  `birthday` date NOT NULL DEFAULT '0000-00-00' COMMENT '生日',
  `qq` char(10) NOT NULL DEFAULT '' COMMENT 'qq号',
  `login` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '登录次数',
  `reg_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '注册IP',
  `reg_time` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '注册时间',
  `last_login_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '最后登录IP',
  `last_login_time` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '会员状态',
  `last_login_role` int(11) NOT NULL,
  `show_role` int(11) NOT NULL COMMENT '个人主页显示角色',
  `signature` text NOT NULL,
  `pos_province` int(11) NOT NULL,
  `pos_city` int(11) NOT NULL,
  `pos_district` int(11) NOT NULL,
  `pos_community` int(11) NOT NULL,
  `score1` double DEFAULT '0' COMMENT '用户积分',
  `score2` double DEFAULT '0' COMMENT 'score2',
  `score3` double DEFAULT '0' COMMENT 'score3',
  `score4` double DEFAULT '0' COMMENT 'score4',
  `con_check` int(11) NOT NULL DEFAULT '0',
  `total_check` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='会员表';

--
-- 转存表中的数据 `ocenter_member`
--

INSERT INTO `ocenter_member` (`uid`, `nickname`, `sex`, `birthday`, `qq`, `login`, `reg_ip`, `reg_time`, `last_login_ip`, `last_login_time`, `status`, `last_login_role`, `show_role`, `signature`, `pos_province`, `pos_city`, `pos_district`, `pos_community`, `score1`, `score2`, `score3`, `score4`, `con_check`, `total_check`) VALUES
(1, 'admin', 0, '0000-00-00', '', 18, 0, 1456986683, 2130706433, 1459426854, 1, 1, 1, '', 0, 0, 0, 0, 80, 0, 0, 0, 0, 0),
(100, 'sdfdf', 0, '0000-00-00', '', 1, 0, 1457598215, 0, 1457598216, 1, 1, 1, '', 0, 0, 0, 0, 10, 0, 0, 0, 0, 0),
(101, '100', 0, '0000-00-00', '', 5, 0, 1459408831, 2130706433, 1459598906, 1, 2, 2, '', 0, 0, 0, 0, 10, 0, 0, 0, 0, 0),
(102, 't1', 0, '0000-00-00', '', 3, 0, 1459408907, 2130706433, 1459599052, 1, 2, 2, '', 0, 0, 0, 0, 10, 0, 0, 0, 0, 0),
(103, 'student1', 0, '0000-00-00', '', 7, 2130706433, 1459940192, 2130706433, 1459426887, 1, 3, 3, '', 0, 0, 0, 0, 20, 0, 0, 0, 0, 0),
(104, 'student2', 0, '0000-00-00', '', 2, 2130706433, 1459940256, 2130706433, 1459941818, 1, 3, 3, '', 0, 0, 0, 0, 10, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `ocenter_menu`
--

CREATE TABLE `ocenter_menu` (
  `id` int(10) UNSIGNED NOT NULL COMMENT '文档ID',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '标题',
  `pid` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '上级分类ID',
  `sort` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '排序（同级有效）',
  `url` char(255) NOT NULL DEFAULT '' COMMENT '链接地址',
  `hide` tinyint(1) UNSIGNED NOT NULL DEFAULT '0' COMMENT '是否隐藏',
  `tip` varchar(255) NOT NULL DEFAULT '' COMMENT '提示',
  `group` varchar(50) DEFAULT '' COMMENT '分组',
  `is_dev` tinyint(1) UNSIGNED NOT NULL DEFAULT '0' COMMENT '是否仅开发者模式可见',
  `icon` varchar(20) NOT NULL COMMENT '导航图标',
  `module` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `ocenter_menu`
--

INSERT INTO `ocenter_menu` (`id`, `title`, `pid`, `sort`, `url`, `hide`, `tip`, `group`, `is_dev`, `icon`, `module`) VALUES
(1, '首页', 0, 1, 'Index/index', 0, '', '', 0, 'home', ''),
(2, '用户', 0, 2, 'User/index', 0, '', '', 0, 'user', ''),
(3, '用户信息', 2, 2, 'User/index', 0, '', '用户管理', 0, '', ''),
(4, '积分规则', 113, 3, 'User/action', 0, '', '行为管理', 0, '', ''),
(5, '新增用户行为', 4, 0, 'User/addaction', 0, '', '', 0, '', ''),
(6, '编辑用户行为', 4, 0, 'User/editaction', 0, '', '', 0, '', ''),
(7, '保存用户行为', 4, 0, 'User/saveAction', 0, '"用户->用户行为"保存编辑和新增的用户行为', '', 0, '', ''),
(8, '变更行为状态', 4, 0, 'User/setStatus', 0, '"用户->用户行为"中的启用,禁用和删除权限', '', 0, '', ''),
(9, '禁用会员', 4, 0, 'User/changeStatus?method=forbidUser', 0, '"用户->用户信息"中的禁用', '', 0, '', ''),
(10, '启用会员', 4, 0, 'User/changeStatus?method=resumeUser', 0, '"用户->用户信息"中的启用', '', 0, '', ''),
(11, '删除会员', 4, 0, 'User/changeStatus?method=deleteUser', 0, '"用户->用户信息"中的删除', '', 0, '', ''),
(12, '用户组管理', 2, 5, 'AuthManager/index', 0, '', '权限管理', 0, '', ''),
(13, '删除', 12, 0, 'AuthManager/changeStatus?method=deleteGroup', 0, '删除用户组', '', 0, '', ''),
(14, '禁用', 12, 0, 'AuthManager/changeStatus?method=forbidGroup', 0, '禁用用户组', '', 0, '', ''),
(15, '恢复', 12, 0, 'AuthManager/changeStatus?method=resumeGroup', 0, '恢复已禁用的用户组', '', 0, '', ''),
(16, '新增', 12, 0, 'AuthManager/createGroup', 0, '创建新的用户组', '', 0, '', ''),
(17, '编辑', 12, 0, 'AuthManager/editGroup', 0, '编辑用户组名称和描述', '', 0, '', ''),
(18, '保存用户组', 12, 0, 'AuthManager/writeGroup', 0, '新增和编辑用户组的"保存"按钮', '', 0, '', ''),
(19, '授权', 12, 0, 'AuthManager/group', 0, '"后台 \\ 用户 \\ 用户信息"列表页的"授权"操作按钮,用于设置用户所属用户组', '', 0, '', ''),
(20, '访问授权', 12, 0, 'AuthManager/access', 0, '"后台 \\ 用户 \\ 权限管理"列表页的"访问授权"操作按钮', '', 0, '', ''),
(21, '成员授权', 12, 0, 'AuthManager/user', 0, '"后台 \\ 用户 \\ 权限管理"列表页的"成员授权"操作按钮', '', 0, '', ''),
(22, '解除授权', 12, 0, 'AuthManager/removeFromGroup', 0, '"成员授权"列表页内的解除授权操作按钮', '', 0, '', ''),
(23, '保存成员授权', 12, 0, 'AuthManager/addToGroup', 0, '"用户信息"列表页"授权"时的"保存"按钮和"成员授权"里右上角的"添加"按钮)', '', 0, '', ''),
(24, '分类授权', 12, 0, 'AuthManager/category', 0, '"后台 \\ 用户 \\ 权限管理"列表页的"分类授权"操作按钮', '', 0, '', ''),
(25, '保存分类授权', 12, 0, 'AuthManager/addToCategory', 0, '"分类授权"页面的"保存"按钮', '', 0, '', ''),
(26, '模型授权', 12, 0, 'AuthManager/modelauth', 0, '"后台 \\ 用户 \\ 权限管理"列表页的"模型授权"操作按钮', '', 0, '', ''),
(27, '保存模型授权', 12, 0, 'AuthManager/addToModel', 0, '"分类授权"页面的"保存"按钮', '', 0, '', ''),
(28, '新增权限节点', 12, 0, 'AuthManager/addNode', 1, '', '', 1, '', ''),
(29, '前台权限管理', 12, 0, 'AuthManager/accessUser', 1, '', '权限管理', 0, '', ''),
(30, '删除权限节点', 12, 0, 'AuthManager/deleteNode', 1, '', '', 0, '', ''),
(31, '行为日志', 113, 4, 'Action/actionlog', 0, '', '行为管理', 0, '', ''),
(32, '查看行为日志', 31, 0, 'action/edit', 1, '', '', 0, '', ''),
(33, '修改密码', 2, 3, 'User/updatePassword', 1, '', '', 0, '', ''),
(34, '修改昵称', 2, 4, 'User/updateNickname', 1, '', '', 0, '', ''),
(35, '查看用户', 197, 1, 'Rank/userList', 0, '', '头衔管理', 0, '', ''),
(36, '用户头衔列表', 35, 0, 'Rank/userRankList', 1, '', '', 0, '', ''),
(37, '关联新头衔', 35, 0, 'Rank/userAddRank', 1, '', '', 0, '', ''),
(38, '编辑头衔关联', 35, 0, 'Rank/userChangeRank', 1, '', '', 0, '', ''),
(39, '扩展资料', 2, 3, 'User/profile', 0, '', '用户管理', 0, '', ''),
(40, '添加、编辑分组', 39, 0, 'Admin/User/editProfile', 0, '', '', 0, '', ''),
(41, '分组排序', 39, 0, 'Admin/User/sortProfile', 0, '', '', 0, '', ''),
(42, '字段列表', 39, 0, 'Admin/User/field', 0, '', '', 0, '', ''),
(43, '添加、编辑字段', 39, 0, 'Admin/User/editFieldSetting', 0, '', '', 0, '', ''),
(44, '字段排序', 39, 0, 'Admin/User/sortField', 0, '', '', 0, '', ''),
(45, '用户扩展资料列表', 2, 7, 'User/expandinfo_select', 0, '', '用户管理', 0, '', ''),
(46, '扩展资料详情', 45, 0, 'User/expandinfo_details', 0, '', '', 0, '', ''),
(47, '待审核用户头衔', 197, 2, 'Rank/rankVerify', 0, '', '头衔管理', 0, '', ''),
(48, '被驳回的头衔申请', 197, 3, 'Rank/rankVerifyFailure', 0, '', '头衔管理', 0, '', ''),
(49, '转移用户组', 2, 7, 'User/changeGroup', 1, '批量转移用户组', '', 0, '', ''),
(50, '用户注册配置', 2, 1, 'UserConfig/index', 0, '', '注册配置', 0, '', ''),
(51, '积分类型列表', 113, 1, 'User/scoreList', 0, '', '行为管理', 0, '', ''),
(52, '新增/编辑类型', 113, 2, 'User/editScoreType', 1, '', '行为管理', 0, '', ''),
(53, '充值积分', 113, 5, 'User/recharge', 1, '', '', 0, '用户管理', ''),
(54, '头衔列表', 197, 6, 'Rank/index', 0, '', '头衔管理', 0, '', ''),
(55, '添加头衔', 54, 2, 'Rank/editRank', 1, '', '头衔管理', 0, '', ''),
(57, '插件管理', 105, 4, 'Addons/index', 0, '', '本地', 0, '', ''),
(58, '钩子管理', 57, 2, 'Addons/hooks', 0, '', '本地', 0, '', ''),
(59, '创建', 57, 0, 'Addons/create', 0, '服务器上创建插件结构向导', '', 0, '', ''),
(60, '检测创建', 57, 0, 'Addons/checkForm', 0, '检测插件是否可以创建', '', 0, '', ''),
(61, '预览', 57, 0, 'Addons/preview', 0, '预览插件定义类文件', '', 0, '', ''),
(62, '快速生成插件', 57, 0, 'Addons/build', 0, '开始生成插件结构', '', 0, '', ''),
(64, '设置', 57, 0, 'Addons/config', 0, '设置插件配置', '', 0, '', ''),
(65, '禁用', 57, 0, 'Addons/disable', 0, '禁用插件', '', 0, '', ''),
(66, '启用', 57, 0, 'Addons/enable', 0, '启用插件', '', 0, '', ''),
(67, '安装', 57, 0, 'Addons/install', 0, '安装插件', '', 0, '', ''),
(68, '卸载', 57, 0, 'Addons/uninstall', 0, '卸载插件', '', 0, '', ''),
(69, '更新配置', 57, 0, 'Addons/saveconfig', 0, '更新插件配置处理', '', 0, '', ''),
(70, '插件后台列表', 57, 0, 'Addons/adminList', 0, '', '', 0, '', ''),
(71, 'URL方式访问插件', 57, 0, 'Addons/execute', 0, '控制是否有权限通过url访问插件控制器方法', '', 0, '', ''),
(72, '新增钩子', 58, 0, 'Addons/addHook', 0, '', '', 0, '', ''),
(73, '编辑钩子', 58, 0, 'Addons/edithook', 0, '', '', 0, '', ''),
(74, '系统', 0, 7, 'Config/group', 0, '', '', 0, 'windows', ''),
(75, '网站设置', 74, 1, 'Config/group', 0, '', '系统设置', 0, '', ''),
(76, '配置管理', 74, 7, 'Config/index', 0, '', '系统设置', 0, '', ''),
(77, '编辑', 76, 0, 'Config/edit', 0, '新增编辑和保存配置', '', 0, '', ''),
(78, '删除', 76, 0, 'Config/del', 0, '删除配置', '', 0, '', ''),
(79, '新增', 76, 0, 'Config/add', 0, '新增配置', '', 0, '', ''),
(80, '保存', 76, 0, 'Config/save', 0, '保存配置', '', 0, '', ''),
(81, '排序', 76, 0, 'Config/sort', 1, '', '', 0, '', ''),
(82, '后台菜单管理', 2, 6, 'Menu/index', 0, '', '权限管理', 0, '', ''),
(83, '新增', 82, 0, 'Menu/add', 0, '', '系统设置', 0, '', ''),
(84, '编辑', 82, 0, 'Menu/edit', 0, '', '', 0, '', ''),
(85, '导入', 82, 0, 'Menu/import', 0, '', '', 0, '', ''),
(86, '排序', 82, 0, 'Menu/sort', 1, '', '', 0, '', ''),
(87, '顶部导航', 74, 3, 'Channel/index', 0, '', '导航管理', 0, '', ''),
(88, '新增', 87, 0, 'Channel/add', 0, '', '', 0, '', ''),
(89, '编辑', 87, 0, 'Channel/edit', 0, '', '', 0, '', ''),
(90, '删除', 87, 0, 'Channel/del', 0, '', '', 0, '', ''),
(91, '排序', 87, 0, 'Channel/sort', 1, '', '', 0, '', ''),
(92, '备份数据库', 113, 8, 'Database/index?type=export', 0, '', '数据备份', 0, '', ''),
(93, '备份', 92, 0, 'Database/export', 0, '备份数据库', '', 0, '', ''),
(94, '优化表', 92, 0, 'Database/optimize', 0, '优化数据表', '', 0, '', ''),
(95, '修复表', 92, 0, 'Database/repair', 0, '修复数据表', '', 0, '', ''),
(96, '还原数据库', 113, 9, 'Database/index?type=import', 0, '', '数据备份', 0, '', ''),
(97, '恢复', 96, 0, 'Database/import', 0, '数据库恢复', '', 0, '', ''),
(98, '删除', 96, 0, 'Database/del', 0, '删除备份文件', '', 0, '', ''),
(99, 'SEO规则管理', 74, 8, 'SEO/index', 0, '', 'SEO规则', 0, '', ''),
(100, '新增、编辑', 99, 0, 'SEO/editRule', 0, '', '', 0, '', ''),
(101, '排序', 99, 0, 'SEO/sortRule', 1, '', '', 0, '', ''),
(102, 'SEO规则回收站', 74, 9, 'SEO/ruleTrash', 0, '', 'SEO规则', 0, '', ''),
(103, '全部补丁', 74, 16, 'Update/quick', 1, '', '升级补丁', 0, '', ''),
(104, '新增补丁', 74, 15, 'Update/addpack', 1, '', '升级补丁', 0, '', ''),
(105, '扩展', 0, 11, 'Module/lists', 0, '', '', 0, 'cloud', ''),
(106, '模块安装', 105, 3, 'module/install', 1, '', '本地', 0, '', ''),
(107, '模块管理', 105, 5, 'module/lists', 0, '', '本地', 0, '', ''),
(108, '卸载模块', 105, 7, 'module/uninstall', 1, '', '本地', 0, '', ''),
(109, '授权', 0, 6, 'authorize/ssoSetting', 0, '', '', 0, 'lock', ''),
(110, '单点登录配置', 109, 0, 'Authorize/ssoSetting', 0, '', '单点登录', 0, '', ''),
(111, '应用列表', 109, 0, 'Authorize/ssolist', 0, '', '单点登录', 0, '', ''),
(112, '新增/编辑应用', 109, 0, 'authorize/editssoapp', 1, '', '单点登录', 0, '', ''),
(113, '安全', 0, 5, 'ActionLimit/limitList', 0, '', '', 0, 'shield', ''),
(114, '行为限制列表', 113, 6, 'ActionLimit/limitList', 0, '', '行为限制', 0, '', ''),
(115, '新增/编辑行为限制', 113, 7, 'ActionLimit/editLimit', 1, '', '行为限制', 0, '', ''),
(116, '身份', 0, 3, 'Role/index', 0, '', '', 0, 'group', ''),
(117, '身份列表', 116, 1, 'Role/index', 0, '', '身份管理', 0, '', ''),
(118, '编辑身份', 116, 2, 'Role/editRole', 1, '', '', 0, '', ''),
(119, '启用、禁用、删除身份', 116, 3, 'Role/setStatus', 1, '', '', 0, '', ''),
(120, '身份排序', 116, 4, 'Role/sort', 1, '', '', 0, '', ''),
(121, '默认积分配置', 117, 0, 'Role/configScore', 1, '', '', 0, '', ''),
(122, '默认权限配置', 117, 0, 'Role/configAuth', 1, '', '', 0, '', ''),
(123, '默认头像配置', 117, 0, 'Role/configAvatar', 1, '', '', 0, '', ''),
(124, '默认头衔配置', 117, 0, 'Role/configRank', 1, '', '', 0, '', ''),
(125, '默认字段管理', 117, 0, 'Role/configField', 1, '', '', 0, '', ''),
(126, '身份分组', 116, 5, 'Role/group', 0, '', '身份管理', 0, '', ''),
(127, '编辑分组', 126, 0, 'Role/editGroup', 1, '', '', 0, '', ''),
(128, '删除分组', 126, 0, 'Role/deleteGroup', 1, '', '', 0, '', ''),
(129, '身份基本信息配置', 116, 6, 'Role/config', 1, '', '身份管理', 0, '', ''),
(130, '用户列表', 116, 7, 'Role/userList', 0, '', '身份用户管理', 0, '', ''),
(131, '设置用户状态', 130, 0, 'Role/setUserStatus', 1, '', '', 0, '', ''),
(132, '审核用户', 130, 0, 'Role/setUserAudit', 1, '', '', 0, '', ''),
(133, '迁移用户', 130, 0, 'Role/changeRole', 1, '', '', 0, '', ''),
(134, '上传默认头像', 123, 0, 'Role/uploadPicture', 1, '', '', 0, '', ''),
(135, '类型管理', 116, 8, 'Invite/index', 0, '', '邀请注册管理', 0, '', ''),
(136, '邀请码管理', 116, 9, 'Invite/invite', 0, '', '邀请注册管理', 0, '', ''),
(137, '基础配置', 116, 10, 'Invite/config', 0, '', '邀请注册管理', 0, '', ''),
(138, '兑换记录', 116, 11, 'Invite/buyLog', 0, '', '邀请注册管理', 0, '', ''),
(139, '邀请记录', 116, 12, 'Invite/inviteLog', 0, '', '邀请注册管理', 0, '', ''),
(140, '用户信息', 116, 13, 'Invite/userInfo', 0, '', '邀请注册管理', 0, '', ''),
(141, '编辑邀请注册类型', 135, 0, 'Invite/edit', 1, '', '', 0, '', ''),
(142, '删除邀请', 135, 0, 'Invite/setStatus', 1, '', '', 0, '', ''),
(143, '删除邀请码', 136, 0, 'Invite/delete', 1, '', '', 0, '', ''),
(144, '生成邀请码', 136, 0, 'Invite/createCode', 1, '', '', 0, '', ''),
(145, '删除无用邀请码', 136, 0, 'Invite/deleteTrue', 1, '', '', 0, '', ''),
(146, '导出cvs', 136, 0, 'Invite/cvs', 1, '', '', 0, '', ''),
(147, '用户信息编辑', 140, 0, 'Invite/editUserInfo', 1, '', '', 0, '', ''),
(148, '删除日志', 31, 0, 'Action/remove', 1, '', '', 0, '', ''),
(149, '清空日志', 31, 0, 'Action/clear', 1, '', '', 0, '', ''),
(150, '设置积分状态', 51, 0, 'User/setTypeStatus', 1, '', '', 0, '', ''),
(151, '删除积分类型', 51, 0, 'User/delType', 1, '', '', 0, '', ''),
(152, '充值积分-获取用户昵称', 53, 0, 'User/getNickname', 1, '', '', 0, '', ''),
(153, '删除菜单', 82, 0, 'Menu/del', 1, '', '', 0, '', ''),
(154, '设置开发者模式可见', 82, 0, 'Menu/toogleDev', 1, '', '', 0, '', ''),
(155, '设置显示隐藏', 82, 0, 'Menu/toogleHide', 1, '', '', 0, '', ''),
(156, '行为限制启用、禁用、删除', 114, 0, 'ActionLimit/setLimitStatus', 1, '', '', 0, '', ''),
(157, '启用、禁用、删除、回收站还原', 99, 0, 'SEO/setRuleStatus', 1, '', '', 0, '', ''),
(158, '回收站彻底删除', 102, 0, 'SEO/doClear', 1, '', '', 0, '', ''),
(159, '初始化无角色用户', 130, 0, 'Role/initUnhaveUser', 1, '', '', 0, '', ''),
(160, '删除钩子', 58, 0, 'Addons/delHook', 0, '', '', 0, '', ''),
(161, '使用补丁', 103, 0, 'Update/usePack', 1, '', '', 0, '', ''),
(162, '查看补丁', 103, 0, 'Update/view', 1, '', '', 0, '', ''),
(163, '删除补丁', 103, 0, 'Update/delPack', 1, '', '', 0, '', ''),
(164, '用户标签列表', 2, 4, 'UserTag/userTag', 0, '', '用户管理', 0, '', ''),
(165, '添加分类、标签', 164, 0, 'UserTag/add', 1, '', '', 0, '', ''),
(166, '设置分类、标签状态', 164, 0, 'UserTag/setStatus', 1, '', '', 0, '', ''),
(167, '分类、标签回收站', 164, 0, 'UserTag/tagTrash', 1, '', '', 0, '', ''),
(168, '测底删除回收站内容', 164, 0, 'UserTag/userTagClear', 1, '', '', 0, '', ''),
(169, '可拥有标签配置', 116, 14, 'role/configusertag', 1, '', '', 0, '', ''),
(170, '编辑模块', 107, 0, 'Module/edit', 1, '', '模块管理', 0, '', ''),
(171, '网站信息', 74, 2, 'Config/website', 0, '', '系统设置', 0, '', ''),
(172, '主题管理', 105, 6, 'Theme/tpls', 0, '', '本地', 0, '', ''),
(173, '使用主题', 105, 8, 'Theme/setTheme', 1, '', '本地', 0, '', ''),
(174, '查看主题', 105, 9, 'Theme/lookTheme', 1, '', '本地', 0, '', ''),
(175, '主题打包下载', 105, 10, 'Theme/packageDownload', 1, '', '本地', 0, '', ''),
(176, '卸载删除主题', 105, 11, 'Theme/delete', 1, '', '本地', 0, '', ''),
(177, '上传安装主题', 105, 12, 'Theme/add', 1, '', '本地', 0, '', ''),
(197, '运营', 0, 4, 'Operation/index', 0, '', '', 0, 'laptop', ''),
(198, '群发消息用户列表', 197, 4, 'message/userList', 0, '', '群发消息', 0, '', ''),
(199, '群发消息', 197, 5, 'message/sendMessage', 1, '', '群发消息', 0, '', ''),
(201, '重置用户密码', 3, 0, 'User/initpass', 1, '', '', 0, '', ''),
(209, '表情设置', 74, 4, 'Expression/index', 0, '', '表情设置', 0, '', ''),
(210, '添加表情包', 74, 5, 'Expression/add', 1, '', '表情设置', 0, '', ''),
(211, '表情包列表', 74, 6, 'Expression/package', 0, '', '表情设置', 0, '', ''),
(212, '表情列表', 74, 7, 'Expression/expressionList', 1, '', '表情设置', 0, '', ''),
(213, '删除表情包', 74, 8, 'Expression/delPackage', 1, '', '表情设置', 0, '', ''),
(214, '编辑表情包', 74, 9, 'Expression/editPackage', 1, '', '表情设置', 0, '', ''),
(215, '删除表情', 74, 10, 'Expression/delExpression', 1, '', '表情设置', 0, '', ''),
(216, '上传表情包', 74, 11, 'Expression/upload', 1, '', '表情设置', 0, '', ''),
(217, '用户头衔审核', 47, 2, 'Rank/setVerifyStatus', 1, '', '头衔管理', 0, '', ''),
(225, '广告位', 197, 0, 'Adv/pos', 0, '', '广告配置', 0, '', ''),
(226, '广告管理', 197, 0, 'Adv/adv', 0, '', '广告配置', 0, '', ''),
(227, '新增广告', 226, 0, 'Adv/editAdv', 1, '', '', 0, '', ''),
(228, '编辑广告位', 225, 0, 'Adv/editPos', 1, '', '', 0, '', ''),
(229, '设置广告位状态', 225, 0, 'Adv/setPosStatus', 1, '', '', 0, '', ''),
(230, '广告排期', 226, 0, 'Adv/schedule', 1, '', '', 0, '', ''),
(231, '用户导航', 74, 0, 'Channel/user', 0, '', '导航管理', 0, '', 'Core'),
(232, '积分日志', 113, 0, 'Action/scoreLog', 0, '', '积分管理', 0, '', ''),
(10000, '网站主页', 0, 0, 'Home/config', 1, '', '', 0, 'home', 'Home'),
(10001, '基本设置', 10000, 0, 'Home/config', 0, '', '设置', 0, '', 'Home'),
(10051, '专辑管理', 10050, 0, 'Issue/issue', 0, '', '专辑', 0, '', 'Issue'),
(10050, '专辑', 0, 22, 'Issue/issue', 1, '', '', 0, '', 'Issue'),
(10052, '设置专辑状态', 10051, 0, 'Issue/setIssueContentStatus', 1, '', '', 0, '', 'Issue'),
(10053, '专辑操作', 10051, 0, 'Issue/operate', 1, '', '专辑', 0, '', 'Issue'),
(10054, '编辑专辑', 10051, 0, 'Issue/add', 1, '', '专辑', 0, '', 'Issue'),
(10055, '合并专辑', 10051, 0, 'Issue/doMerge', 1, '', '', 0, '', 'Issue'),
(10056, '专辑回收站', 10050, 4, 'Issue/issueTrash', 0, '', '专辑', 0, '', 'Issue'),
(10057, '内容管理', 10050, 0, 'Issue/contents', 0, '', '内容管理', 0, '', 'Issue'),
(10058, '内容回收站', 10050, 5, 'Issue/contentTrash', 0, '', '内容管理', 0, '', 'Issue'),
(10059, '内容审核', 10050, 1, 'Issue/verify', 0, '', '内容管理', 0, '', 'Issue'),
(10060, '专辑设置', 10050, 0, 'Issue/config', 0, '', '设置', 0, '', 'Issue'),
(10061, '会员展示', 0, 22, 'People/config', 1, '', '', 0, '', 'People'),
(10062, '基本设置', 10061, 0, 'People/config', 0, '', '配置', 0, '', 'People'),
(10113, '内容回收站', 10102, 0, 'Event/contentTrash', 0, '', '内容管理', 0, '', 'Event'),
(10112, '内容审核', 10102, 0, 'Event/verify', 0, '', '内容管理', 0, '', 'Event'),
(10111, '活动分类回收站', 10102, 0, 'Event/eventTypeTrash', 0, '', '活动分类管理', 0, '', 'Event'),
(10110, '合并分类', 10107, 0, 'Event/doMerge', 1, '', '', 0, '', 'Event'),
(10109, '分类操作', 10107, 0, 'Event/operate', 1, '', '', 0, '', 'Event'),
(10108, '分类禁用、启用、删除', 10107, 0, 'Event/setStatus', 1, '', '', 0, '', 'Event'),
(10107, '活动分类管理', 10102, 0, 'Event/index', 0, '', '活动分类管理', 0, '', 'Event'),
(10106, '编辑活动', 10103, 0, 'Event/add', 1, '', '', 0, '', 'Event'),
(10105, '设为推荐', 10103, 0, 'Event/doRecommend', 1, '', '', 0, '', 'Event'),
(10104, '设置活动状态（删除、审核）', 10103, 0, 'Event/setEventContentStatus', 1, '', '', 0, '', 'Event'),
(10103, '内容管理', 10102, 0, 'Event/event', 0, '', '内容管理', 0, '', 'Event'),
(10102, '活动', 0, 22, 'Event/index', 1, '', '', 0, '', 'Event'),
(10114, '活动设置', 10102, 0, 'Event/config', 0, '', '设置', 0, '', 'Event'),
(10115, '开发者工具', 0, 0, 'Devtool/module', 1, '', '', 0, '', 'Devtool'),
(10116, '模块打包向导', 10115, 0, 'Devtool/module', 0, '', '模块工具', 0, '', 'Devtool'),
(10117, '替换文件', 10116, 0, 'Devtool/replace', 1, '', '', 0, '', 'Devtool'),
(10118, '下载压缩包', 10116, 0, 'Devtool/download', 1, '', '', 0, '', 'Devtool'),
(10119, '获取表记录脚本', 10116, 0, 'Devtool/backup_rows', 1, '', '', 0, '', 'Devtool'),
(10120, '第五步', 10116, 0, 'Devtool/module5', 1, '', '', 0, '', 'Devtool'),
(10121, '第四步', 10116, 0, 'Devtool/module4', 1, '', '', 0, '', 'Devtool'),
(10122, '第二步', 10116, 0, 'Devtool/module2', 1, '', '', 0, '', 'Devtool'),
(10123, '第三步', 10116, 0, 'Devtool/module3', 1, '', '', 0, '', 'Devtool'),
(10124, '第一步', 10116, 0, 'Devtool/module1', 1, '', '', 0, '', 'Devtool');

-- --------------------------------------------------------

--
-- 表的结构 `ocenter_message`
--

CREATE TABLE `ocenter_message` (
  `id` int(11) NOT NULL,
  `content_id` int(11) NOT NULL,
  `from_uid` int(11) NOT NULL,
  `to_uid` int(11) NOT NULL,
  `create_time` int(11) NOT NULL,
  `is_read` tinyint(4) NOT NULL,
  `last_toast` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='消息表';

--
-- 转存表中的数据 `ocenter_message`
--

INSERT INTO `ocenter_message` (`id`, `content_id`, `from_uid`, `to_uid`, `create_time`, `is_read`, `last_toast`, `status`) VALUES
(1, 1, 100, 1, 1457598457, 1, 1458197248, 1);

-- --------------------------------------------------------

--
-- 表的结构 `ocenter_message_content`
--

CREATE TABLE `ocenter_message_content` (
  `id` int(11) NOT NULL,
  `from_id` int(11) NOT NULL,
  `title` varchar(500) NOT NULL,
  `content` text NOT NULL,
  `url` varchar(100) NOT NULL,
  `args` text NOT NULL,
  `type` tinyint(11) NOT NULL,
  `create_time` int(11) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `ocenter_message_content`
--

INSERT INTO `ocenter_message_content` (`id`, `from_id`, `title`, `content`, `url`, `args`, `type`, `create_time`, `status`) VALUES
(1, 100, '报名通知', 'sdfdf报名参加了活动]sdfsdf]，请速去审核！', 'Event/Index/member', '{"id":"9"}', 0, 1457598457, 1);

-- --------------------------------------------------------

--
-- 表的结构 `ocenter_module`
--

CREATE TABLE `ocenter_module` (
  `id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL COMMENT '模块名',
  `alias` varchar(30) NOT NULL COMMENT '中文名',
  `version` varchar(20) NOT NULL COMMENT '版本号',
  `is_com` tinyint(4) NOT NULL COMMENT '是否商业版',
  `show_nav` tinyint(4) NOT NULL COMMENT '是否显示在导航栏中',
  `summary` varchar(200) NOT NULL COMMENT '简介',
  `developer` varchar(50) NOT NULL COMMENT '开发者',
  `website` varchar(200) NOT NULL COMMENT '网址',
  `entry` varchar(50) NOT NULL COMMENT '前台入口',
  `is_setup` tinyint(4) NOT NULL DEFAULT '1' COMMENT '是否已安装',
  `sort` int(11) NOT NULL COMMENT '模块排序',
  `icon` varchar(20) NOT NULL,
  `can_uninstall` tinyint(4) NOT NULL,
  `admin_entry` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='模块管理表';

--
-- 转存表中的数据 `ocenter_module`
--

INSERT INTO `ocenter_module` (`id`, `name`, `alias`, `version`, `is_com`, `show_nav`, `summary`, `developer`, `website`, `entry`, `is_setup`, `sort`, `icon`, `can_uninstall`, `admin_entry`) VALUES
(1, 'Home', '网站主页', '2.0.0', 0, 1, '首页模块，主要用于展示网站内容', '嘉兴想天信息科技有限公司', 'http://www.ourstu.com', 'Home/index/index', 1, 0, 'home', 1, 'Admin/Home/config'),
(2, 'Ucenter', '用户中心', '2.0.0', 0, 1, '用户中心模块，系统核心模块', '嘉兴想天信息科技有限公司', 'http://www.ourstu.com', 'Ucenter/index/index', 1, 0, 'user', 0, 'Admin/User/index'),
(3, 'People', '找人', '2.0.0', 0, 1, '会员展示模块，可以用于会员的查找', '嘉兴想天信息科技有限公司', 'http://www.ourstu.com', 'People/index/index', 1, 0, 'group', 1, 'People/config'),
(4, 'Core', '系统公共模块', '2.1.0', 0, 0, '系统核心模块，必不可少，负责核心的处理。', '嘉兴想天信息科技有限公司', 'http://www.ourstu.com', '', 1, 0, 'globe', 0, ''),
(5, 'Issue', '专辑', '2.3.0', 0, 1, '专辑模块，适用于精品内容展示', '嘉兴想天信息科技有限公司', 'http://www.ourstu.com', 'Issue/index/index', 1, 0, 'th', 1, 'Admin/Issue/contents'),
(6, 'Event', '活动', '2.7.1', 0, 1, '活动模块，用户可以发起活动', '嘉兴想天信息科技有限公司', 'http://www.ourstu.com', 'Event/index/index', 1, 0, 'map-marker', 1, 'Admin/Event/index'),
(7, 'Aple', '评价', '2.7.1', 0, 1, '评价模块，学生发起评价', 'ygz', 'http://www.ourstu.com', 'Event/index/index', 0, 0, 'map-marker', 1, 'Admin/Event/index'),
(8, 'Appraise', '评价', '1', 0, 1, '评价模块，学生可以对教师进行任意的评价', 'Lingda', 'http://www.mofriend.net', 'Appraise/index/index', 1, 0, 'map-marker', 1, 'Admin/Appraise/index'),
(9, 'Devtool', '开发者工具', '2.0.2', 0, 1, '开发者工具，主要提供给开发者使用，包含了模块打包工具', '嘉兴想天信息科技有限公司', 'http://www.ourstu.com', '', 1, 0, 'wrench', 1, 'Admin/Devtool/module');

-- --------------------------------------------------------

--
-- 表的结构 `ocenter_picture`
--

CREATE TABLE `ocenter_picture` (
  `id` int(10) UNSIGNED NOT NULL COMMENT '主键id自增',
  `type` varchar(50) NOT NULL,
  `path` varchar(255) NOT NULL DEFAULT '' COMMENT '路径',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '图片链接',
  `md5` char(32) NOT NULL DEFAULT '' COMMENT '文件md5',
  `sha1` char(40) NOT NULL DEFAULT '' COMMENT '文件 sha1编码',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态',
  `create_time` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '创建时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `ocenter_picture`
--

INSERT INTO `ocenter_picture` (`id`, `type`, `path`, `url`, `md5`, `sha1`, `status`, `create_time`) VALUES
(1, 'local', '/Uploads/Picture/default/5693110b42b23.png', '', '78339089a068beeac30171fd0571406e', '26774b61df9fa7412d4dd5f32a5f020a6c2693f0', 1, 1452478731),
(2, 'local', '/Uploads/Picture/default/5693156ceb370.png', '', 'a447783f41a83460179639467b6df0e6', '627b995f0a7643ba66aabc7a42ce7df929b5e0d6', 1, 1452479852),
(3, 'local', '/Uploads/Picture/default/569315aa902f3.png', '', 'c2e044b18aef6d00dcd6475c2ba78764', '3dfa44d10458d300699a25dc6ef476837e475255', 1, 1452479914),
(4, 'local', '/Uploads/Picture/2016-03-03/56d7ebd026219.jpg', '', '076e3caed758a1c18c91a0e9cae3368f', 'f5f8ad26819a471318d24631fa5055036712a87e', 1, 1456991184),
(5, 'local', '/Uploads/Picture/2016-03-30/56fb9ab2b1660.png', '', '6cd427f6f21a07b6b559a2541b0c058b', 'e7af744e71488ca67ce530f0955450d41397082c', 1, 1459329714),
(6, 'local', '/Uploads/Picture/2016-03-30/56fb9abed8e00.png', '', '6e23ff62a5949333b2490f722c2e1cb7', '0a3a9ef18023d53eb9a0cb3eb2e7e9c7a967c0ae', 1, 1459329726);

-- --------------------------------------------------------

--
-- 表的结构 `ocenter_rank`
--

CREATE TABLE `ocenter_rank` (
  `id` int(11) NOT NULL,
  `uid` int(11) NOT NULL COMMENT '上传者id',
  `title` varchar(50) NOT NULL,
  `logo` int(11) NOT NULL,
  `create_time` int(11) NOT NULL,
  `types` tinyint(2) NOT NULL DEFAULT '1' COMMENT '前台是否可申请',
  `label_content` varchar(10) NOT NULL COMMENT '文字头衔内容',
  `label_color` varchar(10) NOT NULL COMMENT '文字颜色',
  `label_bg` varchar(10) NOT NULL COMMENT 'label背景色'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ocenter_rank_user`
--

CREATE TABLE `ocenter_rank_user` (
  `id` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `rank_id` int(11) NOT NULL,
  `reason` varchar(255) NOT NULL,
  `is_show` tinyint(4) NOT NULL COMMENT '是否显示在昵称右侧（必须有图片才可）',
  `create_time` int(11) NOT NULL,
  `status` tinyint(2) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ocenter_report`
--

CREATE TABLE `ocenter_report` (
  `id` int(11) NOT NULL,
  `url` varchar(500) NOT NULL,
  `uid` int(11) NOT NULL,
  `reason` varchar(50) NOT NULL,
  `content` text NOT NULL,
  `data` text NOT NULL,
  `type` varchar(50) NOT NULL,
  `create_time` int(11) NOT NULL,
  `updata_time` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `handle_status` tinyint(4) NOT NULL,
  `handle_result` text NOT NULL,
  `handle_uid` int(11) NOT NULL,
  `handle_time` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ocenter_role`
--

CREATE TABLE `ocenter_role` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL COMMENT '角色组id',
  `name` varchar(25) NOT NULL COMMENT '英文标识',
  `title` varchar(25) NOT NULL COMMENT '中文标题',
  `description` varchar(500) NOT NULL COMMENT '描述',
  `user_groups` varchar(200) NOT NULL COMMENT '默认用户组ids',
  `invite` tinyint(4) NOT NULL COMMENT '预留字段(类型：是否需要邀请注册等)',
  `audit` tinyint(2) NOT NULL DEFAULT '0' COMMENT '是否需要审核',
  `sort` int(10) NOT NULL DEFAULT '0',
  `status` tinyint(2) NOT NULL,
  `create_time` int(11) NOT NULL,
  `update_time` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='角色表';

--
-- 转存表中的数据 `ocenter_role`
--

INSERT INTO `ocenter_role` (`id`, `group_id`, `name`, `title`, `description`, `user_groups`, `invite`, `audit`, `sort`, `status`, `create_time`, `update_time`) VALUES
(1, 0, 'default', '普通用户', '普通用户', '1', 0, 0, 0, 1, 1456986683, 1456986683),
(2, 0, 'teacher', '教师', '', '', 0, 0, 0, 1, 1459407876, 0),
(3, 0, 'student', '学生', '', '', 0, 0, 0, 1, 1459407896, 0);

-- --------------------------------------------------------

--
-- 表的结构 `ocenter_role_config`
--

CREATE TABLE `ocenter_role_config` (
  `id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `name` varchar(25) NOT NULL COMMENT '标识',
  `category` varchar(25) NOT NULL COMMENT '归类标识',
  `value` text NOT NULL COMMENT '配置值',
  `data` text NOT NULL COMMENT '该配置的其它值',
  `update_time` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='角色配置表';

-- --------------------------------------------------------

--
-- 表的结构 `ocenter_role_group`
--

CREATE TABLE `ocenter_role_group` (
  `id` int(11) NOT NULL,
  `title` varchar(25) NOT NULL,
  `update_time` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='角色分组';

-- --------------------------------------------------------

--
-- 表的结构 `ocenter_score_log`
--

CREATE TABLE `ocenter_score_log` (
  `id` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `ip` bigint(20) NOT NULL,
  `type` int(11) NOT NULL,
  `action` varchar(20) NOT NULL,
  `value` double NOT NULL,
  `finally_value` double NOT NULL,
  `create_time` int(11) NOT NULL,
  `remark` varchar(255) NOT NULL,
  `model` varchar(20) NOT NULL,
  `record_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `ocenter_score_log`
--

INSERT INTO `ocenter_score_log` (`id`, `uid`, `ip`, `type`, `action`, `value`, `finally_value`, `create_time`, `remark`, `model`, `record_id`) VALUES
(1, 1, 0, 1, 'inc', 10, 10, 1452476575, 'admin在2016-01-11 09:42登录了账号【积分：+10分】', 'member', 1),
(2, 1, 0, 1, 'inc', 10, 10, 1456986739, 'admin在2016-03-03 14:32登录了账号【积分：+10分】', 'member', 1),
(3, 1, 0, 1, 'inc', 10, 20, 1457590869, 'admin在2016-03-10 14:21登录了账号【积分：+10分】', 'member', 1),
(4, 100, 0, 1, 'inc', 10, 10, 1457598216, 'sdfdf在2016-03-10 16:23登录了账号【积分：+10分】', 'member', 100),
(5, 1, 0, 1, 'inc', 10, 30, 1458197246, 'admin在2016-03-17 14:47登录了账号【积分：+10分】', 'member', 1),
(6, 1, 0, 1, 'inc', 10, 40, 1458801294, 'admin在2016-03-24 14:34登录了账号【积分：+10分】', 'member', 1),
(7, 1, 2130706433, 1, 'inc', 10, 50, 1459328845, 'admin在2016-03-30 17:07登录了账号【积分：+10分】', 'member', 1),
(8, 101, 0, 1, 'inc', 10, 10, 1459408831, 's1在2016-03-31 15:20登录了账号【积分：+10分】', 'member', 101),
(9, 102, 0, 1, 'inc', 10, 10, 1459408907, 't1在2016-03-31 15:21登录了账号【积分：+10分】', 'member', 102),
(10, 1, 2130706433, 1, 'inc', 10, 60, 1459595586, 'admin在2016-04-02 19:13登录了账号【积分：+10分】', 'member', 1),
(11, 103, 2130706433, 1, 'inc', 10, 10, 1459940192, 't2在2016-04-06 18:56登录了账号【积分：+10分】', 'member', 103),
(12, 104, 2130706433, 1, 'inc', 10, 10, 1459940257, 't3在2016-04-06 18:57登录了账号【积分：+10分】', 'member', 104),
(13, 1, 2130706433, 1, 'inc', 10, 70, 1459941079, 'admin在2016-04-06 19:11登录了账号【积分：+10分】', 'member', 1),
(14, 1, 2130706433, 1, 'inc', 10, 80, 1460288547, 'admin在2016-04-10 19:42登录了账号【积分：+10分】', 'member', 1),
(15, 103, 2130706433, 1, 'inc', 10, 20, 1460288578, 't2在2016-04-10 19:42登录了账号【积分：+10分】', 'member', 103);

-- --------------------------------------------------------

--
-- 表的结构 `ocenter_seo_rule`
--

CREATE TABLE `ocenter_seo_rule` (
  `id` int(11) NOT NULL,
  `title` text NOT NULL,
  `app` varchar(40) NOT NULL,
  `controller` varchar(40) NOT NULL,
  `action` varchar(40) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `seo_keywords` text NOT NULL,
  `seo_description` text NOT NULL,
  `seo_title` text NOT NULL,
  `sort` int(11) NOT NULL,
  `summary` varchar(500) NOT NULL COMMENT 'seo变量介绍'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `ocenter_seo_rule`
--

INSERT INTO `ocenter_seo_rule` (`id`, `title`, `app`, `controller`, `action`, `status`, `seo_keywords`, `seo_description`, `seo_title`, `sort`, `summary`) VALUES
(1000, '整站标题', '', '', '', 1, '', '', '', 7, '-'),
(1001, '用户中心', 'Ucenter', 'index', 'index', 1, '{$user_info.username|text}的个人主页', '{$user_info.username|text}的个人主页', '{$user_info.nickname|op_t}的个人主页', 3, '-'),
(1002, '网站首页', 'Home', 'Index', 'index', 1, '', '', '', 0, '-'),
(1003, '积分商城首页', 'Shop', 'Index', 'index', 1, '', '', '', 0, '-'),
(1004, '商品列表', 'Shop', 'Index', 'goods', 1, '', '', '', 0, 'category_name：当前分类名\nchild_category_name：子分类名'),
(1005, '商品详情', 'Shop', 'Index', 'goodsdetail', 1, '', '', '', 0, 'content：商品变量集\n   content.goods_name 商品名\n   content.goods_introduct 商品简介\n   content.goods_detail 商品详情'),
(1006, '活动主页', 'Event', 'Index', 'index', 1, '', '', '', 0, '-'),
(1007, '活动详情', 'Event', 'Index', 'detail', 1, '', '', '', 0, 'content：活动变量集\n   content.title 活动名称\n   content.type.title 活动分类名\n   content.user.nickname 发起人昵称\n   content.address 活动地点\n   content.limitCount 人数限制'),
(1008, '活动成员', 'Event', 'Index', 'member', 1, '', '', '', 0, '-'),
(1009, '专辑首页', 'Issue', 'Index', 'index', 1, '', '', '', 0, '-'),
(1010, '专辑详情', 'Issue', 'Index', 'issuecontentdetail', 1, '', '', '', 0, 'content：专辑内容变量集\n   content.user.nickname 内容发布者昵称\n   content.user.signature 内容发布者签名\n   content.url 内容的Url\n   content.title 内容标题\n   content.create_time|friendlyDate 发布时间\n   content.update_time|friendlyDate 更新时间'),
(1011, '论坛主页', 'Forum', 'Index', 'index', 1, '', '', '', 0, '-'),
(1012, '某个版块的帖子列表', 'Forum', 'Index', 'forum', 1, '', '', '', 0, 'forum：版块变量集\n   forum.description 版块描述\n   forum.title 版块名称\n   forum.topic_count 主题数\n   forum.total_count 帖子数'),
(1013, '帖子详情', 'Forum', 'Index', 'detail', 1, '', '', '', 0, 'post：帖子变量集\n   post.title 帖子标题\n   post.content 帖子详情\n   post.forum.title 帖子所在版块标题\n   '),
(1014, '搜索帖子', 'Forum', 'Index', 'search', 1, '', '', '', 0, 'keywords：搜索的关键词，2.4.0以后版本提供'),
(1015, '随便看看', 'Forum', 'Index', 'look', 1, '', '', '', 0, '-'),
(1016, '全部版块', 'Forum', 'Index', 'lists', 1, '', '', '', 0, '-'),
(1017, '资讯首页/某个分类下的文章列表', 'News', 'Index', 'index', 1, '', '', '', 0, 'now_category.title 当前分类的名称'),
(1018, '某篇文章的内容页', 'News', 'Index', 'detail', 1, '', '', '', 0, 'now_category.title 当前分类的名称\ninfo：文章变量集\n   info.title 文章标题\n   info.description 文章摘要\n   info.source 文章来源\n   info.detail.content 文章内容\nauthor.nickname 作者昵称\nauthor.signature 作者签名\n   '),
(1019, '微博首页', 'Weibo', 'Index', 'index', 1, '{$MODULE_ALIAS}', '{$MODULE_ALIAS}首页', '{$MODULE_ALIAS}-{$website_name}', 0, 'title：我关注的、热门微博、全站关注'),
(1020, '某条微博的详情页', 'Weibo', 'Index', 'weibodetail', 1, '{$weibo.title|text},{$website_name},{$MODULE_ALIAS}', '{$weibo.content|text}', '{$weibo.content|text}——{$MODULE_ALIAS}', 0, 'weibo:微博变量集\n   weibo.user.nickname 发布者昵称\n   weibo.content 微博内容'),
(1021, '微博搜索页面', 'Weibo', 'Index', 'search', 1, '', '', '', 0, 'search_keywords：搜索关键词'),
(1022, '热门话题列表', 'Weibo', 'Topic', 'topic', 1, '', '', '', 0, '-'),
(1023, '某个话题的话题页', 'Weibo', 'Topic', 'index', 1, '', '', '', 0, 'topic：话题变量集\n   topic.name 话题名称\nhost：话题主持人变量集\n   host.nickname 主持人昵称'),
(1024, '自动跳转到我的群组', 'Group', 'Index', 'index', 1, '', '', '', 0, '-'),
(1025, '全部群组', 'Group', 'Index', 'groups', 1, '', '', '', 0, '-'),
(1026, '我的群组-帖子列表', 'Group', 'Index', 'my', 1, '', '', '', 0, '-'),
(1027, '我的群组-全部关注的群组列表', 'Group', 'Index', 'mygroup', 1, '', '', '', 0, '-'),
(1028, '某个群组的帖子列表页面', 'Group', 'Index', 'group', 1, '', '', '', 0, 'search_key：如果查找帖子，则是关键词\ngroup：群组变量集\n   group.title 群组标题\n   group.user.nickname 创始人昵称\n   group.member_count 群组人数'),
(1029, '某篇帖子的内容页', 'Group', 'Index', 'detail', 1, '', '', '', 0, 'group：群组变量集\n   group.title 群组标题\n   group.user.nickname 创始人昵称\n   group.member_count 群组人数\npost：帖子变量集\n   post.title 帖子标题\n   post.content 帖子内容'),
(1030, '创建群组', 'Group', 'Index', 'create', 1, '', '', '', 0, '-'),
(1031, '发现', 'Group', 'Index', 'discover', 1, '', '', '', 0, '-'),
(1032, '精选', 'Group', 'Index', 'select', 1, '', '', '', 0, '-'),
(1033, '找人首页', 'People', 'Index', 'index', 1, '{$MODULE_ALIAS}', '{$MODULE_ALIAS}', '{$MODULE_ALIAS}', 0, '-'),
(1034, '微店首页', 'Store', 'Index', 'index', 1, '', '', '', 0, '-'),
(1035, '某个分类下的商品列表页', 'Store', 'Index', 'li', 1, '', '', '', 0, 'type：当前分类变量集\n   type.title 分类名称'),
(1036, '搜索商品列表页', 'Store', 'Index', 'search', 1, '', '', '', 0, 'searchKey：搜索关键词'),
(1037, '单个商品的详情页', 'Store', 'Index', 'info', 1, '', '', '', 0, 'info：商品变量集\n   info.title 商品标题\n   info.des 商品描述\n   info.shop：店铺变量集\n       info.shop.title 店铺名称\n       info.shop.summary 店铺简介\n       info.shop.position 店铺所在地\n       info.shop.user.nickname 店主昵称'),
(1038, '店铺街', 'Store', 'Index', 'lists', 1, '', '', '', 0, '-'),
(1039, '某个店铺的首页', 'Store', 'Index', 'detail', 1, '', '', '', 0, 'shop：店铺变量集\n   shop.title 店铺名称\n   shop.summary 店铺简介\n   shop.position 店铺所在地\n   shop.user.nickname 店主昵称'),
(1040, '某个店铺下的商品列表页', 'Store', 'Index', 'goods', 1, '', '', '', 0, 'shop：店铺变量集\n   shop.title 店铺名称\n   shop.summary 店铺简介\n   shop.position 店铺所在地\n   shop.user.nickname 店主昵称'),
(1041, '分类信息首页', 'Cat', 'Index', 'index', 1, '', '', '', 0, '-'),
(1042, '某个模型下的列表页', 'Cat', 'Index', 'li', 1, '', '', '', 0, 'entity：当前模型变量集\n   entity.alias 模型名'),
(1043, '某条信息的详情页', 'Cat', 'Index', 'info', 1, '', '', '', 0, 'entity：当前模型变量集\n   entity.alias 模型名\ninfo：当前信息\n   info.title 信息名称\nuser.nickname 发布者昵称'),
(1044, '待回答页面', 'Question', 'Index', 'waitanswer', 1, '', '', '', 0, '-'),
(1045, '热门问题', 'Question', 'Index', 'goodquestion', 1, '', '', '', 0, '-'),
(1046, '我的回答', 'Question', 'Index', 'myquestion', 1, '', '', '', 0, '-'),
(1047, '全部问题', 'Question', 'Index', 'questions', 1, '', '', '', 0, '-'),
(1048, '详情', 'Question', 'Index', 'detail', 1, '', '', '', 0, 'question：问题变量集\n   question.title 问题标题\n   question.description 问题描述\n   question.answer_num 回答数\nbest_answer：最佳回答\n   best_answer.content 最佳答案内容');

-- --------------------------------------------------------

--
-- 表的结构 `ocenter_sso_app`
--

CREATE TABLE `ocenter_sso_app` (
  `id` int(11) NOT NULL,
  `title` varchar(50) NOT NULL,
  `url` varchar(255) NOT NULL,
  `path` varchar(255) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `create_time` int(11) NOT NULL,
  `config` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ocenter_super_links`
--

CREATE TABLE `ocenter_super_links` (
  `id` int(11) UNSIGNED NOT NULL COMMENT '主键',
  `type` int(1) NOT NULL DEFAULT '1' COMMENT '类别（1：图片，2：普通）',
  `title` char(80) NOT NULL DEFAULT '' COMMENT '站点名称',
  `cover_id` int(10) NOT NULL COMMENT '图片ID',
  `link` char(140) NOT NULL DEFAULT '' COMMENT '链接地址',
  `level` int(3) UNSIGNED NOT NULL DEFAULT '0' COMMENT '优先级',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态（0：禁用，1：正常）',
  `create_time` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '添加时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='友情连接表' ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- 表的结构 `ocenter_support`
--

CREATE TABLE `ocenter_support` (
  `id` int(11) NOT NULL,
  `appname` varchar(20) NOT NULL COMMENT '应用名',
  `row` int(11) NOT NULL COMMENT '应用标识',
  `uid` int(11) NOT NULL COMMENT '用户',
  `create_time` int(11) NOT NULL COMMENT '发布时间',
  `table` varchar(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='支持的表';

-- --------------------------------------------------------

--
-- 表的结构 `ocenter_sync_login`
--

CREATE TABLE `ocenter_sync_login` (
  `id` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `type_uid` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `oauth_token` varchar(255) NOT NULL,
  `oauth_token_secret` varchar(255) NOT NULL,
  `is_sync` tinyint(4) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ocenter_talk`
--

CREATE TABLE `ocenter_talk` (
  `id` int(11) NOT NULL,
  `create_time` int(11) NOT NULL,
  `uids` varchar(100) NOT NULL,
  `update_time` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `title` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='会话表';

-- --------------------------------------------------------

--
-- 表的结构 `ocenter_talk_message`
--

CREATE TABLE `ocenter_talk_message` (
  `id` int(11) NOT NULL,
  `content` varchar(500) NOT NULL,
  `uid` int(11) NOT NULL,
  `create_time` int(11) NOT NULL,
  `talk_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='聊天消息表';

-- --------------------------------------------------------

--
-- 表的结构 `ocenter_talk_message_push`
--

CREATE TABLE `ocenter_talk_message_push` (
  `id` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `source_id` int(11) NOT NULL COMMENT '来源消息id',
  `create_time` int(11) NOT NULL COMMENT '创建时间',
  `status` tinyint(4) NOT NULL,
  `talk_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=gbk COMMENT='状态，0为未提示，1为未点击，-1为已点击';

-- --------------------------------------------------------

--
-- 表的结构 `ocenter_talk_push`
--

CREATE TABLE `ocenter_talk_push` (
  `id` int(11) NOT NULL,
  `uid` int(11) NOT NULL COMMENT '接收推送的用户id',
  `source_id` int(11) NOT NULL COMMENT '来源id',
  `create_time` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL COMMENT '状态，0为未提示，1为未点击，-1为已点击'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='对话推送表';

-- --------------------------------------------------------

--
-- 表的结构 `ocenter_ucenter_admin`
--

CREATE TABLE `ocenter_ucenter_admin` (
  `id` int(10) UNSIGNED NOT NULL COMMENT '管理员ID',
  `member_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '管理员用户ID',
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT '0' COMMENT '管理员状态'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='管理员表';

-- --------------------------------------------------------

--
-- 表的结构 `ocenter_ucenter_member`
--

CREATE TABLE `ocenter_ucenter_member` (
  `id` int(10) UNSIGNED NOT NULL COMMENT '用户ID',
  `username` char(32) NOT NULL COMMENT '用户名',
  `password` char(32) NOT NULL COMMENT '密码',
  `email` char(32) NOT NULL COMMENT '用户邮箱',
  `mobile` char(15) NOT NULL COMMENT '用户手机',
  `reg_time` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '注册时间',
  `reg_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '注册IP',
  `last_login_time` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  `last_login_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '最后登录IP',
  `update_time` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) DEFAULT '0' COMMENT '用户状态',
  `type` tinyint(4) NOT NULL COMMENT '1为用户名注册，2为邮箱注册，3为手机注册'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户表';

--
-- 转存表中的数据 `ocenter_ucenter_member`
--

INSERT INTO `ocenter_ucenter_member` (`id`, `username`, `password`, `email`, `mobile`, `reg_time`, `reg_ip`, `last_login_time`, `last_login_ip`, `update_time`, `status`, `type`) VALUES
(1, 'admin', '96f4b6d7cd51ef4a7bf929e0f9e63676', 'admin@admin.com', '', 1456986683, 0, 1459426854, 2130706433, 1456986683, 1, 1),
(100, '', '96f4b6d7cd51ef4a7bf929e0f9e63676', '', '', 1457598215, 0, 1457598215, 0, 1457598215, 1, 1),
(101, '100', '96f4b6d7cd51ef4a7bf929e0f9e63676', '', '', 1459408831, 0, 1459598906, 2130706433, 1459408831, 1, 1),
(102, '101', '96f4b6d7cd51ef4a7bf929e0f9e63676', '', '', 1459408907, 0, 1459599052, 2130706433, 1459408907, 1, 1),
(103, 'student1', '96f4b6d7cd51ef4a7bf929e0f9e63676', '', '', 1459940192, 2130706433, 1459426887, 2130706433, 1459940192, 1, 1),
(104, 'student2', '96f4b6d7cd51ef4a7bf929e0f9e63676', '', '', 1459940256, 2130706433, 1459941818, 2130706433, 1459940256, 1, 1);

-- --------------------------------------------------------

--
-- 表的结构 `ocenter_ucenter_score_type`
--

CREATE TABLE `ocenter_ucenter_score_type` (
  `id` int(11) NOT NULL,
  `title` varchar(50) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `unit` varchar(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `ocenter_ucenter_score_type`
--

INSERT INTO `ocenter_ucenter_score_type` (`id`, `title`, `status`, `unit`) VALUES
(1, '积分', 1, '分'),
(2, '威望', 1, '点'),
(3, '贡献', 1, '元'),
(4, '余额', 1, '点');

-- --------------------------------------------------------

--
-- 表的结构 `ocenter_ucenter_setting`
--

CREATE TABLE `ocenter_ucenter_setting` (
  `id` int(10) UNSIGNED NOT NULL COMMENT '设置ID',
  `type` tinyint(3) UNSIGNED NOT NULL DEFAULT '0' COMMENT '配置类型（1-用户配置）',
  `value` text NOT NULL COMMENT '配置数据'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='设置表';

-- --------------------------------------------------------

--
-- 表的结构 `ocenter_ucenter_user_link`
--

CREATE TABLE `ocenter_ucenter_user_link` (
  `id` int(10) UNSIGNED NOT NULL,
  `uid` int(11) NOT NULL,
  `uc_uid` int(11) NOT NULL,
  `uc_username` varchar(50) NOT NULL,
  `uc_email` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ocenter_url`
--

CREATE TABLE `ocenter_url` (
  `id` int(11) UNSIGNED NOT NULL COMMENT '链接唯一标识',
  `url` char(255) NOT NULL DEFAULT '' COMMENT '链接地址',
  `short` char(100) NOT NULL DEFAULT '' COMMENT '短网址',
  `status` tinyint(2) NOT NULL DEFAULT '2' COMMENT '状态',
  `create_time` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '创建时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='链接表';

-- --------------------------------------------------------

--
-- 表的结构 `ocenter_user_config`
--

CREATE TABLE `ocenter_user_config` (
  `id` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `role_id` int(11) NOT NULL DEFAULT '0',
  `model` varchar(30) NOT NULL,
  `value` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户配置信息表';

-- --------------------------------------------------------

--
-- 表的结构 `ocenter_user_nav`
--

CREATE TABLE `ocenter_user_nav` (
  `id` int(10) UNSIGNED NOT NULL COMMENT '频道ID',
  `title` char(30) NOT NULL COMMENT '频道标题',
  `url` char(100) NOT NULL COMMENT '频道连接',
  `sort` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '导航排序',
  `create_time` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态',
  `target` tinyint(2) UNSIGNED NOT NULL DEFAULT '0' COMMENT '新窗口打开',
  `color` varchar(30) NOT NULL,
  `band_color` varchar(30) NOT NULL,
  `band_text` varchar(30) NOT NULL,
  `icon` varchar(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `ocenter_user_nav`
--

INSERT INTO `ocenter_user_nav` (`id`, `title`, `url`, `sort`, `create_time`, `update_time`, `status`, `target`, `color`, `band_color`, `band_text`, `icon`) VALUES
(1, '个人主页', 'ucenter/Index/index', 0, 0, 0, 1, 0, '', '', '', ''),
(2, '消息中心', 'ucenter/message/message', 0, 0, 0, 1, 0, '', '', '', ''),
(3, '我的收藏', 'ucenter/Collection/index', 0, 0, 0, 1, 0, '', '', '', ''),
(4, '我的头衔', 'ucenter/Index/rank', 0, 0, 0, 1, 0, '', '', '', '');

-- --------------------------------------------------------

--
-- 表的结构 `ocenter_user_role`
--

CREATE TABLE `ocenter_user_role` (
  `id` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL COMMENT '2：未审核，1:启用，0：禁用，-1：删除',
  `step` varchar(50) NOT NULL COMMENT '记录当前执行步骤',
  `init` tinyint(2) NOT NULL DEFAULT '0' COMMENT '是否初始化'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户角色关联';

--
-- 转存表中的数据 `ocenter_user_role`
--

INSERT INTO `ocenter_user_role` (`id`, `uid`, `role_id`, `status`, `step`, `init`) VALUES
(1, 1, 1, 1, 'finish', 1),
(2, 100, 1, 1, 'finish', 1),
(3, 101, 2, 1, 'finish', 1),
(4, 102, 2, 1, 'finish', 1),
(5, 103, 3, 1, 'finish', 1),
(6, 104, 3, 1, 'finish', 1);

-- --------------------------------------------------------

--
-- 表的结构 `ocenter_user_tag`
--

CREATE TABLE `ocenter_user_tag` (
  `id` int(11) NOT NULL,
  `title` varchar(25) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `pid` int(11) NOT NULL,
  `sort` tinyint(6) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='标签分类表';

--
-- 转存表中的数据 `ocenter_user_tag`
--

INSERT INTO `ocenter_user_tag` (`id`, `title`, `status`, `pid`, `sort`) VALUES
(1, '默认', 1, 0, 0),
(2, '开发者', 1, 1, 0),
(3, '站长', 1, 1, 0);

-- --------------------------------------------------------

--
-- 表的结构 `ocenter_user_tag_link`
--

CREATE TABLE `ocenter_user_tag_link` (
  `id` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `tags` varchar(200) NOT NULL COMMENT '标签ids'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户标签关联表';

-- --------------------------------------------------------

--
-- 表的结构 `ocenter_user_token`
--

CREATE TABLE `ocenter_user_token` (
  `id` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `token` varchar(255) NOT NULL,
  `time` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ocenter_verify`
--

CREATE TABLE `ocenter_verify` (
  `id` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `account` varchar(255) NOT NULL,
  `type` varchar(20) NOT NULL,
  `verify` varchar(50) NOT NULL,
  `create_time` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ocenter_version`
--

CREATE TABLE `ocenter_version` (
  `title` varchar(50) NOT NULL COMMENT '版本名',
  `create_time` int(11) NOT NULL COMMENT '发布时间',
  `update_time` int(11) NOT NULL COMMENT '更新的时间',
  `log` text NOT NULL COMMENT '更新日志',
  `url` varchar(150) NOT NULL COMMENT '链接到的远程文章',
  `number` int(11) NOT NULL COMMENT '序列号，一般用日期数字标示',
  `name` varchar(50) NOT NULL COMMENT '版本号',
  `is_current` tinyint(4) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='自动更新表';

--
-- 转存表中的数据 `ocenter_version`
--

INSERT INTO `ocenter_version` (`title`, `create_time`, `update_time`, `log`, `url`, `number`, `name`, `is_current`) VALUES
('OpenCenter V2.0.0', 1452484820, 1452484820, '发布OpenCenter V2', '', 20160111, '2.0.0', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ocenter_action`
--
ALTER TABLE `ocenter_action`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ocenter_action_limit`
--
ALTER TABLE `ocenter_action_limit`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ocenter_action_log`
--
ALTER TABLE `ocenter_action_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `action_ip_ix` (`action_ip`),
  ADD KEY `action_id_ix` (`action_id`),
  ADD KEY `user_id_ix` (`user_id`);

--
-- Indexes for table `ocenter_addons`
--
ALTER TABLE `ocenter_addons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ocenter_adv`
--
ALTER TABLE `ocenter_adv`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ocenter_adv_pos`
--
ALTER TABLE `ocenter_adv_pos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ocenter_appraise`
--
ALTER TABLE `ocenter_appraise`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ocenter_appraise_lesson`
--
ALTER TABLE `ocenter_appraise_lesson`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ocenter_appraise_session`
--
ALTER TABLE `ocenter_appraise_session`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ocenter_appraise_student_lesson`
--
ALTER TABLE `ocenter_appraise_student_lesson`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ocenter_appraise_teacher_lesson`
--
ALTER TABLE `ocenter_appraise_teacher_lesson`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ocenter_attachment`
--
ALTER TABLE `ocenter_attachment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_record_status` (`record_id`,`status`);

--
-- Indexes for table `ocenter_auth_extend`
--
ALTER TABLE `ocenter_auth_extend`
  ADD UNIQUE KEY `group_extend_type` (`group_id`,`extend_id`,`type`),
  ADD KEY `uid` (`group_id`),
  ADD KEY `group_id` (`extend_id`);

--
-- Indexes for table `ocenter_auth_group`
--
ALTER TABLE `ocenter_auth_group`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ocenter_auth_group_access`
--
ALTER TABLE `ocenter_auth_group_access`
  ADD UNIQUE KEY `uid_group_id` (`uid`,`group_id`),
  ADD KEY `uid` (`uid`),
  ADD KEY `group_id` (`group_id`);

--
-- Indexes for table `ocenter_auth_rule`
--
ALTER TABLE `ocenter_auth_rule`
  ADD PRIMARY KEY (`id`),
  ADD KEY `module` (`module`,`status`,`type`);

--
-- Indexes for table `ocenter_avatar`
--
ALTER TABLE `ocenter_avatar`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ocenter_channel`
--
ALTER TABLE `ocenter_channel`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pid` (`pid`);

--
-- Indexes for table `ocenter_checkin`
--
ALTER TABLE `ocenter_checkin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ocenter_config`
--
ALTER TABLE `ocenter_config`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uk_name` (`name`),
  ADD KEY `type` (`type`),
  ADD KEY `group` (`group`);

--
-- Indexes for table `ocenter_district`
--
ALTER TABLE `ocenter_district`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ocenter_event`
--
ALTER TABLE `ocenter_event`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ocenter_event_attend`
--
ALTER TABLE `ocenter_event_attend`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ocenter_event_type`
--
ALTER TABLE `ocenter_event_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ocenter_field`
--
ALTER TABLE `ocenter_field`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ocenter_field_group`
--
ALTER TABLE `ocenter_field_group`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ocenter_field_setting`
--
ALTER TABLE `ocenter_field_setting`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ocenter_file`
--
ALTER TABLE `ocenter_file`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uk_md5` (`md5`);

--
-- Indexes for table `ocenter_follow`
--
ALTER TABLE `ocenter_follow`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ocenter_hooks`
--
ALTER TABLE `ocenter_hooks`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `ocenter_invite`
--
ALTER TABLE `ocenter_invite`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ocenter_invite_buy_log`
--
ALTER TABLE `ocenter_invite_buy_log`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ocenter_invite_log`
--
ALTER TABLE `ocenter_invite_log`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ocenter_invite_type`
--
ALTER TABLE `ocenter_invite_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ocenter_invite_user_info`
--
ALTER TABLE `ocenter_invite_user_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ocenter_issue`
--
ALTER TABLE `ocenter_issue`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ocenter_issue_content`
--
ALTER TABLE `ocenter_issue_content`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ocenter_local_comment`
--
ALTER TABLE `ocenter_local_comment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ocenter_member`
--
ALTER TABLE `ocenter_member`
  ADD PRIMARY KEY (`uid`),
  ADD KEY `status` (`status`),
  ADD KEY `name` (`nickname`);

--
-- Indexes for table `ocenter_menu`
--
ALTER TABLE `ocenter_menu`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pid` (`pid`);

--
-- Indexes for table `ocenter_message`
--
ALTER TABLE `ocenter_message`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ocenter_message_content`
--
ALTER TABLE `ocenter_message_content`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ocenter_module`
--
ALTER TABLE `ocenter_module`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD KEY `name_2` (`name`);

--
-- Indexes for table `ocenter_picture`
--
ALTER TABLE `ocenter_picture`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ocenter_rank`
--
ALTER TABLE `ocenter_rank`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ocenter_rank_user`
--
ALTER TABLE `ocenter_rank_user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ocenter_report`
--
ALTER TABLE `ocenter_report`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ocenter_role`
--
ALTER TABLE `ocenter_role`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ocenter_role_config`
--
ALTER TABLE `ocenter_role_config`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ocenter_role_group`
--
ALTER TABLE `ocenter_role_group`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ocenter_score_log`
--
ALTER TABLE `ocenter_score_log`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ocenter_seo_rule`
--
ALTER TABLE `ocenter_seo_rule`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ocenter_sso_app`
--
ALTER TABLE `ocenter_sso_app`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ocenter_super_links`
--
ALTER TABLE `ocenter_super_links`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ocenter_support`
--
ALTER TABLE `ocenter_support`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ocenter_sync_login`
--
ALTER TABLE `ocenter_sync_login`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ocenter_talk`
--
ALTER TABLE `ocenter_talk`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ocenter_talk_message`
--
ALTER TABLE `ocenter_talk_message`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ocenter_talk_message_push`
--
ALTER TABLE `ocenter_talk_message_push`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ocenter_talk_push`
--
ALTER TABLE `ocenter_talk_push`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ocenter_ucenter_admin`
--
ALTER TABLE `ocenter_ucenter_admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ocenter_ucenter_member`
--
ALTER TABLE `ocenter_ucenter_member`
  ADD PRIMARY KEY (`id`),
  ADD KEY `status` (`status`);

--
-- Indexes for table `ocenter_ucenter_score_type`
--
ALTER TABLE `ocenter_ucenter_score_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ocenter_ucenter_setting`
--
ALTER TABLE `ocenter_ucenter_setting`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ocenter_ucenter_user_link`
--
ALTER TABLE `ocenter_ucenter_user_link`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ocenter_url`
--
ALTER TABLE `ocenter_url`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_url` (`url`);

--
-- Indexes for table `ocenter_user_config`
--
ALTER TABLE `ocenter_user_config`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ocenter_user_nav`
--
ALTER TABLE `ocenter_user_nav`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ocenter_user_role`
--
ALTER TABLE `ocenter_user_role`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ocenter_user_tag`
--
ALTER TABLE `ocenter_user_tag`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ocenter_user_tag_link`
--
ALTER TABLE `ocenter_user_tag_link`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ocenter_user_token`
--
ALTER TABLE `ocenter_user_token`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ocenter_verify`
--
ALTER TABLE `ocenter_verify`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ocenter_version`
--
ALTER TABLE `ocenter_version`
  ADD PRIMARY KEY (`name`),
  ADD KEY `id` (`number`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `ocenter_action`
--
ALTER TABLE `ocenter_action`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键', AUTO_INCREMENT=10008;
--
-- 使用表AUTO_INCREMENT `ocenter_action_limit`
--
ALTER TABLE `ocenter_action_limit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- 使用表AUTO_INCREMENT `ocenter_action_log`
--
ALTER TABLE `ocenter_action_log`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键', AUTO_INCREMENT=48;
--
-- 使用表AUTO_INCREMENT `ocenter_addons`
--
ALTER TABLE `ocenter_addons`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键', AUTO_INCREMENT=10;
--
-- 使用表AUTO_INCREMENT `ocenter_adv`
--
ALTER TABLE `ocenter_adv`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键', AUTO_INCREMENT=10000;
--
-- 使用表AUTO_INCREMENT `ocenter_adv_pos`
--
ALTER TABLE `ocenter_adv_pos`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键', AUTO_INCREMENT=10001;
--
-- 使用表AUTO_INCREMENT `ocenter_appraise`
--
ALTER TABLE `ocenter_appraise`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- 使用表AUTO_INCREMENT `ocenter_appraise_lesson`
--
ALTER TABLE `ocenter_appraise_lesson`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- 使用表AUTO_INCREMENT `ocenter_appraise_session`
--
ALTER TABLE `ocenter_appraise_session`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- 使用表AUTO_INCREMENT `ocenter_appraise_student_lesson`
--
ALTER TABLE `ocenter_appraise_student_lesson`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- 使用表AUTO_INCREMENT `ocenter_appraise_teacher_lesson`
--
ALTER TABLE `ocenter_appraise_teacher_lesson`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- 使用表AUTO_INCREMENT `ocenter_attachment`
--
ALTER TABLE `ocenter_attachment`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `ocenter_auth_group`
--
ALTER TABLE `ocenter_auth_group`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '用户组id,自增主键', AUTO_INCREMENT=3;
--
-- 使用表AUTO_INCREMENT `ocenter_auth_rule`
--
ALTER TABLE `ocenter_auth_rule`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '规则id,自增主键', AUTO_INCREMENT=10026;
--
-- 使用表AUTO_INCREMENT `ocenter_avatar`
--
ALTER TABLE `ocenter_avatar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `ocenter_channel`
--
ALTER TABLE `ocenter_channel`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '频道ID', AUTO_INCREMENT=11;
--
-- 使用表AUTO_INCREMENT `ocenter_checkin`
--
ALTER TABLE `ocenter_checkin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `ocenter_config`
--
ALTER TABLE `ocenter_config`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '配置ID', AUTO_INCREMENT=10015;
--
-- 使用表AUTO_INCREMENT `ocenter_district`
--
ALTER TABLE `ocenter_district`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=910007;
--
-- 使用表AUTO_INCREMENT `ocenter_event`
--
ALTER TABLE `ocenter_event`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- 使用表AUTO_INCREMENT `ocenter_event_attend`
--
ALTER TABLE `ocenter_event_attend`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- 使用表AUTO_INCREMENT `ocenter_event_type`
--
ALTER TABLE `ocenter_event_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- 使用表AUTO_INCREMENT `ocenter_field`
--
ALTER TABLE `ocenter_field`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `ocenter_field_group`
--
ALTER TABLE `ocenter_field_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- 使用表AUTO_INCREMENT `ocenter_field_setting`
--
ALTER TABLE `ocenter_field_setting`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- 使用表AUTO_INCREMENT `ocenter_file`
--
ALTER TABLE `ocenter_file`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '文件ID';
--
-- 使用表AUTO_INCREMENT `ocenter_follow`
--
ALTER TABLE `ocenter_follow`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id';
--
-- 使用表AUTO_INCREMENT `ocenter_hooks`
--
ALTER TABLE `ocenter_hooks`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键', AUTO_INCREMENT=10000;
--
-- 使用表AUTO_INCREMENT `ocenter_invite`
--
ALTER TABLE `ocenter_invite`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'PRIMARY_KEY';
--
-- 使用表AUTO_INCREMENT `ocenter_invite_buy_log`
--
ALTER TABLE `ocenter_invite_buy_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'PRIMARY_KEY';
--
-- 使用表AUTO_INCREMENT `ocenter_invite_log`
--
ALTER TABLE `ocenter_invite_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'PRIMARY_KEY';
--
-- 使用表AUTO_INCREMENT `ocenter_invite_type`
--
ALTER TABLE `ocenter_invite_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'PRIMARY_KEY';
--
-- 使用表AUTO_INCREMENT `ocenter_invite_user_info`
--
ALTER TABLE `ocenter_invite_user_info`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'PRIMARY_KEY';
--
-- 使用表AUTO_INCREMENT `ocenter_issue`
--
ALTER TABLE `ocenter_issue`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- 使用表AUTO_INCREMENT `ocenter_issue_content`
--
ALTER TABLE `ocenter_issue_content`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;
--
-- 使用表AUTO_INCREMENT `ocenter_local_comment`
--
ALTER TABLE `ocenter_local_comment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `ocenter_member`
--
ALTER TABLE `ocenter_member`
  MODIFY `uid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '用户ID', AUTO_INCREMENT=105;
--
-- 使用表AUTO_INCREMENT `ocenter_menu`
--
ALTER TABLE `ocenter_menu`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '文档ID', AUTO_INCREMENT=10125;
--
-- 使用表AUTO_INCREMENT `ocenter_message`
--
ALTER TABLE `ocenter_message`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- 使用表AUTO_INCREMENT `ocenter_message_content`
--
ALTER TABLE `ocenter_message_content`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- 使用表AUTO_INCREMENT `ocenter_module`
--
ALTER TABLE `ocenter_module`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- 使用表AUTO_INCREMENT `ocenter_picture`
--
ALTER TABLE `ocenter_picture`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键id自增', AUTO_INCREMENT=7;
--
-- 使用表AUTO_INCREMENT `ocenter_rank`
--
ALTER TABLE `ocenter_rank`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `ocenter_rank_user`
--
ALTER TABLE `ocenter_rank_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `ocenter_report`
--
ALTER TABLE `ocenter_report`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `ocenter_role`
--
ALTER TABLE `ocenter_role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- 使用表AUTO_INCREMENT `ocenter_role_config`
--
ALTER TABLE `ocenter_role_config`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `ocenter_role_group`
--
ALTER TABLE `ocenter_role_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `ocenter_score_log`
--
ALTER TABLE `ocenter_score_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- 使用表AUTO_INCREMENT `ocenter_seo_rule`
--
ALTER TABLE `ocenter_seo_rule`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10000;
--
-- 使用表AUTO_INCREMENT `ocenter_sso_app`
--
ALTER TABLE `ocenter_sso_app`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `ocenter_super_links`
--
ALTER TABLE `ocenter_super_links`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键', AUTO_INCREMENT=5;
--
-- 使用表AUTO_INCREMENT `ocenter_support`
--
ALTER TABLE `ocenter_support`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `ocenter_sync_login`
--
ALTER TABLE `ocenter_sync_login`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `ocenter_talk`
--
ALTER TABLE `ocenter_talk`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `ocenter_talk_message`
--
ALTER TABLE `ocenter_talk_message`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `ocenter_talk_message_push`
--
ALTER TABLE `ocenter_talk_message_push`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `ocenter_talk_push`
--
ALTER TABLE `ocenter_talk_push`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `ocenter_ucenter_admin`
--
ALTER TABLE `ocenter_ucenter_admin`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '管理员ID';
--
-- 使用表AUTO_INCREMENT `ocenter_ucenter_member`
--
ALTER TABLE `ocenter_ucenter_member`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '用户ID', AUTO_INCREMENT=105;
--
-- 使用表AUTO_INCREMENT `ocenter_ucenter_score_type`
--
ALTER TABLE `ocenter_ucenter_score_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- 使用表AUTO_INCREMENT `ocenter_ucenter_setting`
--
ALTER TABLE `ocenter_ucenter_setting`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '设置ID';
--
-- 使用表AUTO_INCREMENT `ocenter_ucenter_user_link`
--
ALTER TABLE `ocenter_ucenter_user_link`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `ocenter_url`
--
ALTER TABLE `ocenter_url`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '链接唯一标识';
--
-- 使用表AUTO_INCREMENT `ocenter_user_config`
--
ALTER TABLE `ocenter_user_config`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `ocenter_user_nav`
--
ALTER TABLE `ocenter_user_nav`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '频道ID', AUTO_INCREMENT=1000;
--
-- 使用表AUTO_INCREMENT `ocenter_user_role`
--
ALTER TABLE `ocenter_user_role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- 使用表AUTO_INCREMENT `ocenter_user_tag`
--
ALTER TABLE `ocenter_user_tag`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- 使用表AUTO_INCREMENT `ocenter_user_tag_link`
--
ALTER TABLE `ocenter_user_tag_link`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `ocenter_user_token`
--
ALTER TABLE `ocenter_user_token`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `ocenter_verify`
--
ALTER TABLE `ocenter_verify`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;