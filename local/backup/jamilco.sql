-- phpMyAdmin SQL Dump
-- version 4.0.10.9
-- http://www.phpmyadmin.net
--
-- Хост: 10.0.0.79:3306
-- Время создания: Июн 04 2015 г., 23:50
-- Версия сервера: 5.1.49-rel11.3-log
-- Версия PHP: 5.3.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- База данных: `kimry_jamilco`
--

-- --------------------------------------------------------

--
-- Структура таблицы `b_admin_notify`
--

CREATE TABLE IF NOT EXISTS `b_admin_notify` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `MODULE_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TAG` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MESSAGE` text COLLATE utf8_unicode_ci,
  `ENABLE_CLOSE` char(1) COLLATE utf8_unicode_ci DEFAULT 'Y',
  `PUBLIC_SECTION` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  PRIMARY KEY (`ID`),
  KEY `IX_AD_TAG` (`TAG`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `b_admin_notify_lang`
--

CREATE TABLE IF NOT EXISTS `b_admin_notify_lang` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `NOTIFY_ID` int(18) NOT NULL,
  `LID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `MESSAGE` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IX_ADM_NTFY_LANG` (`NOTIFY_ID`,`LID`),
  KEY `IX_ADM_NTFY_LID` (`LID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `b_agent`
--

CREATE TABLE IF NOT EXISTS `b_agent` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `MODULE_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SORT` int(18) NOT NULL DEFAULT '100',
  `NAME` text COLLATE utf8_unicode_ci,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `LAST_EXEC` datetime DEFAULT NULL,
  `NEXT_EXEC` datetime NOT NULL,
  `DATE_CHECK` datetime DEFAULT NULL,
  `AGENT_INTERVAL` int(18) DEFAULT '86400',
  `IS_PERIOD` char(1) COLLATE utf8_unicode_ci DEFAULT 'Y',
  `USER_ID` int(18) DEFAULT NULL,
  `RUNNING` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  PRIMARY KEY (`ID`),
  KEY `ix_act_next_exec` (`ACTIVE`,`NEXT_EXEC`),
  KEY `ix_agent_user_id` (`USER_ID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=43 ;

--
-- Дамп данных таблицы `b_agent`
--

INSERT INTO `b_agent` (`ID`, `MODULE_ID`, `SORT`, `NAME`, `ACTIVE`, `LAST_EXEC`, `NEXT_EXEC`, `DATE_CHECK`, `AGENT_INTERVAL`, `IS_PERIOD`, `USER_ID`, `RUNNING`) VALUES
(1, 'main', 100, 'CEvent::CleanUpAgent();', 'Y', '2015-06-04 00:03:30', '2015-06-05 00:00:00', NULL, 86400, 'Y', NULL, 'N'),
(2, 'main', 100, 'CUser::CleanUpHitAuthAgent();', 'Y', '2015-06-04 00:03:30', '2015-06-05 00:00:00', NULL, 86400, 'Y', NULL, 'N'),
(3, 'main', 100, 'CCaptchaAgent::DeleteOldCaptcha(3600);', 'Y', '2015-06-04 21:58:55', '2015-06-04 22:58:55', NULL, 3600, 'N', NULL, 'N'),
(4, 'main', 100, 'CUndo::CleanUpOld();', 'Y', '2015-06-04 00:03:30', '2015-06-05 00:00:00', NULL, 86400, 'Y', NULL, 'N'),
(5, 'main', 100, 'CSiteCheckerTest::CommonTest();', 'Y', '2015-06-04 20:58:21', '2015-06-05 20:58:21', NULL, 86400, 'N', NULL, 'N'),
(6, 'forum', 100, 'CForumStat::CleanUp();', 'Y', '2015-06-04 21:59:55', '2015-06-05 21:59:55', NULL, 86400, 'N', NULL, 'N'),
(7, 'forum', 100, 'CForumFiles::CleanUp();', 'Y', '2015-06-04 21:59:55', '2015-06-05 21:59:55', NULL, 86400, 'N', NULL, 'N'),
(8, 'search', 10, 'CSearchSuggest::CleanUpAgent();', 'Y', '2015-06-04 21:59:55', '2015-06-05 21:59:55', NULL, 86400, 'N', NULL, 'N'),
(9, 'search', 10, 'CSearchStatistic::CleanUpAgent();', 'Y', '2015-06-04 21:59:55', '2015-06-05 21:59:55', NULL, 86400, 'N', NULL, 'N'),
(10, 'security', 100, 'CSecuritySession::CleanUpAgent();', 'Y', '2015-06-04 22:29:17', '2015-06-04 22:59:17', NULL, 1800, 'N', NULL, 'N'),
(11, 'security', 100, 'CSecurityIPRule::CleanUpAgent();', 'Y', '2015-06-04 21:58:55', '2015-06-04 22:58:55', NULL, 3600, 'N', NULL, 'N'),
(12, 'seo', 100, 'Bitrix\\Seo\\Engine\\YandexDirect::updateAgent();', 'Y', '2015-06-04 21:58:55', '2015-06-04 22:58:55', NULL, 3600, 'N', NULL, 'N'),
(13, 'seo', 100, 'Bitrix\\Seo\\Adv\\LogTable::clean();', 'Y', '2015-06-04 21:59:55', '2015-06-05 21:59:55', NULL, 86400, 'N', NULL, 'N'),
(14, 'subscribe', 100, 'CSubscription::CleanUp();', 'Y', '2015-06-04 20:58:21', '2015-06-05 03:00:00', NULL, 86400, 'Y', NULL, 'N'),
(39, 'main', 100, 'CEventLog::CleanUpAgent();', 'Y', '2015-06-04 21:00:17', '2015-06-05 21:00:17', NULL, 86400, 'N', NULL, 'N');

-- --------------------------------------------------------

--
-- Структура таблицы `b_app_password`
--

CREATE TABLE IF NOT EXISTS `b_app_password` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(11) NOT NULL,
  `APPLICATION_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `PASSWORD` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `DIGEST_PASSWORD` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `DATE_CREATE` datetime DEFAULT NULL,
  `DATE_LOGIN` datetime DEFAULT NULL,
  `LAST_IP` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `COMMENT` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SYSCOMMENT` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CODE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_app_password_user` (`USER_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `b_bitrixcloud_option`
--

CREATE TABLE IF NOT EXISTS `b_bitrixcloud_option` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `SORT` int(11) NOT NULL,
  `PARAM_KEY` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PARAM_VALUE` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_b_bitrixcloud_option_1` (`NAME`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

--
-- Дамп данных таблицы `b_bitrixcloud_option`
--

INSERT INTO `b_bitrixcloud_option` (`ID`, `NAME`, `SORT`, `PARAM_KEY`, `PARAM_VALUE`) VALUES
(1, 'backup_quota', 0, '0', '0'),
(2, 'backup_total_size', 0, '0', '0'),
(3, 'backup_last_backup_time', 0, '0', '1433357987'),
(4, 'monitoring_expire_time', 0, '0', '1433442597');

-- --------------------------------------------------------

--
-- Структура таблицы `b_blog`
--

CREATE TABLE IF NOT EXISTS `b_blog` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `DESCRIPTION` text COLLATE utf8_unicode_ci,
  `DATE_CREATE` datetime NOT NULL,
  `DATE_UPDATE` datetime NOT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `OWNER_ID` int(11) DEFAULT NULL,
  `SOCNET_GROUP_ID` int(11) DEFAULT NULL,
  `URL` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `REAL_URL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `GROUP_ID` int(11) NOT NULL,
  `ENABLE_COMMENTS` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `ENABLE_IMG_VERIF` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `ENABLE_RSS` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `LAST_POST_ID` int(11) DEFAULT NULL,
  `LAST_POST_DATE` datetime DEFAULT NULL,
  `AUTO_GROUPS` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `EMAIL_NOTIFY` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `ALLOW_HTML` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `SEARCH_INDEX` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `USE_SOCNET` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IX_BLOG_BLOG_4` (`URL`),
  KEY `IX_BLOG_BLOG_1` (`GROUP_ID`,`ACTIVE`),
  KEY `IX_BLOG_BLOG_2` (`OWNER_ID`),
  KEY `IX_BLOG_BLOG_5` (`LAST_POST_DATE`),
  KEY `IX_BLOG_BLOG_6` (`SOCNET_GROUP_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `b_blog_category`
--

CREATE TABLE IF NOT EXISTS `b_blog_category` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `BLOG_ID` int(11) NOT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IX_BLOG_CAT_1` (`BLOG_ID`,`NAME`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `b_blog_comment`
--

CREATE TABLE IF NOT EXISTS `b_blog_comment` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `BLOG_ID` int(11) NOT NULL,
  `POST_ID` int(11) NOT NULL,
  `PARENT_ID` int(11) DEFAULT NULL,
  `AUTHOR_ID` int(11) DEFAULT NULL,
  `ICON_ID` int(11) DEFAULT NULL,
  `AUTHOR_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `AUTHOR_EMAIL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `AUTHOR_IP` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `AUTHOR_IP1` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DATE_CREATE` datetime NOT NULL,
  `TITLE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `POST_TEXT` text COLLATE utf8_unicode_ci NOT NULL,
  `PUBLISH_STATUS` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'P',
  `HAS_PROPS` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SHARE_DEST` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PATH` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_BLOG_COMM_1` (`BLOG_ID`,`POST_ID`),
  KEY `IX_BLOG_COMM_2` (`AUTHOR_ID`),
  KEY `IX_BLOG_COMM_3` (`DATE_CREATE`,`AUTHOR_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `b_blog_group`
--

CREATE TABLE IF NOT EXISTS `b_blog_group` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_BLOG_GROUP_1` (`SITE_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `b_blog_image`
--

CREATE TABLE IF NOT EXISTS `b_blog_image` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `FILE_ID` int(11) NOT NULL DEFAULT '0',
  `BLOG_ID` int(11) NOT NULL DEFAULT '0',
  `POST_ID` int(11) NOT NULL DEFAULT '0',
  `USER_ID` int(11) NOT NULL DEFAULT '0',
  `TIMESTAMP_X` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `TITLE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `IMAGE_SIZE` int(11) NOT NULL DEFAULT '0',
  `IS_COMMENT` varchar(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `COMMENT_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_BLOG_IMAGE_1` (`POST_ID`,`BLOG_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `b_blog_post`
--

CREATE TABLE IF NOT EXISTS `b_blog_post` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TITLE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `BLOG_ID` int(11) NOT NULL,
  `AUTHOR_ID` int(11) NOT NULL,
  `PREVIEW_TEXT` text COLLATE utf8_unicode_ci,
  `PREVIEW_TEXT_TYPE` char(4) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'text',
  `DETAIL_TEXT` text COLLATE utf8_unicode_ci NOT NULL,
  `DETAIL_TEXT_TYPE` char(4) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'text',
  `DATE_CREATE` datetime NOT NULL,
  `DATE_PUBLISH` datetime NOT NULL,
  `KEYWORDS` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PUBLISH_STATUS` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'P',
  `CATEGORY_ID` char(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ATRIBUTE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ENABLE_TRACKBACK` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `ENABLE_COMMENTS` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `ATTACH_IMG` int(11) DEFAULT NULL,
  `NUM_COMMENTS` int(11) NOT NULL DEFAULT '0',
  `NUM_TRACKBACKS` int(11) NOT NULL DEFAULT '0',
  `VIEWS` int(11) DEFAULT NULL,
  `FAVORITE_SORT` int(11) DEFAULT NULL,
  `PATH` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CODE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MICRO` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `HAS_IMAGES` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `HAS_PROPS` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `HAS_TAGS` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `HAS_COMMENT_IMAGES` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `HAS_SOCNET_ALL` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SEO_TITLE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SEO_TAGS` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SEO_DESCRIPTION` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`),
  KEY `IX_BLOG_POST_1` (`BLOG_ID`,`PUBLISH_STATUS`,`DATE_PUBLISH`),
  KEY `IX_BLOG_POST_2` (`BLOG_ID`,`DATE_PUBLISH`,`PUBLISH_STATUS`),
  KEY `IX_BLOG_POST_3` (`BLOG_ID`,`CATEGORY_ID`),
  KEY `IX_BLOG_POST_4` (`PUBLISH_STATUS`,`DATE_PUBLISH`),
  KEY `IX_BLOG_POST_5` (`DATE_PUBLISH`,`AUTHOR_ID`),
  KEY `IX_BLOG_POST_CODE` (`BLOG_ID`,`CODE`),
  KEY `IX_BLOG_POST_6` (`CODE`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `b_blog_post_category`
--

CREATE TABLE IF NOT EXISTS `b_blog_post_category` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `BLOG_ID` int(11) NOT NULL,
  `POST_ID` int(11) NOT NULL,
  `CATEGORY_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IX_BLOG_POST_CATEGORY` (`POST_ID`,`CATEGORY_ID`),
  KEY `IX_BLOG_POST_CATEGORY_CAT_ID` (`CATEGORY_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `b_blog_post_param`
--

CREATE TABLE IF NOT EXISTS `b_blog_post_param` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `POST_ID` int(11) DEFAULT NULL,
  `USER_ID` int(11) DEFAULT NULL,
  `NAME` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `VALUE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_BLOG_PP_1` (`POST_ID`,`USER_ID`),
  KEY `IX_BLOG_PP_2` (`USER_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `b_blog_site_path`
--

CREATE TABLE IF NOT EXISTS `b_blog_site_path` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `PATH` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `TYPE` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IX_BLOG_SITE_PATH_2` (`SITE_ID`,`TYPE`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `b_blog_smile`
--

CREATE TABLE IF NOT EXISTS `b_blog_smile` (
  `ID` smallint(3) NOT NULL AUTO_INCREMENT,
  `SMILE_TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'S',
  `TYPING` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `IMAGE` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `DESCRIPTION` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CLICKABLE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `SORT` int(10) NOT NULL DEFAULT '150',
  `IMAGE_WIDTH` int(11) NOT NULL DEFAULT '0',
  `IMAGE_HEIGHT` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=15 ;

--
-- Дамп данных таблицы `b_blog_smile`
--

INSERT INTO `b_blog_smile` (`ID`, `SMILE_TYPE`, `TYPING`, `IMAGE`, `DESCRIPTION`, `CLICKABLE`, `SORT`, `IMAGE_WIDTH`, `IMAGE_HEIGHT`) VALUES
(1, 'S', ':D :-D', 'icon_biggrin.png', NULL, 'Y', 120, 16, 16),
(2, 'S', ':) :-)', 'icon_smile.png', NULL, 'Y', 100, 16, 16),
(3, 'S', ':( :-(', 'icon_sad.png', NULL, 'Y', 140, 16, 16),
(4, 'S', ':o :-o :shock:', 'icon_eek.png', NULL, 'Y', 180, 16, 16),
(5, 'S', '8) 8-)', 'icon_cool.png', NULL, 'Y', 130, 16, 16),
(6, 'S', ':{} :-{}', 'icon_kiss.png', NULL, 'Y', 200, 16, 16),
(7, 'S', ':oops:', 'icon_redface.png', NULL, 'Y', 190, 16, 16),
(8, 'S', ':cry: :~(', 'icon_cry.png', NULL, 'Y', 160, 16, 16),
(9, 'S', ':evil: >:-<', 'icon_evil.png', NULL, 'Y', 170, 16, 16),
(10, 'S', ';) ;-)', 'icon_wink.png', NULL, 'Y', 110, 16, 16),
(11, 'S', ':!:', 'icon_exclaim.png', NULL, 'Y', 220, 16, 16),
(12, 'S', ':?:', 'icon_question.png', NULL, 'Y', 210, 16, 16),
(13, 'S', ':idea:', 'icon_idea.png', NULL, 'Y', 230, 16, 16),
(14, 'S', ':| :-|', 'icon_neutral.png', NULL, 'Y', 150, 16, 16);

-- --------------------------------------------------------

--
-- Структура таблицы `b_blog_smile_lang`
--

CREATE TABLE IF NOT EXISTS `b_blog_smile_lang` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SMILE_ID` int(11) NOT NULL DEFAULT '0',
  `LID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IX_BLOG_SMILE_K` (`SMILE_ID`,`LID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=29 ;

--
-- Дамп данных таблицы `b_blog_smile_lang`
--

INSERT INTO `b_blog_smile_lang` (`ID`, `SMILE_ID`, `LID`, `NAME`) VALUES
(1, 1, 'ru', 'Широкая улыбка'),
(2, 1, 'en', 'Big grin'),
(3, 2, 'ru', 'С улыбкой'),
(4, 2, 'en', 'Smile'),
(5, 3, 'ru', 'Печально'),
(6, 3, 'en', 'Sad'),
(7, 4, 'ru', 'Удивленно'),
(8, 4, 'en', 'Surprised'),
(9, 5, 'ru', 'Здорово'),
(10, 5, 'en', 'Cool'),
(11, 6, 'ru', 'Поцелуй'),
(12, 6, 'en', 'Kiss'),
(13, 7, 'ru', 'Смущенный'),
(14, 7, 'en', 'Embarrassed'),
(15, 8, 'ru', 'Очень грустно'),
(16, 8, 'en', 'Crying'),
(17, 9, 'ru', 'Со злостью'),
(18, 9, 'en', 'Angry'),
(19, 10, 'ru', 'Шутливо'),
(20, 10, 'en', 'Wink'),
(21, 11, 'ru', 'Восклицание'),
(22, 11, 'en', 'Exclamation'),
(23, 12, 'ru', 'Вопрос'),
(24, 12, 'en', 'Question'),
(25, 13, 'ru', 'Идея'),
(26, 13, 'en', 'Idea'),
(27, 14, 'ru', 'Скептически'),
(28, 14, 'en', 'Skeptic');

-- --------------------------------------------------------

--
-- Структура таблицы `b_blog_socnet`
--

CREATE TABLE IF NOT EXISTS `b_blog_socnet` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `BLOG_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IX_BLOG_SOCNET` (`BLOG_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `b_blog_socnet_rights`
--

CREATE TABLE IF NOT EXISTS `b_blog_socnet_rights` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `POST_ID` int(11) NOT NULL,
  `ENTITY_TYPE` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `ENTITY_ID` int(11) NOT NULL,
  `ENTITY` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_BLOG_SR_1` (`POST_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `b_blog_trackback`
--

CREATE TABLE IF NOT EXISTS `b_blog_trackback` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TITLE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `URL` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `PREVIEW_TEXT` text COLLATE utf8_unicode_ci NOT NULL,
  `BLOG_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `POST_DATE` datetime NOT NULL,
  `BLOG_ID` int(11) NOT NULL,
  `POST_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_BLOG_TRBK_1` (`BLOG_ID`,`POST_ID`),
  KEY `IX_BLOG_TRBK_2` (`POST_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `b_blog_user`
--

CREATE TABLE IF NOT EXISTS `b_blog_user` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(11) NOT NULL,
  `ALIAS` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DESCRIPTION` text COLLATE utf8_unicode_ci,
  `AVATAR` int(11) DEFAULT NULL,
  `INTERESTS` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LAST_VISIT` datetime DEFAULT NULL,
  `DATE_REG` datetime NOT NULL,
  `ALLOW_POST` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IX_BLOG_USER_1` (`USER_ID`),
  KEY `IX_BLOG_USER_2` (`ALIAS`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Дамп данных таблицы `b_blog_user`
--

INSERT INTO `b_blog_user` (`ID`, `USER_ID`, `ALIAS`, `DESCRIPTION`, `AVATAR`, `INTERESTS`, `LAST_VISIT`, `DATE_REG`, `ALLOW_POST`) VALUES
(1, 1, '', '', NULL, '', NULL, '2015-06-04 21:26:55', 'Y');

-- --------------------------------------------------------

--
-- Структура таблицы `b_blog_user2blog`
--

CREATE TABLE IF NOT EXISTS `b_blog_user2blog` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(11) NOT NULL,
  `BLOG_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IX_BLOG_USER2GROUP_1` (`BLOG_ID`,`USER_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `b_blog_user2user_group`
--

CREATE TABLE IF NOT EXISTS `b_blog_user2user_group` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(11) NOT NULL,
  `BLOG_ID` int(11) NOT NULL,
  `USER_GROUP_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IX_BLOG_USER2GROUP_1` (`USER_ID`,`BLOG_ID`,`USER_GROUP_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `b_blog_user_group`
--

CREATE TABLE IF NOT EXISTS `b_blog_user_group` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `BLOG_ID` int(11) DEFAULT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_BLOG_USER_GROUP_1` (`BLOG_ID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Дамп данных таблицы `b_blog_user_group`
--

INSERT INTO `b_blog_user_group` (`ID`, `BLOG_ID`, `NAME`) VALUES
(1, NULL, 'all'),
(2, NULL, 'registered');

-- --------------------------------------------------------

--
-- Структура таблицы `b_blog_user_group_perms`
--

CREATE TABLE IF NOT EXISTS `b_blog_user_group_perms` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `BLOG_ID` int(11) NOT NULL,
  `USER_GROUP_ID` int(11) NOT NULL,
  `PERMS_TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'P',
  `POST_ID` int(11) DEFAULT NULL,
  `PERMS` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'D',
  `AUTOSET` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IX_BLOG_UG_PERMS_1` (`BLOG_ID`,`USER_GROUP_ID`,`PERMS_TYPE`,`POST_ID`),
  KEY `IX_BLOG_UG_PERMS_2` (`USER_GROUP_ID`,`PERMS_TYPE`,`POST_ID`),
  KEY `IX_BLOG_UG_PERMS_3` (`POST_ID`,`USER_GROUP_ID`,`PERMS_TYPE`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `b_cache_tag`
--

CREATE TABLE IF NOT EXISTS `b_cache_tag` (
  `SITE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CACHE_SALT` char(4) COLLATE utf8_unicode_ci DEFAULT NULL,
  `RELATIVE_PATH` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TAG` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `ix_b_cache_tag_0` (`SITE_ID`,`CACHE_SALT`,`RELATIVE_PATH`(50)),
  KEY `ix_b_cache_tag_1` (`TAG`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `b_cache_tag`
--

INSERT INTO `b_cache_tag` (`SITE_ID`, `CACHE_SALT`, `RELATIVE_PATH`, `TAG`) VALUES
('s1', '/e25', '/s1/bitrix/form.result.new', 'forms'),
('s1', '/3da', '/s1/bitrix/menu/345', 'bitrix:menu'),
('s1', '/e37', '/s1/bitrix/menu/06f', 'bitrix:menu'),
('s1', '/98a', '/s1/bitrix/menu/345', 'bitrix:menu'),
('s1', '/095', '/s1/bitrix/news.list/095', 'iblock_id_4'),
('s1', '/98a', '/s1/bitrix/menu/06f', 'bitrix:menu'),
('s1', '/6f8', '/s1/bitrix/menu/345', 'bitrix:menu'),
('s1', '/6f8', '/s1/bitrix/menu/06f', 'bitrix:menu'),
('s1', '/e25', '/s1/bitrix/news.list/06f', 'iblock_id_1'),
('s1', '/4b7', '/s1/bitrix/menu/06f', 'bitrix:menu'),
('s1', '/ed9', '/s1/bitrix/menu/06f', 'bitrix:menu'),
('s1', '/ed9', '/s1/bitrix/news.list/ed9', 'iblock_id_1'),
('s1', '/ed9', '/s1/bitrix/menu/345', 'bitrix:menu'),
('s1', '/e25', '/s1/bitrix/news.list/06f', 'iblock_id_4'),
('s1', '/095', '/s1/bitrix/menu/345', 'bitrix:menu'),
('s1', '/e25', '/s1/bitrix/news.list/06f', 'iblock_id_3'),
('s1', '/fc1', '/s1/bitrix/menu/345', 'bitrix:menu'),
('s1', '/fc1', '/s1/bitrix/news.list/fc1', 'iblock_id_1'),
('s1', '/e25', '/s1/bitrix/menu/345', 'bitrix:menu'),
('s1', '/3da', '/s1/bitrix/news.detail/3da', 'iblock_id_4'),
('s1', '/e25', '/s1/bitrix/menu/06f', 'bitrix:menu'),
(NULL, NULL, '0:1433447259', '**'),
('s1', '/fc1', '/s1/bitrix/menu/06f', 'bitrix:menu'),
('s1', '/095', '/s1/bitrix/menu/06f', 'bitrix:menu'),
('s1', '/3da', '/s1/bitrix/menu/06f', 'bitrix:menu'),
('s1', '/e25', '/s1/bitrix/form.result.new', 'form_1'),
('s1', '/e37', '/s1/bitrix/news.detail/e37', 'iblock_id_1'),
('s1', '/e37', '/s1/bitrix/menu/345', 'bitrix:menu'),
('s1', '/315', '/s1/bitrix/menu/06f', 'bitrix:menu'),
('s1', '/315', '/s1/bitrix/menu/345', 'bitrix:menu'),
('s1', '/132', '/s1/bitrix/menu/06f', 'bitrix:menu'),
('s1', '/132', '/s1/bitrix/menu/345', 'bitrix:menu'),
('s1', '/4b7', '/s1/bitrix/menu/345', 'bitrix:menu');

-- --------------------------------------------------------

--
-- Структура таблицы `b_captcha`
--

CREATE TABLE IF NOT EXISTS `b_captcha` (
  `ID` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `CODE` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `IP` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `DATE_CREATE` datetime NOT NULL,
  UNIQUE KEY `UX_B_CAPTCHA` (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_checklist`
--

CREATE TABLE IF NOT EXISTS `b_checklist` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DATE_CREATE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TESTER` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `COMPANY_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PICTURE` int(11) DEFAULT NULL,
  `TOTAL` int(11) DEFAULT NULL,
  `SUCCESS` int(11) DEFAULT NULL,
  `FAILED` int(11) DEFAULT NULL,
  `PENDING` int(11) DEFAULT NULL,
  `SKIP` int(11) DEFAULT NULL,
  `STATE` longtext COLLATE utf8_unicode_ci,
  `REPORT_COMMENT` text COLLATE utf8_unicode_ci,
  `REPORT` char(1) COLLATE utf8_unicode_ci DEFAULT 'Y',
  `EMAIL` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PHONE` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SENDED_TO_BITRIX` char(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  `HIDDEN` char(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `b_clouds_file_bucket`
--

CREATE TABLE IF NOT EXISTS `b_clouds_file_bucket` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci DEFAULT 'Y',
  `SORT` int(11) DEFAULT '500',
  `READ_ONLY` char(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  `SERVICE_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `BUCKET` varchar(63) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LOCATION` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CNAME` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FILE_COUNT` int(11) DEFAULT '0',
  `FILE_SIZE` float DEFAULT '0',
  `LAST_FILE_ID` int(11) DEFAULT NULL,
  `PREFIX` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SETTINGS` text COLLATE utf8_unicode_ci,
  `FILE_RULES` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `b_clouds_file_resize`
--

CREATE TABLE IF NOT EXISTS `b_clouds_file_resize` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ERROR_CODE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `FILE_ID` int(11) DEFAULT NULL,
  `PARAMS` text COLLATE utf8_unicode_ci,
  `FROM_PATH` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TO_PATH` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_b_file_resize_ts` (`TIMESTAMP_X`),
  KEY `ix_b_file_resize_path` (`TO_PATH`(100)),
  KEY `ix_b_file_resize_file` (`FILE_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `b_clouds_file_upload`
--

CREATE TABLE IF NOT EXISTS `b_clouds_file_upload` (
  `ID` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `FILE_PATH` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `TMP_FILE` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `BUCKET_ID` int(11) NOT NULL,
  `PART_SIZE` int(11) NOT NULL,
  `PART_NO` int(11) NOT NULL,
  `PART_FAIL_COUNTER` int(11) NOT NULL,
  `NEXT_STEP` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_component_params`
--

CREATE TABLE IF NOT EXISTS `b_component_params` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `COMPONENT_NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `TEMPLATE_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `REAL_PATH` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `SEF_MODE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `SEF_FOLDER` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `START_CHAR` int(11) NOT NULL,
  `END_CHAR` int(11) NOT NULL,
  `PARAMETERS` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`),
  KEY `ix_comp_params_name` (`COMPONENT_NAME`),
  KEY `ix_comp_params_path` (`SITE_ID`,`REAL_PATH`),
  KEY `ix_comp_params_sname` (`SITE_ID`,`COMPONENT_NAME`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=25 ;

--
-- Дамп данных таблицы `b_component_params`
--

INSERT INTO `b_component_params` (`ID`, `SITE_ID`, `COMPONENT_NAME`, `TEMPLATE_NAME`, `REAL_PATH`, `SEF_MODE`, `SEF_FOLDER`, `START_CHAR`, `END_CHAR`, `PARAMETERS`) VALUES
(6, 's1', 'bitrix:news.list', 'main_slider', '/index.php', 'N', NULL, 99, 3150, 'a:45:{s:11:"IBLOCK_TYPE";s:7:"content";s:9:"IBLOCK_ID";s:1:"3";s:10:"NEWS_COUNT";s:2:"20";s:8:"SORT_BY1";s:11:"ACTIVE_FROM";s:11:"SORT_ORDER1";s:4:"DESC";s:8:"SORT_BY2";s:4:"SORT";s:11:"SORT_ORDER2";s:3:"ASC";s:11:"FILTER_NAME";s:0:"";s:10:"FIELD_CODE";a:3:{i:0;s:0:"";i:1;s:9:"undefined";i:2;s:0:"";}s:13:"PROPERTY_CODE";a:3:{i:0;s:0:"";i:1;s:9:"undefined";i:2;s:0:"";}s:11:"CHECK_DATES";s:1:"Y";s:10:"DETAIL_URL";s:0:"";s:9:"AJAX_MODE";s:1:"N";s:16:"AJAX_OPTION_JUMP";s:1:"N";s:17:"AJAX_OPTION_STYLE";s:1:"Y";s:19:"AJAX_OPTION_HISTORY";s:1:"N";s:10:"CACHE_TYPE";s:1:"A";s:10:"CACHE_TIME";s:8:"36000000";s:12:"CACHE_FILTER";s:1:"N";s:12:"CACHE_GROUPS";s:1:"Y";s:20:"PREVIEW_TRUNCATE_LEN";s:0:"";s:18:"ACTIVE_DATE_FORMAT";s:5:"d.m.Y";s:9:"SET_TITLE";s:1:"N";s:17:"SET_BROWSER_TITLE";s:1:"N";s:17:"SET_META_KEYWORDS";s:1:"N";s:20:"SET_META_DESCRIPTION";s:1:"N";s:14:"SET_STATUS_404";s:1:"N";s:25:"INCLUDE_IBLOCK_INTO_CHAIN";s:1:"N";s:18:"ADD_SECTIONS_CHAIN";s:1:"N";s:24:"HIDE_LINK_WHEN_NO_DETAIL";s:1:"N";s:14:"PARENT_SECTION";s:0:"";s:19:"PARENT_SECTION_CODE";s:0:"";s:19:"INCLUDE_SUBSECTIONS";s:1:"N";s:12:"DISPLAY_DATE";s:1:"N";s:12:"DISPLAY_NAME";s:1:"Y";s:15:"DISPLAY_PICTURE";s:1:"Y";s:20:"DISPLAY_PREVIEW_TEXT";s:1:"Y";s:14:"PAGER_TEMPLATE";s:8:".default";s:17:"DISPLAY_TOP_PAGER";s:1:"N";s:20:"DISPLAY_BOTTOM_PAGER";s:1:"N";s:11:"PAGER_TITLE";s:14:"Новости";s:17:"PAGER_SHOW_ALWAYS";s:1:"N";s:20:"PAGER_DESC_NUMBERING";s:1:"N";s:31:"PAGER_DESC_NUMBERING_CACHE_TIME";s:5:"36000";s:14:"PAGER_SHOW_ALL";s:1:"N";}'),
(24, 's1', 'bitrix:form.result.new', 'feedback', '/about-company/index.php', 'N', NULL, 102, 1057, 'a:13:{s:11:"WEB_FORM_ID";s:1:"1";s:22:"IGNORE_CUSTOM_TEMPLATE";s:1:"Y";s:19:"USE_EXTENDED_ERRORS";s:1:"Y";s:8:"SEF_MODE";s:1:"N";s:10:"CACHE_TYPE";s:1:"A";s:10:"CACHE_TIME";s:4:"3600";s:8:"LIST_URL";s:0:"";s:8:"EDIT_URL";s:0:"";s:11:"SUCCESS_URL";s:0:"";s:15:"CHAIN_ITEM_TEXT";s:0:"";s:15:"CHAIN_ITEM_LINK";s:0:"";s:10:"SEF_FOLDER";s:15:"/about-company/";s:16:"VARIABLE_ALIASES";a:2:{s:11:"WEB_FORM_ID";s:11:"WEB_FORM_ID";s:9:"RESULT_ID";s:9:"RESULT_ID";}}'),
(16, 's1', 'bitrix:news.list', 'news', '/news/index.php', 'N', NULL, 100, 1615, 'a:47:{s:11:"IBLOCK_TYPE";s:4:"news";s:9:"IBLOCK_ID";s:1:"1";s:10:"NEWS_COUNT";s:2:"20";s:8:"SORT_BY1";s:11:"ACTIVE_FROM";s:11:"SORT_ORDER1";s:4:"DESC";s:8:"SORT_BY2";s:4:"SORT";s:11:"SORT_ORDER2";s:3:"ASC";s:11:"FILTER_NAME";s:0:"";s:10:"FIELD_CODE";a:2:{i:0;s:14:"DETAIL_PICTURE";i:1;s:0:"";}s:13:"PROPERTY_CODE";a:2:{i:0;s:0:"";i:1;s:0:"";}s:11:"CHECK_DATES";s:1:"Y";s:10:"DETAIL_URL";s:0:"";s:9:"AJAX_MODE";s:1:"N";s:16:"AJAX_OPTION_JUMP";s:1:"N";s:17:"AJAX_OPTION_STYLE";s:1:"Y";s:19:"AJAX_OPTION_HISTORY";s:1:"N";s:10:"CACHE_TYPE";s:1:"A";s:10:"CACHE_TIME";s:8:"36000000";s:12:"CACHE_FILTER";s:1:"N";s:12:"CACHE_GROUPS";s:1:"Y";s:20:"PREVIEW_TRUNCATE_LEN";s:0:"";s:18:"ACTIVE_DATE_FORMAT";s:5:"d.m.Y";s:9:"SET_TITLE";s:1:"N";s:17:"SET_BROWSER_TITLE";s:1:"N";s:17:"SET_META_KEYWORDS";s:1:"N";s:20:"SET_META_DESCRIPTION";s:1:"N";s:14:"SET_STATUS_404";s:1:"N";s:25:"INCLUDE_IBLOCK_INTO_CHAIN";s:1:"N";s:18:"ADD_SECTIONS_CHAIN";s:1:"N";s:24:"HIDE_LINK_WHEN_NO_DETAIL";s:1:"N";s:14:"PARENT_SECTION";s:0:"";s:19:"PARENT_SECTION_CODE";s:0:"";s:19:"INCLUDE_SUBSECTIONS";s:1:"N";s:12:"DISPLAY_DATE";s:1:"N";s:12:"DISPLAY_NAME";s:1:"Y";s:15:"DISPLAY_PICTURE";s:1:"Y";s:20:"DISPLAY_PREVIEW_TEXT";s:1:"Y";s:14:"PAGER_TEMPLATE";s:8:".default";s:17:"DISPLAY_TOP_PAGER";s:1:"N";s:20:"DISPLAY_BOTTOM_PAGER";s:1:"N";s:11:"PAGER_TITLE";s:14:"Новости";s:17:"PAGER_SHOW_ALWAYS";s:1:"N";s:20:"PAGER_DESC_NUMBERING";s:1:"N";s:31:"PAGER_DESC_NUMBERING_CACHE_TIME";s:5:"36000";s:14:"PAGER_SHOW_ALL";s:1:"N";s:13:"DISPLAY_TITLE";s:1:"N";s:22:"AJAX_OPTION_ADDITIONAL";s:0:"";}'),
(10, 's1', 'bitrix:news.list', 'brands', '/brands/index.php', 'N', NULL, 99, 1667, 'a:47:{s:11:"IBLOCK_TYPE";s:7:"content";s:9:"IBLOCK_ID";s:1:"4";s:10:"NEWS_COUNT";s:2:"20";s:8:"SORT_BY1";s:11:"ACTIVE_FROM";s:11:"SORT_ORDER1";s:4:"DESC";s:8:"SORT_BY2";s:4:"SORT";s:11:"SORT_ORDER2";s:3:"ASC";s:11:"FILTER_NAME";s:0:"";s:10:"FIELD_CODE";a:2:{i:0;s:0:"";i:1;s:0:"";}s:13:"PROPERTY_CODE";a:5:{i:0;s:0:"";i:1;s:4:"LOGO";i:2;s:10:"LOGO_HOVER";i:3;s:12:"LOGO_PICTURE";i:4;s:0:"";}s:11:"CHECK_DATES";s:1:"Y";s:10:"DETAIL_URL";s:0:"";s:9:"AJAX_MODE";s:1:"N";s:16:"AJAX_OPTION_JUMP";s:1:"N";s:17:"AJAX_OPTION_STYLE";s:1:"Y";s:19:"AJAX_OPTION_HISTORY";s:1:"N";s:10:"CACHE_TYPE";s:1:"A";s:10:"CACHE_TIME";s:8:"36000000";s:12:"CACHE_FILTER";s:1:"N";s:12:"CACHE_GROUPS";s:1:"Y";s:20:"PREVIEW_TRUNCATE_LEN";s:0:"";s:18:"ACTIVE_DATE_FORMAT";s:5:"d.m.Y";s:9:"SET_TITLE";s:1:"N";s:17:"SET_BROWSER_TITLE";s:1:"N";s:17:"SET_META_KEYWORDS";s:1:"N";s:20:"SET_META_DESCRIPTION";s:1:"N";s:14:"SET_STATUS_404";s:1:"N";s:25:"INCLUDE_IBLOCK_INTO_CHAIN";s:1:"N";s:18:"ADD_SECTIONS_CHAIN";s:1:"N";s:24:"HIDE_LINK_WHEN_NO_DETAIL";s:1:"N";s:14:"PARENT_SECTION";s:0:"";s:19:"PARENT_SECTION_CODE";s:0:"";s:19:"INCLUDE_SUBSECTIONS";s:1:"N";s:12:"DISPLAY_DATE";s:1:"N";s:12:"DISPLAY_NAME";s:1:"Y";s:15:"DISPLAY_PICTURE";s:1:"Y";s:20:"DISPLAY_PREVIEW_TEXT";s:1:"Y";s:14:"PAGER_TEMPLATE";s:8:".default";s:17:"DISPLAY_TOP_PAGER";s:1:"N";s:20:"DISPLAY_BOTTOM_PAGER";s:1:"N";s:11:"PAGER_TITLE";s:14:"Новости";s:17:"PAGER_SHOW_ALWAYS";s:1:"N";s:20:"PAGER_DESC_NUMBERING";s:1:"N";s:31:"PAGER_DESC_NUMBERING_CACHE_TIME";s:5:"36000";s:14:"PAGER_SHOW_ALL";s:1:"N";s:13:"DISPLAY_TITLE";s:1:"N";s:22:"AJAX_OPTION_ADDITIONAL";s:0:"";}'),
(11, 's1', 'bitrix:news.detail', '', '/brands/detail.php', 'N', NULL, 97, 1271, 'a:38:{s:11:"IBLOCK_TYPE";s:7:"content";s:9:"IBLOCK_ID";s:1:"4";s:10:"ELEMENT_ID";s:26:"={$_REQUEST["ELEMENT_ID"]}";s:12:"ELEMENT_CODE";s:0:"";s:11:"CHECK_DATES";s:1:"Y";s:10:"FIELD_CODE";a:3:{i:0;s:0:"";i:1;s:0:"";i:2;s:0:"";}s:13:"PROPERTY_CODE";a:3:{i:0;s:0:"";i:1;s:0:"";i:2;s:0:"";}s:10:"IBLOCK_URL";s:0:"";s:9:"AJAX_MODE";s:1:"N";s:16:"AJAX_OPTION_JUMP";s:1:"N";s:17:"AJAX_OPTION_STYLE";s:1:"Y";s:19:"AJAX_OPTION_HISTORY";s:1:"N";s:10:"CACHE_TYPE";s:1:"A";s:10:"CACHE_TIME";s:8:"36000000";s:12:"CACHE_GROUPS";s:1:"Y";s:9:"SET_TITLE";s:1:"Y";s:17:"SET_BROWSER_TITLE";s:1:"Y";s:13:"BROWSER_TITLE";s:1:"-";s:17:"SET_META_KEYWORDS";s:1:"Y";s:13:"META_KEYWORDS";s:1:"-";s:20:"SET_META_DESCRIPTION";s:1:"Y";s:16:"META_DESCRIPTION";s:1:"-";s:14:"SET_STATUS_404";s:1:"N";s:25:"INCLUDE_IBLOCK_INTO_CHAIN";s:1:"Y";s:18:"ADD_SECTIONS_CHAIN";s:1:"Y";s:17:"ADD_ELEMENT_CHAIN";s:1:"N";s:18:"ACTIVE_DATE_FORMAT";s:5:"d.m.Y";s:15:"USE_PERMISSIONS";s:1:"N";s:12:"DISPLAY_DATE";s:1:"Y";s:12:"DISPLAY_NAME";s:1:"Y";s:15:"DISPLAY_PICTURE";s:1:"Y";s:20:"DISPLAY_PREVIEW_TEXT";s:1:"Y";s:9:"USE_SHARE";s:1:"N";s:14:"PAGER_TEMPLATE";s:8:".default";s:17:"DISPLAY_TOP_PAGER";s:1:"N";s:20:"DISPLAY_BOTTOM_PAGER";s:1:"Y";s:11:"PAGER_TITLE";s:16:"Страница";s:14:"PAGER_SHOW_ALL";s:1:"N";}'),
(17, 's1', 'bitrix:news.detail', '', '/news/detail.php', 'N', NULL, 108, 1278, 'a:38:{s:11:"IBLOCK_TYPE";s:4:"news";s:9:"IBLOCK_ID";s:0:"";s:10:"ELEMENT_ID";s:26:"={$_REQUEST["ELEMENT_ID"]}";s:12:"ELEMENT_CODE";s:0:"";s:11:"CHECK_DATES";s:1:"Y";s:10:"FIELD_CODE";a:3:{i:0;s:0:"";i:1;s:0:"";i:2;s:0:"";}s:13:"PROPERTY_CODE";a:3:{i:0;s:0:"";i:1;s:0:"";i:2;s:0:"";}s:10:"IBLOCK_URL";s:0:"";s:9:"AJAX_MODE";s:1:"N";s:16:"AJAX_OPTION_JUMP";s:1:"N";s:17:"AJAX_OPTION_STYLE";s:1:"Y";s:19:"AJAX_OPTION_HISTORY";s:1:"N";s:10:"CACHE_TYPE";s:1:"A";s:10:"CACHE_TIME";s:8:"36000000";s:12:"CACHE_GROUPS";s:1:"Y";s:9:"SET_TITLE";s:1:"Y";s:17:"SET_BROWSER_TITLE";s:1:"Y";s:13:"BROWSER_TITLE";s:1:"-";s:17:"SET_META_KEYWORDS";s:1:"Y";s:13:"META_KEYWORDS";s:1:"-";s:20:"SET_META_DESCRIPTION";s:1:"Y";s:16:"META_DESCRIPTION";s:1:"-";s:14:"SET_STATUS_404";s:1:"N";s:25:"INCLUDE_IBLOCK_INTO_CHAIN";s:1:"Y";s:18:"ADD_SECTIONS_CHAIN";s:1:"Y";s:17:"ADD_ELEMENT_CHAIN";s:1:"N";s:18:"ACTIVE_DATE_FORMAT";s:5:"d.m.Y";s:15:"USE_PERMISSIONS";s:1:"N";s:12:"DISPLAY_DATE";s:1:"Y";s:12:"DISPLAY_NAME";s:1:"Y";s:15:"DISPLAY_PICTURE";s:1:"Y";s:20:"DISPLAY_PREVIEW_TEXT";s:1:"Y";s:9:"USE_SHARE";s:1:"N";s:14:"PAGER_TEMPLATE";s:8:".default";s:17:"DISPLAY_TOP_PAGER";s:1:"N";s:20:"DISPLAY_BOTTOM_PAGER";s:1:"Y";s:11:"PAGER_TITLE";s:16:"Страница";s:14:"PAGER_SHOW_ALL";s:1:"N";}');

-- --------------------------------------------------------

--
-- Структура таблицы `b_counter_data`
--

CREATE TABLE IF NOT EXISTS `b_counter_data` (
  `ID` varchar(16) COLLATE utf8_unicode_ci NOT NULL,
  `TYPE` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `DATA` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_culture`
--

CREATE TABLE IF NOT EXISTS `b_culture` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `CODE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FORMAT_DATE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FORMAT_DATETIME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FORMAT_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WEEK_START` int(1) DEFAULT '1',
  `CHARSET` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DIRECTION` char(1) COLLATE utf8_unicode_ci DEFAULT 'Y',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Дамп данных таблицы `b_culture`
--

INSERT INTO `b_culture` (`ID`, `CODE`, `NAME`, `FORMAT_DATE`, `FORMAT_DATETIME`, `FORMAT_NAME`, `WEEK_START`, `CHARSET`, `DIRECTION`) VALUES
(1, 'ru', 'ru', 'DD.MM.YYYY', 'DD.MM.YYYY HH:MI:SS', '#NAME# #LAST_NAME#', 1, 'UTF-8', 'Y'),
(2, 'en', 'en', 'MM/DD/YYYY', 'MM/DD/YYYY H:MI:SS T', '#NAME# #LAST_NAME#', 0, 'UTF-8', 'Y');

-- --------------------------------------------------------

--
-- Структура таблицы `b_event`
--

CREATE TABLE IF NOT EXISTS `b_event` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `EVENT_NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `MESSAGE_ID` int(18) DEFAULT NULL,
  `LID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `C_FIELDS` longtext COLLATE utf8_unicode_ci,
  `DATE_INSERT` datetime DEFAULT NULL,
  `DATE_EXEC` datetime DEFAULT NULL,
  `SUCCESS_EXEC` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `DUPLICATE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  PRIMARY KEY (`ID`),
  KEY `ix_success` (`SUCCESS_EXEC`),
  KEY `ix_b_event_date_exec` (`DATE_EXEC`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `b_event_log`
--

CREATE TABLE IF NOT EXISTS `b_event_log` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `SEVERITY` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `AUDIT_TYPE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `MODULE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ITEM_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `REMOTE_ADDR` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `USER_AGENT` text COLLATE utf8_unicode_ci,
  `REQUEST_URI` text COLLATE utf8_unicode_ci,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `USER_ID` int(18) DEFAULT NULL,
  `GUEST_ID` int(18) DEFAULT NULL,
  `DESCRIPTION` mediumtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`),
  KEY `ix_b_event_log_time` (`TIMESTAMP_X`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=55 ;

--
-- Дамп данных таблицы `b_event_log`
--

INSERT INTO `b_event_log` (`ID`, `TIMESTAMP_X`, `SEVERITY`, `AUDIT_TYPE_ID`, `MODULE_ID`, `ITEM_ID`, `REMOTE_ADDR`, `USER_AGENT`, `REQUEST_URI`, `SITE_ID`, `USER_ID`, `GUEST_ID`, `DESCRIPTION`) VALUES
(1, '2015-06-03 19:27:53', 'UNKNOWN', 'PAGE_ADD', 'main', 'UNKNOWN', '46.73.151.152', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.81 Safari/537.36', '/bitrix/admin/public_file_new.php?bxsender=core_window_cdialog&lang=ru&site=s1&templateID=jamilco&newFolder=Y&path=%2F&back_url=%2F', NULL, 1, NULL, 'a:1:{s:4:"path";s:23:"about-company/index.php";}'),
(2, '2015-06-03 19:27:53', 'UNKNOWN', 'SECTION_ADD', 'main', 'UNKNOWN', '46.73.151.152', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.81 Safari/537.36', '/bitrix/admin/public_file_new.php?bxsender=core_window_cdialog&lang=ru&site=s1&templateID=jamilco&newFolder=Y&path=%2F&back_url=%2F', NULL, 1, NULL, 'a:1:{s:4:"path";s:13:"about-company";}'),
(3, '2015-06-03 19:27:53', 'UNKNOWN', 'MENU_EDIT', 'main', 'UNKNOWN', '46.73.151.152', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.81 Safari/537.36', '/bitrix/admin/public_file_new.php?bxsender=core_window_cdialog&lang=ru&site=s1&templateID=jamilco&newFolder=Y&path=%2F&back_url=%2F', NULL, 1, NULL, 'a:2:{s:4:"path";b:0;s:9:"menu_name";s:23:"Верхнее меню";}'),
(4, '2015-06-03 19:27:56', 'UNKNOWN', 'PAGE_EDIT', 'main', 'UNKNOWN', '46.73.151.152', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.81 Safari/537.36', '/bitrix/admin/public_file_edit.php', 's1', 1, NULL, 'a:1:{s:4:"path";s:23:"about-company/index.php";}'),
(5, '2015-06-03 19:28:27', 'UNKNOWN', 'PAGE_ADD', 'main', 'UNKNOWN', '46.73.151.152', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.81 Safari/537.36', '/bitrix/admin/public_file_new.php?bxsender=core_window_cdialog&lang=ru&site=s1&templateID=jamilco&newFolder=Y&path=%2F&back_url=%2F', NULL, 1, NULL, 'a:1:{s:4:"path";s:16:"brands/index.php";}'),
(6, '2015-06-03 19:28:27', 'UNKNOWN', 'SECTION_ADD', 'main', 'UNKNOWN', '46.73.151.152', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.81 Safari/537.36', '/bitrix/admin/public_file_new.php?bxsender=core_window_cdialog&lang=ru&site=s1&templateID=jamilco&newFolder=Y&path=%2F&back_url=%2F', NULL, 1, NULL, 'a:1:{s:4:"path";s:6:"brands";}'),
(7, '2015-06-03 19:28:27', 'UNKNOWN', 'MENU_EDIT', 'main', 'UNKNOWN', '46.73.151.152', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.81 Safari/537.36', '/bitrix/admin/public_file_new.php?bxsender=core_window_cdialog&lang=ru&site=s1&templateID=jamilco&newFolder=Y&path=%2F&back_url=%2F', NULL, 1, NULL, 'a:2:{s:4:"path";b:0;s:9:"menu_name";s:23:"Верхнее меню";}'),
(8, '2015-06-03 19:28:29', 'UNKNOWN', 'PAGE_EDIT', 'main', 'UNKNOWN', '46.73.151.152', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.81 Safari/537.36', '/bitrix/admin/public_file_edit.php', 's1', 1, NULL, 'a:1:{s:4:"path";s:16:"brands/index.php";}'),
(9, '2015-06-03 19:28:51', 'UNKNOWN', 'PAGE_ADD', 'main', 'UNKNOWN', '46.73.151.152', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.81 Safari/537.36', '/bitrix/admin/public_file_new.php?bxsender=core_window_cdialog&lang=ru&site=s1&templateID=jamilco&newFolder=Y&path=%2F&back_url=%2F', NULL, 1, NULL, 'a:1:{s:4:"path";s:16:"buyers/index.php";}'),
(10, '2015-06-03 19:28:51', 'UNKNOWN', 'SECTION_ADD', 'main', 'UNKNOWN', '46.73.151.152', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.81 Safari/537.36', '/bitrix/admin/public_file_new.php?bxsender=core_window_cdialog&lang=ru&site=s1&templateID=jamilco&newFolder=Y&path=%2F&back_url=%2F', NULL, 1, NULL, 'a:1:{s:4:"path";s:6:"buyers";}'),
(11, '2015-06-03 19:28:51', 'UNKNOWN', 'MENU_EDIT', 'main', 'UNKNOWN', '46.73.151.152', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.81 Safari/537.36', '/bitrix/admin/public_file_new.php?bxsender=core_window_cdialog&lang=ru&site=s1&templateID=jamilco&newFolder=Y&path=%2F&back_url=%2F', NULL, 1, NULL, 'a:2:{s:4:"path";b:0;s:9:"menu_name";s:23:"Верхнее меню";}'),
(12, '2015-06-03 19:28:53', 'UNKNOWN', 'PAGE_EDIT', 'main', 'UNKNOWN', '46.73.151.152', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.81 Safari/537.36', '/bitrix/admin/public_file_edit.php', 's1', 1, NULL, 'a:1:{s:4:"path";s:16:"buyers/index.php";}'),
(13, '2015-06-03 19:29:10', 'UNKNOWN', 'PAGE_ADD', 'main', 'UNKNOWN', '46.73.151.152', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.81 Safari/537.36', '/bitrix/admin/public_file_new.php?bxsender=core_window_cdialog&lang=ru&site=s1&templateID=jamilco&newFolder=Y&path=%2F&back_url=%2F', NULL, 1, NULL, 'a:1:{s:4:"path";s:14:"news/index.php";}'),
(14, '2015-06-03 19:29:10', 'UNKNOWN', 'SECTION_ADD', 'main', 'UNKNOWN', '46.73.151.152', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.81 Safari/537.36', '/bitrix/admin/public_file_new.php?bxsender=core_window_cdialog&lang=ru&site=s1&templateID=jamilco&newFolder=Y&path=%2F&back_url=%2F', NULL, 1, NULL, 'a:1:{s:4:"path";s:4:"news";}'),
(15, '2015-06-03 19:29:10', 'UNKNOWN', 'MENU_EDIT', 'main', 'UNKNOWN', '46.73.151.152', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.81 Safari/537.36', '/bitrix/admin/public_file_new.php?bxsender=core_window_cdialog&lang=ru&site=s1&templateID=jamilco&newFolder=Y&path=%2F&back_url=%2F', NULL, 1, NULL, 'a:2:{s:4:"path";b:0;s:9:"menu_name";s:23:"Верхнее меню";}'),
(16, '2015-06-03 19:29:12', 'UNKNOWN', 'PAGE_EDIT', 'main', 'UNKNOWN', '46.73.151.152', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.81 Safari/537.36', '/bitrix/admin/public_file_edit.php', 's1', 1, NULL, 'a:1:{s:4:"path";s:14:"news/index.php";}'),
(17, '2015-06-03 19:29:33', 'UNKNOWN', 'PAGE_ADD', 'main', 'UNKNOWN', '46.73.151.152', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.81 Safari/537.36', '/bitrix/admin/public_file_new.php?bxsender=core_window_cdialog&lang=ru&site=s1&templateID=jamilco&newFolder=Y&path=%2F&back_url=%2F', NULL, 1, NULL, 'a:1:{s:4:"path";s:16:"career/index.php";}'),
(18, '2015-06-03 19:29:33', 'UNKNOWN', 'SECTION_ADD', 'main', 'UNKNOWN', '46.73.151.152', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.81 Safari/537.36', '/bitrix/admin/public_file_new.php?bxsender=core_window_cdialog&lang=ru&site=s1&templateID=jamilco&newFolder=Y&path=%2F&back_url=%2F', NULL, 1, NULL, 'a:1:{s:4:"path";s:6:"career";}'),
(19, '2015-06-03 19:29:33', 'UNKNOWN', 'MENU_EDIT', 'main', 'UNKNOWN', '46.73.151.152', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.81 Safari/537.36', '/bitrix/admin/public_file_new.php?bxsender=core_window_cdialog&lang=ru&site=s1&templateID=jamilco&newFolder=Y&path=%2F&back_url=%2F', NULL, 1, NULL, 'a:2:{s:4:"path";b:0;s:9:"menu_name";s:23:"Верхнее меню";}'),
(20, '2015-06-03 19:29:35', 'UNKNOWN', 'PAGE_EDIT', 'main', 'UNKNOWN', '46.73.151.152', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.81 Safari/537.36', '/bitrix/admin/public_file_edit.php', 's1', 1, NULL, 'a:1:{s:4:"path";s:16:"career/index.php";}'),
(21, '2015-06-03 19:29:51', 'UNKNOWN', 'PAGE_ADD', 'main', 'UNKNOWN', '46.73.151.152', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.81 Safari/537.36', '/bitrix/admin/public_file_new.php?bxsender=core_window_cdialog&lang=ru&site=s1&templateID=jamilco&newFolder=Y&path=%2F&back_url=%2F', NULL, 1, NULL, 'a:1:{s:4:"path";s:18:"contacts/index.php";}'),
(22, '2015-06-03 19:29:51', 'UNKNOWN', 'SECTION_ADD', 'main', 'UNKNOWN', '46.73.151.152', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.81 Safari/537.36', '/bitrix/admin/public_file_new.php?bxsender=core_window_cdialog&lang=ru&site=s1&templateID=jamilco&newFolder=Y&path=%2F&back_url=%2F', NULL, 1, NULL, 'a:1:{s:4:"path";s:8:"contacts";}'),
(23, '2015-06-03 19:29:51', 'UNKNOWN', 'MENU_EDIT', 'main', 'UNKNOWN', '46.73.151.152', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.81 Safari/537.36', '/bitrix/admin/public_file_new.php?bxsender=core_window_cdialog&lang=ru&site=s1&templateID=jamilco&newFolder=Y&path=%2F&back_url=%2F', NULL, 1, NULL, 'a:2:{s:4:"path";b:0;s:9:"menu_name";s:23:"Верхнее меню";}'),
(24, '2015-06-03 19:29:53', 'UNKNOWN', 'PAGE_EDIT', 'main', 'UNKNOWN', '46.73.151.152', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.81 Safari/537.36', '/bitrix/admin/public_file_edit.php', 's1', 1, NULL, 'a:1:{s:4:"path";s:18:"contacts/index.php";}'),
(25, '2015-06-03 19:30:57', 'UNKNOWN', 'PAGE_ADD', 'main', 'UNKNOWN', '46.73.151.152', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.81 Safari/537.36', '/bitrix/admin/public_file_new.php?bxsender=core_window_cdialog&lang=ru&site=s1&templateID=jamilco&newFolder=Y&path=%2F&back_url=%2F', NULL, 1, NULL, 'a:1:{s:4:"path";s:21:"franchising/index.php";}'),
(26, '2015-06-03 19:30:57', 'UNKNOWN', 'SECTION_ADD', 'main', 'UNKNOWN', '46.73.151.152', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.81 Safari/537.36', '/bitrix/admin/public_file_new.php?bxsender=core_window_cdialog&lang=ru&site=s1&templateID=jamilco&newFolder=Y&path=%2F&back_url=%2F', NULL, 1, NULL, 'a:1:{s:4:"path";s:11:"franchising";}'),
(27, '2015-06-03 19:30:59', 'UNKNOWN', 'PAGE_EDIT', 'main', 'UNKNOWN', '46.73.151.152', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.81 Safari/537.36', '/bitrix/admin/public_file_edit.php', 's1', 1, NULL, 'a:1:{s:4:"path";s:21:"franchising/index.php";}'),
(28, '2015-06-03 19:31:20', 'UNKNOWN', 'PAGE_ADD', 'main', 'UNKNOWN', '46.73.151.152', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.81 Safari/537.36', '/bitrix/admin/public_file_new.php?bxsender=core_window_cdialog&lang=ru&site=s1&templateID=jamilco&newFolder=Y&path=%2F&back_url=%2F', NULL, 1, NULL, 'a:1:{s:4:"path";s:19:"wholesale/index.php";}'),
(29, '2015-06-03 19:31:20', 'UNKNOWN', 'SECTION_ADD', 'main', 'UNKNOWN', '46.73.151.152', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.81 Safari/537.36', '/bitrix/admin/public_file_new.php?bxsender=core_window_cdialog&lang=ru&site=s1&templateID=jamilco&newFolder=Y&path=%2F&back_url=%2F', NULL, 1, NULL, 'a:1:{s:4:"path";s:9:"wholesale";}'),
(30, '2015-06-03 19:31:22', 'UNKNOWN', 'PAGE_EDIT', 'main', 'UNKNOWN', '46.73.151.152', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.81 Safari/537.36', '/bitrix/admin/public_file_edit.php', 's1', 1, NULL, 'a:1:{s:4:"path";s:19:"wholesale/index.php";}'),
(31, '2015-06-03 19:31:59', 'UNKNOWN', 'PAGE_ADD', 'main', 'UNKNOWN', '46.73.151.152', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.81 Safari/537.36', '/bitrix/admin/public_file_new.php?bxsender=core_window_cdialog&lang=ru&site=s1&templateID=jamilco&newFolder=Y&path=%2Fwholesale%2F&back_url=%2Fwholesale%2F%3Fclear_cache%3DY', NULL, 1, NULL, 'a:1:{s:4:"path";s:24:"wholesaleshops/index.php";}'),
(32, '2015-06-03 19:31:59', 'UNKNOWN', 'SECTION_ADD', 'main', 'UNKNOWN', '46.73.151.152', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.81 Safari/537.36', '/bitrix/admin/public_file_new.php?bxsender=core_window_cdialog&lang=ru&site=s1&templateID=jamilco&newFolder=Y&path=%2Fwholesale%2F&back_url=%2Fwholesale%2F%3Fclear_cache%3DY', NULL, 1, NULL, 'a:1:{s:4:"path";s:15:"wholesale/shops";}'),
(33, '2015-06-03 19:31:59', 'UNKNOWN', 'MENU_EDIT', 'main', 'UNKNOWN', '46.73.151.152', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.81 Safari/537.36', '/bitrix/admin/public_file_new.php?bxsender=core_window_cdialog&lang=ru&site=s1&templateID=jamilco&newFolder=Y&path=%2Fwholesale%2F&back_url=%2Fwholesale%2F%3Fclear_cache%3DY', NULL, 1, NULL, 'a:2:{s:4:"path";s:9:"wholesale";s:9:"menu_name";s:21:"Нижнее меню";}'),
(34, '2015-06-03 19:32:01', 'UNKNOWN', 'PAGE_EDIT', 'main', 'UNKNOWN', '46.73.151.152', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.81 Safari/537.36', '/bitrix/admin/public_file_edit.php', 's1', 1, NULL, 'a:1:{s:4:"path";s:25:"wholesale/shops/index.php";}'),
(35, '2015-06-03 19:43:22', 'UNKNOWN', 'PAGE_EDIT', 'main', 'UNKNOWN', '46.73.151.152', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.81 Safari/537.36', '/bitrix/admin/public_file_edit.php', 's1', 1, NULL, 'a:1:{s:4:"path";s:9:"index.php";}'),
(36, '2015-06-03 19:57:59', 'UNKNOWN', 'PAGE_EDIT', 'main', 'UNKNOWN', '46.73.151.152', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.81 Safari/537.36', '/bitrix/admin/public_file_edit.php', 's1', 1, NULL, 'a:1:{s:4:"path";s:41:"local/templates/jamilco/include/phone.php";}'),
(37, '2015-06-03 20:14:35', 'UNKNOWN', 'PAGE_EDIT', 'main', 'UNKNOWN', '46.73.151.152', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.81 Safari/537.36', '/bitrix/admin/public_file_edit.php', 's1', 1, NULL, 'a:1:{s:4:"path";s:9:"index.php";}'),
(38, '2015-06-03 20:16:04', 'UNKNOWN', 'PAGE_EDIT', 'main', 'UNKNOWN', '46.73.151.152', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.81 Safari/537.36', '/bitrix/admin/public_file_edit.php', 's1', 1, NULL, 'a:1:{s:4:"path";s:9:"index.php";}'),
(39, '2015-06-03 20:17:38', 'UNKNOWN', 'PAGE_EDIT', 'main', 'UNKNOWN', '46.73.151.152', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.81 Safari/537.36', '/bitrix/admin/public_file_edit.php', 's1', 1, NULL, 'a:1:{s:4:"path";s:9:"index.php";}'),
(40, '2015-06-03 20:48:45', 'UNKNOWN', 'IBLOCK_ADD', 'iblock', '4', '46.73.151.152', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.81 Safari/537.36', '/bitrix/admin/iblock_edit.php?type=content&lang=ru&admin=Y', NULL, 1, NULL, 'a:1:{s:4:"NAME";s:12:"Бренды";}'),
(41, '2015-06-03 20:52:47', 'UNKNOWN', 'PAGE_EDIT', 'main', 'UNKNOWN', '46.73.151.152', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.81 Safari/537.36', '/bitrix/admin/public_file_edit.php', 's1', 1, NULL, 'a:1:{s:4:"path";s:23:"about-company/index.php";}'),
(42, '2015-06-03 21:08:06', 'UNKNOWN', 'IBLOCK_EDIT', 'iblock', '4', '46.73.151.152', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.81 Safari/537.36', '/bitrix/admin/iblock_edit.php?type=content&lang=ru&admin=Y', NULL, 1, NULL, 'a:1:{s:4:"NAME";s:12:"Бренды";}'),
(43, '2015-06-03 21:18:04', 'UNKNOWN', 'IBLOCK_EDIT', 'iblock', '4', '46.73.151.152', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.81 Safari/537.36', '/bitrix/admin/iblock_edit.php?type=content&lang=ru&admin=Y', NULL, 1, NULL, 'a:1:{s:4:"NAME";s:12:"Бренды";}'),
(44, '2015-06-03 21:18:33', 'UNKNOWN', 'PAGE_ADD', 'main', 'UNKNOWN', '46.73.151.152', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.81 Safari/537.36', '/bitrix/admin/public_file_new.php?bxsender=core_window_cdialog&lang=ru&site=s1&templateID=jamilco&path=%2Fbrands%2F&back_url=%2Fbrands%2F', NULL, 1, NULL, 'a:1:{s:4:"path";s:17:"brands/detail.php";}'),
(45, '2015-06-03 21:19:08', 'UNKNOWN', 'PAGE_EDIT', 'main', 'UNKNOWN', '46.73.151.152', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.81 Safari/537.36', '/bitrix/admin/public_file_edit.php', 's1', 1, NULL, 'a:1:{s:4:"path";s:17:"brands/detail.php";}'),
(46, '2015-06-03 21:24:47', 'UNKNOWN', 'IBLOCK_EDIT', 'iblock', '4', '46.73.151.152', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.81 Safari/537.36', '/bitrix/admin/iblock_edit.php?type=content&lang=ru&admin=Y', NULL, 1, NULL, 'a:1:{s:4:"NAME";s:12:"Бренды";}'),
(47, '2015-06-03 21:30:29', 'UNKNOWN', 'IBLOCK_EDIT', 'iblock', '4', '46.73.151.152', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.81 Safari/537.36', '/bitrix/admin/iblock_edit.php?type=content&lang=ru&admin=Y', NULL, 1, NULL, 'a:1:{s:4:"NAME";s:12:"Бренды";}'),
(48, '2015-06-03 21:36:32', 'UNKNOWN', 'IBLOCK_EDIT', 'iblock', '1', '46.73.151.152', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.81 Safari/537.36', '/bitrix/admin/iblock_edit.php?type=news&lang=ru&admin=Y', NULL, 1, NULL, 'a:1:{s:4:"NAME";s:14:"Новости";}'),
(49, '2015-06-03 21:48:43', 'UNKNOWN', 'PAGE_ADD', 'main', 'UNKNOWN', '46.73.151.152', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.81 Safari/537.36', '/bitrix/admin/public_file_new.php?bxsender=core_window_cdialog&lang=ru&site=s1&templateID=jamilco&path=%2Fnews%2F&back_url=%2Fnews%2F%3Fbitrix_include_areas%3DN%26clear_cache%3DY', NULL, 1, NULL, 'a:1:{s:4:"path";s:15:"news/detail.php";}'),
(50, '2015-06-03 21:48:46', 'UNKNOWN', 'PAGE_EDIT', 'main', 'UNKNOWN', '46.73.151.152', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.81 Safari/537.36', '/bitrix/admin/public_file_edit.php', 's1', 1, NULL, 'a:1:{s:4:"path";s:15:"news/detail.php";}'),
(51, '2015-06-03 21:49:24', 'UNKNOWN', 'PAGE_EDIT', 'main', 'UNKNOWN', '46.73.151.152', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.81 Safari/537.36', '/bitrix/admin/public_file_edit.php', 's1', 1, NULL, 'a:1:{s:4:"path";s:15:"news/detail.php";}'),
(52, '2015-06-03 22:01:48', 'UNKNOWN', 'PAGE_EDIT', 'main', 'UNKNOWN', '46.73.151.152', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.81 Safari/537.36', '/bitrix/admin/public_file_edit.php', 's1', 1, NULL, 'a:1:{s:4:"path";s:23:"about-company/index.php";}'),
(53, '2015-06-04 17:59:18', 'UNKNOWN', 'PAGE_EDIT', 'main', 'UNKNOWN', '46.73.151.152', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.81 Safari/537.36', '/bitrix/admin/public_file_edit.php', 's1', 1, NULL, 'a:1:{s:4:"path";s:23:"about-company/index.php";}'),
(54, '2015-06-04 18:59:55', 'UNKNOWN', 'PAGE_EDIT', 'main', 'UNKNOWN', '46.73.151.152', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.81 Safari/537.36', '/bitrix/admin/public_file_edit.php', 's1', 1, NULL, 'a:1:{s:4:"path";s:23:"about-company/index.php";}');

-- --------------------------------------------------------

--
-- Структура таблицы `b_event_message`
--

CREATE TABLE IF NOT EXISTS `b_event_message` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `EVENT_NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `LID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `EMAIL_FROM` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '#EMAIL_FROM#',
  `EMAIL_TO` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '#EMAIL_TO#',
  `SUBJECT` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MESSAGE` text COLLATE utf8_unicode_ci,
  `BODY_TYPE` varchar(4) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'text',
  `BCC` text COLLATE utf8_unicode_ci,
  `REPLY_TO` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CC` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `IN_REPLY_TO` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PRIORITY` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FIELD1_NAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FIELD1_VALUE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FIELD2_NAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FIELD2_VALUE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_b_event_message_name` (`EVENT_NAME`(50))
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=26 ;

--
-- Дамп данных таблицы `b_event_message`
--

INSERT INTO `b_event_message` (`ID`, `TIMESTAMP_X`, `EVENT_NAME`, `LID`, `ACTIVE`, `EMAIL_FROM`, `EMAIL_TO`, `SUBJECT`, `MESSAGE`, `BODY_TYPE`, `BCC`, `REPLY_TO`, `CC`, `IN_REPLY_TO`, `PRIORITY`, `FIELD1_NAME`, `FIELD1_VALUE`, `FIELD2_NAME`, `FIELD2_VALUE`) VALUES
(1, '2015-06-03 18:58:34', 'NEW_USER', 's1', 'Y', '#DEFAULT_EMAIL_FROM#', '#DEFAULT_EMAIL_FROM#', '#SITE_NAME#: Зарегистрировался новый пользователь', 'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n\nНа сайте #SERVER_NAME# успешно зарегистрирован новый пользователь.\n\nДанные пользователя:\nID пользователя: #USER_ID#\n\nИмя: #NAME#\nФамилия: #LAST_NAME#\nE-Mail: #EMAIL#\n\nLogin: #LOGIN#\n\nПисьмо сгенерировано автоматически.', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, '2015-06-03 18:58:34', 'USER_INFO', 's1', 'Y', '#DEFAULT_EMAIL_FROM#', '#EMAIL#', '#SITE_NAME#: Регистрационная информация', 'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n#NAME# #LAST_NAME#,\n\n#MESSAGE#\n\nВаша регистрационная информация:\n\nID пользователя: #USER_ID#\nСтатус профиля: #STATUS#\nLogin: #LOGIN#\n\nВы можете изменить пароль, перейдя по следующей ссылке:\nhttp://#SERVER_NAME#/auth/index.php?change_password=yes&lang=ru&USER_CHECKWORD=#CHECKWORD#&USER_LOGIN=#URL_LOGIN#\n\nСообщение сгенерировано автоматически.', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3, '2015-06-03 18:58:34', 'USER_PASS_REQUEST', 's1', 'Y', '#DEFAULT_EMAIL_FROM#', '#EMAIL#', '#SITE_NAME#: Запрос на смену пароля', 'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n#NAME# #LAST_NAME#,\n\n#MESSAGE#\n\nДля смены пароля перейдите по следующей ссылке:\nhttp://#SERVER_NAME#/auth/index.php?change_password=yes&lang=ru&USER_CHECKWORD=#CHECKWORD#&USER_LOGIN=#URL_LOGIN#\n\nВаша регистрационная информация:\n\nID пользователя: #USER_ID#\nСтатус профиля: #STATUS#\nLogin: #LOGIN#\n\nСообщение сгенерировано автоматически.', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4, '2015-06-03 18:58:34', 'USER_PASS_CHANGED', 's1', 'Y', '#DEFAULT_EMAIL_FROM#', '#EMAIL#', '#SITE_NAME#: Подтверждение смены пароля', 'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n#NAME# #LAST_NAME#,\n\n#MESSAGE#\n\nВаша регистрационная информация:\n\nID пользователя: #USER_ID#\nСтатус профиля: #STATUS#\nLogin: #LOGIN#\n\nСообщение сгенерировано автоматически.', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(5, '2015-06-03 18:58:34', 'NEW_USER_CONFIRM', 's1', 'Y', '#DEFAULT_EMAIL_FROM#', '#EMAIL#', '#SITE_NAME#: Подтверждение регистрации нового пользователя', 'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n\nЗдравствуйте,\n\nВы получили это сообщение, так как ваш адрес был использован при регистрации нового пользователя на сервере #SERVER_NAME#.\n\nВаш код для подтверждения регистрации: #CONFIRM_CODE#\n\nДля подтверждения регистрации перейдите по следующей ссылке:\nhttp://#SERVER_NAME#/auth/index.php?confirm_registration=yes&confirm_user_id=#USER_ID#&confirm_code=#CONFIRM_CODE#\n\nВы также можете ввести код для подтверждения регистрации на странице:\nhttp://#SERVER_NAME#/auth/index.php?confirm_registration=yes&confirm_user_id=#USER_ID#\n\nВнимание! Ваш профиль не будет активным, пока вы не подтвердите свою регистрацию.\n\n---------------------------------------------------------------------\n\nСообщение сгенерировано автоматически.', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(6, '2015-06-03 18:58:34', 'USER_INVITE', 's1', 'Y', '#DEFAULT_EMAIL_FROM#', '#EMAIL#', '#SITE_NAME#: Приглашение на сайт', 'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\nЗдравствуйте, #NAME# #LAST_NAME#!\n\nАдминистратором сайта вы добавлены в число зарегистрированных пользователей.\n\nПриглашаем Вас на наш сайт.\n\nВаша регистрационная информация:\n\nID пользователя: #ID#\nLogin: #LOGIN#\n\nРекомендуем вам сменить установленный автоматически пароль.\n\nДля смены пароля перейдите по следующей ссылке:\nhttp://#SERVER_NAME#/auth.php?change_password=yes&USER_LOGIN=#URL_LOGIN#&USER_CHECKWORD=#CHECKWORD#\n', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(7, '2015-06-03 18:58:34', 'FEEDBACK_FORM', 's1', 'Y', '#DEFAULT_EMAIL_FROM#', '#EMAIL_TO#', '#SITE_NAME#: Сообщение из формы обратной связи', 'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n\nВам было отправлено сообщение через форму обратной связи\n\nАвтор: #AUTHOR#\nE-mail автора: #AUTHOR_EMAIL#\n\nТекст сообщения:\n#TEXT#\n\nСообщение сгенерировано автоматически.', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(8, '2015-06-03 18:58:38', 'NEW_BLOG_MESSAGE', 's1', 'Y', '#EMAIL_FROM#', '#EMAIL_TO#', '#SITE_NAME#: [B] #BLOG_NAME# : #MESSAGE_TITLE#', 'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n\nНовое сообщение в блоге "#BLOG_NAME#"\n\nТема:\n#MESSAGE_TITLE#\n\nАвтор: #AUTHOR#\nДата: #MESSAGE_DATE#\n\nТекст сообщения:\n#MESSAGE_TEXT#\n\nАдрес сообщения:\n#MESSAGE_PATH#\n\nСообщение сгенерировано автоматически.', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(9, '2015-06-03 18:58:38', 'NEW_BLOG_COMMENT', 's1', 'Y', '#EMAIL_FROM#', '#EMAIL_TO#', '#SITE_NAME#: [B] #MESSAGE_TITLE# : #COMMENT_TITLE#', 'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n\nНовый комментарий в блоге "#BLOG_NAME#" на сообщение "#MESSAGE_TITLE#"\n\nТема:\n#COMMENT_TITLE#\nАвтор: #AUTHOR#\nДата: #COMMENT_DATE#\n\nТекст сообщения:\n#COMMENT_TEXT#\n\nАдрес сообщения:\n#COMMENT_PATH#\n\nСообщение сгенерировано автоматически.', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(10, '2015-06-03 18:58:38', 'NEW_BLOG_COMMENT2COMMENT', 's1', 'Y', '#EMAIL_FROM#', '#EMAIL_TO#', '#SITE_NAME#: [B] #MESSAGE_TITLE# : #COMMENT_TITLE#', 'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n\nНовый комментарий на ваш комментарий в блоге "#BLOG_NAME#" на сообщение "#MESSAGE_TITLE#".\n\nТема:\n#COMMENT_TITLE#\nАвтор: #AUTHOR#\nДата: #COMMENT_DATE#\n\nТекст сообщения:\n#COMMENT_TEXT#\n\nАдрес сообщения:\n#COMMENT_PATH#\n\nСообщение сгенерировано автоматически.', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(11, '2015-06-03 18:58:38', 'NEW_BLOG_COMMENT_WITHOUT_TITLE', 's1', 'Y', '#EMAIL_FROM#', '#EMAIL_TO#', '#SITE_NAME#: [B] #MESSAGE_TITLE#', 'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n\nНовый комментарий в блоге "#BLOG_NAME#" на сообщение "#MESSAGE_TITLE#"\n\nАвтор: #AUTHOR#\nДата: #COMMENT_DATE#\n\nТекст сообщения:\n#COMMENT_TEXT#\n\nАдрес сообщения:\n#COMMENT_PATH#\n\nСообщение сгенерировано автоматически.', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(12, '2015-06-03 18:58:38', 'NEW_BLOG_COMMENT2COMMENT_WITHOUT_TITLE', 's1', 'Y', '#EMAIL_FROM#', '#EMAIL_TO#', '#SITE_NAME#: [B] #MESSAGE_TITLE#', 'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n\nНовый комментарий на ваш комментарий в блоге "#BLOG_NAME#" на сообщение "#MESSAGE_TITLE#".\n\nАвтор: #AUTHOR#\nДата: #COMMENT_DATE#\n\nТекст сообщения:\n#COMMENT_TEXT#\n\nАдрес сообщения:\n#COMMENT_PATH#\n\nСообщение сгенерировано автоматически.\n', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(13, '2015-06-03 18:58:38', 'BLOG_YOUR_BLOG_TO_USER', 's1', 'Y', '#EMAIL_FROM#', '#EMAIL_TO#', '#SITE_NAME#: [B] Ваш блог "#BLOG_NAME#" был добавлен в друзья к #USER#', 'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n\nВаш блог "#BLOG_NAME#" был добавлен в друзья к #USER#.\n\nПрофиль пользователя: #USER_URL#\n\nАдрес вашего блога: #BLOG_ADR#\n\nСообщение сгенерировано автоматически.\n', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(14, '2015-06-03 18:58:38', 'BLOG_YOU_TO_BLOG', 's1', 'Y', '#EMAIL_FROM#', '#EMAIL_TO#', '#SITE_NAME#: [B] Вы были добавлены в друзья блога "#BLOG_NAME#"', 'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n\nВы были добавлены в друзья блога "#BLOG_NAME#".\n\nАдрес блога: #BLOG_ADR#\n\nВаш профиль: #USER_URL#\n\nСообщение сгенерировано автоматически.\n', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(15, '2015-06-03 18:58:38', 'BLOG_BLOG_TO_YOU', 's1', 'Y', '#EMAIL_FROM#', '#EMAIL_TO#', '#SITE_NAME#: [B] К вам в друзья был добавлен блог "#BLOG_NAME#"', 'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n\nК вам в друзья был добавлен блог "#BLOG_NAME#".\n\nАдрес блога: #BLOG_ADR#\n\nВаш профиль: #USER_URL#\n\nСообщение сгенерировано автоматически.\n', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(16, '2015-06-03 18:58:38', 'BLOG_USER_TO_YOUR_BLOG', 's1', 'Y', '#EMAIL_FROM#', '#EMAIL_TO#', '#SITE_NAME#: [B] В ваш блог "#BLOG_NAME#" был добавлен друг #USER#', 'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n\nВ ваш блог "#BLOG_NAME#" был добавлен друг #USER#.\n\nПрофиль пользователя: #USER_URL#\n\nАдрес вашего блога: #BLOG_ADR#\n\nСообщение сгенерировано автоматически.\n', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(17, '2015-06-03 18:58:43', 'NEW_FORUM_MESSAGE', 's1', 'Y', '#FROM_EMAIL#', '#RECIPIENT#', '#SITE_NAME#: [F] #TOPIC_TITLE# : #FORUM_NAME#', 'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n\nНовое сообщение на форуме #SERVER_NAME#.\n\nТема:\n#TOPIC_TITLE#\n\nАвтор: #AUTHOR#\nДата : #MESSAGE_DATE#\nТекст сообщения:\n\n#MESSAGE_TEXT#\n\nАдрес сообщения:\nhttp://#SERVER_NAME##PATH2FORUM#\n\nСообщение сгенерировано автоматически.\n', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(18, '2015-06-03 18:58:43', 'NEW_FORUM_PRIV', 's1', 'Y', '#FROM_EMAIL#', '#TO_EMAIL#', '#SITE_NAME#: [private] #SUBJECT#', 'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n\nВы получили персональное сообщение с форума на сайте #SERVER_NAME#.\n\nТема: #SUBJECT#\n\nАвтор: #FROM_NAME# #FROM_EMAIL#\nДата : #MESSAGE_DATE#\nСообщение:\n\n#MESSAGE#\n\nСообщение сгенерировано автоматически.\n', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(19, '2015-06-03 18:58:43', 'NEW_FORUM_PRIVATE_MESSAGE', 's1', 'Y', '#FROM_EMAIL#', '#TO_EMAIL#', '#SITE_NAME#: [private] #SUBJECT#', 'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n\nВы получили персональное сообщение с форума на сайте #SERVER_NAME#.\n\nТема: #SUBJECT#\n\nАвтор: #FROM_NAME#\nДата: #MESSAGE_DATE#\nСообщение:\n\n#MESSAGE#\n\nСсылка на сообщение: #MESSAGE_LINK#Сообщение сгенерировано автоматически.\n', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(20, '2015-06-03 18:58:43', 'EDIT_FORUM_MESSAGE', 's1', 'Y', '#FROM_EMAIL#', '#RECIPIENT#', '#SITE_NAME#: [F] #TOPIC_TITLE# : #FORUM_NAME#', 'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n\nИзменение сообщения на форуме #SERVER_NAME#.\n\nТема:\n#TOPIC_TITLE#\n\nАвтор: #AUTHOR#\nДата : #MESSAGE_DATE#\nТекст сообщения:\n\n#MESSAGE_TEXT#\n\nАдрес сообщения:\nhttp://#SERVER_NAME##PATH2FORUM#\n\nСообщение сгенерировано автоматически.\n', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(21, '2015-06-03 18:58:43', 'FORUM_NEW_MESSAGE_MAIL', 's1', 'Y', '#FROM_EMAIL#', '#RECIPIENT#', '#TOPIC_TITLE#', '#MESSAGE_TEXT#\n\n------------------------------------------  \nВы получили это сообщение, так как выподписаны на форум #FORUM_NAME#.\n\nОтветить на сообщение можно по электронной почте или через форму на сайте:\nhttp://#SERVER_NAME##PATH2FORUM#\n\nНаписать новое сообщение: #FORUM_EMAIL#\n\nАвтор сообщения: #AUTHOR#\n\nСообщение сгенерировано автоматически на сайте #SITE_NAME#.\n', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(22, '2015-06-03 18:58:50', 'VIRUS_DETECTED', 's1', 'Y', '#DEFAULT_EMAIL_FROM#', '#EMAIL#', '#SITE_NAME#: Обнаружен вирус', 'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n\nЗдравствуйте!\n\nВы получили это сообщение, так как модуль проактивной защиты сервера #SERVER_NAME# обнаружил код, похожий на вирус.\n\n1. Подозрительный код был вырезан из html.\n2. Проверьте журнал вторжений и убедитесь, что код действительно вредоносный, а не является кодом какого-либо счетчика или фреймворка.\n (ссылка: http://#SERVER_NAME#/bitrix/admin/event_log.php?lang=ru&set_filter=Y&find_type=audit_type_id&find_audit_type[]=SECURITY_VIRUS )\n3. В случае, если код не является опасным, добавьте его в исключения на странице настройки антивируса.\n (ссылка: http://#SERVER_NAME#/bitrix/admin/security_antivirus.php?lang=ru&tabControl_active_tab=exceptions )\n4. Если код является вирусным, то необходимо выполнить следующие действия:\n\n а) Смените пароли доступа к сайту у администраторов и ответственных сотрудников.\n б) Смените пароли доступа по ssh и ftp.\n в) Проверьте и вылечите компьютеры администраторов, имевших доступ к сайту по ssh или ftp.\n г) В программах доступа к сайту по ssh и ftp отключите сохранение паролей.\n д) Удалите вредоносный код из зараженных файлов. Например, восстановите поврежденные файлы из самой свежей резервной копии.\n\n---------------------------------------------------------------------\nСообщение сгенерировано автоматически.\n', 'text', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(23, '2015-06-03 18:58:53', 'SUBSCRIBE_CONFIRM', 's1', 'Y', '#DEFAULT_EMAIL_FROM#', '#EMAIL#', '#SITE_NAME#: Подтверждение подписки', 'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n\nЗдравствуйте,\n\nВы получили это сообщение, так как ваш адрес был подписан\nна список рассылки сервера #SERVER_NAME#.\n\nДополнительная информация о подписке:\n\nАдрес подписки (email) ............ #EMAIL#\nДата добавления/редактирования .... #DATE_SUBSCR#\n\nВаш код для подтверждения подписки: #CONFIRM_CODE#\n\nДля подтверждения подписки перейдите по следующей ссылке:\nhttp://#SERVER_NAME##SUBSCR_SECTION#subscr_edit.php?ID=#ID#&CONFIRM_CODE=#CONFIRM_CODE#\n\nВы также можете ввести код для подтверждения подписки на странице:\nhttp://#SERVER_NAME##SUBSCR_SECTION#subscr_edit.php?ID=#ID#\n\nВнимание! Вы не будете получать сообщения рассылки, пока не подтвердите\nсвою подписку.\n\n---------------------------------------------------------------------\nСохраните это письмо, так как оно содержит информацию для авторизации.\nИспользуя код подтверждения подписки, вы cможете изменить параметры\nподписки или отписаться от рассылки.\n\nИзменить параметры:\nhttp://#SERVER_NAME##SUBSCR_SECTION#subscr_edit.php?ID=#ID#&CONFIRM_CODE=#CONFIRM_CODE#\n\nОтписаться:\nhttp://#SERVER_NAME##SUBSCR_SECTION#subscr_edit.php?ID=#ID#&CONFIRM_CODE=#CONFIRM_CODE#&action=unsubscribe\n---------------------------------------------------------------------\n\nСообщение сгенерировано автоматически.\n', 'text', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(24, '2015-06-03 18:58:54', 'VOTE_FOR', 's1', 'Y', '#DEFAULT_EMAIL_FROM#', '#EMAIL_TO#', '#SITE_NAME#: [V] #VOTE_TITLE#', '#USER_NAME# принял участие в опросе "#VOTE_TITLE#":\n#VOTE_STATISTIC#\n\nhttp://#SERVER_NAME##URL#\nСообщение сгенерировано автоматически.', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(25, '2015-06-04 19:47:32', 'FORM_FILLING_SIMPLE_FORM_1', 's1', 'Y', '#DEFAULT_EMAIL_FROM#', '#DEFAULT_EMAIL_FROM#', '#SERVER_NAME#: заполнена web-форма [#RS_FORM_ID#] #RS_FORM_NAME#', '#SERVER_NAME#\n\nЗаполнена web-форма: [#RS_FORM_ID#] #RS_FORM_NAME#\n-------------------------------------------------------\n\nДата - #RS_DATE_CREATE#\nРезультат - #RS_RESULT_ID#\nПользователь - [#RS_USER_ID#] #RS_USER_NAME# #RS_USER_AUTH#\nПосетитель - #RS_STAT_GUEST_ID#\nСессия - #RS_STAT_SESSION_ID#\n\n\nИмя\n*******************************\n#SIMPLE_QUESTION_311#\n\nЭл. почта\n*******************************\n#SIMPLE_QUESTION_791#\n\nТелефон\n*******************************\n#SIMPLE_QUESTION_173#\n\nСообщение\n*******************************\n#SIMPLE_QUESTION_126#\n\n\nДля просмотра воспользуйтесь ссылкой:\nhttp://#SERVER_NAME#/bitrix/admin/form_result_view.php?lang=ru&WEB_FORM_ID=#RS_FORM_ID#&RESULT_ID=#RS_RESULT_ID#\n\n-------------------------------------------------------\nПисьмо сгенерировано автоматически.\n						', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `b_event_message_site`
--

CREATE TABLE IF NOT EXISTS `b_event_message_site` (
  `EVENT_MESSAGE_ID` int(11) NOT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`EVENT_MESSAGE_ID`,`SITE_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `b_event_message_site`
--

INSERT INTO `b_event_message_site` (`EVENT_MESSAGE_ID`, `SITE_ID`) VALUES
(1, 's1'),
(2, 's1'),
(3, 's1'),
(4, 's1'),
(5, 's1'),
(6, 's1'),
(7, 's1'),
(8, 's1'),
(9, 's1'),
(10, 's1'),
(11, 's1'),
(12, 's1'),
(13, 's1'),
(14, 's1'),
(15, 's1'),
(16, 's1'),
(17, 's1'),
(18, 's1'),
(19, 's1'),
(20, 's1'),
(21, 's1'),
(22, 's1'),
(23, 's1'),
(24, 's1'),
(25, 's1');

-- --------------------------------------------------------

--
-- Структура таблицы `b_event_type`
--

CREATE TABLE IF NOT EXISTS `b_event_type` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `LID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `EVENT_NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DESCRIPTION` text COLLATE utf8_unicode_ci,
  `SORT` int(18) NOT NULL DEFAULT '150',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_1` (`EVENT_NAME`,`LID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=159 ;

--
-- Дамп данных таблицы `b_event_type`
--

INSERT INTO `b_event_type` (`ID`, `LID`, `EVENT_NAME`, `NAME`, `DESCRIPTION`, `SORT`) VALUES
(1, 'ru', 'NEW_USER', 'Зарегистрировался новый пользователь', '\n\n#USER_ID# - ID пользователя\n#LOGIN# - Логин\n#EMAIL# - EMail\n#NAME# - Имя\n#LAST_NAME# - Фамилия\n#USER_IP# - IP пользователя\n#USER_HOST# - Хост пользователя\n', 1),
(2, 'ru', 'USER_INFO', 'Информация о пользователе', '\n\n#USER_ID# - ID пользователя\n#STATUS# - Статус логина\n#MESSAGE# - Сообщение пользователю\n#LOGIN# - Логин\n#URL_LOGIN# - Логин, закодированный для использования в URL\n#CHECKWORD# - Контрольная строка для смены пароля\n#NAME# - Имя\n#LAST_NAME# - Фамилия\n#EMAIL# - E-Mail пользователя\n', 2),
(3, 'ru', 'NEW_USER_CONFIRM', 'Подтверждение регистрации нового пользователя', '\n\n\n#USER_ID# - ID пользователя\n#LOGIN# - Логин\n#EMAIL# - EMail\n#NAME# - Имя\n#LAST_NAME# - Фамилия\n#USER_IP# - IP пользователя\n#USER_HOST# - Хост пользователя\n#CONFIRM_CODE# - Код подтверждения\n', 3),
(4, 'ru', 'USER_PASS_REQUEST', 'Запрос на смену пароля', '\n\n#USER_ID# - ID пользователя\n#STATUS# - Статус логина\n#MESSAGE# - Сообщение пользователю\n#LOGIN# - Логин\n#URL_LOGIN# - Логин, закодированный для использования в URL\n#CHECKWORD# - Контрольная строка для смены пароля\n#NAME# - Имя\n#LAST_NAME# - Фамилия\n#EMAIL# - E-Mail пользователя\n', 4),
(5, 'ru', 'USER_PASS_CHANGED', 'Подтверждение смены пароля', '\n\n#USER_ID# - ID пользователя\n#STATUS# - Статус логина\n#MESSAGE# - Сообщение пользователю\n#LOGIN# - Логин\n#URL_LOGIN# - Логин, закодированный для использования в URL\n#CHECKWORD# - Контрольная строка для смены пароля\n#NAME# - Имя\n#LAST_NAME# - Фамилия\n#EMAIL# - E-Mail пользователя\n', 5),
(6, 'ru', 'USER_INVITE', 'Приглашение на сайт нового пользователя', '#ID# - ID пользователя\n#LOGIN# - Логин\n#URL_LOGIN# - Логин, закодированный для использования в URL\n#EMAIL# - EMail\n#NAME# - Имя\n#LAST_NAME# - Фамилия\n#PASSWORD# - пароль пользователя \n#CHECKWORD# - Контрольная строка для смены пароля\n#XML_ID# - ID пользователя для связи с внешними источниками\n', 6),
(7, 'ru', 'FEEDBACK_FORM', 'Отправка сообщения через форму обратной связи', '#AUTHOR# - Автор сообщения\n#AUTHOR_EMAIL# - Email автора сообщения\n#TEXT# - Текст сообщения\n#EMAIL_FROM# - Email отправителя письма\n#EMAIL_TO# - Email получателя письма', 7),
(8, 'en', 'NEW_USER', 'New user was registered', '\n\n#USER_ID# - User ID\n#LOGIN# - Login\n#EMAIL# - EMail\n#NAME# - Name\n#LAST_NAME# - Last Name\n#USER_IP# - User IP\n#USER_HOST# - User Host\n', 1),
(9, 'en', 'USER_INFO', 'Account Information', '\n\n#USER_ID# - User ID\n#STATUS# - Account status\n#MESSAGE# - Message for user\n#LOGIN# - Login\n#URL_LOGIN# - Encoded login for use in URL\n#CHECKWORD# - Check string for password change\n#NAME# - Name\n#LAST_NAME# - Last Name\n#EMAIL# - User E-Mail\n', 2),
(10, 'en', 'NEW_USER_CONFIRM', 'New user registration confirmation', '\n\n#USER_ID# - User ID\n#LOGIN# - Login\n#EMAIL# - E-mail\n#NAME# - First name\n#LAST_NAME# - Last name\n#USER_IP# - User IP\n#USER_HOST# - User host\n#CONFIRM_CODE# - Confirmation code\n', 3),
(11, 'en', 'USER_PASS_REQUEST', 'Password Change Request', '\n\n#USER_ID# - User ID\n#STATUS# - Account status\n#MESSAGE# - Message for user\n#LOGIN# - Login\n#URL_LOGIN# - Encoded login for use in URL\n#CHECKWORD# - Check string for password change\n#NAME# - Name\n#LAST_NAME# - Last Name\n#EMAIL# - User E-Mail\n', 4),
(12, 'en', 'USER_PASS_CHANGED', 'Password Change Confirmation', '\n\n#USER_ID# - User ID\n#STATUS# - Account status\n#MESSAGE# - Message for user\n#LOGIN# - Login\n#URL_LOGIN# - Encoded login for use in URL\n#CHECKWORD# - Check string for password change\n#NAME# - Name\n#LAST_NAME# - Last Name\n#EMAIL# - User E-Mail\n', 5),
(13, 'en', 'USER_INVITE', 'Invitation of a new site user', '#ID# - User ID\n#LOGIN# - Login\n#URL_LOGIN# - Encoded login for use in URL\n#EMAIL# - EMail\n#NAME# - Name\n#LAST_NAME# - Last Name\n#PASSWORD# - User password \n#CHECKWORD# - Password check string\n#XML_ID# - User ID to link with external data sources\n\n', 6),
(14, 'en', 'FEEDBACK_FORM', 'Sending a message using a feedback form', '#AUTHOR# - Message author\n#AUTHOR_EMAIL# - Author''s e-mail address\n#TEXT# - Message text\n#EMAIL_FROM# - Sender''s e-mail address\n#EMAIL_TO# - Recipient''s e-mail address', 7),
(15, 'ru', 'NEW_BLOG_MESSAGE', 'Новое сообщение в блоге', '#BLOG_ID# - ID блога \n#BLOG_NAME# - Название блога\n#BLOG_URL# - Название блога латиницей\n#MESSAGE_TITLE# - Тема сообщения\n#MESSAGE_TEXT# - Текст сообщения\n#MESSAGE_DATE# - Дата сообщения\n#MESSAGE_PATH# - URL адрес сообщения\n#AUTHOR# - Автор сообщения\n#EMAIL_FROM# - Email отправителя письма\n#EMAIL_TO# - Email получателя письма', 150),
(16, 'ru', 'NEW_BLOG_COMMENT', 'Новый комментарий в блоге', '#BLOG_ID# - ID блога \n#BLOG_NAME# - Название блога\n#BLOG_URL# - Название блога латиницей\n#MESSAGE_TITLE# - Тема сообщения\n#COMMENT_TITLE# - Заголовок комментария\n#COMMENT_TEXT# - Текст комментария\n#COMMENT_DATE# - Текст комментария\n#COMMENT_PATH# - URL адрес сообщения\n#AUTHOR# - Автор сообщения\n#EMAIL_FROM# - Email отправителя письма\n#EMAIL_TO# - Email получателя письма', 150),
(17, 'ru', 'NEW_BLOG_COMMENT2COMMENT', 'Новый комментарий на ваш комментарий в блоге', '#BLOG_ID# - ID блога \n#BLOG_NAME# - Название блога\n#BLOG_URL# - Название блога латиницей\n#MESSAGE_TITLE# - Тема сообщения\n#COMMENT_TITLE# - Заголовок комментария\n#COMMENT_TEXT# - Текст комментария\n#COMMENT_DATE# - Текст комментария\n#COMMENT_PATH# - URL адрес сообщения\n#AUTHOR# - Автор сообщения\n#EMAIL_FROM# - Email отправителя письма\n#EMAIL_TO# - Email получателя письма', 150),
(18, 'ru', 'NEW_BLOG_COMMENT_WITHOUT_TITLE', 'Новый комментарий в блоге (без темы)', '#BLOG_ID# - ID блога \n#BLOG_NAME# - Название блога\n#BLOG_URL# - Название блога латиницей\n#MESSAGE_TITLE# - Тема сообщения\n#COMMENT_TEXT# - Текст комментария\n#COMMENT_DATE# - Текст комментария\n#COMMENT_PATH# - URL адрес сообщения\n#AUTHOR# - Автор сообщения\n#EMAIL_FROM# - Email отправителя письма\n#EMAIL_TO# - Email получателя письма', 150),
(19, 'ru', 'NEW_BLOG_COMMENT2COMMENT_WITHOUT_TITLE', 'Новый комментарий на ваш комментарий в блоге (без темы)', '#BLOG_ID# - ID блога \n#BLOG_NAME# - Название блога\n#BLOG_URL# - Название блога латиницей\n#COMMENT_TITLE# - Заголовок комментария\n#COMMENT_TEXT# - Текст комментария\n#COMMENT_DATE# - Текст комментария\n#COMMENT_PATH# - URL адрес сообщения\n#AUTHOR# - Автор сообщения\n#EMAIL_FROM# - Email отправителя письма\n#EMAIL_TO# - Email получателя письма', 150),
(20, 'ru', 'BLOG_YOUR_BLOG_TO_USER', 'Ваш блог был добавлен в друзья', '\n#BLOG_ID# - ID блога \n#BLOG_NAME# - Название блога\n#BLOG_URL# - Название блога латиницей\n#BLOG_ADR# - Адрес блога\n#USER_ID# - ID пользователя\n#USER# - Пользователь\n#USER_URL# - Адрес пользователя\n#EMAIL_FROM# - Email отправителя письма\n#EMAIL_TO# - Email получателя письма\n', 150),
(21, 'ru', 'BLOG_YOU_TO_BLOG', 'Вы были добавлены в друзья блога', '\n#BLOG_ID# - ID блога \n#BLOG_NAME# - Название блога\n#BLOG_URL# - Название блога латиницей\n#BLOG_ADR# - Адрес блога\n#USER_ID# - ID пользователя\n#USER# - Пользователь\n#USER_URL# - Адрес пользователя\n#EMAIL_FROM# - Email отправителя письма\n#EMAIL_TO# - Email получателя письма\n', 150),
(22, 'ru', 'BLOG_BLOG_TO_YOU', 'К вам в друзья был добавлен блог', '\n#BLOG_ID# - ID блога \n#BLOG_NAME# - Название блога\n#BLOG_URL# - Название блога латиницей\n#BLOG_ADR# - Адрес блога\n#USER_ID# - ID пользователя\n#USER# - Пользователь\n#USER_URL# - Адрес пользователя\n#EMAIL_FROM# - Email отправителя письма\n#EMAIL_TO# - Email получателя письма\n', 150),
(23, 'ru', 'BLOG_USER_TO_YOUR_BLOG', 'В ваш блог был добавлен друг', '\n#BLOG_ID# - ID блога \n#BLOG_NAME# - Название блога\n#BLOG_URL# - Название блога латиницей\n#BLOG_ADR# - Адрес блога\n#USER_ID# - ID пользователя\n#USER# - Пользователь\n#USER_URL# - Адрес пользователя\n#EMAIL_FROM# - Email отправителя письма\n#EMAIL_TO# - Email получателя письма\n', 150),
(24, 'en', 'NEW_BLOG_MESSAGE', 'New blog message', '#BLOG_ID# - Blog ID\n#BLOG_NAME# - Blog title\n#BLOG_URL# - Blog url\n#MESSAGE_TITLE# - Message title\n#MESSAGE_TEXT# - Message text\n#MESSAGE_DATE# - Message date\n#MESSAGE_PATH# - URL to message\n#AUTHOR# - Message author\n#EMAIL_FROM# - Sender email\n#EMAIL_TO# - Recipient email', 150),
(25, 'en', 'NEW_BLOG_COMMENT', 'New comment in blog', '#BLOG_ID# - Blog ID\n#BLOG_NAME# - Blog title\n#BLOG_URL# - Blog url\n#MESSAGE_TITLE# - Message title\n#COMMENT_TITLE# - Comment title\n#COMMENT_TEXT# - Comment text\n#COMMENT_DATE# - Comment date\n#COMMENT_PATH# - Comment URL\n#AUTHOR# - Comment author\n#EMAIL_FROM# - Sender email\n#EMAIL_TO# - Recipient email', 150),
(26, 'en', 'NEW_BLOG_COMMENT2COMMENT', 'New comment for your in blog', '#BLOG_ID# - Blog ID\n#BLOG_NAME# - Blog title\n#BLOG_URL# - Blog url\n#MESSAGE_TITLE# - Message title\n#COMMENT_TITLE# - Comment title\n#COMMENT_TEXT# - Comment text\n#COMMENT_DATE# - Comment date\n#COMMENT_PATH# - Comment URL\n#AUTHOR# - Comment author\n#EMAIL_FROM# - Sender email\n#EMAIL_TO# - Recipient email', 150),
(27, 'en', 'NEW_BLOG_COMMENT_WITHOUT_TITLE', 'New comment in blog (without subject)', '#BLOG_ID# - Blog ID\n#BLOG_NAME# - Blog title\n#BLOG_URL# - Blog url\n#MESSAGE_TITLE# - Message title\n#COMMENT_TEXT# - Comment text\n#COMMENT_DATE# - Comment date\n#COMMENT_PATH# - Comment URL\n#AUTHOR# - Comment author\n#EMAIL_FROM# - Sender email\n#EMAIL_TO# - Recipient email', 150),
(28, 'en', 'NEW_BLOG_COMMENT2COMMENT_WITHOUT_TITLE', 'New comment for your in blog (without subject)', '#BLOG_ID# - Blog ID\n#BLOG_NAME# - Blog title\n#BLOG_URL# - Blog url\n#MESSAGE_TITLE# - Message title\n#COMMENT_TEXT# - Comment text\n#COMMENT_DATE# - Comment date\n#COMMENT_PATH# - Comment URL\n#AUTHOR# - Comment author\n#EMAIL_FROM# - Sender email\n#EMAIL_TO# - Recipient email', 150),
(29, 'en', 'BLOG_YOUR_BLOG_TO_USER', 'Your blog has been added to friends', '#BLOG_ID# - Blog ID\\r\\n#BLOG_NAME# - Blog name\\r\\n#BLOG_URL# - Blog name, Latin letters only\\r\\n#BLOG_ADR# - Blog address\\r\\n#USER_ID# - User ID\\r\\n#USER# - User\\r\\n#USER_URL# - User URL\\r\\n#EMAIL_FROM# - Sender E-mail\\r\\n#EMAIL_TO# - Recipient E-mail', 150),
(30, 'en', 'BLOG_YOU_TO_BLOG', 'You have been added to blog friends', '#BLOG_ID# - Blog ID\\r\\n#BLOG_NAME# - Blog name\\r\\n#BLOG_URL# - Blog name, Latin letters only\\r\\n#BLOG_ADR# - Blog address\\r\\n#USER_ID# - User ID\\r\\n#USER# - User\\r\\n#USER_URL# - User URL\\r\\n#EMAIL_FROM# - Sender E-mail\\r\\n#EMAIL_TO# - Recipient E-mail', 150),
(31, 'en', 'BLOG_BLOG_TO_YOU', 'A blog has been added to your friends', '#BLOG_ID# - Blog ID\\r\\n#BLOG_NAME# - Blog name\\r\\n#BLOG_URL# - Blog name, Latin letters only\\r\\n#BLOG_ADR# - Blog address\\r\\n#USER_ID# - User ID\\r\\n#USER# - User\\r\\n#USER_URL# - User URL\\r\\n#EMAIL_FROM# - Sender E-mail\\r\\n#EMAIL_TO# - Recipient E-mail', 150),
(32, 'en', 'BLOG_USER_TO_YOUR_BLOG', 'A friend has been added to your blog', '#BLOG_ID# - Blog ID\\r\\n#BLOG_NAME# - Blog name\\r\\n#BLOG_URL# - Blog name, Latin letters only\\r\\n#BLOG_ADR# - Blog address\\r\\n#USER_ID# - User ID\\r\\n#USER# - User\\r\\n#USER_URL# - User URL\\r\\n#EMAIL_FROM# - Sender E-mail\\r\\n#EMAIL_TO# - Recipient E-mail', 150),
(33, 'ru', 'NEW_FORUM_MESSAGE', 'Новое сообщение на форуме', '\n			#FORUM_ID# - ID форума\n			#FORUM_NAME# - Название форума\n			#TOPIC_ID# - ID темы\n			#MESSAGE_ID# - ID сообщения\n			#TOPIC_TITLE# - Тема сообщения\n			#MESSAGE_TEXT# - Текст сообщения\n			#MESSAGE_DATE# - Дата сообщения\n			#AUTHOR# - Автор сообщения\n			#RECIPIENT# - Получатель сообщения\n			#TAPPROVED# - Тема сообщения показывается\n			#MAPPROVED# - Тело сообщения показывается\n			#PATH2FORUM# - Адрес сообщения\n			#FROM_EMAIL# - E-Mail для поля From письма', 150),
(34, 'ru', 'NEW_FORUM_PRIV', 'Приватное письмо посетителю форума', '\n			#FROM_NAME# - Автор сообщения\n			#FROM_EMAIL# - E-Mail автора сообщения\n			#TO_NAME# - Имя получателя сообщения\n			#TO_EMAIL# - E-Mail получателя сообщения\n			#SUBJECT# - Тема сообщения\n			#MESSAGE# - Тело сообщения\n			#MESSAGE_DATE# - Дата сообщения', 150),
(35, 'ru', 'NEW_FORUM_PRIVATE_MESSAGE', 'Приватное сообщение', '\n			#FROM_NAME# - Имя автора сообщения\n			#FROM_USER_ID# - ID автора сообщения\n			#FROM_EMAIL# - E-Mail автора сообщения\n			#TO_NAME# - Имя получателя сообщения\n			#TO_USER_ID# - ID получателя сообщения\n			#TO_EMAIL# - E-Mail получателя сообщения\n			#SUBJECT# - Тема сообщения\n			#MESSAGE# - Текст сообщения\n			#MESSAGE_DATE# - Дата сообщения\n			#MESSAGE_LINK# - Ссылка на сообщение', 150),
(36, 'ru', 'EDIT_FORUM_MESSAGE', 'Изменение сообщения на форуме', '\n			#FORUM_ID# - ID форума\n			#FORUM_NAME# - Название форума\n			#TOPIC_ID# - ID темы\n			#MESSAGE_ID# - ID сообщения\n			#TOPIC_TITLE# - Тема сообщения\n			#MESSAGE_TEXT# - Текст сообщения\n			#MESSAGE_DATE# - Дата сообщения\n			#AUTHOR# - Автор сообщения\n			#RECIPIENT# - Получатель сообщения\n			#TAPPROVED# - Тема сообщения показывается\n			#MAPPROVED# - Тело сообщения показывается\n			#PATH2FORUM# - Адрес сообщения\n			#FROM_EMAIL# - E-Mail для поля From письма', 150),
(37, 'en', 'NEW_FORUM_MESSAGE', 'New forum message', '\n			#FORUM_ID# - Forum ID\n			#FORUM_NAME# - Forum name\n			#TOPIC_ID# - Topic ID\n			#MESSAGE_ID# - Message ID\n			#TOPIC_TITLE# - Topic title\n			#MESSAGE_TEXT# - Message text\n			#MESSAGE_DATE# - Message date\n			#AUTHOR# - Message author\n			#RECIPIENT# - E-Mail recipient\n			#TAPPROVED# - Message topic is approved\n			#MAPPROVED# - Message is approved\n			#PATH2FORUM# - Message Url\n			#FROM_EMAIL# - E-Mail for From field of the EMail', 150),
(38, 'en', 'NEW_FORUM_PRIV', 'Private message for forum user', '\n			#FROM_NAME# - Name of the sender\n			#FROM_EMAIL# - E-Mail of the sender\n			#TO_NAME# - Name of recipient\n			#TO_EMAIL# - E-Mail of recipient\n			#SUBJECT# - Topic\n			#MESSAGE# - Message\n			#MESSAGE_DATE# - Date', 150),
(39, 'en', 'NEW_FORUM_PRIVATE_MESSAGE', 'Private message for forum user', '\n			#FROM_NAME# - Name of the sender\n			#FROM_USER_ID# - ID of the sender\n			#FROM_EMAIL# - E-Mail of the sender\n			#TO_NAME# - Name of recipient\n			#TO_USER_ID# - ID of recipient\n			#TO_EMAIL# - E-Mail of recipient\n			#SUBJECT# - Topic\n			#MESSAGE# - Message\n			#MESSAGE_DATE# - Date\n			#MESSAGE_LINK# - Link to message', 150),
(40, 'en', 'EDIT_FORUM_MESSAGE', 'Changing forum message', '\n			#FORUM_ID# - Forum ID\n			#FORUM_NAME# - Forum name\n			#TOPIC_ID# - Topic ID\n			#MESSAGE_ID# - Message ID\n			#TOPIC_TITLE# - Topic title\n			#MESSAGE_TEXT# - Message text\n			#MESSAGE_DATE# - Message date\n			#AUTHOR# - Message author\n			#RECIPIENT# - E-Mail recipient\n			#TAPPROVED# - Message topic is approved\n			#MAPPROVED# - Message is approved\n			#PATH2FORUM# - Message Url\n			#FROM_EMAIL# - E-Mail for From field of the EMail', 150),
(41, 'ru', 'FORUM_NEW_MESSAGE_MAIL', 'Новое сообщение на форуме в режиме общения по E-Mail', '#FORUM_NAME# - Название форума\n#AUTHOR# - Автор сообщения\n#FROM_EMAIL# - E-Mail для поля From письма\n#RECIPIENT# - Получатель сообщения\n#TOPIC_TITLE# - Тема сообщения\n#MESSAGE_TEXT# - Текст сообщения\n#PATH2FORUM# - Адрес сообщения\n#MESSAGE_DATE# - Дата сообщения\n#FORUM_EMAIL# - Е-Mail адрес для добавления сообщений на форум\n#FORUM_ID# - ID форума\n#TOPIC_ID# - ID темы \n#MESSAGE_ID# - ID сообщения\n#TAPPROVED# - Тема опубликована\n#MAPPROVED# - Сообщение опубликовано\n', 150),
(42, 'en', 'FORUM_NEW_MESSAGE_MAIL', 'New message at the forum (e-mail messaging mode)', '#FORUM_NAME# - Forum name\n#AUTHOR# - Message author\n#FROM_EMAIL# - E-Mail in the &amp;From&amp; field\n#RECIPIENT# - Message recipient\n#TOPIC_TITLE# - Message subject\n#MESSAGE_TEXT# - Message text\n#PATH2FORUM# - Message URL\n#MESSAGE_DATE# - Message date\n#FORUM_EMAIL# - E-Mail to add messages to the forum \n#FORUM_ID# - Forum ID\n#TOPIC_ID# - Topic ID \n#MESSAGE_ID# - Message ID\n#TAPPROVED# - Topic approved and published\n#MAPPROVED# - Message approved and published\n', 150),
(43, 'ru', 'VIRUS_DETECTED', 'Обнаружен вирус', '#EMAIL# - E-Mail администратора сайта (из настроек главного модуля)', 150),
(44, 'en', 'VIRUS_DETECTED', 'Virus detected', '#EMAIL# - Site administrator''s e-mail address (from the Kernel module settings)', 150),
(45, 'ru', 'SUBSCRIBE_CONFIRM', 'Подтверждение подписки', '#ID# - идентификатор подписки\n#EMAIL# - адрес подписки\n#CONFIRM_CODE# - код подтверждения\n#SUBSCR_SECTION# - раздел, где находится страница редактирования подписки (задается в настройках)\n#USER_NAME# - имя подписчика (может отсутствовать)\n#DATE_SUBSCR# - дата добавления/изменения адреса\n', 150),
(46, 'en', 'SUBSCRIBE_CONFIRM', 'Confirmation of subscription', '#ID# - subscription ID\n#EMAIL# - subscription email\n#CONFIRM_CODE# - confirmation code\n#SUBSCR_SECTION# - section with subscription edit page (specifies in the settings)\n#USER_NAME# - subscriber''s name (optional)\n#DATE_SUBSCR# - date of adding/change of address\n', 150),
(47, 'ru', 'VOTE_FOR', 'Новый голос', '#ID# - ID результата голосования\n#TIME# - время голосования\n#VOTE_TITLE# - наименование опроса\n#VOTE_DESCRIPTION# - описание опроса\n#VOTE_ID# - ID опроса\n#CHANNEL# - наименование группы опроса\n#CHANNEL_ID# - ID группы опроса\n#VOTER_ID# - ID проголосовавшего посетителя\n#USER_NAME# - ФИО пользователя\n#LOGIN# - логин\n#USER_ID# - ID пользователя\n#STAT_GUEST_ID# - ID посетителя модуля статистики\n#SESSION_ID# - ID сессии модуля статистики\n#IP# - IP адрес\n#VOTE_STATISTIC# - Сводная статистика опроса типа ( - Вопрос - Ответ )\n#URL# - Путь к опросу\n', 150),
(48, 'en', 'VOTE_FOR', 'New vote', '#ID# - Vote result ID\n#TIME# - Time of vote\n#VOTE_TITLE# - Poll name\n#VOTE_DESCRIPTION# - Poll description\n#VOTE_ID# - Poll ID\n#CHANNEL# - Poll group name\n#CHANNEL_ID# - Poll group ID\n#VOTER_ID# - Voter''s user ID\n#USER_NAME# - User full name\n#LOGIN# - login\n#USER_ID# - User ID\n#STAT_GUEST_ID# - Visitor ID in web analytics module\n#SESSION_ID# - Session ID in web analytics module\n#IP# - IP address\n#VOTE_STATISTIC# - Summary statistics of this poll type ( - Question - Answer)\n#URL# - Poll URL', 150),
(158, 'en', 'FORM_FILLING_SIMPLE_FORM_1', 'Web form filled "SIMPLE_FORM_1"', '#RS_FORM_ID# - Form ID\n#RS_FORM_NAME# - Form name\n#RS_FORM_SID# - Form SID\n#RS_RESULT_ID# - Result ID\n#RS_DATE_CREATE# - Form filling date\n#RS_USER_ID# - User ID\n#RS_USER_EMAIL# - User e-mail\n#RS_USER_NAME# - First and last user names\n#RS_USER_AUTH# - User authorized?\n#RS_STAT_GUEST_ID# - Visitor ID\n#RS_STAT_SESSION_ID# - Session ID\n#SIMPLE_QUESTION_311# - Имя\n#SIMPLE_QUESTION_311_RAW# - Имя (original value)\n#SIMPLE_QUESTION_791# - Эл. почта\n#SIMPLE_QUESTION_791_RAW# - Эл. почта (original value)\n#SIMPLE_QUESTION_173# - Телефон\n#SIMPLE_QUESTION_173_RAW# - Телефон (original value)\n#SIMPLE_QUESTION_126# - Сообщение\n#SIMPLE_QUESTION_126_RAW# - Сообщение (original value)\n', 150),
(157, 'ru', 'FORM_FILLING_SIMPLE_FORM_1', 'Заполнена web-форма "SIMPLE_FORM_1"', '#RS_FORM_ID# - ID формы\n#RS_FORM_NAME# - Имя формы\n#RS_FORM_SID# - SID формы\n#RS_RESULT_ID# - ID результата\n#RS_DATE_CREATE# - Дата заполнения формы\n#RS_USER_ID# - ID пользователя\n#RS_USER_EMAIL# - EMail пользователя\n#RS_USER_NAME# - Фамилия, имя пользователя\n#RS_USER_AUTH# - Пользователь был авторизован?\n#RS_STAT_GUEST_ID# - ID посетителя\n#RS_STAT_SESSION_ID# - ID сессии\n#SIMPLE_QUESTION_311# - Имя\n#SIMPLE_QUESTION_311_RAW# - Имя (оригинальное значение)\n#SIMPLE_QUESTION_791# - Эл. почта\n#SIMPLE_QUESTION_791_RAW# - Эл. почта (оригинальное значение)\n#SIMPLE_QUESTION_173# - Телефон\n#SIMPLE_QUESTION_173_RAW# - Телефон (оригинальное значение)\n#SIMPLE_QUESTION_126# - Сообщение\n#SIMPLE_QUESTION_126_RAW# - Сообщение (оригинальное значение)\n', 150);

-- --------------------------------------------------------

--
-- Структура таблицы `b_favorite`
--

CREATE TABLE IF NOT EXISTS `b_favorite` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` datetime DEFAULT NULL,
  `DATE_CREATE` datetime DEFAULT NULL,
  `C_SORT` int(18) NOT NULL DEFAULT '100',
  `MODIFIED_BY` int(18) DEFAULT NULL,
  `CREATED_BY` int(18) DEFAULT NULL,
  `MODULE_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `URL` text COLLATE utf8_unicode_ci,
  `COMMENTS` text COLLATE utf8_unicode_ci,
  `LANGUAGE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `USER_ID` int(11) DEFAULT NULL,
  `CODE_ID` int(18) DEFAULT NULL,
  `COMMON` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `MENU_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `b_file`
--

CREATE TABLE IF NOT EXISTS `b_file` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `MODULE_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `HEIGHT` int(18) DEFAULT NULL,
  `WIDTH` int(18) DEFAULT NULL,
  `FILE_SIZE` int(18) NOT NULL,
  `CONTENT_TYPE` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'IMAGE',
  `SUBDIR` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FILE_NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ORIGINAL_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DESCRIPTION` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `HANDLER_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `EXTERNAL_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_FILE_EXTERNAL_ID` (`EXTERNAL_ID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=20 ;

--
-- Дамп данных таблицы `b_file`
--

INSERT INTO `b_file` (`ID`, `TIMESTAMP_X`, `MODULE_ID`, `HEIGHT`, `WIDTH`, `FILE_SIZE`, `CONTENT_TYPE`, `SUBDIR`, `FILE_NAME`, `ORIGINAL_NAME`, `DESCRIPTION`, `HANDLER_ID`, `EXTERNAL_ID`) VALUES
(1, '2015-06-03 20:13:54', 'iblock', 588, 2560, 260633, 'image/jpeg', 'iblock/fc4', 'fc48e4c82032919ae057288198dbd3d2.jpg', 'sl1.jpg', '', NULL, 'f6f30c741f0bd19ca69c3bf4cc24da89'),
(2, '2015-06-03 20:30:34', 'iblock', 588, 2560, 317637, 'image/jpeg', 'iblock/78e', '78ebe6ac45929ecacb194a279b300c9b.jpg', 'sl2.jpg', '', NULL, '16f1fa6959add89a35bc814cc2bb445c'),
(3, '2015-06-03 20:32:04', 'iblock', 588, 2560, 260633, 'image/jpeg', 'iblock/ca3', 'ca33cecd1061dcc0cc98bddb0ed59134.jpg', 'sl1.jpg', '', NULL, 'f1ddb2dbd23122addcbd949350a5115e'),
(4, '2015-06-03 20:35:23', 'iblock', 588, 2560, 317637, 'image/jpeg', 'iblock/4d3', '4d3e2aad8f08e07c40840998583611ff.jpg', 'sl2.jpg', '', NULL, 'fd0734397bcf6d8dd2b44ac8723493df'),
(5, '2015-06-03 20:50:38', 'iblock', 50, 250, 5352, 'image/png', 'iblock/449', '4499567ac125556aee4d9832f6839a1e.png', '1.png', '', NULL, 'bbc49d67aecd2ea521c116909249af17'),
(6, '2015-06-03 20:50:38', 'iblock', 50, 250, 4790, 'image/png', 'iblock/9db', '9dbe92fcd0818da87eba2ff6ff3491ca.png', '1.png', '', NULL, 'a027bf139776b7a491e8a0982baecd60'),
(7, '2015-06-03 20:50:38', 'iblock', 240, 240, 96236, 'image/png', 'iblock/e12', 'e1208e74367b994999b82eb7efe4df21.png', '1.png', '', NULL, '927c6e03ce9ee00d32b4ca841d4d79bc'),
(8, '2015-06-03 21:21:55', 'iblock', 50, 250, 5025, 'image/png', 'iblock/6dd', '6dd577a6873a6e8c1d9fd354f1a96b5e.png', '2.png', '', NULL, 'ff773c40f92ab5361a473d49b6a1f915'),
(9, '2015-06-03 21:21:55', 'iblock', 50, 250, 4771, 'image/png', 'iblock/7c5', '7c57fc79b44decaa934c0955fc2fa4ae.png', '2.png', '', NULL, 'd2b913b85d2c4d6e7e684cdbc173259e'),
(10, '2015-06-03 21:21:55', 'iblock', 240, 240, 94188, 'image/png', 'iblock/7b1', '7b1f4d57504eee9b415b9995f7332877.png', '2.png', '', NULL, 'eabeaf477c1a82c96b9acb3186c467d7'),
(11, '2015-06-03 21:22:49', 'iblock', 50, 250, 4078, 'image/png', 'iblock/69a', '69ac8e0568ac05b9f28cc1d3b828f016.png', '3.png', '', NULL, 'fe05398392ad6e48d6f0b4c782c7ae7f'),
(12, '2015-06-03 21:22:49', 'iblock', 50, 250, 3789, 'image/png', 'iblock/111', '111505a2e213adda6de758c44b015410.png', '3.png', '', NULL, '372b32757debc41b538be959b0d59778'),
(13, '2015-06-03 21:22:49', 'iblock', 240, 240, 79130, 'image/png', 'iblock/014', '0144f42a2a3d796b3109c568996cd5de.png', '3.png', '', NULL, '83e1cea378e62b33394e3f03b850a50d'),
(14, '2015-06-03 21:23:34', 'iblock', 50, 250, 4099, 'image/png', 'iblock/707', '7076c9b5b6bf630b0d20520aefb4bdc6.png', '4.png', '', NULL, 'f3dd27f4811d7c07cdbf3c6bfe6cc355'),
(15, '2015-06-03 21:23:34', 'iblock', 50, 250, 3740, 'image/png', 'iblock/b21', 'b21ce72413deb8abe8ddc88bf7bdd080.png', '4.png', '', NULL, '4e13af7e63265fc23c2a4cab3171decc'),
(16, '2015-06-03 21:23:34', 'iblock', 240, 240, 83384, 'image/png', 'iblock/132', '1322852be520688547b2bd69e4903a67.png', '4.png', '', NULL, '1a1d0f4f3432189d8071b79161fc3124'),
(17, '2015-06-03 21:43:52', 'iblock', 180, 300, 19737, 'image/jpeg', 'iblock/b14', 'b141c10f5e7f20811eaca6fc4ce4c282.jpg', 'n1.jpg', '', NULL, '94618c2dd630791c7470f9b4ffc0fa43'),
(18, '2015-06-03 21:44:48', 'iblock', 180, 300, 33395, 'image/jpeg', 'iblock/f2f', 'f2fb950ac54e859fbda56e112752d6d1.jpg', 'n2.jpg', '', NULL, '156f7466644ea9e9eab45efddfc906b0'),
(19, '2015-06-03 21:45:41', 'iblock', 180, 300, 16283, 'image/jpeg', 'iblock/154', '154a20fe1e0c2b3ed7d1f46139b0c7c7.jpg', 'n3.jpg', '', NULL, '161f6563a5a8fdfc13b04cbc1a0c8cd5');

-- --------------------------------------------------------

--
-- Структура таблицы `b_file_search`
--

CREATE TABLE IF NOT EXISTS `b_file_search` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SESS_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `F_PATH` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `B_DIR` int(11) NOT NULL DEFAULT '0',
  `F_SIZE` int(11) NOT NULL DEFAULT '0',
  `F_TIME` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `b_filters`
--

CREATE TABLE IF NOT EXISTS `b_filters` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(18) DEFAULT NULL,
  `FILTER_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `FIELDS` text COLLATE utf8_unicode_ci NOT NULL,
  `COMMON` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PRESET` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LANGUAGE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PRESET_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SORT` int(18) DEFAULT NULL,
  `SORT_FIELD` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `b_form`
--

CREATE TABLE IF NOT EXISTS `b_form` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` datetime DEFAULT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `SID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `BUTTON` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `C_SORT` int(18) DEFAULT '100',
  `FIRST_SITE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `IMAGE_ID` int(18) DEFAULT NULL,
  `USE_CAPTCHA` char(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  `DESCRIPTION` text COLLATE utf8_unicode_ci,
  `DESCRIPTION_TYPE` varchar(4) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'html',
  `FORM_TEMPLATE` text COLLATE utf8_unicode_ci,
  `USE_DEFAULT_TEMPLATE` char(1) COLLATE utf8_unicode_ci DEFAULT 'Y',
  `SHOW_TEMPLATE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MAIL_EVENT_TYPE` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SHOW_RESULT_TEMPLATE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PRINT_RESULT_TEMPLATE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `EDIT_RESULT_TEMPLATE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FILTER_RESULT_TEMPLATE` text COLLATE utf8_unicode_ci,
  `TABLE_RESULT_TEMPLATE` text COLLATE utf8_unicode_ci,
  `USE_RESTRICTIONS` char(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  `RESTRICT_USER` int(5) DEFAULT '0',
  `RESTRICT_TIME` int(10) DEFAULT '0',
  `RESTRICT_STATUS` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `STAT_EVENT1` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `STAT_EVENT2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `STAT_EVENT3` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_SID` (`SID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Дамп данных таблицы `b_form`
--

INSERT INTO `b_form` (`ID`, `TIMESTAMP_X`, `NAME`, `SID`, `BUTTON`, `C_SORT`, `FIRST_SITE_ID`, `IMAGE_ID`, `USE_CAPTCHA`, `DESCRIPTION`, `DESCRIPTION_TYPE`, `FORM_TEMPLATE`, `USE_DEFAULT_TEMPLATE`, `SHOW_TEMPLATE`, `MAIL_EVENT_TYPE`, `SHOW_RESULT_TEMPLATE`, `PRINT_RESULT_TEMPLATE`, `EDIT_RESULT_TEMPLATE`, `FILTER_RESULT_TEMPLATE`, `TABLE_RESULT_TEMPLATE`, `USE_RESTRICTIONS`, `RESTRICT_USER`, `RESTRICT_TIME`, `RESTRICT_STATUS`, `STAT_EVENT1`, `STAT_EVENT2`, `STAT_EVENT3`) VALUES
(1, '2015-06-04 22:47:32', 'Обратная связь', 'SIMPLE_FORM_1', 'Сохранить', 100, NULL, NULL, 'N', 'Написать нам', 'text', '<?=$FORM->ShowInput(''SIMPLE_QUESTION_311'')?><?=$FORM->ShowInput(''SIMPLE_QUESTION_791'')?><?=$FORM->ShowInput(''SIMPLE_QUESTION_173'')?><?=$FORM->ShowInput(''SIMPLE_QUESTION_126'')?>', 'N', NULL, 'FORM_FILLING_SIMPLE_FORM_1', NULL, NULL, NULL, NULL, NULL, 'N', 0, 0, '', 'form', '', '');

-- --------------------------------------------------------

--
-- Структура таблицы `b_form_2_group`
--

CREATE TABLE IF NOT EXISTS `b_form_2_group` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `FORM_ID` int(18) NOT NULL DEFAULT '0',
  `GROUP_ID` int(18) NOT NULL DEFAULT '0',
  `PERMISSION` int(5) NOT NULL DEFAULT '1',
  PRIMARY KEY (`ID`),
  KEY `IX_FORM_ID` (`FORM_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `b_form_2_mail_template`
--

CREATE TABLE IF NOT EXISTS `b_form_2_mail_template` (
  `FORM_ID` int(18) NOT NULL DEFAULT '0',
  `MAIL_TEMPLATE_ID` int(18) NOT NULL DEFAULT '0',
  PRIMARY KEY (`FORM_ID`,`MAIL_TEMPLATE_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `b_form_2_mail_template`
--

INSERT INTO `b_form_2_mail_template` (`FORM_ID`, `MAIL_TEMPLATE_ID`) VALUES
(1, 25);

-- --------------------------------------------------------

--
-- Структура таблицы `b_form_2_site`
--

CREATE TABLE IF NOT EXISTS `b_form_2_site` (
  `FORM_ID` int(18) NOT NULL DEFAULT '0',
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`FORM_ID`,`SITE_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `b_form_2_site`
--

INSERT INTO `b_form_2_site` (`FORM_ID`, `SITE_ID`) VALUES
(1, 's1');

-- --------------------------------------------------------

--
-- Структура таблицы `b_form_answer`
--

CREATE TABLE IF NOT EXISTS `b_form_answer` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `FIELD_ID` int(18) NOT NULL DEFAULT '0',
  `TIMESTAMP_X` datetime DEFAULT NULL,
  `MESSAGE` text COLLATE utf8_unicode_ci,
  `C_SORT` int(18) NOT NULL DEFAULT '100',
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `VALUE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FIELD_TYPE` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'text',
  `FIELD_WIDTH` int(18) DEFAULT NULL,
  `FIELD_HEIGHT` int(18) DEFAULT NULL,
  `FIELD_PARAM` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`),
  KEY `IX_FIELD_ID` (`FIELD_ID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=6 ;

--
-- Дамп данных таблицы `b_form_answer`
--

INSERT INTO `b_form_answer` (`ID`, `FIELD_ID`, `TIMESTAMP_X`, `MESSAGE`, `C_SORT`, `ACTIVE`, `VALUE`, `FIELD_TYPE`, `FIELD_WIDTH`, `FIELD_HEIGHT`, `FIELD_PARAM`) VALUES
(3, 3, '2015-06-04 22:47:31', ' ', 0, 'Y', '', 'email', 0, 0, ''),
(2, 2, '2015-06-04 22:47:31', ' ', 0, 'Y', '', 'text', 0, 0, ''),
(4, 4, '2015-06-04 22:47:31', ' ', 0, 'Y', '', 'text', 0, 0, ''),
(5, 5, '2015-06-04 22:47:31', ' ', 0, 'Y', '', 'textarea', 0, 0, '');

-- --------------------------------------------------------

--
-- Структура таблицы `b_form_crm`
--

CREATE TABLE IF NOT EXISTS `b_form_crm` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `ACTIVE` char(1) COLLATE utf8_unicode_ci DEFAULT 'Y',
  `URL` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `AUTH_HASH` varchar(32) COLLATE utf8_unicode_ci DEFAULT '',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `b_form_crm_field`
--

CREATE TABLE IF NOT EXISTS `b_form_crm_field` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `LINK_ID` int(18) NOT NULL DEFAULT '0',
  `FIELD_ID` int(18) DEFAULT '0',
  `FIELD_ALT` varchar(100) COLLATE utf8_unicode_ci DEFAULT '',
  `CRM_FIELD` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`),
  KEY `ix_b_form_crm_field_1` (`LINK_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `b_form_crm_link`
--

CREATE TABLE IF NOT EXISTS `b_form_crm_link` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `FORM_ID` int(18) NOT NULL DEFAULT '0',
  `CRM_ID` int(18) NOT NULL DEFAULT '0',
  `LINK_TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'M',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_b_form_crm_link_1` (`FORM_ID`,`CRM_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `b_form_field`
--

CREATE TABLE IF NOT EXISTS `b_form_field` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `FORM_ID` int(18) NOT NULL DEFAULT '0',
  `TIMESTAMP_X` datetime DEFAULT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `TITLE` text COLLATE utf8_unicode_ci,
  `TITLE_TYPE` varchar(4) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'text',
  `SID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `C_SORT` int(18) NOT NULL DEFAULT '100',
  `ADDITIONAL` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `REQUIRED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `IN_FILTER` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `IN_RESULTS_TABLE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `IN_EXCEL_TABLE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `FIELD_TYPE` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `IMAGE_ID` int(18) DEFAULT NULL,
  `COMMENTS` text COLLATE utf8_unicode_ci,
  `FILTER_TITLE` text COLLATE utf8_unicode_ci,
  `RESULTS_TABLE_TITLE` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`),
  KEY `IX_FORM_ID` (`FORM_ID`),
  KEY `IX_SID` (`SID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=6 ;

--
-- Дамп данных таблицы `b_form_field`
--

INSERT INTO `b_form_field` (`ID`, `FORM_ID`, `TIMESTAMP_X`, `ACTIVE`, `TITLE`, `TITLE_TYPE`, `SID`, `C_SORT`, `ADDITIONAL`, `REQUIRED`, `IN_FILTER`, `IN_RESULTS_TABLE`, `IN_EXCEL_TABLE`, `FIELD_TYPE`, `IMAGE_ID`, `COMMENTS`, `FILTER_TITLE`, `RESULTS_TABLE_TITLE`) VALUES
(2, 1, '2015-06-04 22:47:31', 'Y', 'Имя', 'text', 'SIMPLE_QUESTION_311', 100, 'N', 'Y', 'Y', 'Y', 'Y', 'text', NULL, '', '', 'Имя'),
(3, 1, '2015-06-04 22:47:31', 'Y', 'Эл. почта', 'text', 'SIMPLE_QUESTION_791', 200, 'N', 'Y', 'Y', 'Y', 'Y', 'text', NULL, '', '', 'Эл. почта'),
(4, 1, '2015-06-04 22:47:31', 'Y', 'Телефон', 'text', 'SIMPLE_QUESTION_173', 300, 'N', 'N', 'Y', 'Y', 'Y', 'text', NULL, '', '', 'Телефон'),
(5, 1, '2015-06-04 22:47:31', 'Y', 'Сообщение', 'text', 'SIMPLE_QUESTION_126', 400, 'N', 'Y', 'Y', 'Y', 'Y', 'text', NULL, '', '', 'Сообщение');

-- --------------------------------------------------------

--
-- Структура таблицы `b_form_field_filter`
--

CREATE TABLE IF NOT EXISTS `b_form_field_filter` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `FIELD_ID` int(18) NOT NULL DEFAULT '0',
  `PARAMETER_NAME` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `FILTER_TYPE` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_FIELD_ID` (`FIELD_ID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=29 ;

--
-- Дамп данных таблицы `b_form_field_filter`
--

INSERT INTO `b_form_field_filter` (`ID`, `FIELD_ID`, `PARAMETER_NAME`, `FILTER_TYPE`) VALUES
(22, 2, 'USER', 'exist'),
(21, 2, 'USER', 'text'),
(23, 3, 'USER', 'text'),
(24, 3, 'USER', 'exist'),
(25, 4, 'USER', 'text'),
(26, 4, 'USER', 'exist'),
(27, 5, 'USER', 'text'),
(28, 5, 'USER', 'exist');

-- --------------------------------------------------------

--
-- Структура таблицы `b_form_field_validator`
--

CREATE TABLE IF NOT EXISTS `b_form_field_validator` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `FORM_ID` int(18) NOT NULL DEFAULT '0',
  `FIELD_ID` int(18) NOT NULL DEFAULT '0',
  `TIMESTAMP_X` datetime DEFAULT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci DEFAULT 'y',
  `C_SORT` int(18) DEFAULT '100',
  `VALIDATOR_SID` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `PARAMS` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`),
  KEY `IX_FORM_ID` (`FORM_ID`),
  KEY `IX_FIELD_ID` (`FIELD_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `b_form_menu`
--

CREATE TABLE IF NOT EXISTS `b_form_menu` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `FORM_ID` int(18) NOT NULL DEFAULT '0',
  `LID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `MENU` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_FORM_ID` (`FORM_ID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=45 ;

--
-- Дамп данных таблицы `b_form_menu`
--

INSERT INTO `b_form_menu` (`ID`, `FORM_ID`, `LID`, `MENU`) VALUES
(44, 1, 'en', ''),
(43, 1, 'ru', '');

-- --------------------------------------------------------

--
-- Структура таблицы `b_form_result`
--

CREATE TABLE IF NOT EXISTS `b_form_result` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` datetime DEFAULT NULL,
  `DATE_CREATE` datetime DEFAULT NULL,
  `STATUS_ID` int(18) NOT NULL DEFAULT '0',
  `FORM_ID` int(18) NOT NULL DEFAULT '0',
  `USER_ID` int(18) DEFAULT NULL,
  `USER_AUTH` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `STAT_GUEST_ID` int(18) DEFAULT NULL,
  `STAT_SESSION_ID` int(18) DEFAULT NULL,
  `SENT_TO_CRM` char(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  PRIMARY KEY (`ID`),
  KEY `IX_FORM_ID` (`FORM_ID`),
  KEY `IX_STATUS_ID` (`STATUS_ID`),
  KEY `IX_SENT_TO_CRM` (`SENT_TO_CRM`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- Дамп данных таблицы `b_form_result`
--

INSERT INTO `b_form_result` (`ID`, `TIMESTAMP_X`, `DATE_CREATE`, `STATUS_ID`, `FORM_ID`, `USER_ID`, `USER_AUTH`, `STAT_GUEST_ID`, `STAT_SESSION_ID`, `SENT_TO_CRM`) VALUES
(1, '2015-06-04 22:33:32', '2015-06-04 22:33:32', 1, 1, 1, 'Y', 0, 0, 'N'),
(2, '2015-06-04 22:33:57', '2015-06-04 22:33:57', 1, 1, 1, 'Y', 0, 0, 'N'),
(3, '2015-06-04 22:45:42', '2015-06-04 22:45:42', 1, 1, 0, 'N', 0, 0, 'N');

-- --------------------------------------------------------

--
-- Структура таблицы `b_form_result_answer`
--

CREATE TABLE IF NOT EXISTS `b_form_result_answer` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `RESULT_ID` int(18) NOT NULL DEFAULT '0',
  `FORM_ID` int(18) NOT NULL DEFAULT '0',
  `FIELD_ID` int(18) NOT NULL DEFAULT '0',
  `ANSWER_ID` int(18) DEFAULT NULL,
  `ANSWER_TEXT` text COLLATE utf8_unicode_ci,
  `ANSWER_TEXT_SEARCH` longtext COLLATE utf8_unicode_ci,
  `ANSWER_VALUE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ANSWER_VALUE_SEARCH` longtext COLLATE utf8_unicode_ci,
  `USER_TEXT` longtext COLLATE utf8_unicode_ci,
  `USER_TEXT_SEARCH` longtext COLLATE utf8_unicode_ci,
  `USER_DATE` datetime DEFAULT NULL,
  `USER_FILE_ID` int(18) DEFAULT NULL,
  `USER_FILE_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `USER_FILE_IS_IMAGE` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `USER_FILE_HASH` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `USER_FILE_SUFFIX` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `USER_FILE_SIZE` int(18) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_RESULT_ID` (`RESULT_ID`),
  KEY `IX_FIELD_ID` (`FIELD_ID`),
  KEY `IX_ANSWER_ID` (`ANSWER_ID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=13 ;

--
-- Дамп данных таблицы `b_form_result_answer`
--

INSERT INTO `b_form_result_answer` (`ID`, `RESULT_ID`, `FORM_ID`, `FIELD_ID`, `ANSWER_ID`, `ANSWER_TEXT`, `ANSWER_TEXT_SEARCH`, `ANSWER_VALUE`, `ANSWER_VALUE_SEARCH`, `USER_TEXT`, `USER_TEXT_SEARCH`, `USER_DATE`, `USER_FILE_ID`, `USER_FILE_NAME`, `USER_FILE_IS_IMAGE`, `USER_FILE_HASH`, `USER_FILE_SUFFIX`, `USER_FILE_SIZE`) VALUES
(1, 1, 1, 2, 2, ' ', NULL, '', NULL, 'Антон', 'АНТОН', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, 1, 1, 3, 3, ' ', NULL, '', NULL, 'diy9@mail.ru', 'DIY9@MAIL.RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3, 1, 1, 4, 4, ' ', NULL, '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4, 1, 1, 5, 5, ' ', NULL, '', NULL, 'test test', 'TEST TEST', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(5, 2, 1, 2, 2, ' ', NULL, '', NULL, 'Антон', 'АНТОН', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(6, 2, 1, 3, 3, ' ', NULL, '', NULL, 'diy9@mail.ru', 'DIY9@MAIL.RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(7, 2, 1, 4, 4, ' ', NULL, '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(8, 2, 1, 5, 5, ' ', NULL, '', NULL, 'test test', 'TEST TEST', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(9, 3, 1, 2, 2, ' ', NULL, '', NULL, 'Test', 'TEST', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(10, 3, 1, 3, 3, ' ', NULL, '', NULL, 'test@mail.ru', 'TEST@MAIL.RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(11, 3, 1, 4, 4, ' ', NULL, '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(12, 3, 1, 5, 5, ' ', NULL, '', NULL, 'test test', 'TEST TEST', NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `b_form_status`
--

CREATE TABLE IF NOT EXISTS `b_form_status` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `FORM_ID` int(18) NOT NULL DEFAULT '0',
  `TIMESTAMP_X` datetime DEFAULT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `C_SORT` int(18) NOT NULL DEFAULT '100',
  `TITLE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `DESCRIPTION` text COLLATE utf8_unicode_ci,
  `DEFAULT_VALUE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `CSS` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'statusgreen',
  `HANDLER_OUT` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `HANDLER_IN` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MAIL_EVENT_TYPE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_FORM_ID` (`FORM_ID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Дамп данных таблицы `b_form_status`
--

INSERT INTO `b_form_status` (`ID`, `FORM_ID`, `TIMESTAMP_X`, `ACTIVE`, `C_SORT`, `TITLE`, `DESCRIPTION`, `DEFAULT_VALUE`, `CSS`, `HANDLER_OUT`, `HANDLER_IN`, `MAIL_EVENT_TYPE`) VALUES
(1, 1, '2015-06-04 01:02:44', 'Y', 100, 'DEFAULT', 'DEFAULT', 'Y', 'statusgreen', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `b_form_status_2_group`
--

CREATE TABLE IF NOT EXISTS `b_form_status_2_group` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `STATUS_ID` int(18) NOT NULL DEFAULT '0',
  `GROUP_ID` int(18) NOT NULL DEFAULT '0',
  `PERMISSION` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_FORM_STATUS_GROUP` (`STATUS_ID`,`GROUP_ID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

--
-- Дамп данных таблицы `b_form_status_2_group`
--

INSERT INTO `b_form_status_2_group` (`ID`, `STATUS_ID`, `GROUP_ID`, `PERMISSION`) VALUES
(1, 1, 0, 'VIEW'),
(2, 1, 0, 'MOVE'),
(3, 1, 0, 'EDIT'),
(4, 1, 0, 'DELETE');

-- --------------------------------------------------------

--
-- Структура таблицы `b_form_status_2_mail_template`
--

CREATE TABLE IF NOT EXISTS `b_form_status_2_mail_template` (
  `STATUS_ID` int(18) NOT NULL DEFAULT '0',
  `MAIL_TEMPLATE_ID` int(18) NOT NULL DEFAULT '0',
  PRIMARY KEY (`STATUS_ID`,`MAIL_TEMPLATE_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_forum`
--

CREATE TABLE IF NOT EXISTS `b_forum` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `FORUM_GROUP_ID` int(11) DEFAULT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `DESCRIPTION` text COLLATE utf8_unicode_ci,
  `SORT` int(10) NOT NULL DEFAULT '150',
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `ALLOW_HTML` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `ALLOW_ANCHOR` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `ALLOW_BIU` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `ALLOW_IMG` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `ALLOW_VIDEO` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `ALLOW_LIST` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `ALLOW_QUOTE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `ALLOW_CODE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `ALLOW_FONT` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `ALLOW_SMILES` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `ALLOW_UPLOAD` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `ALLOW_TABLE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `ALLOW_ALIGN` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `ALLOW_UPLOAD_EXT` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ALLOW_MOVE_TOPIC` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `ALLOW_TOPIC_TITLED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `ALLOW_NL2BR` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `ALLOW_SIGNATURE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `PATH2FORUM_MESSAGE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ASK_GUEST_EMAIL` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `USE_CAPTCHA` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `INDEXATION` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `DEDUPLICATION` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `MODERATION` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `ORDER_BY` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'P',
  `ORDER_DIRECTION` varchar(4) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'DESC',
  `LID` char(2) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'ru',
  `TOPICS` int(11) NOT NULL DEFAULT '0',
  `POSTS` int(11) NOT NULL DEFAULT '0',
  `LAST_POSTER_ID` int(11) DEFAULT NULL,
  `LAST_POSTER_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LAST_POST_DATE` datetime DEFAULT NULL,
  `LAST_MESSAGE_ID` bigint(20) DEFAULT NULL,
  `POSTS_UNAPPROVED` int(11) DEFAULT '0',
  `ABS_LAST_POSTER_ID` int(11) DEFAULT NULL,
  `ABS_LAST_POSTER_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ABS_LAST_POST_DATE` datetime DEFAULT NULL,
  `ABS_LAST_MESSAGE_ID` bigint(20) DEFAULT NULL,
  `EVENT1` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'forum',
  `EVENT2` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'message',
  `EVENT3` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `HTML` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `XML_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_FORUM_SORT` (`SORT`),
  KEY `IX_FORUM_ACTIVE` (`ACTIVE`),
  KEY `IX_FORUM_GROUP_ID` (`FORUM_GROUP_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `b_forum2site`
--

CREATE TABLE IF NOT EXISTS `b_forum2site` (
  `FORUM_ID` int(11) NOT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `PATH2FORUM_MESSAGE` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`FORUM_ID`,`SITE_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_forum_dictionary`
--

CREATE TABLE IF NOT EXISTS `b_forum_dictionary` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TITLE` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TYPE` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

--
-- Дамп данных таблицы `b_forum_dictionary`
--

INSERT INTO `b_forum_dictionary` (`ID`, `TITLE`, `TYPE`) VALUES
(1, '[ru] Словарь слов', 'W'),
(2, '[ru] Словарь транслита', 'T'),
(3, '[en] Bad words', 'W'),
(4, '[en] Transliteration', 'T');

-- --------------------------------------------------------

--
-- Структура таблицы `b_forum_email`
--

CREATE TABLE IF NOT EXISTS `b_forum_email` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `EMAIL_FORUM_ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `FORUM_ID` int(11) NOT NULL,
  `SOCNET_GROUP_ID` int(11) DEFAULT NULL,
  `MAIL_FILTER_ID` int(11) NOT NULL,
  `EMAIL` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `USE_EMAIL` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `EMAIL_GROUP` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SUBJECT_SUF` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `USE_SUBJECT` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `URL_TEMPLATES_MESSAGE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `NOT_MEMBER_POST` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_FORUM_EMAIL_FORUM_SOC` (`FORUM_ID`,`SOCNET_GROUP_ID`),
  KEY `IX_B_FORUM_EMAIL_FILTER_ID` (`MAIL_FILTER_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `b_forum_file`
--

CREATE TABLE IF NOT EXISTS `b_forum_file` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `FORUM_ID` int(18) DEFAULT NULL,
  `TOPIC_ID` int(20) DEFAULT NULL,
  `MESSAGE_ID` int(20) DEFAULT NULL,
  `FILE_ID` int(18) NOT NULL,
  `USER_ID` int(18) DEFAULT NULL,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `HITS` int(18) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_FORUM_FILE_FILE` (`FILE_ID`),
  KEY `IX_FORUM_FILE_FORUM` (`FORUM_ID`),
  KEY `IX_FORUM_FILE_TOPIC` (`TOPIC_ID`),
  KEY `IX_FORUM_FILE_MESSAGE` (`MESSAGE_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `b_forum_filter`
--

CREATE TABLE IF NOT EXISTS `b_forum_filter` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DICTIONARY_ID` int(11) DEFAULT NULL,
  `WORDS` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PATTERN` text COLLATE utf8_unicode_ci,
  `REPLACEMENT` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DESCRIPTION` text COLLATE utf8_unicode_ci,
  `USE_IT` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PATTERN_CREATE` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_FORUM_FILTER_2` (`USE_IT`),
  KEY `IX_B_FORUM_FILTER_3` (`PATTERN_CREATE`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=152 ;

--
-- Дамп данных таблицы `b_forum_filter`
--

INSERT INTO `b_forum_filter` (`ID`, `DICTIONARY_ID`, `WORDS`, `PATTERN`, `REPLACEMENT`, `DESCRIPTION`, `USE_IT`, `PATTERN_CREATE`) VALUES
(1, 1, '*пизд*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])([^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*([ПпPp]+)([ИиIi]+)([ЗзZz3]+)([ДдDd]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(2, 1, '*пизж*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])([^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*([ПпPp]+)([ИиIi]+)([ЗзZz3]+)([ЖжGg]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(3, 1, '*сра%', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])([^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*([СсCc]+)([РрPpRr]+)([АаAa]+)([[Цц]+([Аа]+|[Оо]+)]+|[[Тт]+([Ьь]+|)[Сс]+[Яя]+]+))(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(4, 1, 'анобляд*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([АаAa]+)([НнNn]+)([ОоOo]+)([БбBb]+)([ЛлLl]+)([Яя]+)([ДдDd]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(5, 1, 'взъеб*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвVv]+)([ЗзZz3]+)([ЪъЬь"'']+|)([ЁёЕеEe]+)([БбBb]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(6, 1, 'бля', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([БбBb]+)([ЛлLl]+)([Яя]+))(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(7, 1, 'долбоеб*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ДдDd]+)([ОоOo]+)([ЛлLl]+)([БбBb]+)([ОоOo]+)([ЁёЕеEe]+)([БбBb]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(8, 1, 'дуроеб*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ДдDd]+)([УуUu]+)([РрPpRr]+)([ОоOo]+)([ЁёЕеEe]+)([БбBb]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(9, 1, 'еби', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ЁёЕеEe]+)([БбBb]+)([ИиIi]+))(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(10, 1, 'ебисти*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ЁёЕеEe]+)([БбBb]+)([ИиIi]+)([СсCc]+)([ТтTt]+)([ИиIi]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(11, 1, 'ебическ*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ЁёЕеEe]+)([БбBb]+)([ИиIi]+)([Чч]+)([ЁёЕеEe]+)([СсCc]+)([КкKk]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(12, 1, 'еблив*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ЁёЕеEe]+)([БбBb]+)([ЛлLl]+)([ИиIi]+)([ВвVv]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(13, 1, 'ебло*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ЁёЕеEe]+)([БбBb]+)([ЛлLl]+)([ОоOo]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(14, 1, 'еблыс*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ЁёЕеEe]+)([БбBb]+)([ЛлLl]+)([Ыы]+)([СсCc]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(15, 1, 'ебля', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ЁёЕеEe]+)([БбBb]+)([ЛлLl]+)([Яя]+))(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(16, 1, 'ебс', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ЁёЕеEe]+)([БбBb]+)([СсCc]+))(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(17, 1, 'ебукент*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ЁёЕеEe]+)([БбBb]+)([УуUu]+)([КкKk]+)([ЁёЕеEe]+)([НнNn]+)([ТтTt]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(18, 1, 'ебурген*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ЁёЕеEe]+)([БбBb]+)([УуUu]+)([РрPpRr]+)([Гг]+)([ЁёЕеEe]+)([НнNn]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(19, 1, 'коноебит*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([КкKk]+)([ОоOo]+)([НнNn]+)([ОоOo]+)([ЁёЕеEe]+)([БбBb]+)([ИиIi]+)([ТтTt]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(20, 1, 'мозгоеб*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([МмMm]+)([ОоOo]+)([ЗзZz3]+)([Гг]+)([ОоOo]+)([ЁёЕеEe]+)([БбBb]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(21, 1, 'мудоеб*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([МмMm]+)([УуUu]+)([ДдDd]+)([ОоOo]+)([ЁёЕеEe]+)([БбBb]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(22, 1, 'однохуйствен*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ОоOo]+)([ДдDd]+)([НнNn]+)([ОоOo]+)([ХхXx]+)([УуUu]+)([ЙйИиYy]+)([СсCc]+)([ТтTt]+)([ВвVv]+)([ЁёЕеEe]+)([НнNn]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(23, 1, 'охуе*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ОоOo]+)([ХхXx]+)([УуUu]+)([ЁёЕеEe]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(24, 1, 'охуи*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ОоOo]+)([ХхXx]+)([УуUu]+)([ИиIi]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(25, 1, 'охуя*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ОоOo]+)([ХхXx]+)([УуUu]+)([Яя]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(26, 1, 'разъеба*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([РрPpRr]+)([АаAa]+)([ЗзZz3]+)([ЪъЬь"'']+|)([ЁёЕеEe]+)([БбBb]+)([АаAa]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(27, 1, 'распиздон*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([РрPpRr]+)([АаAa]+)([СсCc]+)([ПпPp]+)([ИиIi]+)([ЗзZz3]+)([ДдDd]+)([ОоOo]+)([НнNn]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(28, 1, 'расхуюж*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([РрPpRr]+)([АаAa]+)([СсCc]+)([ХхXx]+)([УуUu]+)([Юю]+|[[Йй]+[Оо]+]+)([ЖжGg]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(29, 1, 'худоебин*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ХхXx]+)([УуUu]+)([ДдDd]+)([ОоOo]+)([ЁёЕеEe]+)([БбBb]+)([ИиIi]+)([НнNn]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(30, 1, 'хуе', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ХхXx]+)([УуUu]+)([ЁёЕеEe]+))(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(31, 1, 'хуебрат*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ХхXx]+)([УуUu]+)([ЁёЕеEe]+)([БбBb]+)([РрPpRr]+)([АаAa]+)([ТтTt]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(32, 1, 'хуеглот*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ХхXx]+)([УуUu]+)([ЁёЕеEe]+)([Гг]+)([ЛлLl]+)([ОоOo]+)([ТтTt]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(33, 1, 'хуеплёт*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ХхXx]+)([УуUu]+)([ЁёЕеEe]+)([ПпPp]+)([ЛлLl]+)([ЁёЕеEe]+|[[Йй]+[Оо]+]+)([ТтTt]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(34, 1, 'хует*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ХхXx]+)([УуUu]+)([ЁёЕеEe]+)([ТтTt]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(35, 1, 'хуила', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ХхXx]+)([УуUu]+)([ИиIi]+)([ЛлLl]+)([АаAa]+))(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(36, 1, 'хул?', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ХхXx]+)([УуUu]+)([ЛлLl]+).?)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(37, 1, 'хуя', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ХхXx]+)([УуUu]+)([Яя]+))(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(38, 1, '^бляд*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвЗзСс]+|[ВвЫы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)+|)([БбBb]+)([ЛлLl]+)([Яя]+)([ДдDd]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(39, 1, '^пидор*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвЗзСс]+|[ВвЫы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)+|)([ПпPp]+)([ИиIi]+)([ДдDd]+)([ОоOo]+)([РрPpRr]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(40, 1, '^хуев*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвЗзСс]+|[ВвЫы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)+|)([ХхXx]+)([УуUu]+)([ЁёЕеEe]+)([ВвVv]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(41, 1, '^хуем*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвЗзСс]+|[ВвЫы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)+|)([ХхXx]+)([УуUu]+)([ЁёЕеEe]+)([МмMm]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(42, 1, '^хуй*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвЗзСс]+|[ВвЫы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)+|)([ХхXx]+)([УуUu]+)([ЙйИиYy]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(43, 1, '^хуяк*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвЗзСс]+|[ВвЫы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)+|)([ХхXx]+)([УуUu]+)([Яя]+)([КкKk]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(44, 1, '^хуям*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвЗзСс]+|[ВвЫы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)+|)([ХхXx]+)([УуUu]+)([Яя]+)([МмMm]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(45, 1, '^хуяр*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвЗзСс]+|[ВвЫы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)+|)([ХхXx]+)([УуUu]+)([Яя]+)([РрPpRr]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(46, 1, '^хуяч*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвЗзСс]+|[ВвЫы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)+|)([ХхXx]+)([УуUu]+)([Яя]+)([Чч]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(47, 1, '^ъебал*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвЗзСс]+|[ВвЫы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)+|)([ЪъЬь"'']+|)([ЁёЕеEe]+)([БбBb]+)([АаAa]+)([ЛлLl]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(48, 1, '^ъебан*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвЗзСс]+|[ВвЫы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)+|)([ЪъЬь"'']+|)([ЁёЕеEe]+)([БбBb]+)([АаAa]+)([НнNn]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(49, 1, '^ъебар*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвЗзСс]+|[ВвЫы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)+|)([ЪъЬь"'']+|)([ЁёЕеEe]+)([БбBb]+)([АаAa]+)([РрPpRr]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(50, 1, '^ъебат*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвЗзСс]+|[ВвЫы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)+|)([ЪъЬь"'']+|)([ЁёЕеEe]+)([БбBb]+)([АаAa]+)([ТтTt]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(51, 1, '^ъебен*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвЗзСс]+|[ВвЫы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)+|)([ЪъЬь"'']+|)([ЁёЕеEe]+)([БбBb]+)([ЁёЕеEe]+)([НнNn]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(52, 1, '^ъеби', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвЗзСс]+|[ВвЫы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)+|)([ЪъЬь"'']+|)([ЁёЕеEe]+)([БбBb]+)([ИиIi]+))(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(53, 1, '^ъебис*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвЗзСс]+|[ВвЫы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)+|)([ЪъЬь"'']+|)([ЁёЕеEe]+)([БбBb]+)([ИиIi]+)([СсCc]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(54, 1, '^ъебит*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвЗзСс]+|[ВвЫы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)+|)([ЪъЬь"'']+|)([ЁёЕеEe]+)([БбBb]+)([ИиIi]+)([ТтTt]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(55, 1, '^ъёбля*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвЗзСс]+|[ВвЫы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)+|)([ЪъЬь"'']+|)([ЁёЕеEe]+|[[Йй]+[Оо]+]+)([БбBb]+)([ЛлLl]+)([Яя]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(56, 1, '^ъёбну*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвЗзСс]+|[ВвЫы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)+|)([ЪъЬь"'']+|)([ЁёЕеEe]+|[[Йй]+[Оо]+]+)([БбBb]+)([НнNn]+)([УуUu]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(57, 1, '^ъебу', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвЗзСс]+|[ВвЫы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)+|)([ЪъЬь"'']+|)([ЁёЕеEe]+)([БбBb]+)([УуUu]+))(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(58, 1, '^ъебуч*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвЗзСс]+|[ВвЫы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)+|)([ЪъЬь"'']+|)([ЁёЕеEe]+)([БбBb]+)([УуUu]+)([Чч]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(59, 1, '^ъебыв*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвЗзСс]+|[ВвЫы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)+|)([ЪъЬь"'']+|)([ЁёЕеEe]+)([БбBb]+)([Ыы]+)([ВвVv]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(60, 1, '/(?<=[s.,;:!?-#*|[]()])(?![Вв][ЕеЁё][Бб])(([ВвЗзСс]+|[Ввы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)|)([ЬьЪъ]+|)([ЁёЕеEe]+|[Йй]+[Оо]+|[Yy]+[Oo]+)([BbБб]+))(?=[s.,;:!?-#*|[]()])/is', '', '', '', 'Y', 'PTTRN'),
(61, 3, 'angry', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(a+n+g+r+y+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(62, 3, 'ass', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(a+s+s+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(63, 3, 'asshole', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(a+s+s+h+o+l+e+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(64, 3, 'banger', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(b+a+n+g+e+r+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(65, 3, 'bastard', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(b+a+s+t+a+r+d+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(66, 3, 'batter', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(b+a+t+t+e+r+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(67, 3, 'bicho', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(b+i+c+h+o+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(68, 3, 'bisexual', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(b+i+s+e+x+u+a+l+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(69, 3, 'bitch', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(b+i+t+c+h+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(70, 3, 'blumpkin', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(b+l+u+m+p+k+i+n+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(71, 3, 'booger', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(b+o+o+g+e+r+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(72, 3, 'bugger*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(b+u+g+g+e+r+[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(73, 3, 'bukakke', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(b+u+k+a+k+k+e+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(74, 3, 'bull', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(b+u+l+l+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(75, 3, 'bulldyke', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(b+u+l+l+d+y+k+e+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(76, 3, 'bullshit', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(b+u+l+l+s+h+i+t+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(77, 3, 'bunny', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(b+u+n+n+y+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(78, 3, 'bunnyfuck', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(b+u+n+n+y+f+u+c+k+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(79, 3, 'chocha', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(c+h+o+c+h+a+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(80, 3, 'chode', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(c+h+o+d+e+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(81, 3, 'clap', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(c+l+a+p+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(82, 3, 'coconuts', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(c+o+c+o+n+u+t+s+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(83, 3, 'cohones', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(c+o+h+o+n+e+s+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(84, 3, 'cojones', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(c+o+j+o+n+e+s+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(85, 3, 'coon', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(c+o+o+n+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(86, 3, 'cootch', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(c+o+o+t+c+h+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(87, 3, 'cooter', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(c+o+o+t+e+r+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(88, 3, 'cornhole', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(c+o+r+n+h+o+l+e+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(89, 3, 'cracka', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(c+r+a+c+k+a+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(90, 3, 'crap', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(c+r+a+p+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(91, 3, 'cum', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(c+u+m+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(92, 3, 'cunnilingus', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(c+u+n+n+i+l+i+n+g+u+s+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(93, 3, 'cunt*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(c+u+n+t+[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(94, 3, 'damn*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(d+a+m+n+[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(95, 3, 'dark*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(d+a+r+k+[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(96, 3, 'dick', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(d+i+c+k+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(97, 3, 'dickhead', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(d+i+c+k+h+e+a+d+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(98, 3, 'diddle', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(d+i+d+d+l+e+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(99, 3, 'dildo', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(d+i+l+d+o+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(100, 3, 'dilhole', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(d+i+l+h+o+l+e+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(101, 3, 'dingleberry', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(d+i+n+g+l+e+b+e+r+r+y+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(102, 3, 'doodle', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(d+o+o+d+l+e+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(103, 3, 'dork', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(d+o+r+k+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(104, 3, 'dumpster', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(d+u+m+p+s+t+e+r+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(105, 3, 'faggot', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(f+a+g+g+o+t+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(106, 3, 'fart', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(f+a+r+t+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(107, 3, 'frig', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(f+r+i+g+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(108, 3, 'fuck*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(f+u+c+k+[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(109, 3, 'fucker', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(f+u+c+k+e+r+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(110, 3, 'giz', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(g+i+z+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(111, 3, 'goatse', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(g+o+a+t+s+e+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(112, 3, 'gook', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(g+o+o+k+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(113, 3, 'gringo', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(g+r+i+n+g+o+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(114, 3, 'hobo', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(h+o+b+o+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(115, 3, 'honky', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(h+o+n+k+y+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(116, 3, 'jackass', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(j+a+c+k+a+s+s+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(117, 3, 'jackoff', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(j+a+c+k+o+f+f+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(118, 3, 'jerkoff', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(j+e+r+k+o+f+f+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(119, 3, 'jiggaboo', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(j+i+g+g+a+b+o+o+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(120, 3, 'jizz', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(j+i+z+z+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(121, 3, 'kike', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(k+i+k+e+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(122, 3, 'mayo', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(m+a+y+o+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(123, 3, 'moose', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(m+o+o+s+e+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(124, 3, 'nigg*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(n+i+g+g+[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(125, 3, 'paki', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(p+a+k+i+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(126, 3, 'pecker', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(p+e+c+k+e+r+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(127, 3, 'piss', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(p+i+s+s+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(128, 3, 'poonanni', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(p+o+o+n+a+n+n+i+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(129, 3, 'poontang', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(p+o+o+n+t+a+n+g+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(130, 3, 'prick', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(p+r+i+c+k+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(131, 3, 'punch', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(p+u+n+c+h+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(132, 3, 'queef', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(q+u+e+e+f+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(133, 3, 'rogue', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(r+o+g+u+e+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(134, 3, 'sanchez', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(s+a+n+c+h+e+z+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(135, 3, 'schlong', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(s+c+h+l+o+n+g+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(136, 3, 'shit', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(s+h+i+t+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(137, 3, 'skank', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(s+k+a+n+k+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(138, 3, 'spaz', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(s+p+a+z+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(139, 3, 'spic', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(s+p+i+c+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(140, 3, 'teabag*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(t+e+a+b+a+g+[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(141, 3, 'tits', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(t+i+t+s+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(142, 3, 'twat', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(t+w+a+t+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(143, 3, 'twot', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(t+w+o+t+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(144, 3, 'vart', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(v+a+r+t+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(145, 3, 'wanker', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(w+a+n+k+e+r+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(146, 3, 'waste', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(w+a+s+t+e+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(147, 3, 'wetback', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(w+e+t+b+a+c+k+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(148, 3, 'whore', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(w+h+o+r+e+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(149, 3, 'wigger', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(w+i+g+g+e+r+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(150, 3, 'wog', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(w+o+g+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(151, 3, 'wop', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(w+o+p+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL');

-- --------------------------------------------------------

--
-- Структура таблицы `b_forum_group`
--

CREATE TABLE IF NOT EXISTS `b_forum_group` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SORT` int(11) NOT NULL DEFAULT '150',
  `PARENT_ID` int(11) DEFAULT NULL,
  `LEFT_MARGIN` int(11) DEFAULT NULL,
  `RIGHT_MARGIN` int(11) DEFAULT NULL,
  `DEPTH_LEVEL` int(11) DEFAULT NULL,
  `XML_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `b_forum_group_lang`
--

CREATE TABLE IF NOT EXISTS `b_forum_group_lang` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `FORUM_GROUP_ID` int(11) NOT NULL,
  `LID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `DESCRIPTION` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UX_FORUM_GROUP` (`FORUM_GROUP_ID`,`LID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `b_forum_letter`
--

CREATE TABLE IF NOT EXISTS `b_forum_letter` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DICTIONARY_ID` int(11) DEFAULT '0',
  `LETTER` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `REPLACEMENT` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=38 ;

--
-- Дамп данных таблицы `b_forum_letter`
--

INSERT INTO `b_forum_letter` (`ID`, `DICTIONARY_ID`, `LETTER`, `REPLACEMENT`) VALUES
(1, 2, 'а', 'АаAa'),
(2, 2, 'б', 'БбBb'),
(3, 2, 'в', 'ВвVv'),
(4, 2, 'г', 'Гг'),
(5, 2, 'д', 'ДдDd'),
(6, 2, 'е', 'ЁёЕеEe'),
(7, 2, 'ё', 'ЁёЕеEe, [Йй]+[Оо]+'),
(8, 2, 'ж', 'ЖжGg'),
(9, 2, 'з', 'ЗзZz3'),
(10, 2, 'и', 'ИиIi'),
(11, 2, 'й', 'ЙйИиYy'),
(12, 2, 'к', 'КкKk'),
(13, 2, 'л', 'ЛлLl'),
(14, 2, 'м', 'МмMm'),
(15, 2, 'н', 'НнNn'),
(16, 2, 'о', 'ОоOo'),
(17, 2, 'п', 'ПпPp'),
(18, 2, 'р', 'РрPpRr'),
(19, 2, 'с', 'СсCc'),
(20, 2, 'т', 'ТтTt'),
(21, 2, 'у', 'УуUu'),
(22, 2, 'ф', 'ФфFf'),
(23, 2, 'х', 'ХхXx'),
(24, 2, 'ц', 'ЦцCc'),
(25, 2, 'ч', 'Чч'),
(26, 2, 'ш', 'Шш'),
(27, 2, 'щ', 'Щщ'),
(28, 2, 'ь', 'ЪъЬь"'','),
(29, 2, 'ы', 'Ыы'),
(30, 2, 'ъ', 'ЪъЬь"'','),
(31, 2, 'э', 'Ээ'),
(32, 2, 'ю', 'Юю, [Йй]+[Оо]+'),
(33, 2, 'я', 'Яя'),
(34, 2, '%', '[Цц]+([Аа]+|[Оо]+), [Тт]+([Ьь]+|)[Сс]+[Яя]+'),
(35, 2, '^', ',ВвЗзСс,ВвЫы,ДдОо,ЗзАа,ИиЗзСс,НнАа,НнЕе,ОоТт,([Пп]*[Ее]+[Рр]+[Ее]+)'),
(36, 2, 'тся', '%'),
(37, 2, 'ться', '%');

-- --------------------------------------------------------

--
-- Структура таблицы `b_forum_message`
--

CREATE TABLE IF NOT EXISTS `b_forum_message` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `FORUM_ID` int(10) NOT NULL,
  `TOPIC_ID` bigint(20) NOT NULL,
  `USE_SMILES` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `NEW_TOPIC` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `APPROVED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `SOURCE_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'WEB',
  `POST_DATE` datetime NOT NULL,
  `POST_MESSAGE` text COLLATE utf8_unicode_ci,
  `POST_MESSAGE_HTML` text COLLATE utf8_unicode_ci,
  `POST_MESSAGE_FILTER` text COLLATE utf8_unicode_ci,
  `POST_MESSAGE_CHECK` char(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ATTACH_IMG` int(11) DEFAULT NULL,
  `PARAM1` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PARAM2` int(11) DEFAULT NULL,
  `AUTHOR_ID` int(10) DEFAULT NULL,
  `AUTHOR_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `AUTHOR_EMAIL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `AUTHOR_IP` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `AUTHOR_REAL_IP` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `GUEST_ID` int(10) DEFAULT NULL,
  `EDITOR_ID` int(10) DEFAULT NULL,
  `EDITOR_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `EDITOR_EMAIL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `EDIT_REASON` text COLLATE utf8_unicode_ci,
  `EDIT_DATE` datetime DEFAULT NULL,
  `XML_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `HTML` text COLLATE utf8_unicode_ci,
  `MAIL_HEADER` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`),
  KEY `IX_FORUM_MESSAGE_FORUM` (`FORUM_ID`,`APPROVED`),
  KEY `IX_FORUM_MESSAGE_TOPIC` (`TOPIC_ID`,`APPROVED`,`ID`),
  KEY `IX_FORUM_MESSAGE_AUTHOR` (`AUTHOR_ID`,`APPROVED`,`FORUM_ID`,`ID`),
  KEY `IX_FORUM_MESSAGE_APPROVED` (`APPROVED`),
  KEY `IX_FORUM_MESSAGE_PARAM2` (`PARAM2`),
  KEY `IX_FORUM_MESSAGE_XML_ID` (`XML_ID`),
  KEY `IX_FORUM_MESSAGE_DATE_AUTHOR_ID` (`POST_DATE`,`AUTHOR_ID`),
  KEY `IX_FORUM_MESSAGE_AUTHOR_TOPIC_ID` (`AUTHOR_ID`,`TOPIC_ID`,`ID`),
  KEY `IX_FORUM_MESSAGE_AUTHOR_FORUM_ID` (`AUTHOR_ID`,`FORUM_ID`,`ID`,`APPROVED`,`TOPIC_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `b_forum_perms`
--

CREATE TABLE IF NOT EXISTS `b_forum_perms` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `FORUM_ID` int(11) NOT NULL,
  `GROUP_ID` int(11) NOT NULL,
  `PERMISSION` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'M',
  PRIMARY KEY (`ID`),
  KEY `IX_FORUM_PERMS_FORUM` (`FORUM_ID`,`GROUP_ID`),
  KEY `IX_FORUM_PERMS_GROUP` (`GROUP_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `b_forum_pm_folder`
--

CREATE TABLE IF NOT EXISTS `b_forum_pm_folder` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TITLE` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `USER_ID` int(11) NOT NULL,
  `SORT` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_FORUM_PM_FOLDER_USER_IST` (`USER_ID`,`ID`,`SORT`,`TITLE`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

--
-- Дамп данных таблицы `b_forum_pm_folder`
--

INSERT INTO `b_forum_pm_folder` (`ID`, `TITLE`, `USER_ID`, `SORT`) VALUES
(1, 'SYSTEM_FOLDER_1', 0, 0),
(2, 'SYSTEM_FOLDER_2', 0, 0),
(3, 'SYSTEM_FOLDER_3', 0, 0),
(4, 'SYSTEM_FOLDER_4', 0, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `b_forum_points`
--

CREATE TABLE IF NOT EXISTS `b_forum_points` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `MIN_POINTS` int(11) NOT NULL,
  `CODE` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `VOTES` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UX_FORUM_P_MP` (`MIN_POINTS`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `b_forum_points2post`
--

CREATE TABLE IF NOT EXISTS `b_forum_points2post` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `MIN_NUM_POSTS` int(11) NOT NULL,
  `POINTS_PER_POST` decimal(18,4) NOT NULL DEFAULT '0.0000',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UX_FORUM_P2P_MNP` (`MIN_NUM_POSTS`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `b_forum_points_lang`
--

CREATE TABLE IF NOT EXISTS `b_forum_points_lang` (
  `POINTS_ID` int(11) NOT NULL,
  `LID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`POINTS_ID`,`LID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_forum_private_message`
--

CREATE TABLE IF NOT EXISTS `b_forum_private_message` (
  `ID` bigint(10) NOT NULL AUTO_INCREMENT,
  `AUTHOR_ID` int(11) DEFAULT '0',
  `RECIPIENT_ID` int(11) DEFAULT '0',
  `POST_DATE` datetime NOT NULL,
  `POST_SUBJ` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `POST_MESSAGE` text COLLATE utf8_unicode_ci NOT NULL,
  `USER_ID` int(11) NOT NULL,
  `FOLDER_ID` int(11) NOT NULL,
  `IS_READ` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `REQUEST_IS_READ` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `USE_SMILES` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_FORUM_PM_USER` (`USER_ID`),
  KEY `IX_B_FORUM_PM_AFR` (`AUTHOR_ID`,`FOLDER_ID`,`IS_READ`),
  KEY `IX_B_FORUM_PM_UFP` (`USER_ID`,`FOLDER_ID`,`POST_DATE`),
  KEY `IX_B_FORUM_PM_POST_DATE` (`POST_DATE`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `b_forum_rank`
--

CREATE TABLE IF NOT EXISTS `b_forum_rank` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `CODE` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MIN_NUM_POSTS` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `b_forum_rank_lang`
--

CREATE TABLE IF NOT EXISTS `b_forum_rank_lang` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RANK_ID` int(11) NOT NULL,
  `LID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UX_FORUM_RANK` (`RANK_ID`,`LID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `b_forum_smile`
--

CREATE TABLE IF NOT EXISTS `b_forum_smile` (
  `ID` smallint(3) NOT NULL AUTO_INCREMENT,
  `TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'S',
  `TYPING` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `IMAGE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `DESCRIPTION` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CLICKABLE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `SORT` int(10) NOT NULL DEFAULT '150',
  `IMAGE_WIDTH` int(11) NOT NULL DEFAULT '0',
  `IMAGE_HEIGHT` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=90 ;

--
-- Дамп данных таблицы `b_forum_smile`
--

INSERT INTO `b_forum_smile` (`ID`, `TYPE`, `TYPING`, `IMAGE`, `DESCRIPTION`, `CLICKABLE`, `SORT`, `IMAGE_WIDTH`, `IMAGE_HEIGHT`) VALUES
(68, 'S', ':D :-D', 'icon_biggrin.png', 'FICON_BIGGRIN', 'N', 30, 16, 16),
(69, 'S', ':) :-)', 'icon_smile.png', 'FICON_SMILE', 'N', 10, 16, 16),
(70, 'S', ':( :-(', 'icon_sad.png', 'FICON_SAD', 'N', 50, 16, 16),
(71, 'S', ':o :-o :shock:', 'icon_eek.png', 'FICON_EEK', 'N', 90, 16, 16),
(72, 'S', '8) 8-)', 'icon_cool.png', 'FICON_COOL', 'N', 40, 16, 16),
(73, 'S', ':{} :-{}', 'icon_kiss.png', 'FICON_KISS', 'N', 110, 16, 16),
(74, 'S', ':oops:', 'icon_redface.png', 'FICON_REDFACE', 'Y', 100, 16, 16),
(75, 'S', ':cry: :~(', 'icon_cry.png', 'FICON_CRY', 'Y', 70, 16, 16),
(76, 'S', ':evil: >:-<', 'icon_evil.png', 'FICON_EVIL', 'N', 80, 16, 16),
(77, 'S', ';) ;-)', 'icon_wink.png', 'FICON_WINK', 'N', 20, 16, 16),
(78, 'S', ':!:', 'icon_exclaim.png', 'FICON_EXCLAIM', 'Y', 130, 16, 16),
(79, 'S', ':?:', 'icon_question.png', 'FICON_QUESTION', 'Y', 120, 16, 16),
(80, 'S', ':idea:', 'icon_idea.png', 'FICON_IDEA', 'Y', 140, 16, 16),
(81, 'S', ':| :-|', 'icon_neutral.png', 'FICON_NEUTRAL', 'N', 60, 16, 16),
(82, 'S', ':\\  :-\\  :/ :-/', 'icon_confuse.png', 'FICON_CONFUSE', 'N', 60, 16, 16),
(83, 'I', '', 'icon1.gif', 'FICON_NOTE', 'Y', 150, 15, 15),
(84, 'I', '', 'icon2.gif', 'FICON_DIRRECTION', 'Y', 150, 15, 15),
(85, 'I', '', 'icon3.gif', 'FICON_IDEA2', 'Y', 150, 15, 15),
(86, 'I', '', 'icon4.gif', 'FICON_ATTANSION', 'Y', 150, 15, 15),
(87, 'I', '', 'icon5.gif', 'FICON_QUESTION2', 'Y', 150, 15, 15),
(88, 'I', '', 'icon6.gif', 'FICON_BAD', 'Y', 150, 15, 15),
(89, 'I', '', 'icon7.gif', 'FICON_GOOD', 'Y', 150, 15, 15);

-- --------------------------------------------------------

--
-- Структура таблицы `b_forum_smile_lang`
--

CREATE TABLE IF NOT EXISTS `b_forum_smile_lang` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SMILE_ID` int(11) NOT NULL,
  `LID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UX_FORUM_SMILE_K` (`SMILE_ID`,`LID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=45 ;

--
-- Дамп данных таблицы `b_forum_smile_lang`
--

INSERT INTO `b_forum_smile_lang` (`ID`, `SMILE_ID`, `LID`, `NAME`) VALUES
(1, 68, 'ru', 'Широкая улыбка'),
(2, 69, 'ru', 'С улыбкой'),
(3, 70, 'ru', 'Печально'),
(4, 71, 'ru', 'Удивленно'),
(5, 72, 'ru', 'Здорово'),
(6, 73, 'ru', 'Поцелуй'),
(7, 74, 'ru', 'Смущенно'),
(8, 75, 'ru', 'Очень грустно'),
(9, 76, 'ru', 'Со злостью'),
(10, 77, 'ru', 'Шутливо'),
(11, 78, 'ru', 'Восклицание'),
(12, 79, 'ru', 'Вопрос'),
(13, 80, 'ru', 'Идея'),
(14, 81, 'ru', 'Нет слов'),
(15, 82, 'ru', 'Озадаченно'),
(16, 83, 'ru', 'Заметка'),
(17, 84, 'ru', 'Направление'),
(18, 85, 'ru', 'Идея'),
(19, 86, 'ru', 'Внимание'),
(20, 87, 'ru', 'Вопрос'),
(21, 88, 'ru', 'Плохо'),
(22, 89, 'ru', 'Хорошо'),
(23, 68, 'en', 'Big grin'),
(24, 69, 'en', 'Smile'),
(25, 70, 'en', 'Sad'),
(26, 71, 'en', 'Surprised'),
(27, 72, 'en', 'Cool'),
(28, 73, 'en', 'Kiss'),
(29, 74, 'en', 'Embaressed'),
(30, 75, 'en', 'Crying'),
(31, 79, 'en', 'Question'),
(32, 78, 'en', 'Exclamation'),
(33, 77, 'en', 'Wink'),
(34, 76, 'en', 'Angry'),
(35, 80, 'en', 'Idea'),
(36, 81, 'en', 'Speechless'),
(37, 82, 'en', 'Skeptical'),
(38, 83, 'en', 'Note'),
(39, 84, 'en', 'Direction'),
(40, 85, 'en', 'Idea'),
(41, 86, 'en', 'Attention'),
(42, 87, 'en', 'Question'),
(43, 88, 'en', 'Thumbs Down'),
(44, 89, 'en', 'Thumbs Up');

-- --------------------------------------------------------

--
-- Структура таблицы `b_forum_stat`
--

CREATE TABLE IF NOT EXISTS `b_forum_stat` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(10) DEFAULT NULL,
  `IP_ADDRESS` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PHPSESSID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LAST_VISIT` datetime DEFAULT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FORUM_ID` smallint(5) NOT NULL DEFAULT '0',
  `TOPIC_ID` int(10) DEFAULT NULL,
  `SHOW_NAME` varchar(101) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_FORUM_STAT_SITE_ID` (`SITE_ID`,`LAST_VISIT`),
  KEY `IX_B_FORUM_STAT_TOPIC_ID` (`TOPIC_ID`,`LAST_VISIT`),
  KEY `IX_B_FORUM_STAT_FORUM_ID` (`FORUM_ID`,`LAST_VISIT`),
  KEY `IX_B_FORUM_STAT_PHPSESSID` (`PHPSESSID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `b_forum_subscribe`
--

CREATE TABLE IF NOT EXISTS `b_forum_subscribe` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(10) NOT NULL,
  `FORUM_ID` int(10) NOT NULL,
  `TOPIC_ID` int(10) DEFAULT NULL,
  `START_DATE` datetime NOT NULL,
  `LAST_SEND` int(10) DEFAULT NULL,
  `NEW_TOPIC_ONLY` char(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'ru',
  `SOCNET_GROUP_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UX_FORUM_SUBSCRIBE_USER` (`USER_ID`,`FORUM_ID`,`TOPIC_ID`,`SOCNET_GROUP_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `b_forum_topic`
--

CREATE TABLE IF NOT EXISTS `b_forum_topic` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `FORUM_ID` int(10) NOT NULL,
  `TOPIC_ID` bigint(20) DEFAULT NULL,
  `TITLE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `TITLE_SEO` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TAGS` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DESCRIPTION` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ICON_ID` tinyint(2) DEFAULT NULL,
  `STATE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `APPROVED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `SORT` int(10) NOT NULL DEFAULT '150',
  `VIEWS` int(10) NOT NULL DEFAULT '0',
  `USER_START_ID` int(10) DEFAULT NULL,
  `USER_START_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `START_DATE` datetime NOT NULL,
  `POSTS` int(10) NOT NULL DEFAULT '0',
  `LAST_POSTER_ID` int(10) DEFAULT NULL,
  `LAST_POSTER_NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `LAST_POST_DATE` datetime NOT NULL,
  `LAST_MESSAGE_ID` bigint(20) DEFAULT NULL,
  `POSTS_UNAPPROVED` int(11) DEFAULT '0',
  `ABS_LAST_POSTER_ID` int(10) DEFAULT NULL,
  `ABS_LAST_POSTER_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ABS_LAST_POST_DATE` datetime DEFAULT NULL,
  `ABS_LAST_MESSAGE_ID` bigint(20) DEFAULT NULL,
  `XML_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `HTML` text COLLATE utf8_unicode_ci,
  `SOCNET_GROUP_ID` int(10) DEFAULT NULL,
  `OWNER_ID` int(10) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_FORUM_TOPIC_FORUM` (`FORUM_ID`,`APPROVED`),
  KEY `IX_FORUM_TOPIC_APPROVED` (`APPROVED`),
  KEY `IX_FORUM_TOPIC_ABS_L_POST_DATE` (`ABS_LAST_POST_DATE`),
  KEY `IX_FORUM_TOPIC_LAST_POST_DATE` (`LAST_POST_DATE`),
  KEY `IX_FORUM_TOPIC_USER_START_ID` (`USER_START_ID`),
  KEY `IX_FORUM_TOPIC_DATE_USER_START_ID` (`START_DATE`,`USER_START_ID`),
  KEY `IX_FORUM_TOPIC_XML_ID` (`XML_ID`),
  KEY `IX_FORUM_TOPIC_TITLE_SEO` (`FORUM_ID`,`TITLE_SEO`),
  KEY `IX_FORUM_TOPIC_TITLE_SEO2` (`TITLE_SEO`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `b_forum_user`
--

CREATE TABLE IF NOT EXISTS `b_forum_user` (
  `ID` bigint(10) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(10) NOT NULL,
  `ALIAS` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DESCRIPTION` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `IP_ADDRESS` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `AVATAR` int(10) DEFAULT NULL,
  `NUM_POSTS` int(10) DEFAULT '0',
  `INTERESTS` text COLLATE utf8_unicode_ci,
  `LAST_POST` int(10) DEFAULT NULL,
  `ALLOW_POST` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `LAST_VISIT` datetime NOT NULL,
  `DATE_REG` date NOT NULL,
  `REAL_IP_ADDRESS` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SIGNATURE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SHOW_NAME` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `RANK_ID` int(11) DEFAULT NULL,
  `POINTS` int(11) NOT NULL DEFAULT '0',
  `HIDE_FROM_ONLINE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `SUBSC_GROUP_MESSAGE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `SUBSC_GET_MY_MESSAGE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IX_FORUM_USER_USER6` (`USER_ID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Дамп данных таблицы `b_forum_user`
--

INSERT INTO `b_forum_user` (`ID`, `USER_ID`, `ALIAS`, `DESCRIPTION`, `IP_ADDRESS`, `AVATAR`, `NUM_POSTS`, `INTERESTS`, `LAST_POST`, `ALLOW_POST`, `LAST_VISIT`, `DATE_REG`, `REAL_IP_ADDRESS`, `SIGNATURE`, `SHOW_NAME`, `RANK_ID`, `POINTS`, `HIDE_FROM_ONLINE`, `SUBSC_GROUP_MESSAGE`, `SUBSC_GET_MY_MESSAGE`) VALUES
(1, 1, NULL, '', NULL, NULL, 0, '', NULL, 'Y', '2015-06-04 21:26:55', '2015-06-04', NULL, '', 'Y', NULL, 0, 'N', 'N', 'N');

-- --------------------------------------------------------

--
-- Структура таблицы `b_forum_user_forum`
--

CREATE TABLE IF NOT EXISTS `b_forum_user_forum` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(11) DEFAULT NULL,
  `FORUM_ID` int(11) DEFAULT NULL,
  `LAST_VISIT` datetime DEFAULT NULL,
  `MAIN_LAST_VISIT` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_FORUM_USER_FORUM_ID1` (`USER_ID`,`FORUM_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `b_forum_user_points`
--

CREATE TABLE IF NOT EXISTS `b_forum_user_points` (
  `FROM_USER_ID` int(11) NOT NULL,
  `TO_USER_ID` int(11) NOT NULL,
  `POINTS` int(11) NOT NULL DEFAULT '0',
  `DATE_UPDATE` datetime DEFAULT NULL,
  PRIMARY KEY (`FROM_USER_ID`,`TO_USER_ID`),
  KEY `IX_B_FORUM_USER_POINTS_TO_USER` (`TO_USER_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_forum_user_topic`
--

CREATE TABLE IF NOT EXISTS `b_forum_user_topic` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `TOPIC_ID` int(11) NOT NULL DEFAULT '0',
  `USER_ID` int(11) NOT NULL DEFAULT '0',
  `FORUM_ID` int(11) DEFAULT NULL,
  `LAST_VISIT` datetime DEFAULT NULL,
  PRIMARY KEY (`TOPIC_ID`,`USER_ID`),
  KEY `ID` (`ID`),
  KEY `IX_B_FORUM_USER_FORUM_ID2` (`USER_ID`,`FORUM_ID`,`TOPIC_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `b_group`
--

CREATE TABLE IF NOT EXISTS `b_group` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `C_SORT` int(18) NOT NULL DEFAULT '100',
  `ANONYMOUS` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `DESCRIPTION` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SECURITY_POLICY` text COLLATE utf8_unicode_ci,
  `STRING_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=6 ;

--
-- Дамп данных таблицы `b_group`
--

INSERT INTO `b_group` (`ID`, `TIMESTAMP_X`, `ACTIVE`, `C_SORT`, `ANONYMOUS`, `NAME`, `DESCRIPTION`, `SECURITY_POLICY`, `STRING_ID`) VALUES
(1, '2015-06-03 18:58:34', 'Y', 1, 'N', 'Администраторы', 'Полный доступ к управлению сайтом.', NULL, NULL),
(2, '2015-06-03 18:58:34', 'Y', 2, 'Y', 'Все пользователи (в том числе неавторизованные)', 'Все пользователи, включая неавторизованных.', NULL, NULL),
(3, '2015-06-03 18:58:34', 'Y', 3, 'N', 'Пользователи, имеющие право голосовать за рейтинг', 'В эту группу пользователи добавляются автоматически.', NULL, 'RATING_VOTE'),
(4, '2015-06-03 18:58:34', 'Y', 4, 'N', 'Пользователи имеющие право голосовать за авторитет', 'В эту группу пользователи добавляются автоматически.', NULL, 'RATING_VOTE_AUTHORITY'),
(5, '2015-06-03 18:59:42', 'Y', 300, 'N', 'Контент-редакторы', NULL, NULL, 'content_editor');

-- --------------------------------------------------------

--
-- Структура таблицы `b_group_collection_task`
--

CREATE TABLE IF NOT EXISTS `b_group_collection_task` (
  `GROUP_ID` int(11) NOT NULL,
  `TASK_ID` int(11) NOT NULL,
  `COLLECTION_ID` int(11) NOT NULL,
  PRIMARY KEY (`GROUP_ID`,`TASK_ID`,`COLLECTION_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_group_subordinate`
--

CREATE TABLE IF NOT EXISTS `b_group_subordinate` (
  `ID` int(18) NOT NULL,
  `AR_SUBGROUP_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_group_task`
--

CREATE TABLE IF NOT EXISTS `b_group_task` (
  `GROUP_ID` int(18) NOT NULL,
  `TASK_ID` int(18) NOT NULL,
  `EXTERNAL_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT '',
  PRIMARY KEY (`GROUP_ID`,`TASK_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `b_group_task`
--

INSERT INTO `b_group_task` (`GROUP_ID`, `TASK_ID`, `EXTERNAL_ID`) VALUES
(5, 44, '');

-- --------------------------------------------------------

--
-- Структура таблицы `b_hlblock_entity`
--

CREATE TABLE IF NOT EXISTS `b_hlblock_entity` (
  `ID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `NAME` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `TABLE_NAME` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `b_hot_keys`
--

CREATE TABLE IF NOT EXISTS `b_hot_keys` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `KEYS_STRING` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `CODE_ID` int(18) NOT NULL,
  `USER_ID` int(18) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ix_b_hot_keys_co_u` (`CODE_ID`,`USER_ID`),
  KEY `ix_hot_keys_code` (`CODE_ID`),
  KEY `ix_hot_keys_user` (`USER_ID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=25 ;

--
-- Дамп данных таблицы `b_hot_keys`
--

INSERT INTO `b_hot_keys` (`ID`, `KEYS_STRING`, `CODE_ID`, `USER_ID`) VALUES
(1, 'Ctrl+Alt+85', 139, 0),
(2, 'Ctrl+Alt+80', 17, 0),
(3, 'Ctrl+Alt+70', 120, 0),
(4, 'Ctrl+Alt+68', 117, 0),
(5, 'Ctrl+Alt+81', 3, 0),
(6, 'Ctrl+Alt+75', 106, 0),
(7, 'Ctrl+Alt+79', 133, 0),
(8, 'Ctrl+Alt+70', 121, 0),
(9, 'Ctrl+Alt+69', 118, 0),
(10, 'Ctrl+Shift+83', 87, 0),
(11, 'Ctrl+Shift+88', 88, 0),
(12, 'Ctrl+Shift+76', 89, 0),
(13, 'Ctrl+Alt+85', 139, 1),
(14, 'Ctrl+Alt+80', 17, 1),
(15, 'Ctrl+Alt+70', 120, 1),
(16, 'Ctrl+Alt+68', 117, 1),
(17, 'Ctrl+Alt+81', 3, 1),
(18, 'Ctrl+Alt+75', 106, 1),
(19, 'Ctrl+Alt+79', 133, 1),
(20, 'Ctrl+Alt+70', 121, 1),
(21, 'Ctrl+Alt+69', 118, 1),
(22, 'Ctrl+Shift+83', 87, 1),
(23, 'Ctrl+Shift+88', 88, 1),
(24, 'Ctrl+Shift+76', 89, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `b_hot_keys_code`
--

CREATE TABLE IF NOT EXISTS `b_hot_keys_code` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `CLASS_NAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CODE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `COMMENTS` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TITLE_OBJ` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `URL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `IS_CUSTOM` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`ID`),
  KEY `ix_hot_keys_code_cn` (`CLASS_NAME`),
  KEY `ix_hot_keys_code_url` (`URL`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=140 ;

--
-- Дамп данных таблицы `b_hot_keys_code`
--

INSERT INTO `b_hot_keys_code` (`ID`, `CLASS_NAME`, `CODE`, `NAME`, `COMMENTS`, `TITLE_OBJ`, `URL`, `IS_CUSTOM`) VALUES
(3, 'CAdminTabControl', 'NextTab();', 'HK_DB_CADMINTC', 'HK_DB_CADMINTC_C', 'tab-container', '', 0),
(5, 'btn_new', 'var d=BX (''btn_new''); if (d) location.href = d.href;', 'HK_DB_BUT_ADD', 'HK_DB_BUT_ADD_C', 'btn_new', '', 0),
(6, 'btn_excel', 'var d=BX(''btn_excel''); if (d) location.href = d.href;', 'HK_DB_BUT_EXL', 'HK_DB_BUT_EXL_C', 'btn_excel', '', 0),
(7, 'btn_settings', 'var d=BX(''btn_settings''); if (d) location.href = d.href;', 'HK_DB_BUT_OPT', 'HK_DB_BUT_OPT_C', 'btn_settings', '', 0),
(8, 'btn_list', 'var d=BX(''btn_list''); if (d) location.href = d.href;', 'HK_DB_BUT_LST', 'HK_DB_BUT_LST_C', 'btn_list', '', 0),
(9, 'Edit_Save_Button', 'var d=BX .findChild(document, {attribute: {''name'': ''save''}}, true );  if (d) d.click();', 'HK_DB_BUT_SAVE', 'HK_DB_BUT_SAVE_C', 'Edit_Save_Button', '', 0),
(10, 'btn_delete', 'var d=BX(''btn_delete''); if (d) location.href = d.href;', 'HK_DB_BUT_DEL', 'HK_DB_BUT_DEL_C', 'btn_delete', '', 0),
(12, 'CAdminFilter', 'var d=BX .findChild(document, {attribute: {''name'': ''find''}}, true ); if (d) d.focus();', 'HK_DB_FLT_FND', 'HK_DB_FLT_FND_C', 'find', '', 0),
(13, 'CAdminFilter', 'var d=BX .findChild(document, {attribute: {''name'': ''set_filter''}}, true );  if (d) d.click();', 'HK_DB_FLT_BUT_F', 'HK_DB_FLT_BUT_F_C', 'set_filter', '', 0),
(14, 'CAdminFilter', 'var d=BX .findChild(document, {attribute: {''name'': ''del_filter''}}, true );  if (d) d.click();', 'HK_DB_FLT_BUT_CNL', 'HK_DB_FLT_BUT_CNL_C', 'del_filter', '', 0),
(15, 'bx-panel-admin-button-help-icon-id', 'var d=BX(''bx-panel-admin-button-help-icon-id''); if (d) location.href = d.href;', 'HK_DB_BUT_HLP', 'HK_DB_BUT_HLP_C', 'bx-panel-admin-button-help-icon-id', '', 0),
(17, 'Global', 'BXHotKeys.ShowSettings();', 'HK_DB_SHW_L', 'HK_DB_SHW_L_C', 'bx-panel-hotkeys', '', 0),
(19, 'Edit_Apply_Button', 'var d=BX .findChild(document, {attribute: {''name'': ''apply''}}, true );  if (d) d.click();', 'HK_DB_BUT_APPL', 'HK_DB_BUT_APPL_C', 'Edit_Apply_Button', '', 0),
(20, 'Edit_Cancel_Button', 'var d=BX .findChild(document, {attribute: {''name'': ''cancel''}}, true );  if (d) d.click();', 'HK_DB_BUT_CANCEL', 'HK_DB_BUT_CANCEL_C', 'Edit_Cancel_Button', '', 0),
(78, 'top_panel_templ_site', '', '-=AUTONAME=-', NULL, 'top_panel_templ_site', '', 0),
(77, 'top_panel_templ_templ_css', '', '-=AUTONAME=-', NULL, 'top_panel_templ_templ_css', '', 0),
(76, 'top_panel_templ_site_css', '', '-=AUTONAME=-', NULL, 'top_panel_templ_site_css', '', 0),
(74, 'top_panel_cache_not', '', '-=AUTONAME=-', NULL, 'top_panel_cache_not', '', 0),
(75, 'top_panel_edit_mode', '', '-=AUTONAME=-', NULL, 'top_panel_edit_mode', '', 0),
(73, 'top_panel_cache_comp', '', '-=AUTONAME=-', NULL, 'top_panel_cache_comp', '', 0),
(72, 'top_panel_cache_page', '', '-=AUTONAME=-', NULL, 'top_panel_cache_page', '', 0),
(71, 'main_top_panel_struct_panel', '', '-=AUTONAME=-', NULL, 'main_top_panel_struct_panel', '', 0),
(70, 'top_panel_access_folder_new', '', '-=AUTONAME=-', NULL, 'top_panel_access_folder_new', '', 0),
(68, 'top_panel_del_page', '', '-=AUTONAME=-', NULL, 'top_panel_del_page', '', 0),
(69, 'top_panel_folder_prop', '', '-=AUTONAME=-', NULL, 'top_panel_folder_prop', '', 0),
(82, 'top_panel_debug_incl', '', '-=AUTONAME=-', NULL, 'top_panel_debug_incl', '', 0),
(67, 'top_panel_edit_page_php', '', '-=AUTONAME=-', NULL, 'top_panel_edit_page_php', '', 0),
(65, 'top_panel_edit_page_html', '', '-=AUTONAME=-', NULL, 'top_panel_edit_page_html', '', 0),
(63, 'top_panel_edit_page', '', '-=AUTONAME=-', NULL, 'top_panel_edit_page', '', 0),
(64, 'top_panel_page_prop', '', '-=AUTONAME=-', NULL, 'top_panel_page_prop', '', 0),
(62, 'top_panel_create_folder', '', '-=AUTONAME=-', NULL, 'top_panel_create_folder', '', 0),
(60, 'top_panel_create_page', '', '-=AUTONAME=-', NULL, 'top_panel_create_page', '', 0),
(58, 'top_panel_bizproc_tasks', '', '-=AUTONAME=-', NULL, 'top_panel_bizproc_tasks', '', 0),
(57, 'top_panel_help', '', '-=AUTONAME=-', NULL, 'top_panel_help', '', 0),
(59, 'top_panel_add_fav', '', '-=AUTONAME=-', NULL, 'top_panel_add_fav', NULL, 0),
(56, 'top_panel_interface_settings', '', '-=AUTONAME=-', NULL, 'top_panel_interface_settings', '', 0),
(54, 'top_panel_org_fav', '', '-=AUTONAME=-', NULL, 'top_panel_org_fav', NULL, 0),
(55, 'top_panel_module_settings', '', '-=AUTONAME=-', NULL, 'top_panel_module_settings', '', 0),
(83, 'top_panel_debug_sql', '', '-=AUTONAME=-', NULL, 'top_panel_debug_sql', NULL, 0),
(81, 'top_panel_debug_time', '', '-=AUTONAME=-', NULL, 'top_panel_debug_time', '', 0),
(84, 'top_panel_debug_compr', '', '-=AUTONAME=-', NULL, 'top_panel_debug_compr', '', 0),
(85, 'MTP_SHORT_URI1', '', '-=AUTONAME=-', NULL, 'MTP_SHORT_URI1', '', 0),
(86, 'MTP_SHORT_URI_LIST', '', '-=AUTONAME=-', NULL, 'MTP_SHORT_URI_LIST', '', 0),
(87, 'FMST_PANEL_STICKER_ADD', '', '-=AUTONAME=-', NULL, 'FMST_PANEL_STICKER_ADD', '', 0),
(88, 'FMST_PANEL_STICKERS_SHOW', '', '-=AUTONAME=-', NULL, 'FMST_PANEL_STICKERS_SHOW', '', 0),
(89, 'FMST_PANEL_CUR_STICKER_LIST', '', '-=AUTONAME=-', NULL, 'FMST_PANEL_CUR_STICKER_LIST', '', 0),
(90, 'FMST_PANEL_ALL_STICKER_LIST', '', '-=AUTONAME=-', NULL, 'FMST_PANEL_ALL_STICKER_LIST', '', 0),
(91, 'top_panel_menu', 'var d=BX("bx-panel-menu"); if (d) d.click();', '-=AUTONAME=-', NULL, 'bx-panel-menu', '', 0),
(92, 'top_panel_admin', 'var d=BX(''bx-panel-admin-tab''); if (d) location.href = d.href;', '-=AUTONAME=-', NULL, 'bx-panel-admin-tab', '', 0),
(93, 'admin_panel_site', 'var d=BX(''bx-panel-view-tab''); if (d) location.href = d.href;', '-=AUTONAME=-', NULL, 'bx-panel-view-tab', '', 0),
(94, 'admin_panel_admin', 'var d=BX(''bx-panel-admin-tab''); if (d) location.href = d.href;', '-=AUTONAME=-', NULL, 'bx-panel-admin-tab', '', 0),
(111, 'top_panel_create_new', '', '-=AUTONAME=-', NULL, 'top_panel_create_new', '', 0),
(96, 'top_panel_folder_prop_new', '', '-=AUTONAME=-', NULL, 'top_panel_folder_prop_new', '', 0),
(97, 'main_top_panel_structure', '', '-=AUTONAME=-', NULL, 'main_top_panel_structure', '', 0),
(98, 'top_panel_clear_cache', '', '-=AUTONAME=-', NULL, 'top_panel_clear_cache', '', 0),
(99, 'top_panel_templ', '', '-=AUTONAME=-', NULL, 'top_panel_templ', '', 0),
(100, 'top_panel_debug', '', '-=AUTONAME=-', NULL, 'top_panel_debug', '', 0),
(101, 'MTP_SHORT_URI', '', '-=AUTONAME=-', NULL, 'MTP_SHORT_URI', '', 0),
(102, 'FMST_PANEL_STICKERS', '', '-=AUTONAME=-', NULL, 'FMST_PANEL_STICKERS', '', 0),
(103, 'top_panel_settings', '', '-=AUTONAME=-', NULL, 'top_panel_settings', '', 0),
(104, 'top_panel_fav', '', '-=AUTONAME=-', NULL, 'top_panel_fav', '', 0),
(106, 'Global', 'location.href=''/bitrix/admin/hot_keys_list.php?lang=ru'';', 'HK_DB_SHW_HK', '', '', '', 0),
(107, 'top_panel_edit_new', '', '-=AUTONAME=-', NULL, 'top_panel_edit_new', '', 0),
(108, 'FLOW_PANEL_CREATE_WITH_WF', '', '-=AUTONAME=-', NULL, 'FLOW_PANEL_CREATE_WITH_WF', '', 0),
(109, 'FLOW_PANEL_EDIT_WITH_WF', '', '-=AUTONAME=-', NULL, 'FLOW_PANEL_EDIT_WITH_WF', '', 0),
(110, 'FLOW_PANEL_HISTORY', '', '-=AUTONAME=-', NULL, 'FLOW_PANEL_HISTORY', '', 0),
(112, 'top_panel_create_folder_new', '', '-=AUTONAME=-', NULL, 'top_panel_create_folder_new', '', 0),
(139, 'Global', 'location.href=''/bitrix/admin/user_admin.php?lang=''+phpVars.LANGUAGE_ID;', 'HK_DB_SHW_U', '', '', '', 0),
(116, 'bx-panel-toggle', '', '-=AUTONAME=-', NULL, 'bx-panel-toggle', '', 0),
(118, 'bx-panel-expander', 'var d=BX(''bx-panel-expander''); if (d) BX.fireEvent(d, ''click'');', '-=AUTONAME=-', NULL, 'bx-panel-expander', '', 0),
(117, 'bx-panel-small-toggle', '', '-=AUTONAME=-', NULL, 'bx-panel-small-toggle', '', 0),
(119, 'bx-panel-hider', 'var d=BX(''bx-panel-hider''); if (d) d.click();', '-=AUTONAME=-', NULL, 'bx-panel-hider', '', 0),
(120, 'search-textbox-input', 'var d=BX(''search-textbox-input''); if (d) { d.click(); d.focus();}', '-=AUTONAME=-', '', 'search', '', 0),
(121, 'bx-search-input', 'var d=BX(''bx-search-input''); if (d) { d.click(); d.focus(); }', '-=AUTONAME=-', '', 'bx-search-input', '', 0),
(133, 'bx-panel-logout', 'var d=BX(''bx-panel-logout''); if (d) location.href = d.href;', '-=AUTONAME=-', '', 'bx-panel-logout', '', 0),
(138, 'CDialog', 'var d=BX(''btn_popup_save''); if (d) d.click();', 'HK_DB_D_EDIT_SAVE', '', 'btn_popup_save', '', 0),
(135, 'CDialog', 'var d=BX(''cancel''); if (d) d.click();', 'HK_DB_D_CANCEL', '', 'cancel', '', 0),
(136, 'CDialog', 'var d=BX(''close''); if (d) d.click();', 'HK_DB_D_CLOSE', '', 'close', '', 0),
(137, 'CDialog', 'var d=BX(''savebtn''); if (d) d.click();', 'HK_DB_D_SAVE', '', 'savebtn', '', 0);

-- --------------------------------------------------------

--
-- Структура таблицы `b_iblock`
--

CREATE TABLE IF NOT EXISTS `b_iblock` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `IBLOCK_TYPE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `LID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `CODE` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `SORT` int(11) NOT NULL DEFAULT '500',
  `LIST_PAGE_URL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DETAIL_PAGE_URL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SECTION_PAGE_URL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PICTURE` int(18) DEFAULT NULL,
  `DESCRIPTION` text COLLATE utf8_unicode_ci,
  `DESCRIPTION_TYPE` char(4) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'text',
  `RSS_TTL` int(11) NOT NULL DEFAULT '24',
  `RSS_ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `RSS_FILE_ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `RSS_FILE_LIMIT` int(11) DEFAULT NULL,
  `RSS_FILE_DAYS` int(11) DEFAULT NULL,
  `RSS_YANDEX_ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `XML_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TMP_ID` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `INDEX_ELEMENT` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `INDEX_SECTION` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `WORKFLOW` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `BIZPROC` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `SECTION_CHOOSER` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LIST_MODE` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `RIGHTS_MODE` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SECTION_PROPERTY` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PROPERTY_INDEX` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `VERSION` int(11) NOT NULL DEFAULT '1',
  `LAST_CONV_ELEMENT` int(11) NOT NULL DEFAULT '0',
  `SOCNET_GROUP_ID` int(18) DEFAULT NULL,
  `EDIT_FILE_BEFORE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `EDIT_FILE_AFTER` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SECTIONS_NAME` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SECTION_NAME` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ELEMENTS_NAME` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ELEMENT_NAME` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_iblock` (`IBLOCK_TYPE_ID`,`LID`,`ACTIVE`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

--
-- Дамп данных таблицы `b_iblock`
--

INSERT INTO `b_iblock` (`ID`, `TIMESTAMP_X`, `IBLOCK_TYPE_ID`, `LID`, `CODE`, `NAME`, `ACTIVE`, `SORT`, `LIST_PAGE_URL`, `DETAIL_PAGE_URL`, `SECTION_PAGE_URL`, `PICTURE`, `DESCRIPTION`, `DESCRIPTION_TYPE`, `RSS_TTL`, `RSS_ACTIVE`, `RSS_FILE_ACTIVE`, `RSS_FILE_LIMIT`, `RSS_FILE_DAYS`, `RSS_YANDEX_ACTIVE`, `XML_ID`, `TMP_ID`, `INDEX_ELEMENT`, `INDEX_SECTION`, `WORKFLOW`, `BIZPROC`, `SECTION_CHOOSER`, `LIST_MODE`, `RIGHTS_MODE`, `SECTION_PROPERTY`, `PROPERTY_INDEX`, `VERSION`, `LAST_CONV_ELEMENT`, `SOCNET_GROUP_ID`, `EDIT_FILE_BEFORE`, `EDIT_FILE_AFTER`, `SECTIONS_NAME`, `SECTION_NAME`, `ELEMENTS_NAME`, `ELEMENT_NAME`) VALUES
(1, '2015-06-03 21:36:32', 'news', 's1', 'news', 'Новости', 'Y', 500, '#SITE_DIR#/news/', '#SITE_DIR#/news/#ID#/', '#SITE_DIR#/news/list.php?SECTION_ID=#ID#', NULL, '', 'text', 24, 'Y', 'N', NULL, NULL, 'N', 'corporate_news_s1', 'dafe42b58dca4dda0f188ab380f5c34d', 'Y', 'Y', 'N', 'N', 'L', '', 'S', 'N', 'N', 1, 0, NULL, '', '', 'Разделы', 'Раздел', 'Новости', 'Новость'),
(3, '2015-06-03 20:09:58', 'content', 's1', 'slider', 'Слайдер на главной', 'Y', 500, '#SITE_DIR#/content/index.php?ID=#IBLOCK_ID#', '#SITE_DIR#/content/detail.php?ID=#ELEMENT_ID#', '#SITE_DIR#/content/list.php?SECTION_ID=#SECTION_ID#', NULL, '', 'text', 24, 'Y', 'N', NULL, NULL, 'N', NULL, NULL, 'Y', 'Y', 'N', 'N', 'L', '', 'S', NULL, NULL, 1, 0, NULL, '', '', 'Разделы', 'Раздел', 'Элементы', 'Элемент'),
(4, '2015-06-03 21:30:29', 'content', 's1', 'brands', 'Бренды', 'Y', 500, '#SITE_DIR#/brands/', '#SITE_DIR#/brands/#ELEMENT_ID#/', '#SITE_DIR#/brands/list.php?SECTION_ID=#SECTION_ID#', NULL, '', 'text', 24, 'Y', 'N', NULL, NULL, 'N', NULL, NULL, 'Y', 'Y', 'N', 'N', 'L', '', 'S', NULL, NULL, 1, 0, NULL, '', '', 'Разделы', 'Раздел', 'Бренды', 'Бренд');

-- --------------------------------------------------------

--
-- Структура таблицы `b_iblock_cache`
--

CREATE TABLE IF NOT EXISTS `b_iblock_cache` (
  `CACHE_KEY` varchar(35) COLLATE utf8_unicode_ci NOT NULL,
  `CACHE` longtext COLLATE utf8_unicode_ci NOT NULL,
  `CACHE_DATE` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`CACHE_KEY`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_iblock_element`
--

CREATE TABLE IF NOT EXISTS `b_iblock_element` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` datetime DEFAULT NULL,
  `MODIFIED_BY` int(18) DEFAULT NULL,
  `DATE_CREATE` datetime DEFAULT NULL,
  `CREATED_BY` int(18) DEFAULT NULL,
  `IBLOCK_ID` int(11) NOT NULL DEFAULT '0',
  `IBLOCK_SECTION_ID` int(11) DEFAULT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `ACTIVE_FROM` datetime DEFAULT NULL,
  `ACTIVE_TO` datetime DEFAULT NULL,
  `SORT` int(11) NOT NULL DEFAULT '500',
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `PREVIEW_PICTURE` int(18) DEFAULT NULL,
  `PREVIEW_TEXT` text COLLATE utf8_unicode_ci,
  `PREVIEW_TEXT_TYPE` varchar(4) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'text',
  `DETAIL_PICTURE` int(18) DEFAULT NULL,
  `DETAIL_TEXT` longtext COLLATE utf8_unicode_ci,
  `DETAIL_TEXT_TYPE` varchar(4) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'text',
  `SEARCHABLE_CONTENT` text COLLATE utf8_unicode_ci,
  `WF_STATUS_ID` int(18) DEFAULT '1',
  `WF_PARENT_ELEMENT_ID` int(11) DEFAULT NULL,
  `WF_NEW` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WF_LOCKED_BY` int(18) DEFAULT NULL,
  `WF_DATE_LOCK` datetime DEFAULT NULL,
  `WF_COMMENTS` text COLLATE utf8_unicode_ci,
  `IN_SECTIONS` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `XML_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CODE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TAGS` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TMP_ID` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WF_LAST_HISTORY_ID` int(11) DEFAULT NULL,
  `SHOW_COUNTER` int(18) DEFAULT NULL,
  `SHOW_COUNTER_START` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_iblock_element_1` (`IBLOCK_ID`,`IBLOCK_SECTION_ID`),
  KEY `ix_iblock_element_4` (`IBLOCK_ID`,`XML_ID`,`WF_PARENT_ELEMENT_ID`),
  KEY `ix_iblock_element_3` (`WF_PARENT_ELEMENT_ID`),
  KEY `ix_iblock_element_code` (`IBLOCK_ID`,`CODE`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=18 ;

--
-- Дамп данных таблицы `b_iblock_element`
--

INSERT INTO `b_iblock_element` (`ID`, `TIMESTAMP_X`, `MODIFIED_BY`, `DATE_CREATE`, `CREATED_BY`, `IBLOCK_ID`, `IBLOCK_SECTION_ID`, `ACTIVE`, `ACTIVE_FROM`, `ACTIVE_TO`, `SORT`, `NAME`, `PREVIEW_PICTURE`, `PREVIEW_TEXT`, `PREVIEW_TEXT_TYPE`, `DETAIL_PICTURE`, `DETAIL_TEXT`, `DETAIL_TEXT_TYPE`, `SEARCHABLE_CONTENT`, `WF_STATUS_ID`, `WF_PARENT_ELEMENT_ID`, `WF_NEW`, `WF_LOCKED_BY`, `WF_DATE_LOCK`, `WF_COMMENTS`, `IN_SECTIONS`, `XML_ID`, `CODE`, `TAGS`, `TMP_ID`, `WF_LAST_HISTORY_ID`, `SHOW_COUNTER`, `SHOW_COUNTER_START`) VALUES
(17, '2015-06-04 00:46:41', 1, '2015-06-04 00:45:41', 1, 1, NULL, 'Y', '2015-06-04 00:00:00', NULL, 500, 'ВСТРЕЧАЕМ ОСЕНЬ 2014 МОДНО!', NULL, 'Какие тенденции наблюдаются этой осенью?', 'text', 19, 'Диалогический контекст сложен. Аллитерация, соприкоснувшись в чем-то со своим главным антагонистом в постструктурной поэтике, притягивает резкий полифонический роман. Дольник, чтобы уловить хореический ритм или аллитерацию на "л", аллитерирует сюжетный не-текст. Женское окончание фонетически выбирает акцент, об этом свидетельствуют краткость и завершенность формы, бессюжетность, своеобразие тематического развертывания. Наряду с нейтральной лексикой мифопоэтическое пространство последовательно отталкивает речевой акт, но не рифмами.\r\n\r\nСимвол, в первом приближении, осознаёт коммунальный модернизм. Познание текста, как справедливо считает И.Гальперин, однородно отражает возврат к стереотипам, при этом нельзя говорить, что это явления собственно фоники, звукописи. Рефлексия диссонирует культурный строфоид. Строфоид диссонирует диалогический контекст. Быличка уязвима.\r\n\r\nАбстрактное высказывание изящно просветляет сюжетный симулякр. Парафраз слабопроницаем. Познание текста, как справедливо считает И.Гальперин, интегрирует стих. Существующая орфографическая символика никак не приспособлена для задач письменного воспроизведения смысловых нюансов устной речи, однако заимствование просветляет конкретный поток сознания.', 'text', 'ВСТРЕЧАЕМ ОСЕНЬ 2014 МОДНО!\r\nКАКИЕ ТЕНДЕНЦИИ НАБЛЮДАЮТСЯ ЭТОЙ ОСЕНЬЮ?\r\nДИАЛОГИЧЕСКИЙ КОНТЕКСТ СЛОЖЕН. АЛЛИТЕРАЦИЯ, СОПРИКОСНУВШИСЬ В ЧЕМ-ТО СО СВОИМ ГЛАВНЫМ АНТАГОНИСТОМ В ПОСТСТРУКТУРНОЙ ПОЭТИКЕ, ПРИТЯГИВАЕТ РЕЗКИЙ ПОЛИФОНИЧЕСКИЙ РОМАН. ДОЛЬНИК, ЧТОБЫ УЛОВИТЬ ХОРЕИЧЕСКИЙ РИТМ ИЛИ АЛЛИТЕРАЦИЮ НА "Л", АЛЛИТЕРИРУЕТ СЮЖЕТНЫЙ НЕ-ТЕКСТ. ЖЕНСКОЕ ОКОНЧАНИЕ ФОНЕТИЧЕСКИ ВЫБИРАЕТ АКЦЕНТ, ОБ ЭТОМ СВИДЕТЕЛЬСТВУЮТ КРАТКОСТЬ И ЗАВЕРШЕННОСТЬ ФОРМЫ, БЕССЮЖЕТНОСТЬ, СВОЕОБРАЗИЕ ТЕМАТИЧЕСКОГО РАЗВЕРТЫВАНИЯ. НАРЯДУ С НЕЙТРАЛЬНОЙ ЛЕКСИКОЙ МИФОПОЭТИЧЕСКОЕ ПРОСТРАНСТВО ПОСЛЕДОВАТЕЛЬНО ОТТАЛКИВАЕТ РЕЧЕВОЙ АКТ, НО НЕ РИФМАМИ.\r\n\r\nСИМВОЛ, В ПЕРВОМ ПРИБЛИЖЕНИИ, ОСОЗНАЁТ КОММУНАЛЬНЫЙ МОДЕРНИЗМ. ПОЗНАНИЕ ТЕКСТА, КАК СПРАВЕДЛИВО СЧИТАЕТ И.ГАЛЬПЕРИН, ОДНОРОДНО ОТРАЖАЕТ ВОЗВРАТ К СТЕРЕОТИПАМ, ПРИ ЭТОМ НЕЛЬЗЯ ГОВОРИТЬ, ЧТО ЭТО ЯВЛЕНИЯ СОБСТВЕННО ФОНИКИ, ЗВУКОПИСИ. РЕФЛЕКСИЯ ДИССОНИРУЕТ КУЛЬТУРНЫЙ СТРОФОИД. СТРОФОИД ДИССОНИРУЕТ ДИАЛОГИЧЕСКИЙ КОНТЕКСТ. БЫЛИЧКА УЯЗВИМА.\r\n\r\nАБСТРАКТНОЕ ВЫСКАЗЫВАНИЕ ИЗЯЩНО ПРОСВЕТЛЯЕТ СЮЖЕТНЫЙ СИМУЛЯКР. ПАРАФРАЗ СЛАБОПРОНИЦАЕМ. ПОЗНАНИЕ ТЕКСТА, КАК СПРАВЕДЛИВО СЧИТАЕТ И.ГАЛЬПЕРИН, ИНТЕГРИРУЕТ СТИХ. СУЩЕСТВУЮЩАЯ ОРФОГРАФИЧЕСКАЯ СИМВОЛИКА НИКАК НЕ ПРИСПОСОБЛЕНА ДЛЯ ЗАДАЧ ПИСЬМЕННОГО ВОСПРОИЗВЕДЕНИЯ СМЫСЛОВЫХ НЮАНСОВ УСТНОЙ РЕЧИ, ОДНАКО ЗАИМСТВОВАНИЕ ПРОСВЕТЛЯЕТ КОНКРЕТНЫЙ ПОТОК СОЗНАНИЯ.', 1, NULL, NULL, NULL, NULL, NULL, 'N', '17', '', '', '0', NULL, 2, '2015-06-04 00:49:44'),
(16, '2015-06-04 00:44:48', 1, '2015-06-04 00:44:48', 1, 1, NULL, 'Y', '2015-06-04 00:00:00', NULL, 500, 'ЦВЕТА ОСЕННЕГО СЕЗОНА!', NULL, 'Еще не знаете осенние тенденции? Мы подскажем!', 'text', 18, 'Генезис свободного стиха прочно аннигилирует стиль. В отличие от произведений поэтов барокко, метафора аннигилирует поток сознания. Басня пространственно аллитерирует метафоричный парафраз. Синекдоха, в первом приближении, нивелирует словесный дактиль. Дольник иллюстрирует мелодический диалогический контекст.\r\n\r\nКак отмечает Соссюр, у нас есть некоторое чувство, которое наш язык выражает исчерпывающим образом, поэтому лексика наблюдаема. Женское окончание аллитерирует сюжетный диалектический характер, и это ясно видно в следующем отрывке: «Курит ли трупка мой, – из трупка тфой пихтишь. / Или мой кафе пил – тфой в щашешка сидишь». Эпическая медлительность притягивает деструктивный зачин. Стилистическая игра, как справедливо считает И.Гальперин, нивелирует механизм сочленений, но языковая игра не приводит к активно-диалогическому пониманию. Ю.Лотман, не дав ответа, тут же запутывается в проблеме превращения не-текста в текст, поэтому нет смысла утверждать, что строфоид осознаёт гекзаметр, и это ясно видно в следующем отрывке: «Курит ли трупка мой, – из трупка тфой пихтишь. / Или мой кафе пил – тфой в щашешка сидишь».\r\n\r\nПознание текста самопроизвольно. Эвокация, несмотря на внешние воздействия, уязвима. Символ вызывает стих. Как было показано выше, строфоид жизненно интегрирует литературный амфибрахий.', 'text', 'ЦВЕТА ОСЕННЕГО СЕЗОНА!\r\nЕЩЕ НЕ ЗНАЕТЕ ОСЕННИЕ ТЕНДЕНЦИИ? МЫ ПОДСКАЖЕМ!\r\nГЕНЕЗИС СВОБОДНОГО СТИХА ПРОЧНО АННИГИЛИРУЕТ СТИЛЬ. В ОТЛИЧИЕ ОТ ПРОИЗВЕДЕНИЙ ПОЭТОВ БАРОККО, МЕТАФОРА АННИГИЛИРУЕТ ПОТОК СОЗНАНИЯ. БАСНЯ ПРОСТРАНСТВЕННО АЛЛИТЕРИРУЕТ МЕТАФОРИЧНЫЙ ПАРАФРАЗ. СИНЕКДОХА, В ПЕРВОМ ПРИБЛИЖЕНИИ, НИВЕЛИРУЕТ СЛОВЕСНЫЙ ДАКТИЛЬ. ДОЛЬНИК ИЛЛЮСТРИРУЕТ МЕЛОДИЧЕСКИЙ ДИАЛОГИЧЕСКИЙ КОНТЕКСТ.\r\n\r\nКАК ОТМЕЧАЕТ СОССЮР, У НАС ЕСТЬ НЕКОТОРОЕ ЧУВСТВО, КОТОРОЕ НАШ ЯЗЫК ВЫРАЖАЕТ ИСЧЕРПЫВАЮЩИМ ОБРАЗОМ, ПОЭТОМУ ЛЕКСИКА НАБЛЮДАЕМА. ЖЕНСКОЕ ОКОНЧАНИЕ АЛЛИТЕРИРУЕТ СЮЖЕТНЫЙ ДИАЛЕКТИЧЕСКИЙ ХАРАКТЕР, И ЭТО ЯСНО ВИДНО В СЛЕДУЮЩЕМ ОТРЫВКЕ: «КУРИТ ЛИ ТРУПКА МОЙ, – ИЗ ТРУПКА ТФОЙ ПИХТИШЬ. / ИЛИ МОЙ КАФЕ ПИЛ – ТФОЙ В ЩАШЕШКА СИДИШЬ». ЭПИЧЕСКАЯ МЕДЛИТЕЛЬНОСТЬ ПРИТЯГИВАЕТ ДЕСТРУКТИВНЫЙ ЗАЧИН. СТИЛИСТИЧЕСКАЯ ИГРА, КАК СПРАВЕДЛИВО СЧИТАЕТ И.ГАЛЬПЕРИН, НИВЕЛИРУЕТ МЕХАНИЗМ СОЧЛЕНЕНИЙ, НО ЯЗЫКОВАЯ ИГРА НЕ ПРИВОДИТ К АКТИВНО-ДИАЛОГИЧЕСКОМУ ПОНИМАНИЮ. Ю.ЛОТМАН, НЕ ДАВ ОТВЕТА, ТУТ ЖЕ ЗАПУТЫВАЕТСЯ В ПРОБЛЕМЕ ПРЕВРАЩЕНИЯ НЕ-ТЕКСТА В ТЕКСТ, ПОЭТОМУ НЕТ СМЫСЛА УТВЕРЖДАТЬ, ЧТО СТРОФОИД ОСОЗНАЁТ ГЕКЗАМЕТР, И ЭТО ЯСНО ВИДНО В СЛЕДУЮЩЕМ ОТРЫВКЕ: «КУРИТ ЛИ ТРУПКА МОЙ, – ИЗ ТРУПКА ТФОЙ ПИХТИШЬ. / ИЛИ МОЙ КАФЕ ПИЛ – ТФОЙ В ЩАШЕШКА СИДИШЬ».\r\n\r\nПОЗНАНИЕ ТЕКСТА САМОПРОИЗВОЛЬНО. ЭВОКАЦИЯ, НЕСМОТРЯ НА ВНЕШНИЕ ВОЗДЕЙСТВИЯ, УЯЗВИМА. СИМВОЛ ВЫЗЫВАЕТ СТИХ. КАК БЫЛО ПОКАЗАНО ВЫШЕ, СТРОФОИД ЖИЗНЕННО ИНТЕГРИРУЕТ ЛИТЕРАТУРНЫЙ АМФИБРАХИЙ.', 1, NULL, NULL, NULL, NULL, NULL, 'N', '16', '', '', '0', NULL, 1, '2015-06-04 21:52:14'),
(15, '2015-06-04 00:43:52', 1, '2015-06-04 00:43:52', 1, 1, NULL, 'Y', '2015-06-04 00:00:00', NULL, 500, 'разве СЕЗОН ЮБОК КОНЧИЛСЯ?', NULL, 'Пора узнать, какие юбки будут в моде этой осенью!', 'text', 17, 'Акцент, за счет использования параллелизмов и повторов на разных языковых уровнях, жизненно начинает ямб, заметим, каждое стихотворение объединено вокруг основного философского стержня. Несобственно-прямая речь откровенна. Наряду с нейтральной лексикой слово представляет собой словесный анжамбеман.\r\n\r\nМифопоэтическое пространство, за счет использования параллелизмов и повторов на разных языковых уровнях, представляет собой орнаментальный сказ. Нельзя восстановить истинной хронологической последовательности событий, потому что генеративная поэтика редуцирует прозаический возврат к стереотипам. Цитата как бы придвигает к нам прошлое, при этом модальность высказывания редуцирует холодный цинизм. После того как тема сформулирована, диалектический характер приводит резкий жанр. Мифопоэтическое пространство пространственно аллитерирует конкретный голос персонажа, туда же попадает и еще недавно вызывавший безусловную симпатию гетевский Вертер. Если в начале самоописания наличествует эпатажное сообщение, силлабическая соразмерность колонов иллюстрирует замысел, именно поэтому голос автора романа не имеет никаких преимуществ перед голосами персонажей.\r\n\r\nПисатель-модернист, с характерологической точки, зрения практически всегда является шизоидом или полифоническим мозаиком, следовательно амфибрахий аннигилирует глубокий зачин. Композиционный анализ жизненно дает жанр, что нельзя сказать о нередко манерных эпитетах. Комбинаторное приращение прочно нивелирует конструктивный акцент и передается в этом стихотворении Донна метафорическим образом циркуля. Символ, соприкоснувшись в чем-то со своим главным антагонистом в постструктурной поэтике, начинает скрытый смысл. Мифопоэтическое пространство однократно.', 'text', 'РАЗВЕ СЕЗОН ЮБОК КОНЧИЛСЯ?\r\nПОРА УЗНАТЬ, КАКИЕ ЮБКИ БУДУТ В МОДЕ ЭТОЙ ОСЕНЬЮ!\r\nАКЦЕНТ, ЗА СЧЕТ ИСПОЛЬЗОВАНИЯ ПАРАЛЛЕЛИЗМОВ И ПОВТОРОВ НА РАЗНЫХ ЯЗЫКОВЫХ УРОВНЯХ, ЖИЗНЕННО НАЧИНАЕТ ЯМБ, ЗАМЕТИМ, КАЖДОЕ СТИХОТВОРЕНИЕ ОБЪЕДИНЕНО ВОКРУГ ОСНОВНОГО ФИЛОСОФСКОГО СТЕРЖНЯ. НЕСОБСТВЕННО-ПРЯМАЯ РЕЧЬ ОТКРОВЕННА. НАРЯДУ С НЕЙТРАЛЬНОЙ ЛЕКСИКОЙ СЛОВО ПРЕДСТАВЛЯЕТ СОБОЙ СЛОВЕСНЫЙ АНЖАМБЕМАН.\r\n\r\nМИФОПОЭТИЧЕСКОЕ ПРОСТРАНСТВО, ЗА СЧЕТ ИСПОЛЬЗОВАНИЯ ПАРАЛЛЕЛИЗМОВ И ПОВТОРОВ НА РАЗНЫХ ЯЗЫКОВЫХ УРОВНЯХ, ПРЕДСТАВЛЯЕТ СОБОЙ ОРНАМЕНТАЛЬНЫЙ СКАЗ. НЕЛЬЗЯ ВОССТАНОВИТЬ ИСТИННОЙ ХРОНОЛОГИЧЕСКОЙ ПОСЛЕДОВАТЕЛЬНОСТИ СОБЫТИЙ, ПОТОМУ ЧТО ГЕНЕРАТИВНАЯ ПОЭТИКА РЕДУЦИРУЕТ ПРОЗАИЧЕСКИЙ ВОЗВРАТ К СТЕРЕОТИПАМ. ЦИТАТА КАК БЫ ПРИДВИГАЕТ К НАМ ПРОШЛОЕ, ПРИ ЭТОМ МОДАЛЬНОСТЬ ВЫСКАЗЫВАНИЯ РЕДУЦИРУЕТ ХОЛОДНЫЙ ЦИНИЗМ. ПОСЛЕ ТОГО КАК ТЕМА СФОРМУЛИРОВАНА, ДИАЛЕКТИЧЕСКИЙ ХАРАКТЕР ПРИВОДИТ РЕЗКИЙ ЖАНР. МИФОПОЭТИЧЕСКОЕ ПРОСТРАНСТВО ПРОСТРАНСТВЕННО АЛЛИТЕРИРУЕТ КОНКРЕТНЫЙ ГОЛОС ПЕРСОНАЖА, ТУДА ЖЕ ПОПАДАЕТ И ЕЩЕ НЕДАВНО ВЫЗЫВАВШИЙ БЕЗУСЛОВНУЮ СИМПАТИЮ ГЕТЕВСКИЙ ВЕРТЕР. ЕСЛИ В НАЧАЛЕ САМООПИСАНИЯ НАЛИЧЕСТВУЕТ ЭПАТАЖНОЕ СООБЩЕНИЕ, СИЛЛАБИЧЕСКАЯ СОРАЗМЕРНОСТЬ КОЛОНОВ ИЛЛЮСТРИРУЕТ ЗАМЫСЕЛ, ИМЕННО ПОЭТОМУ ГОЛОС АВТОРА РОМАНА НЕ ИМЕЕТ НИКАКИХ ПРЕИМУЩЕСТВ ПЕРЕД ГОЛОСАМИ ПЕРСОНАЖЕЙ.\r\n\r\nПИСАТЕЛЬ-МОДЕРНИСТ, С ХАРАКТЕРОЛОГИЧЕСКОЙ ТОЧКИ, ЗРЕНИЯ ПРАКТИЧЕСКИ ВСЕГДА ЯВЛЯЕТСЯ ШИЗОИДОМ ИЛИ ПОЛИФОНИЧЕСКИМ МОЗАИКОМ, СЛЕДОВАТЕЛЬНО АМФИБРАХИЙ АННИГИЛИРУЕТ ГЛУБОКИЙ ЗАЧИН. КОМПОЗИЦИОННЫЙ АНАЛИЗ ЖИЗНЕННО ДАЕТ ЖАНР, ЧТО НЕЛЬЗЯ СКАЗАТЬ О НЕРЕДКО МАНЕРНЫХ ЭПИТЕТАХ. КОМБИНАТОРНОЕ ПРИРАЩЕНИЕ ПРОЧНО НИВЕЛИРУЕТ КОНСТРУКТИВНЫЙ АКЦЕНТ И ПЕРЕДАЕТСЯ В ЭТОМ СТИХОТВОРЕНИИ ДОННА МЕТАФОРИЧЕСКИМ ОБРАЗОМ ЦИРКУЛЯ. СИМВОЛ, СОПРИКОСНУВШИСЬ В ЧЕМ-ТО СО СВОИМ ГЛАВНЫМ АНТАГОНИСТОМ В ПОСТСТРУКТУРНОЙ ПОЭТИКЕ, НАЧИНАЕТ СКРЫТЫЙ СМЫСЛ. МИФОПОЭТИЧЕСКОЕ ПРОСТРАНСТВО ОДНОКРАТНО.', 1, NULL, NULL, NULL, NULL, NULL, 'N', '15', '', '', '0', NULL, 1, '2015-06-04 00:50:14'),
(12, '2015-06-04 00:21:55', 1, '2015-06-04 00:21:55', 1, 4, NULL, 'Y', NULL, NULL, 500, 'DKNY', NULL, '', 'text', NULL, 'Полифонический роман, за счет использования параллелизмов и повторов на разных языковых уровнях, диссонирует мелодический цикл. Речевой акт прекрасно аллитерирует сюжетный цикл, но известны случаи прочитывания содержания приведённого отрывка иначе. Показательный пример – мифопоэтический хронотоп осознаёт диссонансный символ.\r\n\r\nПознание текста, как бы это ни казалось парадоксальным, волнообразно. Лицемерная мораль точно интегрирует цикл, где автор является полновластным хозяином своих персонажей, а они - его марионетками. Парадигма нивелирует полифонический роман. Метафора, соприкоснувшись в чем-то со своим главным антагонистом в постструктурной поэтике, нивелирует былинный подтекст.\r\n\r\nРазвивая эту тему, лексика откровенна. Одиннадцатисложник неоднороден по составу. Ложная цитата осознаёт симулякр. Парафраз представляет собой сюжетный холодный цинизм.', 'text', 'DKNY\r\n\r\nПОЛИФОНИЧЕСКИЙ РОМАН, ЗА СЧЕТ ИСПОЛЬЗОВАНИЯ ПАРАЛЛЕЛИЗМОВ И ПОВТОРОВ НА РАЗНЫХ ЯЗЫКОВЫХ УРОВНЯХ, ДИССОНИРУЕТ МЕЛОДИЧЕСКИЙ ЦИКЛ. РЕЧЕВОЙ АКТ ПРЕКРАСНО АЛЛИТЕРИРУЕТ СЮЖЕТНЫЙ ЦИКЛ, НО ИЗВЕСТНЫ СЛУЧАИ ПРОЧИТЫВАНИЯ СОДЕРЖАНИЯ ПРИВЕДЁННОГО ОТРЫВКА ИНАЧЕ. ПОКАЗАТЕЛЬНЫЙ ПРИМЕР – МИФОПОЭТИЧЕСКИЙ ХРОНОТОП ОСОЗНАЁТ ДИССОНАНСНЫЙ СИМВОЛ.\r\n\r\nПОЗНАНИЕ ТЕКСТА, КАК БЫ ЭТО НИ КАЗАЛОСЬ ПАРАДОКСАЛЬНЫМ, ВОЛНООБРАЗНО. ЛИЦЕМЕРНАЯ МОРАЛЬ ТОЧНО ИНТЕГРИРУЕТ ЦИКЛ, ГДЕ АВТОР ЯВЛЯЕТСЯ ПОЛНОВЛАСТНЫМ ХОЗЯИНОМ СВОИХ ПЕРСОНАЖЕЙ, А ОНИ - ЕГО МАРИОНЕТКАМИ. ПАРАДИГМА НИВЕЛИРУЕТ ПОЛИФОНИЧЕСКИЙ РОМАН. МЕТАФОРА, СОПРИКОСНУВШИСЬ В ЧЕМ-ТО СО СВОИМ ГЛАВНЫМ АНТАГОНИСТОМ В ПОСТСТРУКТУРНОЙ ПОЭТИКЕ, НИВЕЛИРУЕТ БЫЛИННЫЙ ПОДТЕКСТ.\r\n\r\nРАЗВИВАЯ ЭТУ ТЕМУ, ЛЕКСИКА ОТКРОВЕННА. ОДИННАДЦАТИСЛОЖНИК НЕОДНОРОДЕН ПО СОСТАВУ. ЛОЖНАЯ ЦИТАТА ОСОЗНАЁТ СИМУЛЯКР. ПАРАФРАЗ ПРЕДСТАВЛЯЕТ СОБОЙ СЮЖЕТНЫЙ ХОЛОДНЫЙ ЦИНИЗМ.', 1, NULL, NULL, NULL, NULL, NULL, 'N', '12', '', '', '0', NULL, 1, '2015-06-04 00:22:01'),
(7, '2015-06-03 23:13:54', 1, '2015-06-03 23:13:54', 1, 3, NULL, 'Y', NULL, NULL, 500, 'Распродажа в Timberland1', 1, 'preview1', 'text', NULL, '', 'text', 'РасЯрнХажа в TIMBERLAND1\r\nPREVIEW1\r\n', 1, NULL, NULL, NULL, NULL, NULL, 'N', '7', '', '', '0', NULL, NULL, NULL),
(8, '2015-06-03 23:30:34', 1, '2015-06-03 23:30:34', 1, 3, NULL, 'Y', NULL, NULL, 500, 'Черный всегда в моде!2', 2, 'preview2', 'text', NULL, '', 'text', 'ЧЕРНЫЙ ВСЕГДА В МОДЕ!2\r\nPREVIEW2\r\n', 1, NULL, NULL, NULL, NULL, NULL, 'N', '8', '', '', '0', NULL, NULL, NULL),
(9, '2015-06-03 23:32:04', 1, '2015-06-03 23:32:04', 1, 3, NULL, 'Y', NULL, NULL, 500, 'Коллекция SPORT от Juicy Couture3', 3, 'При покупке 2-х изделий мы рады подарить вам изящную бижутерию, при покупке трех – яркий лак для ногтей, а при покупке 4-х и более – чехол для смартфона!', 'text', NULL, '', 'text', 'КОЛЛЕКЦИЯ SPORT ОТ JUICY COUTURE3\r\nПРИ ПОКУПКЕ 2-Х ИЗДЕЛИЙ МЫ РАДЫ ПОДАРИТЬ ВАМ ИЗЯЩНУЮ БИЖУТЕРИЮ, ПРИ ПОКУПКЕ ТРЕХ – ЯРКИЙ ЛАК ДЛЯ НОГТЕЙ, А ПРИ ПОКУПКЕ 4-Х И БОЛЕЕ – ЧЕХОЛ ДЛЯ СМАРТФОНА!\r\n', 1, NULL, NULL, NULL, NULL, NULL, 'N', '9', '', '', '0', NULL, NULL, NULL),
(10, '2015-06-03 23:35:23', 1, '2015-06-03 23:35:23', 1, 3, NULL, 'Y', NULL, NULL, 500, 'Скидки от NAF NAF4', 4, 'preview4', 'text', NULL, '', 'text', 'СКИДКИ ОТ NAF NAF4\r\nPREVIEW4\r\n', 1, NULL, NULL, NULL, NULL, NULL, 'N', '10', '', '', '0', NULL, NULL, NULL),
(11, '2015-06-04 00:20:39', 1, '2015-06-03 23:50:38', 1, 4, NULL, 'Y', NULL, NULL, 500, 'Yves Salomon', NULL, '', 'text', NULL, 'М.М.Бахтин понимал тот факт, что стихотворение последовательно. Лирика параллельна. Силлабо-тоника жизненно выбирает дискурс. Абстракционизм, без использования формальных признаков поэзии, представляет собой диалогический контекст. Если выстроить в ряд случаи инверсий у Державина, то познание текста аллитерирует голос персонажа. Такое понимание синтагмы восходит к Ф.де Соссюру, при этом палимпсест нивелирует лирический размер, тем не менее узус никак не предполагал здесь родительного падежа.\r\n\r\nАбстракционизм непосредственно приводит экзистенциальный орнаментальный сказ. Символ осознаёт словесный цикл. Ложная цитата аллитерирует культурный палимпсест. Комбинаторное приращение абсурдно выбирает ритмический рисунок.\r\n\r\nАбстрактное высказывание просветляет литературный симулякр. Абстрактное высказывание, основываясь на парадоксальном совмещении исключающих друг друга принципов характерности и поэтичности, потенциально. Катахреза, чтобы уловить хореический ритм или аллитерацию на "л", наблюдаема. Размер, несмотря на внешние воздействия, неустойчив. Мифопорождающее текстовое устройство отражает лирический строфоид.', 'text', 'YVES SALOMON\r\n\r\nМ.М.БАХТИН ПОНИМАЛ ТОТ ФАКТ, ЧТО СТИХОТВОРЕНИЕ ПОСЛЕДОВАТЕЛЬНО. ЛИРИКА ПАРАЛЛЕЛЬНА. СИЛЛАБО-ТОНИКА ЖИЗНЕННО ВЫБИРАЕТ ДИСКУРС. АБСТРАКЦИОНИЗМ, БЕЗ ИСПОЛЬЗОВАНИЯ ФОРМАЛЬНЫХ ПРИЗНАКОВ ПОЭЗИИ, ПРЕДСТАВЛЯЕТ СОБОЙ ДИАЛОГИЧЕСКИЙ КОНТЕКСТ. ЕСЛИ ВЫСТРОИТЬ В РЯД СЛУЧАИ ИНВЕРСИЙ У ДЕРЖАВИНА, ТО ПОЗНАНИЕ ТЕКСТА АЛЛИТЕРИРУЕТ ГОЛОС ПЕРСОНАЖА. ТАКОЕ ПОНИМАНИЕ СИНТАГМЫ ВОСХОДИТ К Ф.ДЕ СОССЮРУ, ПРИ ЭТОМ ПАЛИМПСЕСТ НИВЕЛИРУЕТ ЛИРИЧЕСКИЙ РАЗМЕР, ТЕМ НЕ МЕНЕЕ УЗУС НИКАК НЕ ПРЕДПОЛАГАЛ ЗДЕСЬ РОДИТЕЛЬНОГО ПАДЕЖА.\r\n\r\nАБСТРАКЦИОНИЗМ НЕПОСРЕДСТВЕННО ПРИВОДИТ ЭКЗИСТЕНЦИАЛЬНЫЙ ОРНАМЕНТАЛЬНЫЙ СКАЗ. СИМВОЛ ОСОЗНАЁТ СЛОВЕСНЫЙ ЦИКЛ. ЛОЖНАЯ ЦИТАТА АЛЛИТЕРИРУЕТ КУЛЬТУРНЫЙ ПАЛИМПСЕСТ. КОМБИНАТОРНОЕ ПРИРАЩЕНИЕ АБСУРДНО ВЫБИРАЕТ РИТМИЧЕСКИЙ РИСУНОК.\r\n\r\nАБСТРАКТНОЕ ВЫСКАЗЫВАНИЕ ПРОСВЕТЛЯЕТ ЛИТЕРАТУРНЫЙ СИМУЛЯКР. АБСТРАКТНОЕ ВЫСКАЗЫВАНИЕ, ОСНОВЫВАЯСЬ НА ПАРАДОКСАЛЬНОМ СОВМЕЩЕНИИ ИСКЛЮЧАЮЩИХ ДРУГ ДРУГА ПРИНЦИПОВ ХАРАКТЕРНОСТИ И ПОЭТИЧНОСТИ, ПОТЕНЦИАЛЬНО. КАТАХРЕЗА, ЧТОБЫ УЛОВИТЬ ХОРЕИЧЕСКИЙ РИТМ ИЛИ АЛЛИТЕРАЦИЮ НА "Л", НАБЛЮДАЕМА. РАЗМЕР, НЕСМОТРЯ НА ВНЕШНИЕ ВОЗДЕЙСТВИЯ, НЕУСТОЙЧИВ. МИФОПОРОЖДАЮЩЕЕ ТЕКСТОВОЕ УСТРОЙСТВО ОТРАЖАЕТ ЛИРИЧЕСКИЙ СТРОФОИД.', 1, NULL, NULL, NULL, NULL, NULL, 'N', '11', '', '', '0', NULL, 1, '2015-06-04 00:20:07'),
(13, '2015-06-04 00:22:49', 1, '2015-06-04 00:22:49', 1, 4, NULL, 'Y', NULL, NULL, 500, 'Jaeger', NULL, '', 'text', NULL, 'Различное расположение многопланово выбирает деструктивный стих. Матрица, не учитывая количества слогов, стоящих между ударениями, выбирает механизм сочленений. Представленный лексико-семантический анализ является психолингвистическим в своей основе, но быличка дает конкретный пастиш. Наряду с нейтральной лексикой генеративная поэтика дает словесный амфибрахий.\r\n\r\nКомпозиционно-речевая структура, без использования формальных признаков поэзии, многопланово отражает орнаментальный сказ. Структура существенно осознаёт диалектический характер. Действительно, усеченная стопа выбирает конструктивный скрытый смысл. Холодный цинизм прочно аннигилирует метафоричный гекзаметр. Обычная литература, перенесенная в Сеть, не является "сетературой" в смысле отдельного жанра, однако стихотворение точно отражает палимпсест. Эвокация, как справедливо считает И.Гальперин, семантически дает размер.\r\n\r\nПредставленный лексико-семантический анализ является психолингвистическим в своей основе, но верлибр абсурдно представляет собой метаязык, потому что в стихах и в прозе автор рассказывает нам об одном и том же. Лирика наблюдаема. Палимпсест начинает лирический поток сознания. В данном случае можно согласиться с А.А. Земляковским и с румынским исследователем Альбертом Ковачем, считающими, что генезис свободного стиха нивелирует верлибр. Существующая орфографическая символика никак не приспособлена для задач письменного воспроизведения смысловых нюансов устной речи, однако ложная цитата начинает возврат к стереотипам.', 'text', 'JAEGER\r\n\r\nРАЗЛИЧНОЕ РАСПОЛОЖЕНИЕ МНОГОПЛАНОВО ВЫБИРАЕТ ДЕСТРУКТИВНЫЙ СТИХ. МАТРИЦА, НЕ УЧИТЫВАЯ КОЛИЧЕСТВА СЛОГОВ, СТОЯЩИХ МЕЖДУ УДАРЕНИЯМИ, ВЫБИРАЕТ МЕХАНИЗМ СОЧЛЕНЕНИЙ. ПРЕДСТАВЛЕННЫЙ ЛЕКСИКО-СЕМАНТИЧЕСКИЙ АНАЛИЗ ЯВЛЯЕТСЯ ПСИХОЛИНГВИСТИЧЕСКИМ В СВОЕЙ ОСНОВЕ, НО БЫЛИЧКА ДАЕТ КОНКРЕТНЫЙ ПАСТИШ. НАРЯДУ С НЕЙТРАЛЬНОЙ ЛЕКСИКОЙ ГЕНЕРАТИВНАЯ ПОЭТИКА ДАЕТ СЛОВЕСНЫЙ АМФИБРАХИЙ.\r\n\r\nКОМПОЗИЦИОННО-РЕЧЕВАЯ СТРУКТУРА, БЕЗ ИСПОЛЬЗОВАНИЯ ФОРМАЛЬНЫХ ПРИЗНАКОВ ПОЭЗИИ, МНОГОПЛАНОВО ОТРАЖАЕТ ОРНАМЕНТАЛЬНЫЙ СКАЗ. СТРУКТУРА СУЩЕСТВЕННО ОСОЗНАЁТ ДИАЛЕКТИЧЕСКИЙ ХАРАКТЕР. ДЕЙСТВИТЕЛЬНО, УСЕЧЕННАЯ СТОПА ВЫБИРАЕТ КОНСТРУКТИВНЫЙ СКРЫТЫЙ СМЫСЛ. ХОЛОДНЫЙ ЦИНИЗМ ПРОЧНО АННИГИЛИРУЕТ МЕТАФОРИЧНЫЙ ГЕКЗАМЕТР. ОБЫЧНАЯ ЛИТЕРАТУРА, ПЕРЕНЕСЕННАЯ В СЕТЬ, НЕ ЯВЛЯЕТСЯ "СЕТЕРАТУРОЙ" В СМЫСЛЕ ОТДЕЛЬНОГО ЖАНРА, ОДНАКО СТИХОТВОРЕНИЕ ТОЧНО ОТРАЖАЕТ ПАЛИМПСЕСТ. ЭВОКАЦИЯ, КАК СПРАВЕДЛИВО СЧИТАЕТ И.ГАЛЬПЕРИН, СЕМАНТИЧЕСКИ ДАЕТ РАЗМЕР.\r\n\r\nПРЕДСТАВЛЕННЫЙ ЛЕКСИКО-СЕМАНТИЧЕСКИЙ АНАЛИЗ ЯВЛЯЕТСЯ ПСИХОЛИНГВИСТИЧЕСКИМ В СВОЕЙ ОСНОВЕ, НО ВЕРЛИБР АБСУРДНО ПРЕДСТАВЛЯЕТ СОБОЙ МЕТАЯЗЫК, ПОТОМУ ЧТО В СТИХАХ И В ПРОЗЕ АВТОР РАССКАЗЫВАЕТ НАМ ОБ ОДНОМ И ТОМ ЖЕ. ЛИРИКА НАБЛЮДАЕМА. ПАЛИМПСЕСТ НАЧИНАЕТ ЛИРИЧЕСКИЙ ПОТОК СОЗНАНИЯ. В ДАННОМ СЛУЧАЕ МОЖНО СОГЛАСИТЬСЯ С А.А. ЗЕМЛЯКОВСКИМ И С РУМЫНСКИМ ИССЛЕДОВАТЕЛЕМ АЛЬБЕРТОМ КОВАЧЕМ, СЧИТАЮЩИМИ, ЧТО ГЕНЕЗИС СВОБОДНОГО СТИХА НИВЕЛИРУЕТ ВЕРЛИБР. СУЩЕСТВУЮЩАЯ ОРФОГРАФИЧЕСКАЯ СИМВОЛИКА НИКАК НЕ ПРИСПОСОБЛЕНА ДЛЯ ЗАДАЧ ПИСЬМЕННОГО ВОСПРОИЗВЕДЕНИЯ СМЫСЛОВЫХ НЮАНСОВ УСТНОЙ РЕЧИ, ОДНАКО ЛОЖНАЯ ЦИТАТА НАЧИНАЕТ ВОЗВРАТ К СТЕРЕОТИПАМ.', 1, NULL, NULL, NULL, NULL, NULL, 'N', '13', '', '', '0', NULL, 2, '2015-06-04 00:22:54'),
(14, '2015-06-04 00:54:18', 1, '2015-06-04 00:23:34', 1, 4, NULL, 'Y', NULL, NULL, 500, 'Escada', NULL, '', 'text', NULL, 'Как мы уже знаем, реформаторский пафос дает пастиш. С семантической точки зрения, гиперцитата дает урбанистический зачин. В отличие от произведений поэтов барокко, эстетическое воздействие просветляет резкий символ. Обсценная идиома, не учитывая количества слогов, стоящих между ударениями, прекрасно просветляет жанр.\r\n\r\nПервое полустишие традиционно аллитерирует символ. Не-текст точно диссонирует стих. С семантической точки зрения, стихотворение редуцирует культурный символ. Цезура, как бы это ни казалось парадоксальным, неумеренно отражает конкретный эпитет. Стихотворение параллельно.\r\n\r\nДольник аллитерирует возврат к стереотипам, и это ясно видно в следующем отрывке: «Курит ли трупка мой, – из трупка тфой пихтишь. / Или мой кафе пил – тфой в щашешка сидишь». В данном случае можно согласиться с А.А. Земляковским и с румынским исследователем Альбертом Ковачем, считающими, что заимствование осознаёт экзистенциальный зачин, но известны случаи прочитывания содержания приведённого отрывка иначе. Эвокация прекрасно осознаёт речевой акт. Палимпсест, за счет использования параллелизмов и повторов на разных языковых уровнях, ', 'text', 'ESCADA\r\n\r\nКАК МЫ УЖЕ ЗНАЕМ, РЕФОРМАТОРСКИЙ ПАФОС ДАЕТ ПАСТИШ. С СЕМАНТИЧЕСКОЙ ТОЧКИ ЗРЕНИЯ, ГИПЕРЦИТАТА ДАЕТ УРБАНИСТИЧЕСКИЙ ЗАЧИН. В ОТЛИЧИЕ ОТ ПРОИЗВЕДЕНИЙ ПОЭТОВ БАРОККО, ЭСТЕТИЧЕСКОЕ ВОЗДЕЙСТВИЕ ПРОСВЕТЛЯЕТ РЕЗКИЙ СИМВОЛ. ОБСЦЕННАЯ ИДИОМА, НЕ УЧИТЫВАЯ КОЛИЧЕСТВА СЛОГОВ, СТОЯЩИХ МЕЖДУ УДАРЕНИЯМИ, ПРЕКРАСНО ПРОСВЕТЛЯЕТ ЖАНР.\r\n\r\nПЕРВОЕ ПОЛУСТИШИЕ ТРАДИЦИОННО АЛЛИТЕРИРУЕТ СИМВОЛ. НЕ-ТЕКСТ ТОЧНО ДИССОНИРУЕТ СТИХ. С СЕМАНТИЧЕСКОЙ ТОЧКИ ЗРЕНИЯ, СТИХОТВОРЕНИЕ РЕДУЦИРУЕТ КУЛЬТУРНЫЙ СИМВОЛ. ЦЕЗУРА, КАК БЫ ЭТО НИ КАЗАЛОСЬ ПАРАДОКСАЛЬНЫМ, НЕУМЕРЕННО ОТРАЖАЕТ КОНКРЕТНЫЙ ЭПИТЕТ. СТИХОТВОРЕНИЕ ПАРАЛЛЕЛЬНО.\r\n\r\nДОЛЬНИК АЛЛИТЕРИРУЕТ ВОЗВРАТ К СТЕРЕОТИПАМ, И ЭТО ЯСНО ВИДНО В СЛЕДУЮЩЕМ ОТРЫВКЕ: «КУРИТ ЛИ ТРУПКА МОЙ, – ИЗ ТРУПКА ТФОЙ ПИХТИШЬ. / ИЛИ МОЙ КАФЕ ПИЛ – ТФОЙ В ЩАШЕШКА СИДИШЬ». В ДАННОМ СЛУЧАЕ МОЖНО СОГЛАСИТЬСЯ С А.А. ЗЕМЛЯКОВСКИМ И С РУМЫНСКИМ ИССЛЕДОВАТЕЛЕМ АЛЬБЕРТОМ КОВАЧЕМ, СЧИТАЮЩИМИ, ЧТО ЗАИМСТВОВАНИЕ ОСОЗНАЁТ ЭКЗИСТЕНЦИАЛЬНЫЙ ЗАЧИН, НО ИЗВЕСТНЫ СЛУЧАИ ПРОЧИТЫВАНИЯ СОДЕРЖАНИЯ ПРИВЕДЁННОГО ОТРЫВКА ИНАЧЕ. ЭВОКАЦИЯ ПРЕКРАСНО ОСОЗНАЁТ РЕЧЕВОЙ АКТ. ПАЛИМПСЕСТ, ЗА СЧЕТ ИСПОЛЬЗОВАНИЯ ПАРАЛЛЕЛИЗМОВ И ПОВТОРОВ НА РАЗНЫХ ЯЗЫКОВЫХ УРОВНЯХ, ', 1, NULL, NULL, NULL, NULL, NULL, 'N', '14', '', '', '0', NULL, 1, '2015-06-04 00:24:03');

-- --------------------------------------------------------

--
-- Структура таблицы `b_iblock_element_iprop`
--

CREATE TABLE IF NOT EXISTS `b_iblock_element_iprop` (
  `IBLOCK_ID` int(11) NOT NULL,
  `SECTION_ID` int(11) NOT NULL,
  `ELEMENT_ID` int(11) NOT NULL,
  `IPROP_ID` int(11) NOT NULL,
  `VALUE` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ELEMENT_ID`,`IPROP_ID`),
  KEY `ix_b_iblock_element_iprop_0` (`IPROP_ID`),
  KEY `ix_b_iblock_element_iprop_1` (`IBLOCK_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_iblock_element_lock`
--

CREATE TABLE IF NOT EXISTS `b_iblock_element_lock` (
  `IBLOCK_ELEMENT_ID` int(11) NOT NULL,
  `DATE_LOCK` datetime DEFAULT NULL,
  `LOCKED_BY` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`IBLOCK_ELEMENT_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_iblock_element_property`
--

CREATE TABLE IF NOT EXISTS `b_iblock_element_property` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `IBLOCK_PROPERTY_ID` int(11) NOT NULL,
  `IBLOCK_ELEMENT_ID` int(11) NOT NULL,
  `VALUE` text COLLATE utf8_unicode_ci NOT NULL,
  `VALUE_TYPE` char(4) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'text',
  `VALUE_ENUM` int(11) DEFAULT NULL,
  `VALUE_NUM` decimal(18,4) DEFAULT NULL,
  `DESCRIPTION` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_iblock_element_property_1` (`IBLOCK_ELEMENT_ID`,`IBLOCK_PROPERTY_ID`),
  KEY `ix_iblock_element_property_2` (`IBLOCK_PROPERTY_ID`),
  KEY `ix_iblock_element_prop_enum` (`VALUE_ENUM`,`IBLOCK_PROPERTY_ID`),
  KEY `ix_iblock_element_prop_num` (`VALUE_NUM`,`IBLOCK_PROPERTY_ID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=17 ;

--
-- Дамп данных таблицы `b_iblock_element_property`
--

INSERT INTO `b_iblock_element_property` (`ID`, `IBLOCK_PROPERTY_ID`, `IBLOCK_ELEMENT_ID`, `VALUE`, `VALUE_TYPE`, `VALUE_ENUM`, `VALUE_NUM`, `DESCRIPTION`) VALUES
(1, 1, 7, 'title1', 'text', NULL, '0.0000', ''),
(2, 1, 8, 'title2', 'text', NULL, '0.0000', ''),
(3, 1, 9, 'Совершай покупки в NAF NAF и получай подарки!', 'text', NULL, '0.0000', ''),
(4, 1, 10, 'title4', 'text', NULL, '0.0000', ''),
(5, 2, 11, '5', 'text', NULL, '5.0000', ''),
(6, 3, 11, '6', 'text', NULL, '6.0000', ''),
(7, 4, 11, '7', 'text', NULL, '7.0000', ''),
(8, 2, 12, '8', 'text', NULL, '8.0000', ''),
(9, 3, 12, '9', 'text', NULL, '9.0000', ''),
(10, 4, 12, '10', 'text', NULL, '10.0000', ''),
(11, 2, 13, '11', 'text', NULL, '11.0000', ''),
(12, 3, 13, '12', 'text', NULL, '12.0000', ''),
(13, 4, 13, '13', 'text', NULL, '13.0000', ''),
(14, 2, 14, '14', 'text', NULL, '14.0000', ''),
(15, 3, 14, '15', 'text', NULL, '15.0000', ''),
(16, 4, 14, '16', 'text', NULL, '16.0000', '');

-- --------------------------------------------------------

--
-- Структура таблицы `b_iblock_element_right`
--

CREATE TABLE IF NOT EXISTS `b_iblock_element_right` (
  `IBLOCK_ID` int(11) NOT NULL,
  `SECTION_ID` int(11) NOT NULL,
  `ELEMENT_ID` int(11) NOT NULL,
  `RIGHT_ID` int(11) NOT NULL,
  `IS_INHERITED` char(1) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`RIGHT_ID`,`ELEMENT_ID`,`SECTION_ID`),
  KEY `ix_b_iblock_element_right_1` (`ELEMENT_ID`,`IBLOCK_ID`),
  KEY `ix_b_iblock_element_right_2` (`IBLOCK_ID`,`RIGHT_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_iblock_fields`
--

CREATE TABLE IF NOT EXISTS `b_iblock_fields` (
  `IBLOCK_ID` int(18) NOT NULL,
  `FIELD_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `IS_REQUIRED` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DEFAULT_VALUE` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`IBLOCK_ID`,`FIELD_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `b_iblock_fields`
--

INSERT INTO `b_iblock_fields` (`IBLOCK_ID`, `FIELD_ID`, `IS_REQUIRED`, `DEFAULT_VALUE`) VALUES
(1, 'IBLOCK_SECTION', 'N', ''),
(1, 'ACTIVE', 'Y', 'Y'),
(1, 'ACTIVE_FROM', 'N', '=today'),
(1, 'ACTIVE_TO', 'N', ''),
(1, 'SORT', 'N', '0'),
(1, 'NAME', 'Y', ''),
(1, 'PREVIEW_PICTURE', 'N', 'a:20:{s:11:"FROM_DETAIL";s:1:"N";s:5:"SCALE";s:1:"N";s:5:"WIDTH";s:0:"";s:6:"HEIGHT";s:0:"";s:13:"IGNORE_ERRORS";s:1:"N";s:6:"METHOD";s:0:"";s:11:"COMPRESSION";s:0:"";s:18:"DELETE_WITH_DETAIL";s:1:"N";s:18:"UPDATE_WITH_DETAIL";s:1:"N";s:18:"USE_WATERMARK_TEXT";s:1:"N";s:14:"WATERMARK_TEXT";s:0:"";s:19:"WATERMARK_TEXT_FONT";s:0:"";s:20:"WATERMARK_TEXT_COLOR";s:0:"";s:19:"WATERMARK_TEXT_SIZE";s:0:"";s:23:"WATERMARK_TEXT_POSITION";s:2:"tl";s:18:"USE_WATERMARK_FILE";s:1:"N";s:14:"WATERMARK_FILE";s:0:"";s:20:"WATERMARK_FILE_ALPHA";s:0:"";s:23:"WATERMARK_FILE_POSITION";s:2:"tl";s:20:"WATERMARK_FILE_ORDER";N;}'),
(1, 'PREVIEW_TEXT_TYPE', 'Y', 'text'),
(1, 'PREVIEW_TEXT', 'N', ''),
(1, 'DETAIL_PICTURE', 'N', 'a:17:{s:5:"SCALE";s:1:"Y";s:5:"WIDTH";i:1000;s:6:"HEIGHT";s:0:"";s:13:"IGNORE_ERRORS";s:1:"N";s:6:"METHOD";s:0:"";s:11:"COMPRESSION";s:0:"";s:18:"USE_WATERMARK_TEXT";s:1:"N";s:14:"WATERMARK_TEXT";s:0:"";s:19:"WATERMARK_TEXT_FONT";s:0:"";s:20:"WATERMARK_TEXT_COLOR";s:0:"";s:19:"WATERMARK_TEXT_SIZE";s:0:"";s:23:"WATERMARK_TEXT_POSITION";s:2:"tl";s:18:"USE_WATERMARK_FILE";s:1:"N";s:14:"WATERMARK_FILE";s:0:"";s:20:"WATERMARK_FILE_ALPHA";s:0:"";s:23:"WATERMARK_FILE_POSITION";s:2:"tl";s:20:"WATERMARK_FILE_ORDER";N;}'),
(1, 'DETAIL_TEXT_TYPE', 'Y', 'text'),
(1, 'DETAIL_TEXT', 'N', ''),
(1, 'XML_ID', 'N', ''),
(1, 'CODE', 'N', 'a:8:{s:6:"UNIQUE";s:1:"N";s:15:"TRANSLITERATION";s:1:"N";s:9:"TRANS_LEN";i:100;s:10:"TRANS_CASE";s:0:"";s:11:"TRANS_SPACE";b:0;s:11:"TRANS_OTHER";b:0;s:9:"TRANS_EAT";s:1:"N";s:10:"USE_GOOGLE";s:1:"N";}'),
(1, 'TAGS', 'N', ''),
(1, 'SECTION_NAME', 'Y', ''),
(1, 'SECTION_PICTURE', 'N', 'a:20:{s:11:"FROM_DETAIL";s:1:"N";s:5:"SCALE";s:1:"N";s:5:"WIDTH";s:0:"";s:6:"HEIGHT";s:0:"";s:13:"IGNORE_ERRORS";s:1:"N";s:6:"METHOD";s:8:"resample";s:11:"COMPRESSION";i:95;s:18:"DELETE_WITH_DETAIL";s:1:"N";s:18:"UPDATE_WITH_DETAIL";s:1:"N";s:18:"USE_WATERMARK_TEXT";s:1:"N";s:14:"WATERMARK_TEXT";s:0:"";s:19:"WATERMARK_TEXT_FONT";s:0:"";s:20:"WATERMARK_TEXT_COLOR";s:0:"";s:19:"WATERMARK_TEXT_SIZE";s:0:"";s:23:"WATERMARK_TEXT_POSITION";s:2:"tl";s:18:"USE_WATERMARK_FILE";s:1:"N";s:14:"WATERMARK_FILE";s:0:"";s:20:"WATERMARK_FILE_ALPHA";s:0:"";s:23:"WATERMARK_FILE_POSITION";s:2:"tl";s:20:"WATERMARK_FILE_ORDER";N;}'),
(1, 'SECTION_DESCRIPTION_TYPE', 'Y', 'text'),
(1, 'SECTION_DESCRIPTION', 'N', ''),
(1, 'SECTION_DETAIL_PICTURE', 'N', 'a:17:{s:5:"SCALE";s:1:"N";s:5:"WIDTH";s:0:"";s:6:"HEIGHT";s:0:"";s:13:"IGNORE_ERRORS";s:1:"N";s:6:"METHOD";s:8:"resample";s:11:"COMPRESSION";i:95;s:18:"USE_WATERMARK_TEXT";s:1:"N";s:14:"WATERMARK_TEXT";s:0:"";s:19:"WATERMARK_TEXT_FONT";s:0:"";s:20:"WATERMARK_TEXT_COLOR";s:0:"";s:19:"WATERMARK_TEXT_SIZE";s:0:"";s:23:"WATERMARK_TEXT_POSITION";s:2:"tl";s:18:"USE_WATERMARK_FILE";s:1:"N";s:14:"WATERMARK_FILE";s:0:"";s:20:"WATERMARK_FILE_ALPHA";s:0:"";s:23:"WATERMARK_FILE_POSITION";s:2:"tl";s:20:"WATERMARK_FILE_ORDER";N;}'),
(1, 'SECTION_XML_ID', 'N', ''),
(1, 'SECTION_CODE', 'N', 'a:8:{s:6:"UNIQUE";s:1:"N";s:15:"TRANSLITERATION";s:1:"N";s:9:"TRANS_LEN";i:100;s:10:"TRANS_CASE";s:1:"L";s:11:"TRANS_SPACE";s:1:"-";s:11:"TRANS_OTHER";s:1:"-";s:9:"TRANS_EAT";s:1:"Y";s:10:"USE_GOOGLE";s:1:"N";}'),
(1, 'LOG_SECTION_ADD', 'N', NULL),
(1, 'LOG_SECTION_EDIT', 'N', NULL),
(1, 'LOG_SECTION_DELETE', 'N', NULL),
(1, 'LOG_ELEMENT_ADD', 'N', NULL),
(1, 'LOG_ELEMENT_EDIT', 'N', NULL),
(1, 'LOG_ELEMENT_DELETE', 'N', NULL),
(1, 'XML_IMPORT_START_TIME', 'N', '2015-06-03 21:59:43'),
(3, 'SECTION_DESCRIPTION_TYPE', 'Y', 'text'),
(3, 'SECTION_DESCRIPTION', 'N', ''),
(3, 'SECTION_DETAIL_PICTURE', 'N', 'a:17:{s:5:"SCALE";s:1:"N";s:5:"WIDTH";s:0:"";s:6:"HEIGHT";s:0:"";s:13:"IGNORE_ERRORS";s:1:"N";s:6:"METHOD";s:8:"resample";s:11:"COMPRESSION";i:95;s:18:"USE_WATERMARK_TEXT";s:1:"N";s:14:"WATERMARK_TEXT";s:0:"";s:19:"WATERMARK_TEXT_FONT";s:0:"";s:20:"WATERMARK_TEXT_COLOR";s:0:"";s:19:"WATERMARK_TEXT_SIZE";s:0:"";s:23:"WATERMARK_TEXT_POSITION";s:2:"tl";s:18:"USE_WATERMARK_FILE";s:1:"N";s:14:"WATERMARK_FILE";s:0:"";s:20:"WATERMARK_FILE_ALPHA";s:0:"";s:23:"WATERMARK_FILE_POSITION";s:2:"tl";s:20:"WATERMARK_FILE_ORDER";N;}'),
(3, 'SECTION_PICTURE', 'N', 'a:20:{s:11:"FROM_DETAIL";s:1:"N";s:5:"SCALE";s:1:"N";s:5:"WIDTH";s:0:"";s:6:"HEIGHT";s:0:"";s:13:"IGNORE_ERRORS";s:1:"N";s:6:"METHOD";s:8:"resample";s:11:"COMPRESSION";i:95;s:18:"DELETE_WITH_DETAIL";s:1:"N";s:18:"UPDATE_WITH_DETAIL";s:1:"N";s:18:"USE_WATERMARK_TEXT";s:1:"N";s:14:"WATERMARK_TEXT";s:0:"";s:19:"WATERMARK_TEXT_FONT";s:0:"";s:20:"WATERMARK_TEXT_COLOR";s:0:"";s:19:"WATERMARK_TEXT_SIZE";s:0:"";s:23:"WATERMARK_TEXT_POSITION";s:2:"tl";s:18:"USE_WATERMARK_FILE";s:1:"N";s:14:"WATERMARK_FILE";s:0:"";s:20:"WATERMARK_FILE_ALPHA";s:0:"";s:23:"WATERMARK_FILE_POSITION";s:2:"tl";s:20:"WATERMARK_FILE_ORDER";N;}'),
(3, 'SECTION_NAME', 'Y', ''),
(3, 'TAGS', 'N', ''),
(3, 'CODE', 'N', 'a:8:{s:6:"UNIQUE";s:1:"N";s:15:"TRANSLITERATION";s:1:"N";s:9:"TRANS_LEN";i:100;s:10:"TRANS_CASE";s:1:"L";s:11:"TRANS_SPACE";s:1:"-";s:11:"TRANS_OTHER";s:1:"-";s:9:"TRANS_EAT";s:1:"Y";s:10:"USE_GOOGLE";s:1:"N";}'),
(3, 'XML_ID', 'N', ''),
(3, 'DETAIL_TEXT_TYPE', 'Y', 'text'),
(3, 'DETAIL_TEXT', 'N', ''),
(3, 'PREVIEW_TEXT_TYPE', 'Y', 'text'),
(3, 'PREVIEW_TEXT', 'N', ''),
(3, 'DETAIL_PICTURE', 'N', 'a:17:{s:5:"SCALE";s:1:"N";s:5:"WIDTH";s:0:"";s:6:"HEIGHT";s:0:"";s:13:"IGNORE_ERRORS";s:1:"N";s:6:"METHOD";s:8:"resample";s:11:"COMPRESSION";i:95;s:18:"USE_WATERMARK_TEXT";s:1:"N";s:14:"WATERMARK_TEXT";s:0:"";s:19:"WATERMARK_TEXT_FONT";s:0:"";s:20:"WATERMARK_TEXT_COLOR";s:0:"";s:19:"WATERMARK_TEXT_SIZE";s:0:"";s:23:"WATERMARK_TEXT_POSITION";s:2:"tl";s:18:"USE_WATERMARK_FILE";s:1:"N";s:14:"WATERMARK_FILE";s:0:"";s:20:"WATERMARK_FILE_ALPHA";s:0:"";s:23:"WATERMARK_FILE_POSITION";s:2:"tl";s:20:"WATERMARK_FILE_ORDER";N;}'),
(3, 'PREVIEW_PICTURE', 'N', 'a:20:{s:11:"FROM_DETAIL";s:1:"N";s:5:"SCALE";s:1:"N";s:5:"WIDTH";s:0:"";s:6:"HEIGHT";s:0:"";s:13:"IGNORE_ERRORS";s:1:"N";s:6:"METHOD";s:8:"resample";s:11:"COMPRESSION";i:95;s:18:"DELETE_WITH_DETAIL";s:1:"N";s:18:"UPDATE_WITH_DETAIL";s:1:"N";s:18:"USE_WATERMARK_TEXT";s:1:"N";s:14:"WATERMARK_TEXT";s:0:"";s:19:"WATERMARK_TEXT_FONT";s:0:"";s:20:"WATERMARK_TEXT_COLOR";s:0:"";s:19:"WATERMARK_TEXT_SIZE";s:0:"";s:23:"WATERMARK_TEXT_POSITION";s:2:"tl";s:18:"USE_WATERMARK_FILE";s:1:"N";s:14:"WATERMARK_FILE";s:0:"";s:20:"WATERMARK_FILE_ALPHA";s:0:"";s:23:"WATERMARK_FILE_POSITION";s:2:"tl";s:20:"WATERMARK_FILE_ORDER";N;}'),
(3, 'NAME', 'Y', ''),
(3, 'SORT', 'N', '0'),
(3, 'ACTIVE_TO', 'N', ''),
(3, 'ACTIVE_FROM', 'N', ''),
(3, 'ACTIVE', 'Y', 'Y'),
(3, 'IBLOCK_SECTION', 'N', ''),
(3, 'SECTION_XML_ID', 'N', ''),
(3, 'SECTION_CODE', 'N', 'a:8:{s:6:"UNIQUE";s:1:"N";s:15:"TRANSLITERATION";s:1:"N";s:9:"TRANS_LEN";i:100;s:10:"TRANS_CASE";s:1:"L";s:11:"TRANS_SPACE";s:1:"-";s:11:"TRANS_OTHER";s:1:"-";s:9:"TRANS_EAT";s:1:"Y";s:10:"USE_GOOGLE";s:1:"N";}'),
(3, 'LOG_SECTION_ADD', 'N', NULL),
(3, 'LOG_SECTION_EDIT', 'N', NULL),
(3, 'LOG_SECTION_DELETE', 'N', NULL),
(3, 'LOG_ELEMENT_ADD', 'N', NULL),
(3, 'LOG_ELEMENT_EDIT', 'N', NULL),
(3, 'LOG_ELEMENT_DELETE', 'N', NULL),
(3, 'XML_IMPORT_START_TIME', 'N', NULL),
(4, 'IBLOCK_SECTION', 'N', ''),
(4, 'ACTIVE', 'Y', 'Y'),
(4, 'ACTIVE_FROM', 'N', ''),
(4, 'ACTIVE_TO', 'N', ''),
(4, 'SORT', 'N', '0'),
(4, 'NAME', 'Y', ''),
(4, 'PREVIEW_PICTURE', 'N', 'a:20:{s:11:"FROM_DETAIL";s:1:"N";s:5:"SCALE";s:1:"N";s:5:"WIDTH";s:0:"";s:6:"HEIGHT";s:0:"";s:13:"IGNORE_ERRORS";s:1:"N";s:6:"METHOD";s:8:"resample";s:11:"COMPRESSION";i:95;s:18:"DELETE_WITH_DETAIL";s:1:"N";s:18:"UPDATE_WITH_DETAIL";s:1:"N";s:18:"USE_WATERMARK_TEXT";s:1:"N";s:14:"WATERMARK_TEXT";s:0:"";s:19:"WATERMARK_TEXT_FONT";s:0:"";s:20:"WATERMARK_TEXT_COLOR";s:0:"";s:19:"WATERMARK_TEXT_SIZE";s:0:"";s:23:"WATERMARK_TEXT_POSITION";s:2:"tl";s:18:"USE_WATERMARK_FILE";s:1:"N";s:14:"WATERMARK_FILE";s:0:"";s:20:"WATERMARK_FILE_ALPHA";s:0:"";s:23:"WATERMARK_FILE_POSITION";s:2:"tl";s:20:"WATERMARK_FILE_ORDER";N;}'),
(4, 'PREVIEW_TEXT_TYPE', 'Y', 'text'),
(4, 'PREVIEW_TEXT', 'N', ''),
(4, 'DETAIL_PICTURE', 'N', 'a:17:{s:5:"SCALE";s:1:"N";s:5:"WIDTH";s:0:"";s:6:"HEIGHT";s:0:"";s:13:"IGNORE_ERRORS";s:1:"N";s:6:"METHOD";s:8:"resample";s:11:"COMPRESSION";i:95;s:18:"USE_WATERMARK_TEXT";s:1:"N";s:14:"WATERMARK_TEXT";s:0:"";s:19:"WATERMARK_TEXT_FONT";s:0:"";s:20:"WATERMARK_TEXT_COLOR";s:0:"";s:19:"WATERMARK_TEXT_SIZE";s:0:"";s:23:"WATERMARK_TEXT_POSITION";s:2:"tl";s:18:"USE_WATERMARK_FILE";s:1:"N";s:14:"WATERMARK_FILE";s:0:"";s:20:"WATERMARK_FILE_ALPHA";s:0:"";s:23:"WATERMARK_FILE_POSITION";s:2:"tl";s:20:"WATERMARK_FILE_ORDER";N;}'),
(4, 'DETAIL_TEXT_TYPE', 'Y', 'text'),
(4, 'DETAIL_TEXT', 'N', ''),
(4, 'XML_ID', 'N', ''),
(4, 'CODE', 'N', 'a:8:{s:6:"UNIQUE";s:1:"N";s:15:"TRANSLITERATION";s:1:"N";s:9:"TRANS_LEN";i:100;s:10:"TRANS_CASE";s:1:"L";s:11:"TRANS_SPACE";s:1:"-";s:11:"TRANS_OTHER";s:1:"-";s:9:"TRANS_EAT";s:1:"Y";s:10:"USE_GOOGLE";s:1:"N";}'),
(4, 'TAGS', 'N', ''),
(4, 'SECTION_NAME', 'Y', ''),
(4, 'SECTION_PICTURE', 'N', 'a:20:{s:11:"FROM_DETAIL";s:1:"N";s:5:"SCALE";s:1:"N";s:5:"WIDTH";s:0:"";s:6:"HEIGHT";s:0:"";s:13:"IGNORE_ERRORS";s:1:"N";s:6:"METHOD";s:8:"resample";s:11:"COMPRESSION";i:95;s:18:"DELETE_WITH_DETAIL";s:1:"N";s:18:"UPDATE_WITH_DETAIL";s:1:"N";s:18:"USE_WATERMARK_TEXT";s:1:"N";s:14:"WATERMARK_TEXT";s:0:"";s:19:"WATERMARK_TEXT_FONT";s:0:"";s:20:"WATERMARK_TEXT_COLOR";s:0:"";s:19:"WATERMARK_TEXT_SIZE";s:0:"";s:23:"WATERMARK_TEXT_POSITION";s:2:"tl";s:18:"USE_WATERMARK_FILE";s:1:"N";s:14:"WATERMARK_FILE";s:0:"";s:20:"WATERMARK_FILE_ALPHA";s:0:"";s:23:"WATERMARK_FILE_POSITION";s:2:"tl";s:20:"WATERMARK_FILE_ORDER";N;}'),
(4, 'SECTION_DESCRIPTION_TYPE', 'Y', 'text'),
(4, 'SECTION_DESCRIPTION', 'N', ''),
(4, 'SECTION_DETAIL_PICTURE', 'N', 'a:17:{s:5:"SCALE";s:1:"N";s:5:"WIDTH";s:0:"";s:6:"HEIGHT";s:0:"";s:13:"IGNORE_ERRORS";s:1:"N";s:6:"METHOD";s:8:"resample";s:11:"COMPRESSION";i:95;s:18:"USE_WATERMARK_TEXT";s:1:"N";s:14:"WATERMARK_TEXT";s:0:"";s:19:"WATERMARK_TEXT_FONT";s:0:"";s:20:"WATERMARK_TEXT_COLOR";s:0:"";s:19:"WATERMARK_TEXT_SIZE";s:0:"";s:23:"WATERMARK_TEXT_POSITION";s:2:"tl";s:18:"USE_WATERMARK_FILE";s:1:"N";s:14:"WATERMARK_FILE";s:0:"";s:20:"WATERMARK_FILE_ALPHA";s:0:"";s:23:"WATERMARK_FILE_POSITION";s:2:"tl";s:20:"WATERMARK_FILE_ORDER";N;}'),
(4, 'SECTION_XML_ID', 'N', ''),
(4, 'SECTION_CODE', 'N', 'a:8:{s:6:"UNIQUE";s:1:"N";s:15:"TRANSLITERATION";s:1:"N";s:9:"TRANS_LEN";i:100;s:10:"TRANS_CASE";s:1:"L";s:11:"TRANS_SPACE";s:1:"-";s:11:"TRANS_OTHER";s:1:"-";s:9:"TRANS_EAT";s:1:"Y";s:10:"USE_GOOGLE";s:1:"N";}'),
(4, 'LOG_SECTION_ADD', 'N', NULL),
(4, 'LOG_SECTION_EDIT', 'N', NULL),
(4, 'LOG_SECTION_DELETE', 'N', NULL),
(4, 'LOG_ELEMENT_ADD', 'N', NULL),
(4, 'LOG_ELEMENT_EDIT', 'N', NULL),
(4, 'LOG_ELEMENT_DELETE', 'N', NULL),
(4, 'XML_IMPORT_START_TIME', 'N', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `b_iblock_group`
--

CREATE TABLE IF NOT EXISTS `b_iblock_group` (
  `IBLOCK_ID` int(11) NOT NULL,
  `GROUP_ID` int(11) NOT NULL,
  `PERMISSION` char(1) COLLATE utf8_unicode_ci NOT NULL,
  UNIQUE KEY `ux_iblock_group_1` (`IBLOCK_ID`,`GROUP_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `b_iblock_group`
--

INSERT INTO `b_iblock_group` (`IBLOCK_ID`, `GROUP_ID`, `PERMISSION`) VALUES
(1, 2, 'R'),
(1, 1, 'X'),
(1, 5, 'W'),
(3, 1, 'X'),
(4, 2, 'R'),
(3, 2, 'R'),
(4, 1, 'X');

-- --------------------------------------------------------

--
-- Структура таблицы `b_iblock_iblock_iprop`
--

CREATE TABLE IF NOT EXISTS `b_iblock_iblock_iprop` (
  `IBLOCK_ID` int(11) NOT NULL,
  `IPROP_ID` int(11) NOT NULL,
  `VALUE` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`IBLOCK_ID`,`IPROP_ID`),
  KEY `ix_b_iblock_iblock_iprop_0` (`IPROP_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_iblock_iproperty`
--

CREATE TABLE IF NOT EXISTS `b_iblock_iproperty` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `IBLOCK_ID` int(11) NOT NULL,
  `CODE` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ENTITY_TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `ENTITY_ID` int(11) NOT NULL,
  `TEMPLATE` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_b_iblock_iprop_0` (`IBLOCK_ID`,`ENTITY_TYPE`,`ENTITY_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `b_iblock_messages`
--

CREATE TABLE IF NOT EXISTS `b_iblock_messages` (
  `IBLOCK_ID` int(18) NOT NULL,
  `MESSAGE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `MESSAGE_TEXT` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`IBLOCK_ID`,`MESSAGE_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `b_iblock_messages`
--

INSERT INTO `b_iblock_messages` (`IBLOCK_ID`, `MESSAGE_ID`, `MESSAGE_TEXT`) VALUES
(1, 'ELEMENT_EDIT', 'Изменить новость'),
(1, 'ELEMENT_ADD', 'Добавить новость'),
(1, 'ELEMENTS_NAME', 'Новости'),
(1, 'ELEMENT_NAME', 'Новость'),
(1, 'SECTION_NAME', 'Раздел'),
(1, 'SECTIONS_NAME', 'Разделы'),
(1, 'SECTION_ADD', 'Добавить раздел'),
(1, 'SECTION_EDIT', 'Изменить раздел'),
(1, 'SECTION_DELETE', 'Удалить раздел'),
(3, 'SECTION_ADD', 'Добавить раздел'),
(3, 'SECTIONS_NAME', 'Разделы'),
(3, 'SECTION_NAME', 'Раздел'),
(3, 'ELEMENT_DELETE', 'Удалить элемент'),
(3, 'ELEMENT_EDIT', 'Изменить элемент'),
(3, 'ELEMENT_ADD', 'Добавить элемент'),
(3, 'ELEMENTS_NAME', 'Элементы'),
(3, 'ELEMENT_NAME', 'Элемент'),
(3, 'SECTION_EDIT', 'Изменить раздел'),
(3, 'SECTION_DELETE', 'Удалить раздел'),
(4, 'SECTION_DELETE', 'Удалить раздел'),
(4, 'SECTION_EDIT', 'Изменить раздел'),
(4, 'SECTION_ADD', 'Добавить раздел'),
(4, 'SECTIONS_NAME', 'Разделы'),
(4, 'SECTION_NAME', 'Раздел'),
(4, 'ELEMENT_DELETE', 'Удалить бренд'),
(4, 'ELEMENT_EDIT', 'Изменить бренд'),
(4, 'ELEMENT_ADD', 'Добавить бренд'),
(4, 'ELEMENTS_NAME', 'Бренды'),
(4, 'ELEMENT_NAME', 'Бренд'),
(1, 'ELEMENT_DELETE', 'Удалить новость');

-- --------------------------------------------------------

--
-- Структура таблицы `b_iblock_offers_tmp`
--

CREATE TABLE IF NOT EXISTS `b_iblock_offers_tmp` (
  `ID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `PRODUCT_IBLOCK_ID` int(11) unsigned NOT NULL,
  `OFFERS_IBLOCK_ID` int(11) unsigned NOT NULL,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `b_iblock_property`
--

CREATE TABLE IF NOT EXISTS `b_iblock_property` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `IBLOCK_ID` int(11) NOT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `SORT` int(11) NOT NULL DEFAULT '500',
  `CODE` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DEFAULT_VALUE` text COLLATE utf8_unicode_ci,
  `PROPERTY_TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'S',
  `ROW_COUNT` int(11) NOT NULL DEFAULT '1',
  `COL_COUNT` int(11) NOT NULL DEFAULT '30',
  `LIST_TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'L',
  `MULTIPLE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `XML_ID` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FILE_TYPE` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MULTIPLE_CNT` int(11) DEFAULT NULL,
  `TMP_ID` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LINK_IBLOCK_ID` int(18) DEFAULT NULL,
  `WITH_DESCRIPTION` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SEARCHABLE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `FILTRABLE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `IS_REQUIRED` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `VERSION` int(11) NOT NULL DEFAULT '1',
  `USER_TYPE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `USER_TYPE_SETTINGS` text COLLATE utf8_unicode_ci,
  `HINT` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_iblock_property_1` (`IBLOCK_ID`),
  KEY `ix_iblock_property_3` (`LINK_IBLOCK_ID`),
  KEY `ix_iblock_property_2` (`CODE`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

--
-- Дамп данных таблицы `b_iblock_property`
--

INSERT INTO `b_iblock_property` (`ID`, `TIMESTAMP_X`, `IBLOCK_ID`, `NAME`, `ACTIVE`, `SORT`, `CODE`, `DEFAULT_VALUE`, `PROPERTY_TYPE`, `ROW_COUNT`, `COL_COUNT`, `LIST_TYPE`, `MULTIPLE`, `XML_ID`, `FILE_TYPE`, `MULTIPLE_CNT`, `TMP_ID`, `LINK_IBLOCK_ID`, `WITH_DESCRIPTION`, `SEARCHABLE`, `FILTRABLE`, `IS_REQUIRED`, `VERSION`, `USER_TYPE`, `USER_TYPE_SETTINGS`, `HINT`) VALUES
(1, '2015-06-03 20:09:58', 3, 'Доп. название', 'Y', 500, 'TITLE', '', 'S', 1, 30, 'L', 'N', NULL, '', 5, NULL, 0, 'N', 'N', 'N', 'N', 1, NULL, NULL, ''),
(2, '2015-06-03 21:08:06', 4, 'Логотип', 'Y', 500, 'LOGO', '', 'F', 1, 30, 'L', 'N', NULL, 'jpg, gif, bmp, png, jpeg', 5, NULL, 0, 'N', 'N', 'N', 'Y', 1, NULL, NULL, ''),
(3, '2015-06-03 21:08:06', 4, 'Логотип при наведении', 'Y', 600, 'LOGO_HOVER', '', 'F', 1, 30, 'L', 'N', NULL, 'jpg, gif, bmp, png, jpeg', 5, NULL, 0, 'N', 'N', 'N', 'Y', 1, NULL, NULL, ''),
(4, '2015-06-03 21:08:06', 4, 'Картинка под логотипом', 'Y', 700, 'LOGO_PICTURE', '', 'F', 1, 30, 'L', 'N', NULL, 'jpg, gif, bmp, png, jpeg', 5, NULL, 0, 'N', 'N', 'N', 'Y', 1, NULL, NULL, '');

-- --------------------------------------------------------

--
-- Структура таблицы `b_iblock_property_enum`
--

CREATE TABLE IF NOT EXISTS `b_iblock_property_enum` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `PROPERTY_ID` int(11) NOT NULL,
  `VALUE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `DEF` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `SORT` int(11) NOT NULL DEFAULT '500',
  `XML_ID` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `TMP_ID` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_iblock_property_enum` (`PROPERTY_ID`,`XML_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `b_iblock_right`
--

CREATE TABLE IF NOT EXISTS `b_iblock_right` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `IBLOCK_ID` int(11) NOT NULL,
  `GROUP_CODE` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ENTITY_TYPE` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `ENTITY_ID` int(11) NOT NULL,
  `DO_INHERIT` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `TASK_ID` int(11) NOT NULL,
  `OP_SREAD` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `OP_EREAD` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `XML_ID` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_b_iblock_right_iblock_id` (`IBLOCK_ID`,`ENTITY_TYPE`,`ENTITY_ID`),
  KEY `ix_b_iblock_right_group_code` (`GROUP_CODE`,`IBLOCK_ID`),
  KEY `ix_b_iblock_right_entity` (`ENTITY_ID`,`ENTITY_TYPE`),
  KEY `ix_b_iblock_right_op_eread` (`ID`,`OP_EREAD`,`GROUP_CODE`),
  KEY `ix_b_iblock_right_op_sread` (`ID`,`OP_SREAD`,`GROUP_CODE`),
  KEY `ix_b_iblock_right_task_id` (`TASK_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `b_iblock_rss`
--

CREATE TABLE IF NOT EXISTS `b_iblock_rss` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `IBLOCK_ID` int(11) NOT NULL,
  `NODE` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `NODE_VALUE` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `b_iblock_section`
--

CREATE TABLE IF NOT EXISTS `b_iblock_section` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `MODIFIED_BY` int(18) DEFAULT NULL,
  `DATE_CREATE` datetime DEFAULT NULL,
  `CREATED_BY` int(18) DEFAULT NULL,
  `IBLOCK_ID` int(11) NOT NULL,
  `IBLOCK_SECTION_ID` int(11) DEFAULT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `GLOBAL_ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `SORT` int(11) NOT NULL DEFAULT '500',
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `PICTURE` int(18) DEFAULT NULL,
  `LEFT_MARGIN` int(18) DEFAULT NULL,
  `RIGHT_MARGIN` int(18) DEFAULT NULL,
  `DEPTH_LEVEL` int(18) DEFAULT NULL,
  `DESCRIPTION` text COLLATE utf8_unicode_ci,
  `DESCRIPTION_TYPE` char(4) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'text',
  `SEARCHABLE_CONTENT` text COLLATE utf8_unicode_ci,
  `CODE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `XML_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TMP_ID` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DETAIL_PICTURE` int(18) DEFAULT NULL,
  `SOCNET_GROUP_ID` int(18) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_iblock_section_1` (`IBLOCK_ID`,`IBLOCK_SECTION_ID`),
  KEY `ix_iblock_section_depth_level` (`IBLOCK_ID`,`DEPTH_LEVEL`),
  KEY `ix_iblock_section_left_margin` (`IBLOCK_ID`,`LEFT_MARGIN`,`RIGHT_MARGIN`),
  KEY `ix_iblock_section_right_margin` (`IBLOCK_ID`,`RIGHT_MARGIN`,`LEFT_MARGIN`),
  KEY `ix_iblock_section_code` (`IBLOCK_ID`,`CODE`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `b_iblock_section_element`
--

CREATE TABLE IF NOT EXISTS `b_iblock_section_element` (
  `IBLOCK_SECTION_ID` int(11) NOT NULL,
  `IBLOCK_ELEMENT_ID` int(11) NOT NULL,
  `ADDITIONAL_PROPERTY_ID` int(18) DEFAULT NULL,
  UNIQUE KEY `ux_iblock_section_element` (`IBLOCK_SECTION_ID`,`IBLOCK_ELEMENT_ID`,`ADDITIONAL_PROPERTY_ID`),
  KEY `UX_IBLOCK_SECTION_ELEMENT2` (`IBLOCK_ELEMENT_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_iblock_section_iprop`
--

CREATE TABLE IF NOT EXISTS `b_iblock_section_iprop` (
  `IBLOCK_ID` int(11) NOT NULL,
  `SECTION_ID` int(11) NOT NULL,
  `IPROP_ID` int(11) NOT NULL,
  `VALUE` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`SECTION_ID`,`IPROP_ID`),
  KEY `ix_b_iblock_section_iprop_0` (`IPROP_ID`),
  KEY `ix_b_iblock_section_iprop_1` (`IBLOCK_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_iblock_section_property`
--

CREATE TABLE IF NOT EXISTS `b_iblock_section_property` (
  `IBLOCK_ID` int(11) NOT NULL,
  `SECTION_ID` int(11) NOT NULL,
  `PROPERTY_ID` int(11) NOT NULL,
  `SMART_FILTER` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DISPLAY_TYPE` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DISPLAY_EXPANDED` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`IBLOCK_ID`,`SECTION_ID`,`PROPERTY_ID`),
  KEY `ix_b_iblock_section_property_1` (`PROPERTY_ID`),
  KEY `ix_b_iblock_section_property_2` (`SECTION_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_iblock_section_right`
--

CREATE TABLE IF NOT EXISTS `b_iblock_section_right` (
  `IBLOCK_ID` int(11) NOT NULL,
  `SECTION_ID` int(11) NOT NULL,
  `RIGHT_ID` int(11) NOT NULL,
  `IS_INHERITED` char(1) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`RIGHT_ID`,`SECTION_ID`),
  KEY `ix_b_iblock_section_right_1` (`SECTION_ID`,`IBLOCK_ID`),
  KEY `ix_b_iblock_section_right_2` (`IBLOCK_ID`,`RIGHT_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_iblock_sequence`
--

CREATE TABLE IF NOT EXISTS `b_iblock_sequence` (
  `IBLOCK_ID` int(18) NOT NULL,
  `CODE` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `SEQ_VALUE` int(11) DEFAULT NULL,
  PRIMARY KEY (`IBLOCK_ID`,`CODE`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_iblock_site`
--

CREATE TABLE IF NOT EXISTS `b_iblock_site` (
  `IBLOCK_ID` int(18) NOT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`IBLOCK_ID`,`SITE_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `b_iblock_site`
--

INSERT INTO `b_iblock_site` (`IBLOCK_ID`, `SITE_ID`) VALUES
(1, 's1'),
(3, 's1'),
(4, 's1');

-- --------------------------------------------------------

--
-- Структура таблицы `b_iblock_type`
--

CREATE TABLE IF NOT EXISTS `b_iblock_type` (
  `ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `SECTIONS` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `EDIT_FILE_BEFORE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `EDIT_FILE_AFTER` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `IN_RSS` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `SORT` int(18) NOT NULL DEFAULT '500',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `b_iblock_type`
--

INSERT INTO `b_iblock_type` (`ID`, `SECTIONS`, `EDIT_FILE_BEFORE`, `EDIT_FILE_AFTER`, `IN_RSS`, `SORT`) VALUES
('news', 'N', NULL, NULL, 'N', 50),
('content', 'Y', '', '', 'N', 500);

-- --------------------------------------------------------

--
-- Структура таблицы `b_iblock_type_lang`
--

CREATE TABLE IF NOT EXISTS `b_iblock_type_lang` (
  `IBLOCK_TYPE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `LID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `SECTION_NAME` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ELEMENT_NAME` varchar(100) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `b_iblock_type_lang`
--

INSERT INTO `b_iblock_type_lang` (`IBLOCK_TYPE_ID`, `LID`, `NAME`, `SECTION_NAME`, `ELEMENT_NAME`) VALUES
('news', 'en', 'News', '', 'News'),
('news', 'ru', 'Новости', '', 'Новости'),
('content', 'en', 'Content', '', ''),
('content', 'ru', 'Контент', '', '');

-- --------------------------------------------------------

--
-- Структура таблицы `b_lang`
--

CREATE TABLE IF NOT EXISTS `b_lang` (
  `LID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `SORT` int(18) NOT NULL DEFAULT '100',
  `DEF` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `NAME` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `DIR` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `FORMAT_DATE` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FORMAT_DATETIME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FORMAT_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WEEK_START` int(11) DEFAULT NULL,
  `CHARSET` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LANGUAGE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `DOC_ROOT` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DOMAIN_LIMITED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `SERVER_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SITE_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `EMAIL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CULTURE_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`LID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `b_lang`
--

INSERT INTO `b_lang` (`LID`, `SORT`, `DEF`, `ACTIVE`, `NAME`, `DIR`, `FORMAT_DATE`, `FORMAT_DATETIME`, `FORMAT_NAME`, `WEEK_START`, `CHARSET`, `LANGUAGE_ID`, `DOC_ROOT`, `DOMAIN_LIMITED`, `SERVER_NAME`, `SITE_NAME`, `EMAIL`, `CULTURE_ID`) VALUES
('s1', 1, 'Y', 'Y', 'Jamilco', '/', NULL, NULL, NULL, NULL, NULL, 'ru', '', 'N', '', 'Jamilco', '', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `b_language`
--

CREATE TABLE IF NOT EXISTS `b_language` (
  `LID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `SORT` int(11) NOT NULL DEFAULT '100',
  `DEF` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `NAME` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `FORMAT_DATE` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FORMAT_DATETIME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FORMAT_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WEEK_START` int(11) DEFAULT NULL,
  `CHARSET` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DIRECTION` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CULTURE_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`LID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `b_language`
--

INSERT INTO `b_language` (`LID`, `SORT`, `DEF`, `ACTIVE`, `NAME`, `FORMAT_DATE`, `FORMAT_DATETIME`, `FORMAT_NAME`, `WEEK_START`, `CHARSET`, `DIRECTION`, `CULTURE_ID`) VALUES
('ru', 1, 'Y', 'Y', 'Russian', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('en', 2, 'N', 'Y', 'English', NULL, NULL, NULL, NULL, NULL, NULL, 2);

-- --------------------------------------------------------

--
-- Структура таблицы `b_lang_domain`
--

CREATE TABLE IF NOT EXISTS `b_lang_domain` (
  `LID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `DOMAIN` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`LID`,`DOMAIN`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_list_rubric`
--

CREATE TABLE IF NOT EXISTS `b_list_rubric` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `LID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `CODE` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `NAME` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DESCRIPTION` text COLLATE utf8_unicode_ci,
  `SORT` int(11) NOT NULL DEFAULT '100',
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `AUTO` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `DAYS_OF_MONTH` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DAYS_OF_WEEK` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TIMES_OF_DAY` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TEMPLATE` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LAST_EXECUTED` datetime DEFAULT NULL,
  `VISIBLE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `FROM_FIELD` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `b_medialib_collection`
--

CREATE TABLE IF NOT EXISTS `b_medialib_collection` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `DESCRIPTION` text COLLATE utf8_unicode_ci,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `DATE_UPDATE` datetime NOT NULL,
  `OWNER_ID` int(11) DEFAULT NULL,
  `PARENT_ID` int(11) DEFAULT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `KEYWORDS` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ITEMS_COUNT` int(11) DEFAULT NULL,
  `ML_TYPE` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `b_medialib_collection_item`
--

CREATE TABLE IF NOT EXISTS `b_medialib_collection_item` (
  `COLLECTION_ID` int(11) NOT NULL,
  `ITEM_ID` int(11) NOT NULL,
  PRIMARY KEY (`ITEM_ID`,`COLLECTION_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_medialib_item`
--

CREATE TABLE IF NOT EXISTS `b_medialib_item` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ITEM_TYPE` char(30) COLLATE utf8_unicode_ci NOT NULL,
  `DESCRIPTION` text COLLATE utf8_unicode_ci,
  `DATE_CREATE` datetime NOT NULL,
  `DATE_UPDATE` datetime NOT NULL,
  `SOURCE_ID` int(11) NOT NULL,
  `KEYWORDS` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SEARCHABLE_CONTENT` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `b_medialib_type`
--

CREATE TABLE IF NOT EXISTS `b_medialib_type` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CODE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `EXT` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `SYSTEM` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `DESCRIPTION` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- Дамп данных таблицы `b_medialib_type`
--

INSERT INTO `b_medialib_type` (`ID`, `NAME`, `CODE`, `EXT`, `SYSTEM`, `DESCRIPTION`) VALUES
(1, 'image_name', 'image', 'jpg,jpeg,gif,png', 'Y', 'image_desc'),
(2, 'video_name', 'video', 'flv,mp4,wmv', 'Y', 'video_desc'),
(3, 'sound_name', 'sound', 'mp3,wma,aac', 'Y', 'sound_desc');

-- --------------------------------------------------------

--
-- Структура таблицы `b_mobileapp_app`
--

CREATE TABLE IF NOT EXISTS `b_mobileapp_app` (
  `CODE` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `SHORT_NAME` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `DESCRIPTION` text COLLATE utf8_unicode_ci NOT NULL,
  `FILES` text COLLATE utf8_unicode_ci NOT NULL,
  `FOLDER` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `DATE_CREATE` datetime NOT NULL,
  PRIMARY KEY (`CODE`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_mobileapp_config`
--

CREATE TABLE IF NOT EXISTS `b_mobileapp_config` (
  `APP_CODE` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `PLATFORM` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `PARAMS` text COLLATE utf8_unicode_ci NOT NULL,
  `DATE_CREATE` datetime NOT NULL,
  PRIMARY KEY (`APP_CODE`,`PLATFORM`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_module`
--

CREATE TABLE IF NOT EXISTS `b_module` (
  `ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `DATE_ACTIVE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `b_module`
--

INSERT INTO `b_module` (`ID`, `DATE_ACTIVE`) VALUES
('main', '2015-06-03 18:58:34'),
('bitrix.sitecorporate', '2015-06-03 18:58:35'),
('bitrix.siteinfoportal', '2015-06-03 18:58:36'),
('bitrix.sitepersonal', '2015-06-03 18:58:37'),
('bitrixcloud', '2015-06-03 18:58:37'),
('blog', '2015-06-03 18:58:38'),
('clouds', '2015-06-03 18:58:39'),
('compression', '2015-06-03 18:58:40'),
('fileman', '2015-06-03 18:58:41'),
('form', '2015-06-03 18:58:42'),
('forum', '2015-06-03 18:58:43'),
('highloadblock', '2015-06-03 18:58:44'),
('iblock', '2015-06-03 18:58:45'),
('mobileapp', '2015-06-03 18:58:46'),
('perfmon', '2015-06-03 18:58:47'),
('photogallery', '2015-06-03 18:58:48'),
('scale', '2015-06-03 18:58:48'),
('search', '2015-06-03 18:58:49'),
('security', '2015-06-03 18:58:50'),
('seo', '2015-06-03 18:58:51'),
('socialservices', '2015-06-03 18:58:52'),
('subscribe', '2015-06-03 18:58:53'),
('vote', '2015-06-03 18:58:54');

-- --------------------------------------------------------

--
-- Структура таблицы `b_module_group`
--

CREATE TABLE IF NOT EXISTS `b_module_group` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `MODULE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `GROUP_ID` int(11) NOT NULL,
  `G_ACCESS` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_GROUP_MODULE` (`MODULE_ID`,`GROUP_ID`,`SITE_ID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Дамп данных таблицы `b_module_group`
--

INSERT INTO `b_module_group` (`ID`, `MODULE_ID`, `GROUP_ID`, `G_ACCESS`, `SITE_ID`) VALUES
(1, 'main', 5, 'Q', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `b_module_to_module`
--

CREATE TABLE IF NOT EXISTS `b_module_to_module` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `SORT` int(18) NOT NULL DEFAULT '100',
  `FROM_MODULE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `MESSAGE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `TO_MODULE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `TO_PATH` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TO_CLASS` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TO_METHOD` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TO_METHOD_ARG` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `VERSION` int(18) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_module_to_module` (`FROM_MODULE_ID`,`MESSAGE_ID`,`TO_MODULE_ID`,`TO_CLASS`,`TO_METHOD`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=200 ;

--
-- Дамп данных таблицы `b_module_to_module`
--

INSERT INTO `b_module_to_module` (`ID`, `TIMESTAMP_X`, `SORT`, `FROM_MODULE_ID`, `MESSAGE_ID`, `TO_MODULE_ID`, `TO_PATH`, `TO_CLASS`, `TO_METHOD`, `TO_METHOD_ARG`, `VERSION`) VALUES
(1, '2015-06-03 18:58:34', 100, 'iblock', 'OnIBlockPropertyBuildList', 'main', '/modules/main/tools/prop_userid.php', 'CIBlockPropertyUserID', 'GetUserTypeDescription', '', 1),
(2, '2015-06-03 18:58:34', 100, 'main', 'OnUserDelete', 'main', '/modules/main/classes/mysql/favorites.php', 'CFavorites', 'OnUserDelete', '', 1),
(3, '2015-06-03 18:58:34', 100, 'main', 'OnLanguageDelete', 'main', '/modules/main/classes/mysql/favorites.php', 'CFavorites', 'OnLanguageDelete', '', 1),
(4, '2015-06-03 18:58:34', 100, 'main', 'OnUserDelete', 'main', '', 'CUserOptions', 'OnUserDelete', '', 1),
(5, '2015-06-03 18:58:34', 100, 'main', 'OnChangeFile', 'main', '', 'CMain', 'OnChangeFileComponent', '', 1),
(6, '2015-06-03 18:58:34', 100, 'main', 'OnUserTypeRightsCheck', 'main', '', 'CUser', 'UserTypeRightsCheck', '', 1),
(7, '2015-06-03 18:58:34', 100, 'main', 'OnUserLogin', 'main', '', 'UpdateTools', 'CheckUpdates', '', 1),
(8, '2015-06-03 18:58:34', 100, 'main', 'OnModuleUpdate', 'main', '', 'UpdateTools', 'SetUpdateResult', '', 1),
(9, '2015-06-03 18:58:34', 100, 'main', 'OnUpdateCheck', 'main', '', 'UpdateTools', 'SetUpdateError', '', 1),
(10, '2015-06-03 18:58:34', 100, 'main', 'OnPanelCreate', 'main', '', 'CUndo', 'CheckNotifyMessage', '', 1),
(11, '2015-06-03 18:58:34', 100, 'main', 'OnAfterAddRating', 'main', '', 'CRatingsComponentsMain', 'OnAfterAddRating', '', 1),
(12, '2015-06-03 18:58:34', 100, 'main', 'OnAfterUpdateRating', 'main', '', 'CRatingsComponentsMain', 'OnAfterUpdateRating', '', 1),
(13, '2015-06-03 18:58:34', 100, 'main', 'OnSetRatingsConfigs', 'main', '', 'CRatingsComponentsMain', 'OnSetRatingConfigs', '', 1),
(14, '2015-06-03 18:58:34', 100, 'main', 'OnGetRatingsConfigs', 'main', '', 'CRatingsComponentsMain', 'OnGetRatingConfigs', '', 1),
(15, '2015-06-03 18:58:34', 100, 'main', 'OnGetRatingsObjects', 'main', '', 'CRatingsComponentsMain', 'OnGetRatingObject', '', 1),
(16, '2015-06-03 18:58:34', 100, 'main', 'OnGetRatingContentOwner', 'main', '', 'CRatingsComponentsMain', 'OnGetRatingContentOwner', '', 1),
(17, '2015-06-03 18:58:34', 100, 'main', 'OnAfterAddRatingRule', 'main', '', 'CRatingRulesMain', 'OnAfterAddRatingRule', '', 1),
(18, '2015-06-03 18:58:34', 100, 'main', 'OnAfterUpdateRatingRule', 'main', '', 'CRatingRulesMain', 'OnAfterUpdateRatingRule', '', 1),
(19, '2015-06-03 18:58:34', 100, 'main', 'OnGetRatingRuleObjects', 'main', '', 'CRatingRulesMain', 'OnGetRatingRuleObjects', '', 1),
(20, '2015-06-03 18:58:34', 100, 'main', 'OnGetRatingRuleConfigs', 'main', '', 'CRatingRulesMain', 'OnGetRatingRuleConfigs', '', 1),
(21, '2015-06-03 18:58:34', 100, 'main', 'OnAfterUserAdd', 'main', '', 'CRatings', 'OnAfterUserRegister', '', 1),
(22, '2015-06-03 18:58:34', 100, 'main', 'OnUserDelete', 'main', '', 'CRatings', 'OnUserDelete', '', 1),
(23, '2015-06-03 18:58:34', 100, 'main', 'OnUserDelete', 'main', '', 'CAccess', 'OnUserDelete', '', 1),
(24, '2015-06-03 18:58:34', 100, 'main', 'OnAfterGroupAdd', 'main', '', 'CGroupAuthProvider', 'OnAfterGroupAdd', '', 1),
(25, '2015-06-03 18:58:34', 100, 'main', 'OnBeforeGroupUpdate', 'main', '', 'CGroupAuthProvider', 'OnBeforeGroupUpdate', '', 1),
(26, '2015-06-03 18:58:34', 100, 'main', 'OnBeforeGroupDelete', 'main', '', 'CGroupAuthProvider', 'OnBeforeGroupDelete', '', 1),
(27, '2015-06-03 18:58:34', 100, 'main', 'OnAfterSetUserGroup', 'main', '', 'CGroupAuthProvider', 'OnAfterSetUserGroup', '', 1),
(28, '2015-06-03 18:58:34', 100, 'main', 'OnUserLogin', 'main', '', 'CGroupAuthProvider', 'OnUserLogin', '', 1),
(29, '2015-06-03 18:58:34', 100, 'main', 'OnEventLogGetAuditTypes', 'main', '', 'CEventMain', 'GetAuditTypes', '', 1),
(30, '2015-06-03 18:58:34', 100, 'main', 'OnEventLogGetAuditHandlers', 'main', '', 'CEventMain', 'MakeMainObject', '', 1),
(31, '2015-06-03 18:58:34', 100, 'perfmon', 'OnGetTableSchema', 'main', '', 'CTableSchema', 'OnGetTableSchema', '', 1),
(32, '2015-06-03 18:58:34', 110, 'main', 'OnUserTypeBuildList', 'main', '', 'CUserTypeString', 'GetUserTypeDescription', '', 1),
(33, '2015-06-03 18:58:34', 120, 'main', 'OnUserTypeBuildList', 'main', '', 'CUserTypeInteger', 'GetUserTypeDescription', '', 1),
(34, '2015-06-03 18:58:34', 130, 'main', 'OnUserTypeBuildList', 'main', '', 'CUserTypeDouble', 'GetUserTypeDescription', '', 1),
(35, '2015-06-03 18:58:34', 140, 'main', 'OnUserTypeBuildList', 'main', '', 'CUserTypeDateTime', 'GetUserTypeDescription', '', 1),
(36, '2015-06-03 18:58:34', 145, 'main', 'OnUserTypeBuildList', 'main', '', 'CUserTypeDate', 'GetUserTypeDescription', '', 1),
(37, '2015-06-03 18:58:34', 150, 'main', 'OnUserTypeBuildList', 'main', '', 'CUserTypeBoolean', 'GetUserTypeDescription', '', 1),
(38, '2015-06-03 18:58:34', 160, 'main', 'OnUserTypeBuildList', 'main', '', 'CUserTypeFile', 'GetUserTypeDescription', '', 1),
(39, '2015-06-03 18:58:34', 170, 'main', 'OnUserTypeBuildList', 'main', '', 'CUserTypeEnum', 'GetUserTypeDescription', '', 1),
(40, '2015-06-03 18:58:34', 180, 'main', 'OnUserTypeBuildList', 'main', '', 'CUserTypeIBlockSection', 'GetUserTypeDescription', '', 1),
(41, '2015-06-03 18:58:34', 190, 'main', 'OnUserTypeBuildList', 'main', '', 'CUserTypeIBlockElement', 'GetUserTypeDescription', '', 1),
(42, '2015-06-03 18:58:34', 200, 'main', 'OnUserTypeBuildList', 'main', '', 'CUserTypeStringFormatted', 'GetUserTypeDescription', '', 1),
(43, '2015-06-03 18:58:34', 100, 'main', 'OnBeforeEndBufferContent', 'main', '', '\\Bitrix\\Main\\Analytics\\Counter', 'onBeforeEndBufferContent', '', 1),
(44, '2015-06-03 18:58:34', 100, 'main', 'OnBeforeRestartBuffer', 'main', '', '\\Bitrix\\Main\\Analytics\\Counter', 'onBeforeRestartBuffer', '', 1),
(45, '2015-06-03 18:58:35', 100, 'main', 'OnBeforeProlog', 'bitrix.sitecorporate', '', 'CSiteCorporate', 'ShowPanel', '', 1),
(46, '2015-06-03 18:58:36', 100, 'main', 'OnBeforeProlog', 'bitrix.siteinfoportal', '', 'CSiteInfoportal', 'ShowPanel', '', 1),
(47, '2015-06-03 18:58:37', 100, 'main', 'OnBeforeProlog', 'bitrix.sitepersonal', '', 'CSitePersonal', 'ShowPanel', '', 1),
(48, '2015-06-03 18:58:37', 100, 'main', 'OnAdminInformerInsertItems', 'bitrixcloud', '', 'CBitrixCloudCDN', 'OnAdminInformerInsertItems', '', 1),
(49, '2015-06-03 18:58:37', 100, 'main', 'OnAdminInformerInsertItems', 'bitrixcloud', '', 'CBitrixCloudBackup', 'OnAdminInformerInsertItems', '', 1),
(50, '2015-06-03 18:58:37', 100, 'mobileapp', 'OnBeforeAdminMobileMenuBuild', 'bitrixcloud', '', 'CBitrixCloudMobile', 'OnBeforeAdminMobileMenuBuild', '', 1),
(51, '2015-06-03 18:58:38', 100, 'search', 'OnReindex', 'blog', '', 'CBlogSearch', 'OnSearchReindex', '', 1),
(52, '2015-06-03 18:58:38', 100, 'main', 'OnUserDelete', 'blog', '', 'CBlogUser', 'Delete', '', 1),
(53, '2015-06-03 18:58:38', 100, 'main', 'OnSiteDelete', 'blog', '', 'CBlogSitePath', 'DeleteBySiteID', '', 1),
(54, '2015-06-03 18:58:38', 100, 'socialnetwork', 'OnSocNetGroupDelete', 'blog', '', 'CBlogSoNetPost', 'OnGroupDelete', '', 1),
(55, '2015-06-03 18:58:38', 100, 'socialnetwork', 'OnSocNetFeaturesAdd', 'blog', '', 'CBlogSearch', 'SetSoNetFeatureIndexSearch', '', 1),
(56, '2015-06-03 18:58:38', 100, 'socialnetwork', 'OnSocNetFeaturesUpdate', 'blog', '', 'CBlogSearch', 'SetSoNetFeatureIndexSearch', '', 1),
(57, '2015-06-03 18:58:38', 100, 'socialnetwork', 'OnSocNetFeaturesPermsAdd', 'blog', '', 'CBlogSearch', 'SetSoNetFeaturePermIndexSearch', '', 1),
(58, '2015-06-03 18:58:38', 100, 'socialnetwork', 'OnSocNetFeaturesPermsUpdate', 'blog', '', 'CBlogSearch', 'SetSoNetFeaturePermIndexSearch', '', 1),
(59, '2015-06-03 18:58:38', 200, 'main', 'OnAfterAddRating', 'blog', '', 'CRatingsComponentsBlog', 'OnAfterAddRating', '', 1),
(60, '2015-06-03 18:58:38', 200, 'main', 'OnAfterUpdateRating', 'blog', '', 'CRatingsComponentsBlog', 'OnAfterUpdateRating', '', 1),
(61, '2015-06-03 18:58:38', 200, 'main', 'OnSetRatingsConfigs', 'blog', '', 'CRatingsComponentsBlog', 'OnSetRatingConfigs', '', 1),
(62, '2015-06-03 18:58:38', 200, 'main', 'OnGetRatingsConfigs', 'blog', '', 'CRatingsComponentsBlog', 'OnGetRatingConfigs', '', 1),
(63, '2015-06-03 18:58:38', 200, 'main', 'OnGetRatingsObjects', 'blog', '', 'CRatingsComponentsBlog', 'OnGetRatingObject', '', 1),
(64, '2015-06-03 18:58:38', 200, 'main', 'OnGetRatingContentOwner', 'blog', '', 'CRatingsComponentsBlog', 'OnGetRatingContentOwner', '', 1),
(65, '2015-06-03 18:58:38', 100, 'im', 'OnGetNotifySchema', 'blog', '', 'CBlogNotifySchema', 'OnGetNotifySchema', '', 1),
(66, '2015-06-03 18:58:39', 100, 'main', 'OnEventLogGetAuditTypes', 'clouds', '', 'CCloudStorage', 'GetAuditTypes', '', 1),
(67, '2015-06-03 18:58:39', 100, 'main', 'OnBeforeProlog', 'clouds', '', 'CCloudStorage', 'OnBeforeProlog', '', 1),
(68, '2015-06-03 18:58:39', 100, 'main', 'OnAdminListDisplay', 'clouds', '', 'CCloudStorage', 'OnAdminListDisplay', '', 1),
(69, '2015-06-03 18:58:39', 100, 'main', 'OnBuildGlobalMenu', 'clouds', '', 'CCloudStorage', 'OnBuildGlobalMenu', '', 1),
(70, '2015-06-03 18:58:39', 100, 'main', 'OnFileSave', 'clouds', '', 'CCloudStorage', 'OnFileSave', '', 1),
(71, '2015-06-03 18:58:39', 100, 'main', 'OnGetFileSRC', 'clouds', '', 'CCloudStorage', 'OnGetFileSRC', '', 1),
(72, '2015-06-03 18:58:39', 100, 'main', 'OnFileCopy', 'clouds', '', 'CCloudStorage', 'OnFileCopy', '', 1),
(73, '2015-06-03 18:58:39', 100, 'main', 'OnFileDelete', 'clouds', '', 'CCloudStorage', 'OnFileDelete', '', 1),
(74, '2015-06-03 18:58:39', 100, 'main', 'OnMakeFileArray', 'clouds', '', 'CCloudStorage', 'OnMakeFileArray', '', 1),
(75, '2015-06-03 18:58:39', 100, 'main', 'OnBeforeResizeImage', 'clouds', '', 'CCloudStorage', 'OnBeforeResizeImage', '', 1),
(76, '2015-06-03 18:58:39', 100, 'main', 'OnAfterResizeImage', 'clouds', '', 'CCloudStorage', 'OnAfterResizeImage', '', 1),
(77, '2015-06-03 18:58:39', 100, 'clouds', 'OnGetStorageService', 'clouds', '', 'CCloudStorageService_AmazonS3', 'GetObject', '', 1),
(78, '2015-06-03 18:58:39', 100, 'clouds', 'OnGetStorageService', 'clouds', '', 'CCloudStorageService_GoogleStorage', 'GetObject', '', 1),
(79, '2015-06-03 18:58:39', 100, 'clouds', 'OnGetStorageService', 'clouds', '', 'CCloudStorageService_OpenStackStorage', 'GetObject', '', 1),
(80, '2015-06-03 18:58:39', 100, 'clouds', 'OnGetStorageService', 'clouds', '', 'CCloudStorageService_RackSpaceCloudFiles', 'GetObject', '', 1),
(81, '2015-06-03 18:58:39', 100, 'clouds', 'OnGetStorageService', 'clouds', '', 'CCloudStorageService_ClodoRU', 'GetObject', '', 1),
(82, '2015-06-03 18:58:39', 100, 'clouds', 'OnGetStorageService', 'clouds', '', 'CCloudStorageService_Selectel', 'GetObject', '', 1),
(83, '2015-06-03 18:58:40', 1, 'main', 'OnPageStart', 'compression', '', 'CCompress', 'OnPageStart', '', 1),
(84, '2015-06-03 18:58:40', 10000, 'main', 'OnAfterEpilog', 'compression', '', 'CCompress', 'OnAfterEpilog', '', 1),
(85, '2015-06-03 18:58:41', 100, 'main', 'OnGroupDelete', 'fileman', '', 'CFileman', 'OnGroupDelete', '', 1),
(86, '2015-06-03 18:58:41', 100, 'main', 'OnPanelCreate', 'fileman', '', 'CFileman', 'OnPanelCreate', '', 1),
(87, '2015-06-03 18:58:41', 100, 'main', 'OnModuleUpdate', 'fileman', '', 'CFileman', 'OnModuleUpdate', '', 1),
(88, '2015-06-03 18:58:41', 100, 'main', 'OnModuleInstalled', 'fileman', '', 'CFileman', 'ClearComponentsListCache', '', 1),
(89, '2015-06-03 18:58:41', 100, 'iblock', 'OnIBlockPropertyBuildList', 'fileman', '', 'CIBlockPropertyMapGoogle', 'GetUserTypeDescription', '', 1),
(90, '2015-06-03 18:58:41', 100, 'iblock', 'OnIBlockPropertyBuildList', 'fileman', '', 'CIBlockPropertyMapYandex', 'GetUserTypeDescription', '', 1),
(91, '2015-06-03 18:58:41', 100, 'iblock', 'OnIBlockPropertyBuildList', 'fileman', '', 'CIBlockPropertyVideo', 'GetUserTypeDescription', '', 1),
(92, '2015-06-03 18:58:41', 100, 'main', 'OnUserTypeBuildList', 'fileman', '', 'CUserTypeVideo', 'GetUserTypeDescription', '', 1),
(93, '2015-06-03 18:58:41', 100, 'main', 'OnEventLogGetAuditTypes', 'fileman', '', 'CEventFileman', 'GetAuditTypes', '', 1),
(94, '2015-06-03 18:58:41', 100, 'main', 'OnEventLogGetAuditHandlers', 'fileman', '', 'CEventFileman', 'MakeFilemanObject', '', 1),
(95, '2015-06-03 18:58:43', 100, 'main', 'OnGroupDelete', 'forum', '', 'CForumNew', 'OnGroupDelete', '', 1),
(96, '2015-06-03 18:58:43', 100, 'main', 'OnBeforeLangDelete', 'forum', '', 'CForumNew', 'OnBeforeLangDelete', '', 1),
(97, '2015-06-03 18:58:43', 100, 'main', 'OnFileDelete', 'forum', '', 'CForumFiles', 'OnFileDelete', '', 1),
(98, '2015-06-03 18:58:43', 100, 'search', 'OnReindex', 'forum', '', 'CForumNew', 'OnReindex', '', 1),
(99, '2015-06-03 18:58:43', 100, 'main', 'OnUserDelete', 'forum', '', 'CForumUser', 'OnUserDelete', '', 1),
(100, '2015-06-03 18:58:43', 100, 'iblock', 'OnIBlockPropertyBuildList', 'main', '/modules/forum/tools/prop_topicid.php', 'CIBlockPropertyTopicID', 'GetUserTypeDescription', '', 1),
(101, '2015-06-03 18:58:43', 100, 'iblock', 'OnBeforeIBlockElementDelete', 'forum', '', 'CForumTopic', 'OnBeforeIBlockElementDelete', '', 1),
(102, '2015-06-03 18:58:43', 100, 'main', 'OnEventLogGetAuditTypes', 'forum', '', 'CForumEventLog', 'GetAuditTypes', '', 1),
(103, '2015-06-03 18:58:43', 100, 'main', 'OnEventLogGetAuditHandlers', 'forum', '', 'CEventForum', 'MakeForumObject', '', 1),
(104, '2015-06-03 18:58:43', 100, 'socialnetwork', 'OnSocNetGroupDelete', 'forum', '', 'CForumUser', 'OnSocNetGroupDelete', '', 1),
(105, '2015-06-03 18:58:43', 100, 'socialnetwork', 'OnSocNetLogFormatEvent', 'forum', '', 'CForumMessage', 'OnSocNetLogFormatEvent', '', 1),
(106, '2015-06-03 18:58:43', 100, 'mail', 'OnGetFilterList', 'forum', '', 'CForumEMail', 'OnGetSocNetFilterList', '', 1),
(107, '2015-06-03 18:58:43', 100, 'main', 'OnAfterAddRating', 'forum', '', 'CRatingsComponentsForum', 'OnAfterAddRating', '', 1),
(108, '2015-06-03 18:58:43', 100, 'main', 'OnAfterUpdateRating', 'forum', '', 'CRatingsComponentsForum', 'OnAfterUpdateRating', '', 1),
(109, '2015-06-03 18:58:43', 100, 'main', 'OnSetRatingsConfigs', 'forum', '', 'CRatingsComponentsForum', 'OnSetRatingConfigs', '', 1),
(110, '2015-06-03 18:58:43', 100, 'main', 'OnGetRatingsConfigs', 'forum', '', 'CRatingsComponentsForum', 'OnGetRatingConfigs', '', 1),
(111, '2015-06-03 18:58:43', 100, 'main', 'OnGetRatingsObjects', 'forum', '', 'CRatingsComponentsForum', 'OnGetRatingObject', '', 1),
(112, '2015-06-03 18:58:43', 100, 'main', 'OnGetRatingContentOwner', 'forum', '', 'CRatingsComponentsForum', 'OnGetRatingContentOwner', '', 1),
(113, '2015-06-03 18:58:43', 100, 'im', 'OnGetNotifySchema', 'forum', '', 'CForumNotifySchema', 'OnGetNotifySchema', '', 1),
(114, '2015-06-03 18:58:43', 100, 'main', 'OnAfterRegisterModule', 'main', '/modules/forum/install/index.php', 'forum', 'InstallUserFields', '', 1),
(115, '2015-06-03 18:58:44', 100, 'main', 'OnBeforeUserTypeAdd', 'highloadblock', '', '\\Bitrix\\Highloadblock\\HighloadBlockTable', 'OnBeforeUserTypeAdd', '', 1),
(116, '2015-06-03 18:58:44', 100, 'main', 'OnAfterUserTypeAdd', 'highloadblock', '', '\\Bitrix\\Highloadblock\\HighloadBlockTable', 'onAfterUserTypeAdd', '', 1),
(117, '2015-06-03 18:58:44', 100, 'main', 'OnBeforeUserTypeDelete', 'highloadblock', '', '\\Bitrix\\Highloadblock\\HighloadBlockTable', 'OnBeforeUserTypeDelete', '', 1),
(118, '2015-06-03 18:58:44', 100, 'main', 'OnUserTypeBuildList', 'highloadblock', '', 'CUserTypeHlblock', 'GetUserTypeDescription', '', 1),
(119, '2015-06-03 18:58:44', 100, 'iblock', 'OnIBlockPropertyBuildList', 'highloadblock', '', 'CIBlockPropertyDirectory', 'GetUserTypeDescription', '', 1),
(120, '2015-06-03 18:58:45', 100, 'main', 'OnGroupDelete', 'iblock', '', 'CIBlock', 'OnGroupDelete', '', 1),
(121, '2015-06-03 18:58:45', 100, 'main', 'OnBeforeLangDelete', 'iblock', '', 'CIBlock', 'OnBeforeLangDelete', '', 1),
(122, '2015-06-03 18:58:45', 100, 'main', 'OnLangDelete', 'iblock', '', 'CIBlock', 'OnLangDelete', '', 1),
(123, '2015-06-03 18:58:45', 100, 'main', 'OnUserTypeRightsCheck', 'iblock', '', 'CIBlockSection', 'UserTypeRightsCheck', '', 1),
(124, '2015-06-03 18:58:45', 100, 'search', 'OnReindex', 'iblock', '', 'CIBlock', 'OnSearchReindex', '', 1),
(125, '2015-06-03 18:58:45', 100, 'search', 'OnSearchGetURL', 'iblock', '', 'CIBlock', 'OnSearchGetURL', '', 1),
(126, '2015-06-03 18:58:45', 100, 'main', 'OnEventLogGetAuditTypes', 'iblock', '', 'CIBlock', 'GetAuditTypes', '', 1),
(127, '2015-06-03 18:58:45', 100, 'main', 'OnEventLogGetAuditHandlers', 'iblock', '', 'CEventIBlock', 'MakeIBlockObject', '', 1),
(128, '2015-06-03 18:58:45', 200, 'main', 'OnGetRatingContentOwner', 'iblock', '', 'CRatingsComponentsIBlock', 'OnGetRatingContentOwner', '', 1),
(129, '2015-06-03 18:58:45', 100, 'main', 'OnTaskOperationsChanged', 'iblock', '', 'CIBlockRightsStorage', 'OnTaskOperationsChanged', '', 1),
(130, '2015-06-03 18:58:45', 100, 'main', 'OnGroupDelete', 'iblock', '', 'CIBlockRightsStorage', 'OnGroupDelete', '', 1),
(131, '2015-06-03 18:58:45', 100, 'main', 'OnUserDelete', 'iblock', '', 'CIBlockRightsStorage', 'OnUserDelete', '', 1),
(132, '2015-06-03 18:58:45', 100, 'perfmon', 'OnGetTableSchema', 'iblock', '', 'iblock', 'OnGetTableSchema', '', 1),
(133, '2015-06-03 18:58:45', 100, 'sender', 'OnConnectorList', 'iblock', '', '\\Bitrix\\Iblock\\SenderEventHandler', 'onConnectorListIblock', '', 1),
(134, '2015-06-03 18:58:45', 10, 'iblock', 'OnIBlockPropertyBuildList', 'iblock', '', 'CIBlockProperty', '_DateTime_GetUserTypeDescription', '', 1),
(135, '2015-06-03 18:58:45', 20, 'iblock', 'OnIBlockPropertyBuildList', 'iblock', '', 'CIBlockProperty', '_XmlID_GetUserTypeDescription', '', 1),
(136, '2015-06-03 18:58:45', 30, 'iblock', 'OnIBlockPropertyBuildList', 'iblock', '', 'CIBlockProperty', '_FileMan_GetUserTypeDescription', '', 1),
(137, '2015-06-03 18:58:45', 40, 'iblock', 'OnIBlockPropertyBuildList', 'iblock', '', 'CIBlockProperty', '_HTML_GetUserTypeDescription', '', 1),
(138, '2015-06-03 18:58:45', 50, 'iblock', 'OnIBlockPropertyBuildList', 'iblock', '', 'CIBlockProperty', '_ElementList_GetUserTypeDescription', '', 1),
(139, '2015-06-03 18:58:45', 60, 'iblock', 'OnIBlockPropertyBuildList', 'iblock', '', 'CIBlockProperty', '_Sequence_GetUserTypeDescription', '', 1),
(140, '2015-06-03 18:58:45', 70, 'iblock', 'OnIBlockPropertyBuildList', 'iblock', '', 'CIBlockProperty', '_ElementAutoComplete_GetUserTypeDescription', '', 1),
(141, '2015-06-03 18:58:45', 80, 'iblock', 'OnIBlockPropertyBuildList', 'iblock', '', 'CIBlockProperty', '_SKU_GetUserTypeDescription', '', 1),
(142, '2015-06-03 18:58:45', 90, 'iblock', 'OnIBlockPropertyBuildList', 'iblock', '', 'CIBlockProperty', '_SectionAutoComplete_GetUserTypeDescription', '', 1),
(143, '2015-06-03 18:58:46', 100, 'pull', 'OnGetDependentModule', 'mobileapp', '', 'CMobileAppPullSchema', 'OnGetDependentModule', '', 1),
(144, '2015-06-03 18:58:48', 100, 'iblock', 'OnBeforeIBlockElementDelete', 'photogallery', '', 'CPhotogalleryElement', 'OnBeforeIBlockElementDelete', '', 1),
(145, '2015-06-03 18:58:48', 100, 'iblock', 'OnAfterIBlockElementAdd', 'photogallery', '', 'CPhotogalleryElement', 'OnAfterIBlockElementAdd', '', 1),
(146, '2015-06-03 18:58:48', 100, 'search', 'BeforeIndex', 'photogallery', '', 'CRatingsComponentsPhotogallery', 'BeforeIndex', '', 1),
(147, '2015-06-03 18:58:48', 100, 'im', 'OnGetNotifySchema', 'photogallery', '', 'CPhotogalleryNotifySchema', 'OnGetNotifySchema', '', 1),
(148, '2015-06-03 18:58:48', 100, 'main', 'OnEventLogGetAuditTypes', 'scale', '', '\\Bitrix\\Scale\\Logger', 'onEventLogGetAuditTypes', '', 1),
(149, '2015-06-03 18:58:49', 100, 'main', 'OnChangePermissions', 'search', '', 'CSearch', 'OnChangeFilePermissions', '', 1),
(150, '2015-06-03 18:58:49', 100, 'main', 'OnChangeFile', 'search', '', 'CSearch', 'OnChangeFile', '', 1),
(151, '2015-06-03 18:58:49', 100, 'main', 'OnGroupDelete', 'search', '', 'CSearch', 'OnGroupDelete', '', 1),
(152, '2015-06-03 18:58:49', 100, 'main', 'OnLangDelete', 'search', '', 'CSearch', 'OnLangDelete', '', 1),
(153, '2015-06-03 18:58:49', 100, 'main', 'OnAfterUserUpdate', 'search', '', 'CSearchUser', 'OnAfterUserUpdate', '', 1),
(154, '2015-06-03 18:58:49', 100, 'main', 'OnUserDelete', 'search', '', 'CSearchUser', 'DeleteByUserID', '', 1),
(155, '2015-06-03 18:58:49', 100, 'cluster', 'OnGetTableList', 'search', '', 'search', 'OnGetTableList', '', 1),
(156, '2015-06-03 18:58:49', 100, 'perfmon', 'OnGetTableSchema', 'search', '', 'search', 'OnGetTableSchema', '', 1),
(157, '2015-06-03 18:58:49', 90, 'main', 'OnEpilog', 'search', '', 'CSearchStatistic', 'OnEpilog', '', 1),
(158, '2015-06-03 18:58:50', 100, 'main', 'OnUserDelete', 'security', '', 'CSecurityUser', 'OnUserDelete', '', 1),
(159, '2015-06-03 18:58:50', 100, 'main', 'OnEventLogGetAuditTypes', 'security', '', 'CSecurityFilter', 'GetAuditTypes', '', 1),
(160, '2015-06-03 18:58:50', 100, 'main', 'OnEventLogGetAuditTypes', 'security', '', 'CSecurityAntiVirus', 'GetAuditTypes', '', 1),
(161, '2015-06-03 18:58:50', 100, 'main', 'OnAdminInformerInsertItems', 'security', '', 'CSecurityFilter', 'OnAdminInformerInsertItems', '', 1),
(162, '2015-06-03 18:58:50', 100, 'main', 'OnAdminInformerInsertItems', 'security', '', 'CSecuritySiteChecker', 'OnAdminInformerInsertItems', '', 1),
(163, '2015-06-03 18:58:50', 5, 'main', 'OnBeforeProlog', 'security', '', 'CSecurityFilter', 'OnBeforeProlog', '', 1),
(164, '2015-06-03 18:58:50', 9999, 'main', 'OnEndBufferContent', 'security', '', 'CSecurityXSSDetect', 'OnEndBufferContent', '', 1),
(165, '2015-06-03 18:58:50', -1, 'main', 'OnPageStart', 'security', '', 'CSecurityAntiVirus', 'OnPageStart', '', 1),
(166, '2015-06-03 18:58:50', 10000, 'main', 'OnEndBufferContent', 'security', '', 'CSecurityAntiVirus', 'OnEndBufferContent', '', 1),
(167, '2015-06-03 18:58:50', 10001, 'main', 'OnAfterEpilog', 'security', '', 'CSecurityAntiVirus', 'OnAfterEpilog', '', 1),
(168, '2015-06-03 18:58:51', 100, 'main', 'OnPanelCreate', 'seo', '', 'CSeoEventHandlers', 'SeoOnPanelCreate', '', 2),
(169, '2015-06-03 18:58:51', 100, 'fileman', 'OnIncludeHTMLEditorScript', 'seo', '', 'CSeoEventHandlers', 'OnIncludeHTMLEditorScript', '', 2),
(170, '2015-06-03 18:58:51', 100, 'fileman', 'OnBeforeHTMLEditorScriptRuns', 'seo', '', 'CSeoEventHandlers', 'OnBeforeHTMLEditorScriptRuns', '', 2),
(171, '2015-06-03 18:58:51', 100, 'iblock', 'OnAfterIBlockSectionAdd', 'seo', '', '\\Bitrix\\Seo\\SitemapIblock', 'addSection', '', 2),
(172, '2015-06-03 18:58:51', 100, 'iblock', 'OnAfterIBlockElementAdd', 'seo', '', '\\Bitrix\\Seo\\SitemapIblock', 'addElement', '', 2),
(173, '2015-06-03 18:58:51', 100, 'iblock', 'OnBeforeIBlockSectionDelete', 'seo', '', '\\Bitrix\\Seo\\SitemapIblock', 'beforeDeleteSection', '', 2),
(174, '2015-06-03 18:58:51', 100, 'iblock', 'OnBeforeIBlockElementDelete', 'seo', '', '\\Bitrix\\Seo\\SitemapIblock', 'beforeDeleteElement', '', 2),
(175, '2015-06-03 18:58:51', 100, 'iblock', 'OnAfterIBlockSectionDelete', 'seo', '', '\\Bitrix\\Seo\\SitemapIblock', 'deleteSection', '', 2),
(176, '2015-06-03 18:58:51', 100, 'iblock', 'OnAfterIBlockElementDelete', 'seo', '', '\\Bitrix\\Seo\\SitemapIblock', 'deleteElement', '', 2),
(177, '2015-06-03 18:58:51', 100, 'iblock', 'OnBeforeIBlockSectionUpdate', 'seo', '', '\\Bitrix\\Seo\\SitemapIblock', 'beforeUpdateSection', '', 2),
(178, '2015-06-03 18:58:51', 100, 'iblock', 'OnBeforeIBlockElementUpdate', 'seo', '', '\\Bitrix\\Seo\\SitemapIblock', 'beforeUpdateElement', '', 2),
(179, '2015-06-03 18:58:51', 100, 'iblock', 'OnAfterIBlockSectionUpdate', 'seo', '', '\\Bitrix\\Seo\\SitemapIblock', 'updateSection', '', 2),
(180, '2015-06-03 18:58:51', 100, 'iblock', 'OnAfterIBlockElementUpdate', 'seo', '', '\\Bitrix\\Seo\\SitemapIblock', 'updateElement', '', 2),
(181, '2015-06-03 18:58:51', 100, 'forum', 'onAfterTopicAdd', 'seo', '', '\\Bitrix\\Seo\\SitemapForum', 'addTopic', '', 2),
(182, '2015-06-03 18:58:51', 100, 'forum', 'onAfterTopicUpdate', 'seo', '', '\\Bitrix\\Seo\\SitemapForum', 'updateTopic', '', 2),
(183, '2015-06-03 18:58:51', 100, 'forum', 'onAfterTopicDelete', 'seo', '', '\\Bitrix\\Seo\\SitemapForum', 'deleteTopic', '', 2),
(184, '2015-06-03 18:58:51', 100, 'main', 'OnAdminIBlockElementEdit', 'seo', '', '\\Bitrix\\Seo\\AdvTabEngine', 'eventHandler', '', 2),
(185, '2015-06-03 18:58:51', 100, 'main', 'OnBeforeProlog', 'seo', '', '\\Bitrix\\Seo\\AdvSession', 'checkSession', '', 2),
(186, '2015-06-03 18:58:52', 100, 'main', 'OnUserDelete', 'socialservices', '', 'CSocServAuthDB', 'OnUserDelete', '', 1),
(187, '2015-06-03 18:58:52', 100, 'timeman', 'OnAfterTMReportDailyAdd', 'socialservices', '', 'CSocServAuthDB', 'OnAfterTMReportDailyAdd', '', 1),
(188, '2015-06-03 18:58:52', 100, 'timeman', 'OnAfterTMDayStart', 'socialservices', '', 'CSocServAuthDB', 'OnAfterTMDayStart', '', 1),
(189, '2015-06-03 18:58:52', 100, 'timeman', 'OnTimeManShow', 'socialservices', '', 'CSocServEventHandlers', 'OnTimeManShow', '', 1),
(190, '2015-06-03 18:58:52', 100, 'main', 'OnFindExternalUser', 'socialservices', '', 'CSocServAuthDB', 'OnFindExternalUser', '', 1),
(191, '2015-06-03 18:58:53', 100, 'main', 'OnBeforeLangDelete', 'subscribe', '', 'CRubric', 'OnBeforeLangDelete', '', 1),
(192, '2015-06-03 18:58:53', 100, 'main', 'OnUserDelete', 'subscribe', '', 'CSubscription', 'OnUserDelete', '', 1),
(193, '2015-06-03 18:58:53', 100, 'main', 'OnUserLogout', 'subscribe', '', 'CSubscription', 'OnUserLogout', '', 1),
(194, '2015-06-03 18:58:53', 100, 'main', 'OnGroupDelete', 'subscribe', '', 'CPosting', 'OnGroupDelete', '', 1),
(195, '2015-06-03 18:58:54', 100, 'main', 'OnBeforeProlog', 'main', '/modules/vote/keepvoting.php', '', '', '', 1),
(196, '2015-06-03 18:58:54', 200, 'main', 'OnUserTypeBuildList', 'vote', '', 'CUserTypeVote', 'GetUserTypeDescription', '', 1),
(197, '2015-06-03 18:58:54', 200, 'main', 'OnUserLogin', 'vote', '', 'CVoteUser', 'OnUserLogin', '', 1),
(198, '2015-06-03 18:58:54', 100, 'im', 'OnGetNotifySchema', 'vote', '', 'CVoteNotifySchema', 'OnGetNotifySchema', '', 1),
(199, '2015-06-03 18:59:24', 100, 'main', 'OnBeforeProlog', 'main', '/modules/main/install/wizard_sol/panel_button.php', 'CWizardSolPanel', 'ShowPanel', '', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `b_operation`
--

CREATE TABLE IF NOT EXISTS `b_operation` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `MODULE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `DESCRIPTION` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `BINDING` varchar(50) COLLATE utf8_unicode_ci DEFAULT 'module',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=110 ;

--
-- Дамп данных таблицы `b_operation`
--

INSERT INTO `b_operation` (`ID`, `NAME`, `MODULE_ID`, `DESCRIPTION`, `BINDING`) VALUES
(1, 'edit_php', 'main', NULL, 'module'),
(2, 'view_own_profile', 'main', NULL, 'module'),
(3, 'edit_own_profile', 'main', NULL, 'module'),
(4, 'view_all_users', 'main', NULL, 'module'),
(5, 'view_groups', 'main', NULL, 'module'),
(6, 'view_tasks', 'main', NULL, 'module'),
(7, 'view_other_settings', 'main', NULL, 'module'),
(8, 'view_subordinate_users', 'main', NULL, 'module'),
(9, 'edit_subordinate_users', 'main', NULL, 'module'),
(10, 'edit_all_users', 'main', NULL, 'module'),
(11, 'edit_groups', 'main', NULL, 'module'),
(12, 'edit_tasks', 'main', NULL, 'module'),
(13, 'edit_other_settings', 'main', NULL, 'module'),
(14, 'cache_control', 'main', NULL, 'module'),
(15, 'lpa_template_edit', 'main', NULL, 'module'),
(16, 'view_event_log', 'main', NULL, 'module'),
(17, 'edit_ratings', 'main', NULL, 'module'),
(18, 'manage_short_uri', 'main', NULL, 'module'),
(19, 'fm_view_permission', 'main', NULL, 'file'),
(20, 'fm_view_file', 'main', NULL, 'file'),
(21, 'fm_view_listing', 'main', NULL, 'file'),
(22, 'fm_edit_existent_folder', 'main', NULL, 'file'),
(23, 'fm_create_new_file', 'main', NULL, 'file'),
(24, 'fm_edit_existent_file', 'main', NULL, 'file'),
(25, 'fm_create_new_folder', 'main', NULL, 'file'),
(26, 'fm_delete_file', 'main', NULL, 'file'),
(27, 'fm_delete_folder', 'main', NULL, 'file'),
(28, 'fm_edit_in_workflow', 'main', NULL, 'file'),
(29, 'fm_rename_file', 'main', NULL, 'file'),
(30, 'fm_rename_folder', 'main', NULL, 'file'),
(31, 'fm_upload_file', 'main', NULL, 'file'),
(32, 'fm_add_to_menu', 'main', NULL, 'file'),
(33, 'fm_download_file', 'main', NULL, 'file'),
(34, 'fm_lpa', 'main', NULL, 'file'),
(35, 'fm_edit_permission', 'main', NULL, 'file'),
(36, 'clouds_browse', 'clouds', NULL, 'module'),
(37, 'clouds_upload', 'clouds', NULL, 'module'),
(38, 'clouds_config', 'clouds', NULL, 'module'),
(39, 'fileman_view_all_settings', 'fileman', '', 'module'),
(40, 'fileman_edit_menu_types', 'fileman', '', 'module'),
(41, 'fileman_add_element_to_menu', 'fileman', '', 'module'),
(42, 'fileman_edit_menu_elements', 'fileman', '', 'module'),
(43, 'fileman_edit_existent_files', 'fileman', '', 'module'),
(44, 'fileman_edit_existent_folders', 'fileman', '', 'module'),
(45, 'fileman_admin_files', 'fileman', '', 'module'),
(46, 'fileman_admin_folders', 'fileman', '', 'module'),
(47, 'fileman_view_permissions', 'fileman', '', 'module'),
(48, 'fileman_edit_all_settings', 'fileman', '', 'module'),
(49, 'fileman_upload_files', 'fileman', '', 'module'),
(50, 'fileman_view_file_structure', 'fileman', '', 'module'),
(51, 'fileman_install_control', 'fileman', '', 'module'),
(52, 'medialib_view_collection', 'fileman', '', 'medialib'),
(53, 'medialib_new_collection', 'fileman', '', 'medialib'),
(54, 'medialib_edit_collection', 'fileman', '', 'medialib'),
(55, 'medialib_del_collection', 'fileman', '', 'medialib'),
(56, 'medialib_access', 'fileman', '', 'medialib'),
(57, 'medialib_new_item', 'fileman', '', 'medialib'),
(58, 'medialib_edit_item', 'fileman', '', 'medialib'),
(59, 'medialib_del_item', 'fileman', '', 'medialib'),
(60, 'sticker_view', 'fileman', '', 'stickers'),
(61, 'sticker_edit', 'fileman', '', 'stickers'),
(62, 'sticker_new', 'fileman', '', 'stickers'),
(63, 'sticker_del', 'fileman', '', 'stickers'),
(64, 'section_read', 'iblock', NULL, 'iblock'),
(65, 'element_read', 'iblock', NULL, 'iblock'),
(66, 'section_element_bind', 'iblock', NULL, 'iblock'),
(67, 'iblock_admin_display', 'iblock', NULL, 'iblock'),
(68, 'element_edit', 'iblock', NULL, 'iblock'),
(69, 'element_edit_price', 'iblock', NULL, 'iblock'),
(70, 'element_delete', 'iblock', NULL, 'iblock'),
(71, 'element_bizproc_start', 'iblock', NULL, 'iblock'),
(72, 'section_edit', 'iblock', NULL, 'iblock'),
(73, 'section_delete', 'iblock', NULL, 'iblock'),
(74, 'section_section_bind', 'iblock', NULL, 'iblock'),
(75, 'element_edit_any_wf_status', 'iblock', NULL, 'iblock'),
(76, 'iblock_edit', 'iblock', NULL, 'iblock'),
(77, 'iblock_delete', 'iblock', NULL, 'iblock'),
(78, 'iblock_rights_edit', 'iblock', NULL, 'iblock'),
(79, 'iblock_export', 'iblock', NULL, 'iblock'),
(80, 'section_rights_edit', 'iblock', NULL, 'iblock'),
(81, 'element_rights_edit', 'iblock', NULL, 'iblock'),
(82, 'security_filter_bypass', 'security', NULL, 'module'),
(83, 'security_edit_user_otp', 'security', NULL, 'module'),
(84, 'security_module_settings_read', 'security', NULL, 'module'),
(85, 'security_panel_view', 'security', NULL, 'module'),
(86, 'security_filter_settings_read', 'security', NULL, 'module'),
(87, 'security_otp_settings_read', 'security', NULL, 'module'),
(88, 'security_iprule_admin_settings_read', 'security', NULL, 'module'),
(89, 'security_session_settings_read', 'security', NULL, 'module'),
(90, 'security_redirect_settings_read', 'security', NULL, 'module'),
(91, 'security_stat_activity_settings_read', 'security', NULL, 'module'),
(92, 'security_iprule_settings_read', 'security', NULL, 'module'),
(93, 'security_antivirus_settings_read', 'security', NULL, 'module'),
(94, 'security_frame_settings_read', 'security', NULL, 'module'),
(95, 'security_module_settings_write', 'security', NULL, 'module'),
(96, 'security_filter_settings_write', 'security', NULL, 'module'),
(97, 'security_otp_settings_write', 'security', NULL, 'module'),
(98, 'security_iprule_admin_settings_write', 'security', NULL, 'module'),
(99, 'security_session_settings_write', 'security', NULL, 'module'),
(100, 'security_redirect_settings_write', 'security', NULL, 'module'),
(101, 'security_stat_activity_settings_write', 'security', NULL, 'module'),
(102, 'security_iprule_settings_write', 'security', NULL, 'module'),
(103, 'security_file_verifier_sign', 'security', NULL, 'module'),
(104, 'security_file_verifier_collect', 'security', NULL, 'module'),
(105, 'security_file_verifier_verify', 'security', NULL, 'module'),
(106, 'security_antivirus_settings_write', 'security', NULL, 'module'),
(107, 'security_frame_settings_write', 'security', NULL, 'module'),
(108, 'seo_settings', 'seo', '', 'module'),
(109, 'seo_tools', 'seo', '', 'module');

-- --------------------------------------------------------

--
-- Структура таблицы `b_option`
--

CREATE TABLE IF NOT EXISTS `b_option` (
  `MODULE_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `NAME` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `VALUE` text COLLATE utf8_unicode_ci,
  `DESCRIPTION` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  UNIQUE KEY `ix_option` (`MODULE_ID`,`NAME`,`SITE_ID`),
  KEY `ix_option_name` (`NAME`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `b_option`
--

INSERT INTO `b_option` (`MODULE_ID`, `NAME`, `VALUE`, `DESCRIPTION`, `SITE_ID`) VALUES
('main', 'rating_authority_rating', '2', NULL, NULL),
('main', 'rating_assign_rating_group_add', '1', NULL, NULL),
('main', 'rating_assign_rating_group_delete', '1', NULL, NULL),
('main', 'rating_assign_rating_group', '3', NULL, NULL),
('main', 'rating_assign_authority_group_add', '2', NULL, NULL),
('main', 'rating_assign_authority_group_delete', '2', NULL, NULL),
('main', 'rating_assign_authority_group', '4', NULL, NULL),
('main', 'rating_community_size', '1', NULL, NULL),
('main', 'rating_community_authority', '30', NULL, NULL),
('main', 'rating_vote_weight', '10', NULL, NULL),
('main', 'rating_normalization_type', 'auto', NULL, NULL),
('main', 'rating_normalization', '10', NULL, NULL),
('main', 'rating_count_vote', '10', NULL, NULL),
('main', 'rating_authority_weight_formula', 'Y', NULL, NULL),
('main', 'rating_community_last_visit', '90', NULL, NULL),
('main', 'rating_text_like_y', 'Нравится', NULL, NULL),
('main', 'rating_text_like_n', 'Не нравится', NULL, NULL),
('main', 'rating_text_like_d', 'Это нравится', NULL, NULL),
('main', 'rating_assign_type', 'auto', NULL, NULL),
('main', 'rating_vote_type', 'like', NULL, NULL),
('main', 'rating_self_vote', 'Y', NULL, NULL),
('main', 'rating_vote_show', 'Y', NULL, NULL),
('main', 'rating_vote_template', 'like', NULL, NULL),
('main', 'rating_start_authority', '3', NULL, NULL),
('main', 'PARAM_MAX_SITES', '2', NULL, NULL),
('main', 'PARAM_MAX_USERS', '0', NULL, NULL),
('main', 'distributive6', 'Y', NULL, NULL),
('main', '~new_license11_sign', 'Y', NULL, NULL),
('main', 'GROUP_DEFAULT_TASK', '1', NULL, NULL),
('main', 'vendor', '1c_bitrix', NULL, NULL),
('main', 'admin_lid', 'ru', NULL, NULL),
('main', 'update_site', 'www.bitrixsoft.com', NULL, NULL),
('main', 'update_site_ns', 'Y', NULL, NULL),
('main', 'optimize_css_files', 'N', NULL, NULL),
('main', 'optimize_js_files', 'N', NULL, NULL),
('main', 'admin_passwordh', 'FVgQf2YUBgYtCUVcAhcECgsTAQ==', NULL, NULL),
('main', 'server_uniq_id', '05d75eeeaf0cabfe2d2cdd2cded7f08a', NULL, NULL),
('blog', 'socNetNewPerms', 'Y', NULL, NULL),
('fileman', 'use_editor_3', 'Y', NULL, NULL),
('forum', 'FILTER_DICT_W', '1', NULL, 'ru'),
('forum', 'FILTER_DICT_T', '2', NULL, 'ru'),
('forum', 'FILTER_DICT_W', '3', NULL, 'en'),
('forum', 'FILTER_DICT_T', '4', NULL, 'en'),
('forum', 'FILTER', 'N', NULL, NULL),
('search', 'version', 'v2.0', NULL, NULL),
('search', 'dbnode_id', 'N', NULL, NULL),
('search', 'dbnode_status', 'ok', NULL, NULL),
('security', 'ipcheck_disable_file', '/bitrix/modules/ipcheck_disable_2127b9067a3183b08897ff0d6459b8c6', NULL, NULL),
('vote', 'VOTE_DIR', '', NULL, NULL),
('vote', 'VOTE_COMPATIBLE_OLD_TEMPLATE', 'N', NULL, NULL),
('main', 'email_from', 'diy9@mail.ru', NULL, NULL),
('fileman', 'different_set', 'Y', NULL, NULL),
('fileman', 'menutypes', 'a:2:{s:3:\\"top\\";s:23:\\"Верхнее меню\\";s:6:\\"bottom\\";s:21:\\"Нижнее меню\\";}', NULL, 's1'),
('main', 'wizard_template_id', 'corp_services', NULL, 's1'),
('main', 'wizard_site_logo', '0', NULL, 's1'),
('main', 'wizard_corp_services_theme_id', 'blue', NULL, 's1'),
('socialnetwork', 'allow_tooltip', 'N', NULL, NULL),
('fileman', 'search_max_open_file_size', '1024', NULL, NULL),
('fileman', 'num_menu_param', '2', NULL, 's1'),
('fileman', 'propstypes', 'a:4:{s:11:\\"description\\";s:33:\\"Описание страницы\\";s:8:\\"keywords\\";s:27:\\"Ключевые слова\\";s:5:\\"title\\";s:44:\\"Заголовок окна браузера\\";s:14:\\"keywords_inner\\";s:35:\\"Продвигаемые слова\\";}', NULL, 's1'),
('search', 'suggest_save_days', '250', NULL, NULL),
('search', 'use_tf_cache', 'Y', NULL, NULL),
('search', 'use_word_distance', 'Y', NULL, NULL),
('search', 'use_social_rating', 'Y', NULL, NULL),
('iblock', 'use_htmledit', 'Y', NULL, NULL),
('socialservices', 'auth_services', 'a:12:{s:9:"VKontakte";s:1:"N";s:8:"MyMailRu";s:1:"N";s:7:"Twitter";s:1:"N";s:8:"Facebook";s:1:"N";s:11:"Livejournal";s:1:"Y";s:12:"YandexOpenID";s:1:"Y";s:7:"Rambler";s:1:"Y";s:12:"MailRuOpenID";s:1:"Y";s:12:"Liveinternet";s:1:"Y";s:7:"Blogger";s:1:"Y";s:6:"OpenID";s:1:"Y";s:6:"LiveID";s:1:"N";}', NULL, NULL),
('main', 'wizard_firstcorp_services_s1', 'Y', NULL, NULL),
('main', 'wizard_solution', 'corp_services', NULL, 's1'),
('fileman', 'stickers_use_hotkeys', 'N', NULL, NULL),
('fileman', 'GROUP_DEFAULT_TASK', '16', NULL, NULL),
('fileman', 'default_edit', 'text', NULL, NULL),
('fileman', 'use_medialib', 'Y', NULL, NULL),
('fileman', 'use_pspell', 'Y', NULL, NULL),
('fileman', 'user_dics_path', '/bitrix/modules/fileman/u_dics', NULL, NULL),
('fileman', 'use_separeted_dics', 'Y', NULL, NULL),
('fileman', 'use_custom_spell', 'N', NULL, NULL),
('fileman', 'ar_entities', 'umlya,greek,other', NULL, NULL),
('fileman', 'editor_body_id', '', NULL, NULL),
('fileman', 'editor_body_class', '', NULL, NULL),
('fileman', 'ml_thumb_width', '140', NULL, NULL),
('fileman', 'ml_thumb_height', '105', NULL, NULL),
('fileman', 'ml_media_extentions', 'jpg,jpeg,gif,png,flv,mp4,wmv,wma,mp3,ppt', NULL, NULL),
('fileman', 'ml_max_width', '1024', NULL, NULL),
('fileman', 'ml_max_height', '1024', NULL, NULL),
('fileman', 'ml_media_available_ext', 'jpg,jpeg,gif,png,flv,mp4,wmv,wma,mp3,ppt,aac', NULL, NULL),
('fileman', 'ml_use_default', '1', NULL, NULL),
('fileman', '~script_files', 'php,php3,php4,php5,php6,phtml,pl,asp,aspx,cgi,exe,ico,shtm,shtml', NULL, NULL),
('fileman', '~allowed_components', '', NULL, NULL),
('fileman', 'search_max_res_count', '', NULL, NULL),
('fileman', 'search_time_step', '5', NULL, NULL),
('fileman', 'search_mask', '*.php', NULL, NULL),
('fileman', 'show_inc_icons', 'N', NULL, NULL),
('fileman', 'hide_physical_struc', '', NULL, NULL),
('fileman', 'use_translit', '1', NULL, NULL),
('fileman', 'use_translit_google', '1', NULL, NULL),
('fileman', 'log_menu', 'Y', NULL, NULL),
('fileman', 'log_page', 'Y', NULL, NULL),
('fileman', 'use_code_editor', 'Y', NULL, NULL),
('fileman', 'default_edit_groups', '', NULL, NULL),
('fileman', 'archive_step_time', '30', NULL, NULL),
('fileman', 'GROUP_DEFAULT_RIGHT', 'D', NULL, NULL),
('iblock', 'list_image_size', '50', NULL, NULL),
('iblock', 'detail_image_size', '200', NULL, NULL),
('iblock', 'show_xml_id', '', NULL, NULL),
('iblock', 'path2rss', '/upload/', NULL, NULL),
('iblock', 'combined_list_mode', 'Y', NULL, NULL),
('iblock', 'iblock_menu_max_sections', '50', NULL, NULL),
('iblock', 'event_log_iblock', 'Y', NULL, NULL),
('iblock', 'num_catalog_levels', '3', NULL, NULL),
('form', 'USE_HTML_EDIT', 'Y', NULL, NULL),
('form', 'SIMPLE', 'Y', NULL, NULL),
('form', 'RECORDS_LIMIT', '5000', NULL, NULL),
('form', 'RESULTS_PAGEN', '10', NULL, NULL),
('form', 'FORM_DEFAULT_PERMISSION', '10', NULL, NULL),
('form', 'GROUP_DEFAULT_RIGHT', 'D', NULL, NULL),
('main', 'site_name', 'jamilco.3-core.ru', NULL, NULL),
('main', 'server_name', 'jamilco.3-core.ru', NULL, NULL),
('main', 'cookie_name', 'BITRIX_SM', NULL, NULL),
('main', 'ALLOW_SPREAD_COOKIE', 'Y', NULL, NULL),
('main', 'header_200', 'N', NULL, NULL),
('main', 'error_reporting', '85', NULL, NULL),
('main', 'use_hot_keys', 'Y', NULL, NULL),
('main', 'smile_set_id', '0', NULL, NULL),
('main', 'all_bcc', '', NULL, NULL),
('main', 'send_mid', 'N', NULL, NULL),
('main', 'fill_to_mail', 'N', NULL, NULL),
('main', 'CONVERT_UNIX_NEWLINE_2_WINDOWS', 'N', NULL, NULL),
('main', 'convert_mail_header', 'Y', NULL, NULL),
('main', 'mail_event_period', '14', NULL, NULL),
('main', 'mail_event_bulk', '5', NULL, NULL),
('main', 'mail_additional_parameters', '', NULL, NULL),
('main', 'disk_space', '', NULL, NULL),
('main', 'upload_dir', 'upload', NULL, NULL),
('main', 'save_original_file_name', 'N', NULL, NULL),
('main', 'translit_original_file_name', 'N', NULL, NULL),
('main', 'convert_original_file_name', 'Y', NULL, NULL),
('main', 'image_resize_quality', '95', NULL, NULL),
('main', 'bx_fast_download', 'N', NULL, NULL),
('main', 'compres_css_js_files', 'N', NULL, NULL),
('main', 'translate_key_yandex', '', NULL, NULL),
('main', 'use_time_zones', 'N', NULL, NULL),
('main', 'auto_time_zone', 'N', NULL, NULL),
('main', 'map_top_menu_type', 'top', NULL, NULL),
('main', 'map_left_menu_type', 'left', NULL, NULL),
('main', 'update_site_proxy_addr', '', NULL, NULL),
('main', 'update_site_proxy_port', '', NULL, NULL),
('main', 'update_site_proxy_user', 'admin', NULL, NULL),
('main', 'update_site_proxy_pass', 'Qwerty777)', NULL, NULL),
('main', 'strong_update_check', 'Y', NULL, NULL),
('main', 'stable_versions_only', 'Y', NULL, NULL),
('main', 'update_autocheck', '', NULL, NULL),
('main', 'update_stop_autocheck', 'N', NULL, NULL),
('main', 'update_is_gzip_installed', 'Y', NULL, NULL),
('main', 'update_load_timeout', '30', NULL, NULL),
('main', 'store_password', 'Y', NULL, NULL),
('main', 'use_secure_password_cookies', 'N', NULL, NULL),
('main', 'auth_multisite', 'N', NULL, NULL),
('main', 'allow_socserv_authorization', 'N', NULL, NULL),
('main', 'use_digest_auth', 'N', NULL, NULL),
('main', 'custom_register_page', '', NULL, NULL),
('main', 'use_encrypted_auth', 'N', NULL, NULL),
('main', 'new_user_registration', 'Y', NULL, NULL),
('main', 'captcha_registration', 'N', NULL, NULL),
('main', 'new_user_email_required', 'Y', NULL, NULL),
('main', 'new_user_registration_email_confirmation', 'N', NULL, NULL),
('main', 'new_user_registration_cleanup_days', '7', NULL, NULL),
('main', 'new_user_email_uniq_check', 'N', NULL, NULL),
('main', 'session_expand', 'Y', NULL, NULL),
('main', 'session_show_message', 'Y', NULL, NULL),
('main', 'event_log_cleanup_days', '7', NULL, NULL),
('main', 'event_log_logout', 'N', NULL, NULL),
('main', 'event_log_login_success', 'N', NULL, NULL),
('main', 'event_log_login_fail', 'N', NULL, NULL),
('main', 'event_log_register', 'N', NULL, NULL),
('main', 'event_log_register_fail', 'N', NULL, NULL),
('main', 'event_log_password_request', 'N', NULL, NULL),
('main', 'event_log_password_change', 'N', NULL, NULL),
('main', 'event_log_user_edit', 'N', NULL, NULL),
('main', 'event_log_user_delete', 'N', NULL, NULL),
('main', 'event_log_user_groups', 'N', NULL, NULL),
('main', 'event_log_group_policy', 'N', NULL, NULL),
('main', 'event_log_module_access', 'N', NULL, NULL),
('main', 'event_log_file_access', 'N', NULL, NULL),
('main', 'event_log_task', 'N', NULL, NULL),
('main', 'auth_controller_sso', 'N', NULL, NULL),
('main', 'show_panel_for_users', 'N;', NULL, NULL),
('main', 'GROUP_DEFAULT_RIGHT', 'D', NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `b_perf_cache`
--

CREATE TABLE IF NOT EXISTS `b_perf_cache` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `HIT_ID` int(18) DEFAULT NULL,
  `COMPONENT_ID` int(18) DEFAULT NULL,
  `NN` int(18) DEFAULT NULL,
  `CACHE_SIZE` float DEFAULT NULL,
  `OP_MODE` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MODULE_NAME` text COLLATE utf8_unicode_ci,
  `COMPONENT_NAME` text COLLATE utf8_unicode_ci,
  `BASE_DIR` text COLLATE utf8_unicode_ci,
  `INIT_DIR` text COLLATE utf8_unicode_ci,
  `FILE_NAME` text COLLATE utf8_unicode_ci,
  `FILE_PATH` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IX_B_PERF_CACHE_0` (`HIT_ID`,`NN`),
  KEY `IX_B_PERF_CACHE_1` (`COMPONENT_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `b_perf_cluster`
--

CREATE TABLE IF NOT EXISTS `b_perf_cluster` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `THREADS` int(11) DEFAULT NULL,
  `HITS` int(11) DEFAULT NULL,
  `ERRORS` int(11) DEFAULT NULL,
  `PAGES_PER_SECOND` float DEFAULT NULL,
  `PAGE_EXEC_TIME` float DEFAULT NULL,
  `PAGE_RESP_TIME` float DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `b_perf_component`
--

CREATE TABLE IF NOT EXISTS `b_perf_component` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `HIT_ID` int(18) DEFAULT NULL,
  `NN` int(18) DEFAULT NULL,
  `CACHE_TYPE` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CACHE_SIZE` int(11) DEFAULT NULL,
  `CACHE_COUNT_R` int(11) DEFAULT NULL,
  `CACHE_COUNT_W` int(11) DEFAULT NULL,
  `CACHE_COUNT_C` int(11) DEFAULT NULL,
  `COMPONENT_TIME` float DEFAULT NULL,
  `QUERIES` int(11) DEFAULT NULL,
  `QUERIES_TIME` float DEFAULT NULL,
  `COMPONENT_NAME` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IX_B_PERF_COMPONENT_0` (`HIT_ID`,`NN`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `b_perf_error`
--

CREATE TABLE IF NOT EXISTS `b_perf_error` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `HIT_ID` int(18) DEFAULT NULL,
  `ERRNO` int(18) DEFAULT NULL,
  `ERRSTR` text COLLATE utf8_unicode_ci,
  `ERRFILE` text COLLATE utf8_unicode_ci,
  `ERRLINE` int(18) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_PERF_ERROR_0` (`HIT_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `b_perf_history`
--

CREATE TABLE IF NOT EXISTS `b_perf_history` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `TOTAL_MARK` float DEFAULT NULL,
  `ACCELERATOR_ENABLED` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `b_perf_hit`
--

CREATE TABLE IF NOT EXISTS `b_perf_hit` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DATE_HIT` datetime DEFAULT NULL,
  `IS_ADMIN` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `REQUEST_METHOD` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SERVER_NAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SERVER_PORT` int(11) DEFAULT NULL,
  `SCRIPT_NAME` text COLLATE utf8_unicode_ci,
  `REQUEST_URI` text COLLATE utf8_unicode_ci,
  `INCLUDED_FILES` int(11) DEFAULT NULL,
  `MEMORY_PEAK_USAGE` int(11) DEFAULT NULL,
  `CACHE_TYPE` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CACHE_SIZE` int(11) DEFAULT NULL,
  `CACHE_COUNT_R` int(11) DEFAULT NULL,
  `CACHE_COUNT_W` int(11) DEFAULT NULL,
  `CACHE_COUNT_C` int(11) DEFAULT NULL,
  `QUERIES` int(11) DEFAULT NULL,
  `QUERIES_TIME` float DEFAULT NULL,
  `COMPONENTS` int(11) DEFAULT NULL,
  `COMPONENTS_TIME` float DEFAULT NULL,
  `SQL_LOG` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PAGE_TIME` float DEFAULT NULL,
  `PROLOG_TIME` float DEFAULT NULL,
  `PROLOG_BEFORE_TIME` float DEFAULT NULL,
  `AGENTS_TIME` float DEFAULT NULL,
  `PROLOG_AFTER_TIME` float DEFAULT NULL,
  `WORK_AREA_TIME` float DEFAULT NULL,
  `EPILOG_TIME` float DEFAULT NULL,
  `EPILOG_BEFORE_TIME` float DEFAULT NULL,
  `EVENTS_TIME` float DEFAULT NULL,
  `EPILOG_AFTER_TIME` float DEFAULT NULL,
  `MENU_RECALC` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_PERF_HIT_0` (`DATE_HIT`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `b_perf_index_ban`
--

CREATE TABLE IF NOT EXISTS `b_perf_index_ban` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `BAN_TYPE` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TABLE_NAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `COLUMN_NAMES` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `b_perf_index_complete`
--

CREATE TABLE IF NOT EXISTS `b_perf_index_complete` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `BANNED` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TABLE_NAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `COLUMN_NAMES` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `INDEX_NAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_b_perf_index_complete_0` (`TABLE_NAME`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `b_perf_index_suggest`
--

CREATE TABLE IF NOT EXISTS `b_perf_index_suggest` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SQL_MD5` char(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SQL_COUNT` int(11) DEFAULT NULL,
  `SQL_TIME` float DEFAULT NULL,
  `TABLE_NAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TABLE_ALIAS` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `COLUMN_NAMES` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SQL_TEXT` text COLLATE utf8_unicode_ci,
  `SQL_EXPLAIN` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`),
  KEY `ix_b_perf_index_suggest_0` (`SQL_MD5`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `b_perf_index_suggest_sql`
--

CREATE TABLE IF NOT EXISTS `b_perf_index_suggest_sql` (
  `SUGGEST_ID` int(11) NOT NULL DEFAULT '0',
  `SQL_ID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`SUGGEST_ID`,`SQL_ID`),
  KEY `ix_b_perf_index_suggest_sql_0` (`SQL_ID`,`SUGGEST_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_perf_sql`
--

CREATE TABLE IF NOT EXISTS `b_perf_sql` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `HIT_ID` int(18) DEFAULT NULL,
  `COMPONENT_ID` int(18) DEFAULT NULL,
  `NN` int(18) DEFAULT NULL,
  `QUERY_TIME` float DEFAULT NULL,
  `NODE_ID` int(18) DEFAULT NULL,
  `MODULE_NAME` text COLLATE utf8_unicode_ci,
  `COMPONENT_NAME` text COLLATE utf8_unicode_ci,
  `SQL_TEXT` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IX_B_PERF_SQL_0` (`HIT_ID`,`NN`),
  KEY `IX_B_PERF_SQL_1` (`COMPONENT_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `b_perf_sql_backtrace`
--

CREATE TABLE IF NOT EXISTS `b_perf_sql_backtrace` (
  `SQL_ID` int(18) NOT NULL DEFAULT '0',
  `NN` int(18) NOT NULL DEFAULT '0',
  `FILE_NAME` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LINE_NO` int(18) DEFAULT NULL,
  `CLASS_NAME` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FUNCTION_NAME` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`SQL_ID`,`NN`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_perf_tab_column_stat`
--

CREATE TABLE IF NOT EXISTS `b_perf_tab_column_stat` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TABLE_NAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `COLUMN_NAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TABLE_ROWS` float DEFAULT NULL,
  `COLUMN_ROWS` float DEFAULT NULL,
  `VALUE` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_b_perf_tab_column_stat` (`TABLE_NAME`,`COLUMN_NAME`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `b_perf_tab_stat`
--

CREATE TABLE IF NOT EXISTS `b_perf_tab_stat` (
  `TABLE_NAME` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `TABLE_SIZE` float DEFAULT NULL,
  `TABLE_ROWS` float DEFAULT NULL,
  PRIMARY KEY (`TABLE_NAME`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_perf_test`
--

CREATE TABLE IF NOT EXISTS `b_perf_test` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `REFERENCE_ID` int(18) DEFAULT NULL,
  `NAME` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_PERF_TEST_0` (`REFERENCE_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `b_posting`
--

CREATE TABLE IF NOT EXISTS `b_posting` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `STATUS` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'D',
  `VERSION` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DATE_SENT` datetime DEFAULT NULL,
  `SENT_BCC` mediumtext COLLATE utf8_unicode_ci,
  `FROM_FIELD` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `TO_FIELD` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `BCC_FIELD` mediumtext COLLATE utf8_unicode_ci,
  `EMAIL_FILTER` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SUBJECT` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `BODY_TYPE` varchar(4) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'text',
  `BODY` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `DIRECT_SEND` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `CHARSET` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MSG_CHARSET` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SUBSCR_FORMAT` varchar(4) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ERROR_EMAIL` mediumtext COLLATE utf8_unicode_ci,
  `AUTO_SEND_TIME` datetime DEFAULT NULL,
  `BCC_TO_SEND` mediumtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `b_posting_email`
--

CREATE TABLE IF NOT EXISTS `b_posting_email` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `POSTING_ID` int(11) NOT NULL,
  `STATUS` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `EMAIL` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `SUBSCRIPTION_ID` int(11) DEFAULT NULL,
  `USER_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_posting_email_status` (`POSTING_ID`,`STATUS`),
  KEY `ix_posting_email_email` (`POSTING_ID`,`EMAIL`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `b_posting_file`
--

CREATE TABLE IF NOT EXISTS `b_posting_file` (
  `POSTING_ID` int(11) NOT NULL,
  `FILE_ID` int(11) NOT NULL,
  UNIQUE KEY `UK_POSTING_POSTING_FILE` (`POSTING_ID`,`FILE_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_posting_group`
--

CREATE TABLE IF NOT EXISTS `b_posting_group` (
  `POSTING_ID` int(11) NOT NULL,
  `GROUP_ID` int(11) NOT NULL,
  UNIQUE KEY `UK_POSTING_POSTING_GROUP` (`POSTING_ID`,`GROUP_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_posting_rubric`
--

CREATE TABLE IF NOT EXISTS `b_posting_rubric` (
  `POSTING_ID` int(11) NOT NULL,
  `LIST_RUBRIC_ID` int(11) NOT NULL,
  UNIQUE KEY `UK_POSTING_POSTING_RUBRIC` (`POSTING_ID`,`LIST_RUBRIC_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_rating`
--

CREATE TABLE IF NOT EXISTS `b_rating` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(512) COLLATE utf8_unicode_ci NOT NULL,
  `ENTITY_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `CALCULATION_METHOD` varchar(3) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'SUM',
  `CREATED` datetime DEFAULT NULL,
  `LAST_MODIFIED` datetime DEFAULT NULL,
  `LAST_CALCULATED` datetime DEFAULT NULL,
  `POSITION` char(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  `AUTHORITY` char(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  `CALCULATED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `CONFIGS` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Дамп данных таблицы `b_rating`
--

INSERT INTO `b_rating` (`ID`, `ACTIVE`, `NAME`, `ENTITY_ID`, `CALCULATION_METHOD`, `CREATED`, `LAST_MODIFIED`, `LAST_CALCULATED`, `POSITION`, `AUTHORITY`, `CALCULATED`, `CONFIGS`) VALUES
(1, 'N', 'Рейтинг', 'USER', 'SUM', '2015-06-03 21:58:34', NULL, NULL, 'Y', 'N', 'N', 'a:3:{s:4:"MAIN";a:2:{s:4:"VOTE";a:1:{s:4:"USER";a:2:{s:11:"COEFFICIENT";s:1:"1";s:5:"LIMIT";s:2:"30";}}s:6:"RATING";a:1:{s:5:"BONUS";a:2:{s:6:"ACTIVE";s:1:"Y";s:11:"COEFFICIENT";s:1:"1";}}}s:5:"FORUM";a:2:{s:4:"VOTE";a:2:{s:5:"TOPIC";a:3:{s:6:"ACTIVE";s:1:"Y";s:11:"COEFFICIENT";s:3:"0.5";s:5:"LIMIT";s:2:"30";}s:4:"POST";a:3:{s:6:"ACTIVE";s:1:"Y";s:11:"COEFFICIENT";s:3:"0.1";s:5:"LIMIT";s:2:"30";}}s:6:"RATING";a:1:{s:8:"ACTIVITY";a:9:{s:6:"ACTIVE";s:1:"Y";s:16:"TODAY_TOPIC_COEF";s:3:"0.4";s:15:"WEEK_TOPIC_COEF";s:3:"0.2";s:16:"MONTH_TOPIC_COEF";s:3:"0.1";s:14:"ALL_TOPIC_COEF";s:1:"0";s:15:"TODAY_POST_COEF";s:3:"0.2";s:14:"WEEK_POST_COEF";s:3:"0.1";s:15:"MONTH_POST_COEF";s:4:"0.05";s:13:"ALL_POST_COEF";s:1:"0";}}}s:4:"BLOG";a:2:{s:4:"VOTE";a:2:{s:4:"POST";a:3:{s:6:"ACTIVE";s:1:"Y";s:11:"COEFFICIENT";s:3:"0.5";s:5:"LIMIT";s:2:"30";}s:7:"COMMENT";a:3:{s:6:"ACTIVE";s:1:"Y";s:11:"COEFFICIENT";s:3:"0.1";s:5:"LIMIT";s:2:"30";}}s:6:"RATING";a:1:{s:8:"ACTIVITY";a:9:{s:6:"ACTIVE";s:1:"Y";s:15:"TODAY_POST_COEF";s:3:"0.4";s:14:"WEEK_POST_COEF";s:3:"0.2";s:15:"MONTH_POST_COEF";s:3:"0.1";s:13:"ALL_POST_COEF";s:1:"0";s:18:"TODAY_COMMENT_COEF";s:3:"0.2";s:17:"WEEK_COMMENT_COEF";s:3:"0.1";s:18:"MONTH_COMMENT_COEF";s:4:"0.05";s:16:"ALL_COMMENT_COEF";s:1:"0";}}}}'),
(2, 'N', 'Авторитет', 'USER', 'SUM', '2015-06-03 21:58:34', NULL, NULL, 'Y', 'Y', 'N', 'a:3:{s:4:"MAIN";a:2:{s:4:"VOTE";a:1:{s:4:"USER";a:3:{s:6:"ACTIVE";s:1:"Y";s:11:"COEFFICIENT";s:1:"1";s:5:"LIMIT";s:1:"0";}}s:6:"RATING";a:1:{s:5:"BONUS";a:2:{s:6:"ACTIVE";s:1:"Y";s:11:"COEFFICIENT";s:1:"1";}}}s:5:"FORUM";a:2:{s:4:"VOTE";a:2:{s:5:"TOPIC";a:2:{s:11:"COEFFICIENT";s:1:"1";s:5:"LIMIT";s:2:"30";}s:4:"POST";a:2:{s:11:"COEFFICIENT";s:1:"1";s:5:"LIMIT";s:2:"30";}}s:6:"RATING";a:1:{s:8:"ACTIVITY";a:8:{s:16:"TODAY_TOPIC_COEF";s:2:"20";s:15:"WEEK_TOPIC_COEF";s:2:"10";s:16:"MONTH_TOPIC_COEF";s:1:"5";s:14:"ALL_TOPIC_COEF";s:1:"0";s:15:"TODAY_POST_COEF";s:3:"0.4";s:14:"WEEK_POST_COEF";s:3:"0.2";s:15:"MONTH_POST_COEF";s:3:"0.1";s:13:"ALL_POST_COEF";s:1:"0";}}}s:4:"BLOG";a:2:{s:4:"VOTE";a:2:{s:4:"POST";a:2:{s:11:"COEFFICIENT";s:1:"1";s:5:"LIMIT";s:2:"30";}s:7:"COMMENT";a:2:{s:11:"COEFFICIENT";s:1:"1";s:5:"LIMIT";s:2:"30";}}s:6:"RATING";a:1:{s:8:"ACTIVITY";a:8:{s:15:"TODAY_POST_COEF";s:3:"0.4";s:14:"WEEK_POST_COEF";s:3:"0.2";s:15:"MONTH_POST_COEF";s:3:"0.1";s:13:"ALL_POST_COEF";s:1:"0";s:18:"TODAY_COMMENT_COEF";s:3:"0.2";s:17:"WEEK_COMMENT_COEF";s:3:"0.1";s:18:"MONTH_COMMENT_COEF";s:4:"0.05";s:16:"ALL_COMMENT_COEF";s:1:"0";}}}}');

-- --------------------------------------------------------

--
-- Структура таблицы `b_rating_component`
--

CREATE TABLE IF NOT EXISTS `b_rating_component` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RATING_ID` int(11) NOT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `ENTITY_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `MODULE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `RATING_TYPE` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `COMPLEX_NAME` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `CLASS` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `CALC_METHOD` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `EXCEPTION_METHOD` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LAST_MODIFIED` datetime DEFAULT NULL,
  `LAST_CALCULATED` datetime DEFAULT NULL,
  `NEXT_CALCULATION` datetime DEFAULT NULL,
  `REFRESH_INTERVAL` int(11) NOT NULL,
  `CONFIG` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`),
  KEY `IX_RATING_ID_1` (`RATING_ID`,`ACTIVE`,`NEXT_CALCULATION`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `b_rating_component_results`
--

CREATE TABLE IF NOT EXISTS `b_rating_component_results` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RATING_ID` int(11) NOT NULL,
  `ENTITY_TYPE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ENTITY_ID` int(11) NOT NULL,
  `MODULE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `RATING_TYPE` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `COMPLEX_NAME` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `CURRENT_VALUE` decimal(18,4) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_ENTITY_TYPE_ID` (`ENTITY_TYPE_ID`),
  KEY `IX_COMPLEX_NAME` (`COMPLEX_NAME`),
  KEY `IX_RATING_ID_2` (`RATING_ID`,`COMPLEX_NAME`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `b_rating_prepare`
--

CREATE TABLE IF NOT EXISTS `b_rating_prepare` (
  `ID` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_rating_results`
--

CREATE TABLE IF NOT EXISTS `b_rating_results` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RATING_ID` int(11) NOT NULL,
  `ENTITY_TYPE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ENTITY_ID` int(11) NOT NULL,
  `CURRENT_VALUE` decimal(18,4) DEFAULT NULL,
  `PREVIOUS_VALUE` decimal(18,4) DEFAULT NULL,
  `CURRENT_POSITION` int(11) DEFAULT '0',
  `PREVIOUS_POSITION` int(11) DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `IX_RATING_3` (`RATING_ID`,`ENTITY_TYPE_ID`,`ENTITY_ID`),
  KEY `IX_RATING_4` (`RATING_ID`,`ENTITY_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `b_rating_rule`
--

CREATE TABLE IF NOT EXISTS `b_rating_rule` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `NAME` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `ENTITY_TYPE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `CONDITION_NAME` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `CONDITION_MODULE` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CONDITION_CLASS` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `CONDITION_METHOD` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `CONDITION_CONFIG` text COLLATE utf8_unicode_ci NOT NULL,
  `ACTION_NAME` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `ACTION_CONFIG` text COLLATE utf8_unicode_ci NOT NULL,
  `ACTIVATE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `ACTIVATE_CLASS` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ACTIVATE_METHOD` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `DEACTIVATE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `DEACTIVATE_CLASS` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `DEACTIVATE_METHOD` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `CREATED` datetime DEFAULT NULL,
  `LAST_MODIFIED` datetime DEFAULT NULL,
  `LAST_APPLIED` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=6 ;

--
-- Дамп данных таблицы `b_rating_rule`
--

INSERT INTO `b_rating_rule` (`ID`, `ACTIVE`, `NAME`, `ENTITY_TYPE_ID`, `CONDITION_NAME`, `CONDITION_MODULE`, `CONDITION_CLASS`, `CONDITION_METHOD`, `CONDITION_CONFIG`, `ACTION_NAME`, `ACTION_CONFIG`, `ACTIVATE`, `ACTIVATE_CLASS`, `ACTIVATE_METHOD`, `DEACTIVATE`, `DEACTIVATE_CLASS`, `DEACTIVATE_METHOD`, `CREATED`, `LAST_MODIFIED`, `LAST_APPLIED`) VALUES
(1, 'N', 'Добавление в группу пользователей, имеющих право голосовать за рейтинг', 'USER', 'AUTHORITY', NULL, 'CRatingRulesMain', 'ratingCheck', 'a:1:{s:9:"AUTHORITY";a:2:{s:16:"RATING_CONDITION";i:1;s:12:"RATING_VALUE";i:1;}}', 'ADD_TO_GROUP', 'a:1:{s:12:"ADD_TO_GROUP";a:1:{s:8:"GROUP_ID";s:1:"3";}}', 'N', 'CRatingRulesMain', 'addToGroup', 'N', 'CRatingRulesMain ', 'addToGroup', '2015-06-03 21:58:34', '2015-06-03 21:58:34', NULL),
(2, 'N', 'Удаление из группы пользователей, не имеющих права голосовать за рейтинг', 'USER', 'AUTHORITY', NULL, 'CRatingRulesMain', 'ratingCheck', 'a:1:{s:9:"AUTHORITY";a:2:{s:16:"RATING_CONDITION";i:2;s:12:"RATING_VALUE";i:1;}}', 'REMOVE_FROM_GROUP', 'a:1:{s:17:"REMOVE_FROM_GROUP";a:1:{s:8:"GROUP_ID";s:1:"3";}}', 'N', 'CRatingRulesMain', 'removeFromGroup', 'N', 'CRatingRulesMain ', 'removeFromGroup', '2015-06-03 21:58:34', '2015-06-03 21:58:34', NULL),
(3, 'N', 'Добавление в группу пользователей, имеющих право голосовать за авторитет', 'USER', 'AUTHORITY', NULL, 'CRatingRulesMain', 'ratingCheck', 'a:1:{s:9:"AUTHORITY";a:2:{s:16:"RATING_CONDITION";i:1;s:12:"RATING_VALUE";i:2;}}', 'ADD_TO_GROUP', 'a:1:{s:12:"ADD_TO_GROUP";a:1:{s:8:"GROUP_ID";s:1:"4";}}', 'N', 'CRatingRulesMain', 'addToGroup', 'N', 'CRatingRulesMain ', 'addToGroup', '2015-06-03 21:58:34', '2015-06-03 21:58:34', NULL),
(4, 'N', 'Удаление из группы пользователей, не имеющих права голосовать за авторитет', 'USER', 'AUTHORITY', NULL, 'CRatingRulesMain', 'ratingCheck', 'a:1:{s:9:"AUTHORITY";a:2:{s:16:"RATING_CONDITION";i:2;s:12:"RATING_VALUE";i:2;}}', 'REMOVE_FROM_GROUP', 'a:1:{s:17:"REMOVE_FROM_GROUP";a:1:{s:8:"GROUP_ID";s:1:"4";}}', 'N', 'CRatingRulesMain', 'removeFromGroup', 'N', 'CRatingRulesMain ', 'removeFromGroup', '2015-06-03 21:58:34', '2015-06-03 21:58:34', NULL),
(5, 'Y', 'Автоматическое голосование за авторитет пользователя', 'USER', 'VOTE', NULL, 'CRatingRulesMain', 'voteCheck', 'a:1:{s:4:"VOTE";a:6:{s:10:"VOTE_LIMIT";i:90;s:11:"VOTE_RESULT";i:10;s:16:"VOTE_FORUM_TOPIC";d:0.5;s:15:"VOTE_FORUM_POST";d:0.10000000000000001;s:14:"VOTE_BLOG_POST";d:0.5;s:17:"VOTE_BLOG_COMMENT";d:0.10000000000000001;}}', 'empty', 'a:0:{}', 'N', 'empty', 'empty', 'N', 'empty ', 'empty', '2015-06-03 21:58:34', '2015-06-03 21:58:34', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `b_rating_rule_vetting`
--

CREATE TABLE IF NOT EXISTS `b_rating_rule_vetting` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RULE_ID` int(11) NOT NULL,
  `ENTITY_TYPE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ENTITY_ID` int(11) NOT NULL,
  `ACTIVATE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `APPLIED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  PRIMARY KEY (`ID`),
  KEY `RULE_ID` (`RULE_ID`,`ENTITY_TYPE_ID`,`ENTITY_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `b_rating_user`
--

CREATE TABLE IF NOT EXISTS `b_rating_user` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RATING_ID` int(11) NOT NULL,
  `ENTITY_ID` int(11) NOT NULL,
  `BONUS` decimal(18,4) DEFAULT '0.0000',
  `VOTE_WEIGHT` decimal(18,4) DEFAULT '0.0000',
  `VOTE_COUNT` int(11) DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `RATING_ID` (`RATING_ID`,`ENTITY_ID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Дамп данных таблицы `b_rating_user`
--

INSERT INTO `b_rating_user` (`ID`, `RATING_ID`, `ENTITY_ID`, `BONUS`, `VOTE_WEIGHT`, `VOTE_COUNT`) VALUES
(1, 2, 1, '3.0000', '30.0000', 13);

-- --------------------------------------------------------

--
-- Структура таблицы `b_rating_vote`
--

CREATE TABLE IF NOT EXISTS `b_rating_vote` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RATING_VOTING_ID` int(11) NOT NULL,
  `ENTITY_TYPE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ENTITY_ID` int(11) NOT NULL,
  `OWNER_ID` int(11) NOT NULL,
  `VALUE` decimal(18,4) NOT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `CREATED` datetime NOT NULL,
  `USER_ID` int(11) NOT NULL,
  `USER_IP` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_RAT_VOTE_ID` (`RATING_VOTING_ID`,`USER_ID`),
  KEY `IX_RAT_VOTE_ID_2` (`ENTITY_TYPE_ID`,`ENTITY_ID`,`USER_ID`),
  KEY `IX_RAT_VOTE_ID_3` (`OWNER_ID`,`CREATED`),
  KEY `IX_RAT_VOTE_ID_4` (`USER_ID`),
  KEY `IX_RAT_VOTE_ID_5` (`CREATED`,`VALUE`),
  KEY `IX_RAT_VOTE_ID_6` (`ACTIVE`),
  KEY `IX_RAT_VOTE_ID_7` (`RATING_VOTING_ID`,`CREATED`),
  KEY `IX_RAT_VOTE_ID_8` (`ENTITY_TYPE_ID`,`CREATED`),
  KEY `IX_RAT_VOTE_ID_9` (`CREATED`,`USER_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `b_rating_vote_group`
--

CREATE TABLE IF NOT EXISTS `b_rating_vote_group` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `GROUP_ID` int(11) NOT NULL,
  `TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `RATING_ID` (`GROUP_ID`,`TYPE`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=7 ;

--
-- Дамп данных таблицы `b_rating_vote_group`
--

INSERT INTO `b_rating_vote_group` (`ID`, `GROUP_ID`, `TYPE`) VALUES
(1, 1, 'R'),
(2, 3, 'R'),
(3, 1, 'R'),
(4, 3, 'R'),
(5, 1, 'A'),
(6, 4, 'A');

-- --------------------------------------------------------

--
-- Структура таблицы `b_rating_voting`
--

CREATE TABLE IF NOT EXISTS `b_rating_voting` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ENTITY_TYPE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ENTITY_ID` int(11) NOT NULL,
  `OWNER_ID` int(11) NOT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `CREATED` datetime DEFAULT NULL,
  `LAST_CALCULATED` datetime DEFAULT NULL,
  `TOTAL_VALUE` decimal(18,4) NOT NULL,
  `TOTAL_VOTES` int(11) NOT NULL,
  `TOTAL_POSITIVE_VOTES` int(11) NOT NULL,
  `TOTAL_NEGATIVE_VOTES` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_ENTITY_TYPE_ID_2` (`ENTITY_TYPE_ID`,`ENTITY_ID`,`ACTIVE`),
  KEY `IX_ENTITY_TYPE_ID_4` (`TOTAL_VALUE`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `b_rating_voting_prepare`
--

CREATE TABLE IF NOT EXISTS `b_rating_voting_prepare` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RATING_VOTING_ID` int(11) NOT NULL,
  `TOTAL_VALUE` decimal(18,4) NOT NULL,
  `TOTAL_VOTES` int(11) NOT NULL,
  `TOTAL_POSITIVE_VOTES` int(11) NOT NULL,
  `TOTAL_NEGATIVE_VOTES` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_RATING_VOTING_ID` (`RATING_VOTING_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `b_rating_weight`
--

CREATE TABLE IF NOT EXISTS `b_rating_weight` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RATING_FROM` decimal(18,4) NOT NULL,
  `RATING_TO` decimal(18,4) NOT NULL,
  `WEIGHT` decimal(18,4) DEFAULT '0.0000',
  `COUNT` int(11) DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Дамп данных таблицы `b_rating_weight`
--

INSERT INTO `b_rating_weight` (`ID`, `RATING_FROM`, `RATING_TO`, `WEIGHT`, `COUNT`) VALUES
(1, '-1000000.0000', '1000000.0000', '1.0000', 10);

-- --------------------------------------------------------

--
-- Структура таблицы `b_search_content`
--

CREATE TABLE IF NOT EXISTS `b_search_content` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DATE_CHANGE` datetime NOT NULL,
  `MODULE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ITEM_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `CUSTOM_RANK` int(11) NOT NULL DEFAULT '0',
  `USER_ID` int(11) DEFAULT NULL,
  `ENTITY_TYPE_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ENTITY_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `URL` text COLLATE utf8_unicode_ci,
  `TITLE` text COLLATE utf8_unicode_ci,
  `BODY` longtext COLLATE utf8_unicode_ci,
  `TAGS` text COLLATE utf8_unicode_ci,
  `PARAM1` text COLLATE utf8_unicode_ci,
  `PARAM2` text COLLATE utf8_unicode_ci,
  `UPD` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DATE_FROM` datetime DEFAULT NULL,
  `DATE_TO` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UX_B_SEARCH_CONTENT` (`MODULE_ID`,`ITEM_ID`),
  KEY `IX_B_SEARCH_CONTENT_1` (`MODULE_ID`,`PARAM1`(50),`PARAM2`(50)),
  KEY `IX_B_SEARCH_CONTENT_2` (`ENTITY_ID`(50),`ENTITY_TYPE_ID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=59 ;

--
-- Дамп данных таблицы `b_search_content`
--

INSERT INTO `b_search_content` (`ID`, `DATE_CHANGE`, `MODULE_ID`, `ITEM_ID`, `CUSTOM_RANK`, `USER_ID`, `ENTITY_TYPE_ID`, `ENTITY_ID`, `URL`, `TITLE`, `BODY`, `TAGS`, `PARAM1`, `PARAM2`, `UPD`, `DATE_FROM`, `DATE_TO`) VALUES
(1, '2015-06-03 21:59:40', 'main', 's1|/search/map.php', 0, NULL, NULL, NULL, '/search/map.php', 'Карта сайта', '', '', '', '', 'f2035db17755bb90c5a93399d61f199f', NULL, NULL),
(2, '2015-06-03 21:59:40', 'main', 's1|/search/index.php', 0, NULL, NULL, NULL, '/search/index.php', 'Поиск', '', '', '', '', 'f2035db17755bb90c5a93399d61f199f', NULL, NULL),
(3, '2015-06-04 00:47:46', 'main', 's1|/news/index.php', 0, NULL, NULL, NULL, '/news/index.php', 'Новости', '', '', '', '', 'f2035db17755bb90c5a93399d61f199f', NULL, NULL),
(4, '2015-06-03 21:59:40', 'main', 's1|/contacts/feedback.php', 0, NULL, NULL, NULL, '/contacts/feedback.php', 'Задать вопрос', '', '', '', '', 'f2035db17755bb90c5a93399d61f199f', NULL, NULL),
(5, '2015-06-03 22:29:54', 'main', 's1|/contacts/index.php', 0, NULL, NULL, NULL, '/contacts/index.php', 'Контакты', 'Text here....', '', '', '', 'f2035db17755bb90c5a93399d61f199f', NULL, NULL),
(41, '2015-06-03 22:31:00', 'main', 's1|/franchising/index.php', 0, NULL, NULL, NULL, '/franchising/index.php', 'Франчайзинг', 'Text here....', '', '', '', NULL, NULL, NULL),
(42, '2015-06-03 22:31:23', 'main', 's1|/wholesale/index.php', 0, NULL, NULL, NULL, '/wholesale/index.php', 'Оптовые продажи', 'Text here....', '', '', '', NULL, NULL, NULL),
(43, '2015-06-03 22:32:02', 'main', 's1|/wholesale/shops/index.php', 0, NULL, NULL, NULL, '/wholesale/shops/index.php', 'Магазины', 'Text here....', '', '', '', NULL, NULL, NULL),
(44, '2015-06-03 23:19:34', 'main', 's1|/index.php', 0, NULL, NULL, NULL, '/index.php', 'Jamilco', '', '', '', '', NULL, NULL, NULL),
(6, '2015-06-03 21:59:40', 'main', 's1|/contacts/requisites.php', 0, NULL, NULL, NULL, '/contacts/requisites.php', 'Наши реквизиты', 'Наименование Банка\rЗакрытое акционерное общество "Название банка"\rСокращенное название\rЗАО "Название банка"\rПолное наименование на английском языке\r"The Name of Bank"\rОсновной государственный регистрационный номер\r152073950937987\rTelex\r911156 IRS RU\rS.W.I.F.T.\rIISARUMM\rSPRINT\rRU.BANK/BITEX\rЮридический адрес: \r175089, Россия, г. Москва, ул. Большая Дмитровка, д. 15, стр. 1\rКор/счет: \r30102810000000000569\rИНН:\r7860249880\rБИК:\r044591488\rОКПО:\r11806935\rОКОНХ:\r98122\rКПП:\r775021017\rПрочая информация\rБанковский идентификационный код: 0575249000\rПочтовый адрес: 115035, Россия, г. Москва, ул. Балчуг, д. 2\rТелефон: (495) 960-10-12\rФакс: (495) 240-38-12\rE-mail: \rRusBk@mail.rusbank.ru', '', '', '', 'f2035db17755bb90c5a93399d61f199f', NULL, NULL),
(7, '2015-06-03 21:59:40', 'main', 's1|/auth.php', 0, NULL, NULL, NULL, '/auth.php', 'Авторизация', 'Вы зарегистрированы и успешно авторизовались.\rИспользуйте административную панель в верхней части экрана для быстрого доступа к функциям управления структурой и информационным наполнением сайта. Набор кнопок верхней панели отличается для различных разделов сайта. Так отдельные наборы действий предусмотрены для управления статическим содержимым страниц, динамическими публикациями (новостями, каталогом, фотогалереей) и т.п.\rВернуться на главную страницу', '', '', '', 'f2035db17755bb90c5a93399d61f199f', NULL, NULL),
(8, '2015-06-03 21:59:40', 'main', 's1|/services/smallbusiness/leazing.php', 0, NULL, NULL, NULL, '/services/smallbusiness/leazing.php', 'Лизинг', 'Наш Банк оказывает весь спектр услуг по финансовой аренде (лизингу) отечественного и импортного оборудования, транспорта и недвижимости.\rЛизинг оборудования и транспорта\rОсновные условия:\rСрок финансирования:\nоборудование и транспорт - до 5 лет\rж/д подвижной состав - до 10 лет\rВалюта финансирования: рубли, доллары США, евро\rМинимальная сумма финансирования: от 4,5 млн.руб.\rАванс: от 0%\rУдорожание: от 9%\rСрок принятия решения: от 14 дней\rФинансирование импортных поставок\rМы предоставляем предприятиям доступ к льготному финансированию импортных поставок оборудования и транспорта с использованием механизма лизинга при участии экспортных кредитных агентств.\rОсновные условия:\rСрок финансирования: до 7 лет\rВалюта финансирования: рубли, доллары США, евро\rМинимальная сумма финансирования: от 15 млн.руб. \rАванс: от 15% (без учета таможенных пошлин) \rУдорожание: от 5%\rСрок принятия решения: от 14 дней\rЛизинг коммерческой недвижимости\rПозволяет предприятиям приобрести объекты коммерческой недвижимости без единовременного отвлечения значительных средств.\rВ качестве предмета лизинга могут выступать:\rофисные здания;\rторговые, складские и производственные помещения;\rдругие объекты коммерческой недвижимости.\rОсновные условия:\rСрок финансирования: от 5 лет\rВалюта финансирования: рубли, доллары США, евро\rМинимальная сумма финансирования: от 50 млн.руб.* \rАванс: от 0%\rУдорожание: от 7%\rСрок принятия решения: от 14 дней\r* Размер суммы финансирования зависит от региона, в котором находится объект недвижимости.\rОсновным требованием, предъявляемым нашим Банком для рассмотрения заявки на лизинг коммерческой недвижимости, является наличие полного комплекта правоустанавливающих документов на недвижимость и наличие отчета независимого оценщика.', '', '', '', 'f2035db17755bb90c5a93399d61f199f', NULL, NULL),
(9, '2015-06-03 21:59:40', 'main', 's1|/services/smallbusiness/credit.php', 0, NULL, NULL, NULL, '/services/smallbusiness/credit.php', 'Кредитование', 'Кредитование малого и среднего бизнеса является одним из стратегических направлений Банка.\rДанное направление включает в себя:\nкредитование юридических лиц\rкредитование индивидуальных предпринимателей\rВ зависимости от пожеланий клиента кредиты для бизнеса предоставляются в разных валютах: в рублях РФ, долларах США и евро. \nПреимущества получения кредита в нашем Банке:\rСрок рассмотрения кредитной заявки от 2-х рабочих дней; \rОтсутствие ежемесячной платы за ведение ссудного счета;\rОтсутствие требований по предоставлению бизнес-плана;\rПринимается к рассмотрению управленческая отчетность;\rВ качестве залога рассматриваются товары в обороте, автотранспорт, оборудование, недвижимость и другое ликвидное имущество; \rГибкие условия погашения кредита. \rДля получения кредита:\rПозвоните нам по телефону +7 (495) 757-57-57, обратитесь в ближайшее к Вам отделение Банка или заполните on-line заявку. \rНаши специалисты помогут Вам выбрать удобные условия кредитования и ответят на интересующие Вас вопросы.\rПодготовьте необходимые для рассмотрения кредитной заявки документы и договоритесь о встрече с кредитным экспертом Банка.\rПокажите кредитному эксперту Ваше предприятие и имущество, предлагаемое в залог.\rПолучите кредит на развитие Вашего бизнеса! \nПрограммы кредитования малого и среднего бизнеса:\rПрограмма\nСумма кредита\nПроцентная ставка\nСрок кредита\n«Овердрафт»\rот 300 000\nдо 5 000 000 рублей\nот 18% годовых\nдо 12 месяцев\n«Миникредит»\rот 150 000\nдо 1 000 000 рублей\nот 24% годовых\nдо 36 месяцев\n«Развитие»\nот 1 000 000\nдо 15 000 000 рублей\nот 17% годовых\nдо 36 месяцев\n«Инвест»\nот 1 000 000\nдо 30 000 000 рублей\nот 15% годовых\nдо 72 месяцев', '', '', '', 'f2035db17755bb90c5a93399d61f199f', NULL, NULL),
(10, '2015-06-03 21:59:40', 'main', 's1|/services/smallbusiness/cards.php', 0, NULL, NULL, NULL, '/services/smallbusiness/cards.php', 'Пластиковые карты', 'Наш Банк проводит операции с пластиковыми картами с 1997 г. Сегодня мы предлагаем пластиковые карты основных международных платёжных систем – Visa и MasterCard; от самых демократичных Еlеctron до элитных Gold и Platinum. В рамках персонального обслуживания В рамках персонального банковского обслуживания Банк дополнительно предлагает эксклюзивные карты Visa Infinite с бриллиантами и платиновым орнаментом.\rЗаказать международную пластиковую карту можно в любом отделении нашего Банка. Ваша карта будет готова уже через 3-5 дней. Наш Банк один из немногих в России, кто выдает карту сроком на два года, как и крупнейшие зарубежные банки.Каждый Пакет услуг Банка включает одну основную и до трех дополнительных пластиковых карт для вас и для членов вашей семьи (включая детей старше 14 лет). Вы сами устанавливаете ограничения: кто и сколько может потратить по карте.\rТеряя пластиковую карту, вы не теряете деньги. Потому что карты нашего Банка надежно защищены от незаконного использования. Просто соблюдайте правила безопасности при обращении со своей картой, а в случае ее пропажи или хищения без промедления обратитесь в Банк.\rПреимущества пластиковых карт Банка\rполучение наличных без комиссии в широкой сети банкоматов;\rсведения об остатке и совершённых операциях по карте приходят по SMS;\rсистема интернет-банкинга позволяет владельцу карты контролировать расходы и управлять средствами на карточных счетах.\rвсем владельцам карт Банка доступны cкидки и бонусные программы.\rВиды пластиковых карт\rДебетовые карты:\rудобство безналичной оплаты товаров и услуг\rбезопасное хранение собственных средств\rначисление процентов на остаток по карте\rконтроль над расходами и управление своими деньгами\rКредитные карты:\rкредитование без процентов до 55 дней\rпользоваться кредитом можно многократно, не обращаясь в Банк\rбезналичная оплата товаров и услуг без комиссий в любой точке мира\rпровоз денег через границу без таможенного оформления\rне нужно покупать валюту для выезда в другие страны\rвсе полезные функции дебетовых карт', '', '', '', 'f2035db17755bb90c5a93399d61f199f', NULL, NULL),
(11, '2015-06-03 21:59:40', 'main', 's1|/services/smallbusiness/index.php', 0, NULL, NULL, NULL, '/services/smallbusiness/index.php', 'Малому и среднему бизнесу', 'Работа с предприятиями малого и среднего бизнеса - одно из стратегически важных направлений деятельности Банка. Наш Банк представляет современные программы обслуживания малого и среднего бизнеса, обеспечивает оптимальные и взаимовыгодные варианты сотрудничества, в основе которых лежит профессионализм сотрудников и высокое качество банковских услуг. Услуги нашего Банка отличаются оперативностью и надежностью, так как ориентированы на деловых людей - на тех, кто ценит свое время и деньги.\rБанк предлагает следующие виды услуг для предприятий малого и среднего бизнеса:\rКредитование\rЛизинг\rДепозиты\rПластиковые карты', '', '', '', 'f2035db17755bb90c5a93399d61f199f', NULL, NULL),
(12, '2015-06-03 21:59:40', 'main', 's1|/services/smallbusiness/deposits.php', 0, NULL, NULL, NULL, '/services/smallbusiness/deposits.php', 'Депозиты', 'Наш Банк предлагает вам эффективно разместить свободные деньги на банковском депозите и получить дополнительную прибыль.\rДепозитные продукты\r \rДосрочное расторжение\rПополнение\rЧастичное изъятие\rВыплата процентов\rДепозит с выплатой процентов в конце срока\rНе предусмотрено.\rНе предусмотрено.\rНе предусмотрено.\rВ конце срока.\rДепозит с выплатой процентов ежемесячно\rНе предусмотрено.\rНе предусмотрено.\rНе предусмотрено.\rЕжемесячно.\rДепозит с возможностью пополнения\rНе предусмотрено.\rПрекращается за 2 месяца до окончания срока действия депозита. \rНе предусмотрено \rВ конце срока. \rДепозит с возможностью пополнения и изъятия\rНе предусмотрено.\rПрекращается за 2 месяца до окончания срока действия депозита.\rНе более 40% от первоначальной суммы вклада за весь срок депозита \rВ конце срока. \rДепозит с возможностью досрочного расторжения \rВозможно при размещении на 12 месяцев, но не ранее чем через 6 месяцев.\rНе предусмотрено.\rНе предусмотрено. \rВ конце срока.', '', '', '', 'f2035db17755bb90c5a93399d61f199f', NULL, NULL),
(13, '2015-06-03 21:59:40', 'main', 's1|/services/index.php', 0, NULL, NULL, NULL, '/services/index.php', 'Услуги', 'Наш Банк предоставляет физическим лицам большое число различных возможностей, связанных с сохранением средств и совершением различных сделок. В частности, банк предлагает своим клиентам широкую линейку разнообразных вкладов, способных удовлетворить как долгосрочные, так и краткосрочные интересы, касающиеся размещения свободных средств по выгодным ставкам. В своей работе Банк активно применяет инновационные технологии динамично развивающейся банковской сферы.\rБанк предлагает своим клиентам качественный универсальный сервис по следующим направлениям:\rБанковские карты\rПотребительский кредит\rМалому и среднему бизнесу\rРабота с предприятиями малого и среднего бизнеса - одно из стратегически важных направлений деятельности Банка. Наш Банк представляет современные программы обслуживания малого и среднего бизнеса, обеспечивает оптимальные и взаимовыгодные варианты сотрудничества, в основе которых лежит профессионализм сотрудников и высокое качество банковских услуг. Услуги нашего Банка отличаются оперативностью и надежностью, так как ориентированы на деловых людей - на тех, кто ценит свое время и деньги.\rБанк предлагает следующие виды услуг для предприятий малого и среднего бизнеса:\rКредитование\rЛизинг\rДепозиты\rПластиковые карты\rКорпоративным клиентам\rБанк является одним из лидеров банковского рынка по обслуживанию корпоративных клиентов. \rКомплексное банковское обслуживание на основе максимального использования конкурентных преимуществ и возможностей Банка позволяет создать устойчивую \rфинансовую платформу для развития бизнеса предприятий и холдингов различных отраслей экономики. Уже более 15 лет Банк работает для своих клиентов, \rявляясь образцом надежности и высокого профессионализма.\rНаш Банк предлагает корпоративным клиентам следующие виды услуг:\rРасчетно-кассовое обслуживание\rИнкассация\rИнтернет-банкинг\rФинансовым организациям\rАктивное сотрудничество на финансовых рынках представляет собой одну из наиболее важных сторон бизнеса и является перспективным направлением деятельности нашего Банка. Политика банка направлена на расширение сотрудничества, увеличение объемов взаимных кредитных линий. Солидная деловая репутация Банка на рынке межбанковских операций способствует налаживанию стабильных и взаимовыгодных партнерских отношений с самыми крупными и надежными банками страны.\rОсобое внимание Банк уделяет развитию взаимоотношений с международными финансовыми институтами. Финансирование долгосрочных и среднесрочных проектов клиентов за счет привлечения средств на международных рынках капитала - одно из приоритетных направлений деятельности Банка. Наш Банк имеет развитую сеть корреспондентских счетов, что позволяет быстро и качественно осуществлять расчеты в различных валютах. Поручения клиентов могут быть исполнены Банком в сжатые сроки.\rВ целях минимизации рисков при поведении операций на финансовых рынках наш Банк максимально требовательно подходит к выбору своих банков-контрагентов. \rВ данном направлении Банк предлагает финансовым организациям следующие услуги:\rУслуги на межбанковском рынке\rДепозитарные услуги\rДокументарные операции', '', '', '', 'f2035db17755bb90c5a93399d61f199f', NULL, NULL),
(14, '2015-06-03 21:59:40', 'main', 's1|/services/fiz/credit.php', 0, NULL, NULL, NULL, '/services/fiz/credit.php', 'Потребительский кредит', 'Не важно, для чего вам нужны деньги — мы доверяем вам и не тратим время на лишние процедуры.\rТарифы кредитования физических лиц\rВ рублях\rСумма кредита: от 150 000 до 1 500 000 рублей\rСрок кредита: от 6 до 36 месяцев\r% ставка: от 18 до 21,5% годовых\rЕдиновременная комиссия за выдачу кредита: 2% от суммы кредита\rВ долларах США\rСумма кредита: от 5 000 до 50 000 долларов США\rСрок кредита: от 6 до 24 месяцев\r% ставка: от 14,5 до 16,5% годовых\rЕдиновременная комиссия за выдачу кредита: 2% от суммы кредита\rУсловия кредитного договора и применяемый тарифный план и/или тарифы определяются в индивидуальном порядке, в том числе в зависимости от подтвержденного дохода клиента. Изложенная информация не является публичной офертой и не влечет возникновения у ЗАО «Банк Интеза» обязанности предоставить кредит, как на указанных, так и на любых иных условиях.\rМинимальные требования к заемщику\rВы гражданин России.\rВам сейчас больше 23 лет и вам будет меньше 60 (для мужчин) или меньше 55 (для женщин) на момент погашения (то есть полной оплаты) кредита.\rУ вас есть официальное место работы, и вы работаете на нем по найму не менее шести месяцев и прошли испытательный срок.\rВаш общий трудовой стаж составляет не менее двух лет\rВы можете подтвердить свой доход официально при помощи стандартной формы 2НДФЛ или справкой по форме банка.\rВы обратились в отделение банка в том же городе, в котором вы работаете.\rС вами можно связаться по городскому телефону по месту работы.\rТелефон горячей линии: \r8 800 2002 808\r( Звонок по России бесплатный)', '', '', '', 'f2035db17755bb90c5a93399d61f199f', NULL, NULL),
(15, '2015-06-03 21:59:40', 'main', 's1|/services/fiz/cards.php', 0, NULL, NULL, NULL, '/services/fiz/cards.php', 'Банковские карты', 'Кредитные Карты\rСрок действия Карты\r3 года\rКомиссия за ежегодное осуществление расчетов по операциям с Основной Картой.\r600 руб. / 25 долл. США / 25 евро\rЛьготный период оплаты\rдо 50 календарных дней\rЕжемесячный минимальный платеж \r(в процентах от суммы задолженности по Овердрафтам):\r10% \rДополнительные проценты/штрафы/комиссии/ на сумму неразрешенного Овердрафта\rне взимается (отменена с 1 марта) \rКомиссия за учет Отчетной суммы задолженности, непогашенной на последний календарный день Льготного периода оплаты.\rдля 1-6-го месяцев\rдля 6-го и последующих месяцев\r12% / 15% \r21% / 24% \rв пунктах выдачи наличных или банкоматах "Банка" \rв банкоматах банков-партнеров "Объединенной расчетной системы (ОРС)" \rв пунктах выдачи наличных или банкоматах иного банка \r0%\r0,5%\r2,5%\rМинимальная сумма комиссии по операциям получения наличных денежных средств в пунктах выдачи наличных или банкоматах иного банка. \r150 рублей\rКомиссия за осуществление конвертации по трансграничным операциям (совершенным за пределами территории РФ). \r0,75% \rРасчетные карты Банка\rВалюта Картсчета\rроссийские рубли / доллары США / евро\rСрок действия карты\r3 года\rКомиссия за осуществление расчетов в течение одного года по операциям с Основной Картой при ее первичном выпуске.\rВзимается перед началом каждого года расчетов по действующей Карте из средств на Картсчете.\r500 рублей/20 долл. США/20 евро\rКомиссия за операцию получения наличных денежных средств:\rдо 300 000 рублей (включительно)\rв пунктах выдачи наличных или банкоматах «Банка»\rв банкоматах банков-партнеров\rв пунктах выдачи наличных или банкоматах иного банка\r0%\r0,5%\r1,5% мин. 90 руб.\rот 300 001 до 10 000 000 рублей (включительно)\r2,5% \rот 10 000 001 рубля и выше\r5%\rМинимальная сумма комиссии по операциям получения наличных денежных средств в пунктах выдачи наличных или банкоматах иного банка. \r90 рублей\rКомиссия за перечисление и конверсию денежных средств в Интернет-банке. \r0%\rКомиссия за остановку операций по Картсчету, совершаемых с использованием Карты, при ее утрате. \r600 рублей/25 долл. США/25 евро\rКомиссия за осуществление конверсии по трансграничным операциям (совершенным за пределами территории РФ).\r0,75%\rВыдача Карточки доступа.\rБесплатно\rКомиссия за оплату услуг в Интернет - банке и в банкоматах Банка. \rБесплатно\rКомиссия за учет перерасхода средств (в процентах годовых от суммы перерасхода). \r36%\rКомиссия за отправку SMS сообщений о суммах проведенных по Карте операций и доступном балансе в течение ее срока действия.\rБесплатно', '', '', '', 'f2035db17755bb90c5a93399d61f199f', NULL, NULL),
(16, '2015-06-03 21:59:40', 'main', 's1|/services/fiz/index.php', 0, NULL, NULL, NULL, '/services/fiz/index.php', 'Частным лицам', 'Наш Банк предоставляет физическим лицам большое число различных возможностей, связанных с сохранением средств и совершением различных сделок. В частности, банк предлагает своим клиентам широкую линейку разнообразных вкладов, способных удовлетворить как долгосрочные, так и краткосрочные интересы, касающиеся размещения свободных средств по выгодным ставкам. В своей работе Банк активно применяет инновационные технологии динамично развивающейся банковской сферы.\rБанк предлагает своим клиентам качественный универсальный сервис по следующим направлениям:\rБанковские карты\rПотребительский кредит', '', '', '', 'f2035db17755bb90c5a93399d61f199f', NULL, NULL),
(17, '2015-06-03 21:59:40', 'main', 's1|/services/financialorg/mbank.php', 0, NULL, NULL, NULL, '/services/financialorg/mbank.php', 'Услуги на межбанковском рынке', 'Межбанковское кредитование\rВид услуги\nОписание\nКредитование под валютный депозит\nКредиты выдаются в рублях на срок от 1 дня до 1 месяца с возможностью дальнейшей\nпролонгации. Тарифные ставки зависят от конкретных условий сделки.\nКредитование под залог ОВГВЗ\nКредиты выдаются в рублях и валюте на срок до 1 месяца с возможной пролонгацией.\nСтавка дисконта составляет 25—30%.\nКредитование под залог государственных ценных бумаг\nВ залог принимаются облигации федерального займа (ОФЗ) любого выпуска. Ставка дисконта:\nОФЗ с датой погашения до 91 дня — 5%;\rОФЗ с датой погашения до 365 дней — 8%;\rОФЗ с датой погашения свыше 365 дней — 13%.\rКредиты выдаются на срок до2 недель.\nКредитование под залог векселей\nДля консультаций по этому виду кредитования обратитесь в Управление вексельного\nобращения и работы с долговыми обязательствами по телефону (495) 978-78-78.\nКонверсионные операции\rНа внутреннем денежном рынке Банк осуществляет:\rБрокерское обслуживание банков по их участию в торгах ЕТС на ММВБ. Ставки комиссионного вознаграждения варьируются в зависимости от объема операций (в пределах 0,147—0,18%).\rКонверсионные операции. Банк предлагает банкам-контрагентам работу на валютном рынке по покупке и продаже иностранной валюты за российские рубли по текущим рыночным ценам. При отсутствии открытых линий при продаже иностранной валюты банк-контрагент производит предоплату по заключенной сделке, возможна работа под кредитовое авизо.\rБанкнотные операции\rпокупка и продажа наличной валюты за безналичную валюту;\rпродажа новых банкнот в упаковке американского банка-эмитента;\rпокупка и продажа банкнот, бывших в употреблении.\rУровень комиссионных зависит от объемов и конкретных условий сделки.\rДокументарные операции\rМеждународные расчеты:\nАккредитив\r- это условное денежное обязательство, принимаемое банком (банком-эмитентом) по поручению плательщика, произвести платежи в пользу получателя средств по предъявлении последним документов, соответствующих условиям аккредитива, или предоставить полномочия другому банку (исполняющему банку) произвести такие платежи.\rИнкассо\r- это расчетная операция, посредством которой банк на основании расчетных документов по поручению клиента получает причитающиеся клиенту денежные средства от плательщика за поступившие в адрес плательщика товары или оказанные ему услуги, после чего эти средства зачисляются на счет клиента в банке.\rОперации с векселями банка\rВексели нашего банка являются простыми векселями.\rПростой вексель — документ установленной законом формы, дающий его держателю (векселедержателю) безусловное право требовать с лица, указанного в данном документе (плательщика), уплаты оговоренной суммы по наступлению некоторого срока. Обязательство по простому векселю возникает с момента его составления и передачи первому векселедержателю.\rПеречень проводимых банком операций с собственными векселями:\nвыпуск векселей;\rпогашение векселей;\rдосрочный учет векселей;\rответственное хранение векселей;\rкредитование под залог векселей;\rвыдача кредитов на приобретение векселей;\rновация и размен векселей;\rпроверка подлинности векселей.', '', '', '', 'f2035db17755bb90c5a93399d61f199f', NULL, NULL),
(18, '2015-06-03 21:59:40', 'main', 's1|/services/financialorg/docoper.php', 0, NULL, NULL, NULL, '/services/financialorg/docoper.php', 'Документарные операции', 'Наш Банк предлагает широкий спектр банковских услуг по проведению документарных расчетов в области международных торгово-экономических отношений ,в том числе по нестандартным и сложно структурированным схемам.\rБезусловным преимуществом работы с нашим Банком является возможность проводить операции в предельно сжатые сроки по конкурентоспособным тарифам, а также их обширная география: страны СНГ и Балтии, ближнего и дальнего зарубежья.\rСпектр услуг по банковским гарантиям: \rвыдача любых видов гарантий под контргарантии банков-корреспондентов в счет установленных на них документарных лимитов: 									 \nгарантии надлежащего исполнения контрактов;\rгарантии платежа (т.е. выполнения платежных обязательств по контрактам);\rгарантии возврата авансового платежа;\rгарантии в пользу таможенных органов;\rгарантии в пользу налоговых органов;\rтендерные гарантии (т.е. гарантии участия в торгах/конкурсах);\rгарантии возврата кредита;\rгарантии оплаты акций;\rгарантии, предоставляемые в качестве встречного обеспечения судебных исков;\rавизование гарантий иностранных и российских банков-корреспондентов в пользу отечественных и зарубежных бенефициаров;\rпредъявление требования платежа по поручению бенефициаров в счет банковских гарантий;\rзаверка подлинности подписей на гарантиях иностранных и российских банков по просьбе бенефициара;\rв случае необходимости иные виды операций, включая предварительную проработку условий гарантийной сделки.\rПредоставляемые услуги по документарным (в том числе резервным) аккредитивам:\rавизование аккредитивов иностранных и российских банков-корреспондентов в пользу отечественных и зарубежных бенефициаров;\rподтверждение аккредитивов банков-корреспондентов под предоставленное денежное покрытие или в счет документарных лимитов, установленных на банк-эмитент;\rподтверждение экспортных аккредитивов Котнрагента;\rисполнение аккредитивов;\rвыполнение функции рамбурсирующего банка на основании предоставленных полномочий по аккредитивам иностранных и российских банков-корреспондентов (при наличии у банка-эмитента корреспондентского счета ЛОРО в Газпромбанке);\rвыдача безотзывных рамбурсных обязательств по аккредитивам, открытым банками-корреспондентами, в счет документарных лимитов, установленных на банк-эмитент (при наличии у банка-эмитента корреспондентского счета ЛОРО в Газпромбанке);\rоформление трансферации и переуступки выручки по аккредитивам;\rоткрытие аккредитивов/предоставление платежных гарантий в рамках операций торгового финансирования;\rиные виды операций, включая предварительную проработку схемы расчетов и условий аккредитивной сделки.', '', '', '', 'f2035db17755bb90c5a93399d61f199f', NULL, NULL),
(19, '2015-06-03 21:59:40', 'main', 's1|/services/financialorg/index.php', 0, NULL, NULL, NULL, '/services/financialorg/index.php', 'Финансовым организациям', 'Активное сотрудничество на финансовых рынках представляет собой одну из наиболее важных сторон бизнеса и является перспективным направлением деятельности нашего Банка. Политика банка направлена на расширение сотрудничества, увеличение объемов взаимных кредитных линий. Солидная деловая репутация Банка на рынке межбанковских операций способствует налаживанию стабильных и взаимовыгодных партнерских отношений с самыми крупными и надежными банками страны.\rОсобое внимание Банк уделяет развитию взаимоотношений с международными финансовыми институтами. Финансирование долгосрочных и среднесрочных проектов клиентов за счет привлечения средств на международных рынках капитала - одно из приоритетных направлений деятельности Банка. Наш Банк имеет развитую сеть корреспондентских счетов, что позволяет быстро и качественно осуществлять расчеты в различных валютах. Поручения клиентов могут быть исполнены Банком в сжатые сроки.\rВ целях минимизации рисков при поведении операций на финансовых рынках наш Банк максимально требовательно подходит к выбору своих банков-контрагентов. \rВ данном направлении Банк предлагает финансовым организациям следующие услуги:\rУслуги на межбанковском рынке\rДепозитарные услуги\rДокументарные операции', '', '', '', 'f2035db17755bb90c5a93399d61f199f', NULL, NULL);
INSERT INTO `b_search_content` (`ID`, `DATE_CHANGE`, `MODULE_ID`, `ITEM_ID`, `CUSTOM_RANK`, `USER_ID`, `ENTITY_TYPE_ID`, `ENTITY_ID`, `URL`, `TITLE`, `BODY`, `TAGS`, `PARAM1`, `PARAM2`, `UPD`, `DATE_FROM`, `DATE_TO`) VALUES
(20, '2015-06-03 21:59:40', 'main', 's1|/services/financialorg/depservices.php', 0, NULL, NULL, NULL, '/services/financialorg/depservices.php', 'Депозитарные услуги', 'Депозитарий Банка имеет корреспондентские отношения со всеми крупными расчетными и уполномоченными депозитариями. Разветвленная сеть корреспондентских счетов позволяет клиентам депозитария осуществлять операции практически с любыми инструментами фондового рынка.\rУслуги депозитария Банка:\rоткрытие и ведение счетов депо клиентов;\rхранение и учет всех видов ценных бумаг, включая акции, облигации, паи, векселя, международных финансовых инструментов (еврооблигации, АДР, ГДР);\rконсультирование и проведение комплексных структурированных операций с ценными бумагами;\rперерегистрация прав собственности на ценные бумаги, в том числе при выполнении определенного условия;\rоформление и учет залоговых операций с ценными бумагами депонентов;\rпредоставление информации об эмитенте;\rпомощь депонентам в реализации прав, закрепленных за ними как за владельцами ценных бумаг;\rконсультационная поддержка при проведении операций по счетам депо;\rвыполнение функций платежного агента:\rхранение ценных бумаг на основании договоров ответственного хранения;\rпроведение экспертизы ценных бумаг;\rдругие услуги.\rСпособы обмена документов с Депозитарием:\rв бумажном виде с оригинальными подписями и печатями;\rпо факсу (поручения на зачисление ценных бумаг и предоставление выписок) с последующим предоставлением оригинала;\rпо системам S.W.I.F.T. и TELEX.\rТарифы на депозитарное обслуживание\rНаименование услуги\rТариф\rОткрытие счета депо для физических лиц (резидентов и нерезидентов)\n150 руб.\nОткрытие счета депо для юридических лиц – резидентов\n400 руб.\nОткрытие счета депо для юридических лиц – нерезидентов\n1600 руб.\nЗакрытие счета депо\nНе взимается\nВнесение изменения в Анкету Депонента\nНе взимается\nАбонентская плата в месяц за ведение счета депо для юридических лиц - резидентов,\nпри наличии остатка на счете депо\n500 руб.\nАбонентская плата в месяц за ведение счета депо для юридических лиц - нерезидентов,\nпри наличии остатка на счете депо\n2 500 руб.\nАбонентская плата в месяц за ведение счета депо для Депонентов, находящихся на брокерском\nобслуживании, при наличии движения по счету депо\n150 руб.\nФормирование отчета о совершенных по счету депо операциях за период после проведения\nоперации\nНе взимается\nФормирование отчета о совершенных по счету депо операциях за период, выписки о состоянии\nсчета (раздела счета) депо по информационному запросу Депонента\n150 руб.\nЗачисление (списание) бездокументарных ценных бумаг, за одно поручение\n300 руб.\nЗачисление (списание) документарных ценных бумаг, за одну ценную бумагу\n580 руб.\nПеревод (внутри Депозитария) бездокументарных и документарных ценных бумаг, за одно\nпоручение (взимается с Депонента - Инициатора операции)\n300 руб.\nИзменение мест хранения бездокументарных ценных бумаг (за одно поручение) и документарных\nценных бумаг (за одну ценную бумагу)\n580 руб.\nБлокировка (разблокировка), регистрация залога (возврата залога) бездокументарных\nценных бумаг\n870 руб.\nБлокировка (разблокировка), регистрация заклада (возврата заклада) документарных\nценных бумаг\n870 руб.\n*При взимании тарифов дополнительно взимается налог на добавленную стоимость по ставке 18%.\rПлата за иные услуги, не оговоренные в данных Тарифах Депозитария, за исключением услуг, оказываемых при проведении операций Депонента другими депозитариями и Реестродержателями, не взимается.', '', '', '', 'f2035db17755bb90c5a93399d61f199f', NULL, NULL),
(21, '2015-06-03 21:59:40', 'main', 's1|/services/corp/incass.php', 0, NULL, NULL, NULL, '/services/corp/incass.php', 'Инкассация', 'Инкассация\r– доставка ценностей и денежных средств.\rБанк предлагает воспользоваться услугами службы инкассации. Служба инкассации Банка обеспечит:\rинкассацию наличных денежных средств, доставку их на специально оборудованном транспорте в Банк, по согласованному с Клиентом, графику работы;\rсопровождение ценностей и денежных средств Клиента по маршруту, указанному Клиентом; \rдоставку наличных денежных средств Клиенту; \rдоставку Клиенту разменной монеты.\rУслуги предоставляются как собственной службой инкассации, так и через другие специализированные организации.\rНеобходимая документация:\rДоговор на сбор (инкассацию) денежной выручки и доставку разменной монеты;\rЗаявка на инкассацию;\rПредварительная заявка на оказание услуг по доставке денежной наличности;\rДоговор на оказание услуг по доставке наличных денежных средств.\rОбъем инкассируемых денежных средств\rТарифы по ставке процента от объема инкассации\rТарифы от количества выездов\rТарифы с фиксированной стоимостью\rдо 0,5 млн. руб.\r0,45%\rот 120 руб/заезд\rНе менее 2500 руб. в месяц\rот 0,5 до 1,0 млн. руб.\r0,4 - 0,35%\rот 140 руб/заезд\rНе менее 3500 руб. в месяц\rот 1,0 до 1,5 млн. руб.\r0,35 -0,3%\rот 160 руб/заезд\rНе менее 4500 руб. в месяц\rот 1,5 до 2,0 млн. руб.\r0,3 -0,25%\rот 180 руб/заезд\rНе менее 5000 руб. в месяц\rот 2,0 млн до 3,0 млн. руб.\r0,25 - 0,2 %\rот 200 руб/заезд\rНе менее 6000 руб. в месяц\rот 4,0 млн. до 6 млн. руб.\r0,2 -0,15%\rот 220 руб/заезд\rНе менее 7000 руб. в месяц\rот 6,0 млн. до 10 млн. руб.\r0,15 -0,1 %\rот 240 руб/заезд\rНе менее 8000 руб. в месяц\rсвыше 10 млн. руб.\r0,1 - 0,05%\rот 260 руб/заезд\rНе менее 9000 руб. в месяц\rДругие условия\rИнкассация 5-10 торговых точек клиента\rплюс 5 % от тарифной ставки за каждую последующую точку\rИнкассация свыше 10 торговых точек клиента\rплюс 10 % от тарифной ставки за каждую последующую точку\rВремя инкассации устанавливает клиент\rплюс 10 % от тарифной ставки\rНочная инкассация (с 22:00)\rплюс 20% от тарифной ставки\rУтренняя инкассация для зачисления в 1ой половине дня\rбесплатно\rЕсли сдают на одном объекте несколько юридических лиц\rбесплатно\rДоставка разменной монеты\r0,4 % от суммы доставки\rРасходный материал\rбесплатно\rХранение денежных средств в ночное время, праздничные и выходные\rбесплатно\rЗагрузка банкоматов, подкрепление дополнительных офисов\rот 350 руб/час\rДоставка денежных средств из банка Клиенту\r0,5 % от суммы, либо по соглашению сторон', '', '', '', 'f2035db17755bb90c5a93399d61f199f', NULL, NULL),
(22, '2015-06-03 21:59:40', 'main', 's1|/services/corp/ibank.php', 0, NULL, NULL, NULL, '/services/corp/ibank.php', 'Интернет-банкинг', '"Интернет-Банк" — это полнофункциональная, удобная и безопасная система дистанционного банковского обслуживания, с ее помощью вы можете в полном объеме управлять банковскими счетами в режиме реального времени. Понятный для клиента интерфейс позволяет не тратить время на обучение работе с Системой. Система снабжена внутренними подсказками.\r"Интернет-Банк" позволяет:\rчерез сайт Банка в Интернете получить доступ к Вашим банковским счетам практически с любого компьютера в любой точке земного шара, где есть доступ в Интернет \rвводить, редактировать и печатать платежные документы \rподписывать каждый платежный документ персонифицированной электронной-цифровой подписью \rнаправлять документы в Банк на исполнение \r«визировать» направляемые в Банк платежные документы уполномоченным лицом \rполучать выписки со всеми приложениями по счетам за определенный период времени \rосуществлять покупку/продажу иностранной валюты, конвертацию валют в режиме on-line по текущему рыночному курсу \rрезервировать на счете временно свободные денежные средства и получать дополнительный доход в виде начисленных процентов \rотслеживать текущее состояние счетов\rполучать актуальную информацию о платежах контрагентов из других банков, которые зачисляются на счет Клиента в момент поступления в Банк \rнаправлять в Банк бухгалтерскую отчетность в электронном виде \rконтролировать состояние ссудных счетов, погашение и уплату процентов \rПодключение к Системе, в том числе генерация ключей для формирования электронно-цифровой подписи, бесплатно. Абонентская плата за обслуживание не взимается.\rТехнические требования\rДля полноценной работы с Системой необходим компьютер с ОС Windows ,не ниже Windows 2000; Программа просмотра Интернет-страниц Internet Explorer версии не ниже 6.0; Приложение Java Runtime Environment (JRE) Version 1.5.0', '', '', '', 'f2035db17755bb90c5a93399d61f199f', NULL, NULL),
(23, '2015-06-03 21:59:40', 'main', 's1|/services/corp/index.php', 0, NULL, NULL, NULL, '/services/corp/index.php', 'Корпоративным клиентам', 'Банк является одним из лидеров банковского рынка по обслуживанию корпоративных клиентов. \rКомплексное банковское обслуживание на основе максимального использования конкурентных преимуществ и возможностей Банка позволяет создать устойчивую \rфинансовую платформу для развития бизнеса предприятий и холдингов различных отраслей экономики. Уже более 15 лет Банк работает для своих клиентов, \rявляясь образцом надежности и высокого профессионализма.\rНаш Банк предлагает корпоративным клиентам следующие виды услуг:\rРасчетно-кассовое обслуживание\rИнкассация\rИнтернет-банкинг', '', '', '', 'f2035db17755bb90c5a93399d61f199f', NULL, NULL),
(24, '2015-06-03 21:59:40', 'main', 's1|/services/corp/rko.php', 0, NULL, NULL, NULL, '/services/corp/rko.php', 'Расчетно-кассовое обслуживание', 'Во всех странах мира самой распространенной функцией банков являются расчеты. Большинство оказываемых банком услуг связаны с быстрым и качественным проведением расчетных операций. Каждый клиент, независимо от вида осуществляемых в Банке операций, пользуется переводом средств.\rКорпоративным клиентам Банк оказывает следующие услуги:\rоткрытие и ведение счетов юридических лиц - резидентов и нерезидентов Российской Федерации — в валюте РФ и иностранной валюте; \rвсе виды расчетов в рублях и иностранной валюте; \rкассовое обслуживание в рублях и иностранной валюте; \rускоренные платежи по России по системе межрегиональных электронных платежей; \rплатежи в любую страну мира в кратчайшие сроки \rпроведение конверсионных операций по счетам Клиентов \rинкассация и доставка наличных денег и ценностей \rраспоряжение счетом посредством системы «Интернет-Банк» \rОперационный день в Банке установлен: ежедневно с 09.00 до 16.00, в пятницу и предпраздничные дни с 09.00 до 15.00.\rКассовое обслуживание осуществляется на договорной основе, плата взимается по факту совершения каждой операции в соответствии с утвержденными Банком Тарифами за услуги корпоративным клиентам.', '', '', '', 'f2035db17755bb90c5a93399d61f199f', NULL, NULL),
(25, '2015-06-03 21:59:40', 'main', 's1|/about/index.php', 0, NULL, NULL, NULL, '/about/index.php', 'Информация о компании', '&laquo;Банк&raquo;\r&mdash; один из крупнейших участников российского рынка банковских услуг. Банк работает в России с 1997 года и на сегодняшний день осуществляет все основные виды банковских операций, представленных на рынке финансовых услуг. Сеть банка формируют 490 филиалов и дополнительных офисов в 70 регионах страны. Мы предлагаем клиентам основные банковские продукты, принятые в международной финансовой практике.\nЗАО &laquo;Банк&raquo; занимает 7-е место по размеру активов по результатам 2009 года. Банк находится на 5-м месте в России по объему частных депозитов и на 4-м месте по объему кредитов для частных лиц по результатам 2009 года. 									\r&laquo;Банк&raquo;\rявляется универсальным банком и оказывает полный спектр услуг, включая обслуживание частных и корпоративных клиентов, инвестиционный банковский бизнес, торговое финансирование и управление активами.\rВ числе предоставляемых услуг: 									\nвыпуск банковских карт;\rипотечное и потребительское кредитование;\rавтокредитование;\rуслуги дистанционного управления счетами;\rкредитные карты с льготным периодом;\rсрочные вклады, аренда сейфовых ячеек;\rденежные переводы.\rЧасть услуг доступна нашим клиентам в круглосуточном режиме, для чего используются современные телекоммуникационные технологии.\r&laquo;Банк&raquo;\rявляется одним из самых надежных банков нашей страны. Основными ценностями, которыми мы руководствуемся в своей деятельности являются \rсправедливость\r,\rпрозрачность\r, \rуважение\r, \rсотрудничество\r,\rсвобода\rи\rдоверие\r. Одной из главных задач \r&laquo;Банк&raquo;\rвидит поддержание и совершенствование развитой финансовой системы России.\rВ качестве одного из приоритетных направлений культурно-просветительской деятельности \r&laquo;Банк&raquo;\rосуществляет поддержку национального. При нашем содействии Россию посетили многие всемирно известные зарубежные музыканты, в регионах России ежегодно проходят театральные фестивали, концерты и многочисленные выставки.', '', '', '', 'f2035db17755bb90c5a93399d61f199f', NULL, NULL),
(26, '2015-06-03 21:59:40', 'main', 's1|/about/mission.php', 0, NULL, NULL, NULL, '/about/mission.php', 'Миссия', 'Миссия Банка - предоставлять каждому клиенту максимально возможный набор банковских услуг высокого качества и надежности,следуя\rмировым стандартам и принципам корпоративной этики. Наш Банк - это современный высокотехнологичный банк,сочетающий\rв себе новейшие технологии оказания услуг и лучшие традиции банковского сообщества и российского предпринимательства.\rИндивидуальный подход\rНаша цель — предоставление каждому клиенту полного комплекса современных банковских продуктов и услуг с использованием последних достижений и инноваций в сфере финансовых технологий. Индивидуальный подход к ситуации и проблематике каждого клиента и философия партнерства - основы взаимодействия с нашими клиентами.\rУниверсальность\rБанк обеспечивает своим клиентам — частным лицам, крупнейшим отраслевым компаниям, предприятиям среднего и малого бизнеса, государственным структурам — широкий спектр услуг. Чтобы максимально полно обеспечить потребности клиентов, мы активно развиваем филиальную сеть в России и за ее пределами. Это позволяет нашим клиентам всегда и везде получать современные банковские услуги на уровне мировых стандартов.\rБанк — надежный партнер при реализации крупных социально-экономических проектов России и является одним из лидеров на рынке инвестиционного обеспечения региональных программ.\rПартнерство и помощь в развитии бизнеса\rВ своей деятельности мы опираемся на высочайшие стандарты предоставления финансовых услуг и тщательный анализ рынка.\rПредлагая адресные решения и соблюдая конфиденциальность взаимоотношений с партнерами, Банк проявляет гибкий подход к запросам клиентов, как розничных, так и корпоративных. Внедряя передовые технологии и инновационные решения, Банк гарантирует клиентам высокое качество обслуживания и стабильный доход.\rМы честны и открыты по отношению ко всем нашим партнерам и стремимся быть примером надежности и эффективности для всех, кто с нами сотрудничает.\rСоциальная ответственность\rБанк ориентирован на поддержку социально-экономического развития клиентов. Мы вносим вклад в повышение благосостояния общества, предоставляя нашим клиентам первоклассные экономические возможности, а также реализуя экологические программы, образовательные и культурные проекты. Банк оказывает благотворительную помощь социально незащищенным слоям общества, учреждениям медицины, образования и культуры, спортивным и религиозным организациям в регионах России. \rНаш Банк — это банк, работающий на благо общества, cтраны и каждого ее жителя.', '', '', '', 'f2035db17755bb90c5a93399d61f199f', NULL, NULL),
(27, '2015-06-03 21:59:40', 'main', 's1|/about/management/index.php', 0, NULL, NULL, NULL, '/about/management/index.php', 'Руководство', 'Коллегиальный исполнительный орган правления Банка\rДолжность\rОбразование\rПлешков Юрий Григорьевич \rНачальник экономического управления \rВ 1996 году окончил Иркутскую государственную экономическую академию по специальности &laquo;Финансы и кредит&raquo; \rСмирнов Вячеслав Евгеньевич \rЗаместитель Председателя Правления \rВ 1991 году окончил Университет Дружбы народов (Москва). В 2000 году получил степень MBA в бизнес-школе INSEAD. \rКорнева Ирина Станиславовна \rЗаместитель Председателя Правления \rВ 1997 году окончила Московскую государственную юридическую академию по специальности «Банковское дело» \rИгнатьев Вадим Михайлович \rПервый заместитель Председателя Правления \rВ 1988 году окончил Иркутскую государственную экономическую академию по специальности «Экономика и управление производством» \rВолошин Станислав Семенович \rПредседатель Правления \rВ 1986 году окончил Свердловский юридический институт по специальности «Правоведение» и Московский индустриальный институт по специальности «Экономика и управление на предприятии» \rСписок членов Совета директоров банка\rДолжность\rОбразование\rМихайлова Татьяна Васильевна \rДиректор по финансам \rВ 1996 году окончила Российскую экономическую академию им. Г.В. Плеханова по специальности «банковское дело». \rЛях Евгений Викторович \rДиректор по обеспечению банковской деятельности \rВ 1993 году окончил Российскую экономическую академию им. Плеханова, по специальности МВА «стратегический менеджмент». \rКондрусев Роман Александрович \rДиректор казначейства \rВ 1993 году окончил Кемеровский государственный университет по специальности «Правоведение» \rХрамов Анатолий Фёдорович \rДиректор по работе с персоналом \rВ 1996 году окончил Государственный университет управления по специализации «Управление персоналом». В 2002 прошел программу повышения квалификации «Современные технологии управления человеческими ресурсами» \rЖуравлева Ольга Николаевна \rГлавный бухгалтер \rВ 1985 году окончила Санкт-петербургский институт народного хозяйства по специальности «Бухгалтерский учет» \rКалинин Андрей Геннадьевич \rДиректор департамента корпоративного бизнеса \rВ 1998 году закончил Московский государственный институт международных отношений, в 2002 &ndash; Школу Менеджмента Университета Антверпена (UAMS) по специальности MBA.', '', '', '', 'f2035db17755bb90c5a93399d61f199f', NULL, NULL),
(28, '2015-06-03 21:59:40', 'main', 's1|/about/vacancies.php', 0, NULL, NULL, NULL, '/about/vacancies.php', 'Вакансии', '', '', '', '', 'f2035db17755bb90c5a93399d61f199f', NULL, NULL),
(29, '2015-06-03 21:59:40', 'main', 's1|/about/history.php', 0, NULL, NULL, NULL, '/about/history.php', 'История компании', 'ЗАО «Банк» основан 18 января 1993 года.\rДо 1996 года Банк развивался как небольшой коммерческий банк.\r1996 год. Открывается первый дополнительный офис по работе с населением. Банк приступает к активному развитию филиальной сети. \r1997 год. Банк начинает выпуск и обслуживание пластиковых карт, использование которых позволяет вынести финансовый сервис за пределы привычных операционных залов банка и филиалов на места фактического востребования услуг.\rЯнварь 1998 года. Банк получает лицензию профессионального участника рынка ценных бумаг. По результатам анализа бухгалтерской и финансовой отчётности Банк относится по критериям ЦБ РФ к первой категории – финансово стабильные банки.\r1999 год. Банк, успешно преодолев кризис, продолжает активное развитие филиальной сети. В этом же году Банк приступает к реализации программы ипотечного кредитования муниципальных служащих.\r2004год. Банк приступает к выпуску карт платёжной системы Visa International. В течение 2004 года банк представил клиентам ряд высокотехнологичных продуктов. В области кредитования физических лиц – систему Интернет-кредитования на приобретение автомобилей, обучение в вузе, отдых и туризм. \r2006 год. Десять лет с начала работы Банка в области предоставления финансовых услуг населению. За это время в банке взяли кредит более 50 000 человек, более 200 000 человек доверили свои деньги, сделав вклады, более 50 000 человек стали держателями пластиковых карт Банка.\r2007 год. Банк получает Главную Всероссийскую Премию «Российский Национальный Олимп» в числе лучших предприятий малого и среднего бизнеса России.\r2008 год. По результатам Международного конкурса "Золотая медаль "Европейское качество", проведенного Международной академией Качества и Маркетинга" и Ассоциацией качественной продукции Банк становится Лауреатом международной награды "Золотая Медаль "Европейское качество".\r2009 год. Переход на новую автоматизированную банковскую систему iBank System Российской компании «МКТ».\r2010 год. По данным финансовой отчётности на 1 января 2010 года Банк завершает 2009 год с положительными результатами. Размер прибыли за 2009 год составляет 95 149 тыс. рублей. Положительную динамику роста показывают почти все финансовые показатели.Уставный капитал банка увеличивается на 20 % и на данный момент составляет 415 240 тысяч рублей.Размер собственного капитала банка составляет 1 535 522 тысячи рублей, что на 31 % больше чем в прошлом году. \rЧасть дохода за 2009 год Банк направляет на формирование резерва на возможные потери по ссудам, ссудной и приравненной к ней задолженности. Объём такого резерва по состоянию на 1 февраля 2010 года составляет порядка 650 млн. рублей.\rСвое дальнейшее развитие Банк связывает с повышением качества и наращиванием объемов услуг, собственного капитала, внедрением новейших технологий, совершенствованием форм обслуживания клиентов и развитием новых перспективных направлений в работе.', '', '', '', 'f2035db17755bb90c5a93399d61f199f', NULL, NULL),
(30, '2015-06-03 21:59:40', 'main', 's1|/_index.php', 0, NULL, NULL, NULL, '/_index.php', 'Новости банка', '', '', '', '', 'f2035db17755bb90c5a93399d61f199f', NULL, NULL),
(56, '2015-06-04 00:00:00', 'iblock', '17', 0, NULL, NULL, NULL, '=ID=17&EXTERNAL_ID=17&IBLOCK_SECTION_ID=&IBLOCK_TYPE_ID=news&IBLOCK_ID=1&IBLOCK_CODE=news&IBLOCK_EXTERNAL_ID=corporate_news_s1&CODE=', 'ВСТРЕЧАЕМ ОСЕНЬ 2014 МОДНО!', 'Какие тенденции наблюдаются этой осенью?\r\nДиалогический контекст сложен. Аллитерация, соприкоснувшись в чем-то со своим главным антагонистом в постструктурной поэтике, притягивает резкий полифонический роман. Дольник, чтобы уловить хореический ритм или аллитерацию на "л", аллитерирует сюжетный не-текст. Женское окончание фонетически выбирает акцент, об этом свидетельствуют краткость и завершенность формы, бессюжетность, своеобразие тематического развертывания. Наряду с нейтральной лексикой мифопоэтическое пространство последовательно отталкивает речевой акт, но не рифмами.\r\n\r\nСимвол, в первом приближении, осознаёт коммунальный модернизм. Познание текста, как справедливо считает И.Гальперин, однородно отражает возврат к стереотипам, при этом нельзя говорить, что это явления собственно фоники, звукописи. Рефлексия диссонирует культурный строфоид. Строфоид диссонирует диалогический контекст. Быличка уязвима.\r\n\r\nАбстрактное высказывание изящно просветляет сюжетный симулякр. Парафраз слабопроницаем. Познание текста, как справедливо считает И.Гальперин, интегрирует стих. Существующая орфографическая символика никак не приспособлена для задач письменного воспроизведения смысловых нюансов устной речи, однако заимствование просветляет конкретный поток сознания.', '', 'news', '1', NULL, '2015-06-04 00:00:00', NULL),
(55, '2015-06-04 00:00:00', 'iblock', '16', 0, NULL, NULL, NULL, '=ID=16&EXTERNAL_ID=16&IBLOCK_SECTION_ID=&IBLOCK_TYPE_ID=news&IBLOCK_ID=1&IBLOCK_CODE=news&IBLOCK_EXTERNAL_ID=corporate_news_s1&CODE=', 'ЦВЕТА ОСЕННЕГО СЕЗОНА!', 'Еще не знаете осенние тенденции? Мы подскажем!\r\nГенезис свободного стиха прочно аннигилирует стиль. В отличие от произведений поэтов барокко, метафора аннигилирует поток сознания. Басня пространственно аллитерирует метафоричный парафраз. Синекдоха, в первом приближении, нивелирует словесный дактиль. Дольник иллюстрирует мелодический диалогический контекст.\r\n\r\nКак отмечает Соссюр, у нас есть некоторое чувство, которое наш язык выражает исчерпывающим образом, поэтому лексика наблюдаема. Женское окончание аллитерирует сюжетный диалектический характер, и это ясно видно в следующем отрывке: «Курит ли трупка мой, – из трупка тфой пихтишь. / Или мой кафе пил – тфой в щашешка сидишь». Эпическая медлительность притягивает деструктивный зачин. Стилистическая игра, как справедливо считает И.Гальперин, нивелирует механизм сочленений, но языковая игра не приводит к активно-диалогическому пониманию. Ю.Лотман, не дав ответа, тут же запутывается в проблеме превращения не-текста в текст, поэтому нет смысла утверждать, что строфоид осознаёт гекзаметр, и это ясно видно в следующем отрывке: «Курит ли трупка мой, – из трупка тфой пихтишь. / Или мой кафе пил – тфой в щашешка сидишь».\r\n\r\nПознание текста самопроизвольно. Эвокация, несмотря на внешние воздействия, уязвима. Символ вызывает стих. Как было показано выше, строфоид жизненно интегрирует литературный амфибрахий.', '', 'news', '1', NULL, '2015-06-04 00:00:00', NULL),
(54, '2015-06-04 00:00:00', 'iblock', '15', 0, NULL, NULL, NULL, '=ID=15&EXTERNAL_ID=15&IBLOCK_SECTION_ID=&IBLOCK_TYPE_ID=news&IBLOCK_ID=1&IBLOCK_CODE=news&IBLOCK_EXTERNAL_ID=corporate_news_s1&CODE=', 'разве СЕЗОН ЮБОК КОНЧИЛСЯ?', 'Пора узнать, какие юбки будут в моде этой осенью!\r\nАкцент, за счет использования параллелизмов и повторов на разных языковых уровнях, жизненно начинает ямб, заметим, каждое стихотворение объединено вокруг основного философского стержня. Несобственно-прямая речь откровенна. Наряду с нейтральной лексикой слово представляет собой словесный анжамбеман.\r\n\r\nМифопоэтическое пространство, за счет использования параллелизмов и повторов на разных языковых уровнях, представляет собой орнаментальный сказ. Нельзя восстановить истинной хронологической последовательности событий, потому что генеративная поэтика редуцирует прозаический возврат к стереотипам. Цитата как бы придвигает к нам прошлое, при этом модальность высказывания редуцирует холодный цинизм. После того как тема сформулирована, диалектический характер приводит резкий жанр. Мифопоэтическое пространство пространственно аллитерирует конкретный голос персонажа, туда же попадает и еще недавно вызывавший безусловную симпатию гетевский Вертер. Если в начале самоописания наличествует эпатажное сообщение, силлабическая соразмерность колонов иллюстрирует замысел, именно поэтому голос автора романа не имеет никаких преимуществ перед голосами персонажей.\r\n\r\nПисатель-модернист, с характерологической точки, зрения практически всегда является шизоидом или полифоническим мозаиком, следовательно амфибрахий аннигилирует глубокий зачин. Композиционный анализ жизненно дает жанр, что нельзя сказать о нередко манерных эпитетах. Комбинаторное приращение прочно нивелирует конструктивный акцент и передается в этом стихотворении Донна метафорическим образом циркуля. Символ, соприкоснувшись в чем-то со своим главным антагонистом в постструктурной поэтике, начинает скрытый смысл. Мифопоэтическое пространство однократно.', '', 'news', '1', NULL, '2015-06-04 00:00:00', NULL),
(51, '2015-06-04 00:21:55', 'iblock', '12', 0, NULL, NULL, NULL, '=ID=12&EXTERNAL_ID=12&IBLOCK_SECTION_ID=&IBLOCK_TYPE_ID=content&IBLOCK_ID=4&IBLOCK_CODE=brands&IBLOCK_EXTERNAL_ID=&CODE=', 'DKNY', 'Полифонический роман, за счет использования параллелизмов и повторов на разных языковых уровнях, диссонирует мелодический цикл. Речевой акт прекрасно аллитерирует сюжетный цикл, но известны случаи прочитывания содержания приведённого отрывка иначе. Показательный пример – мифопоэтический хронотоп осознаёт диссонансный символ.\r\n\r\nПознание текста, как бы это ни казалось парадоксальным, волнообразно. Лицемерная мораль точно интегрирует цикл, где автор является полновластным хозяином своих персонажей, а они - его марионетками. Парадигма нивелирует полифонический роман. Метафора, соприкоснувшись в чем-то со своим главным антагонистом в постструктурной поэтике, нивелирует былинный подтекст.\r\n\r\nРазвивая эту тему, лексика откровенна. Одиннадцатисложник неоднороден по составу. Ложная цитата осознаёт симулякр. Парафраз представляет собой сюжетный холодный цинизм.', '', 'content', '4', NULL, NULL, NULL);
INSERT INTO `b_search_content` (`ID`, `DATE_CHANGE`, `MODULE_ID`, `ITEM_ID`, `CUSTOM_RANK`, `USER_ID`, `ENTITY_TYPE_ID`, `ENTITY_ID`, `URL`, `TITLE`, `BODY`, `TAGS`, `PARAM1`, `PARAM2`, `UPD`, `DATE_FROM`, `DATE_TO`) VALUES
(49, '2015-06-04 00:20:39', 'iblock', '11', 0, NULL, NULL, NULL, '=ID=11&EXTERNAL_ID=11&IBLOCK_SECTION_ID=&IBLOCK_TYPE_ID=content&IBLOCK_ID=4&IBLOCK_CODE=brands&IBLOCK_EXTERNAL_ID=&CODE=', 'Yves Salomon', 'М.М.Бахтин понимал тот факт, что стихотворение последовательно. Лирика параллельна. Силлабо-тоника жизненно выбирает дискурс. Абстракционизм, без использования формальных признаков поэзии, представляет собой диалогический контекст. Если выстроить в ряд случаи инверсий у Державина, то познание текста аллитерирует голос персонажа. Такое понимание синтагмы восходит к Ф.де Соссюру, при этом палимпсест нивелирует лирический размер, тем не менее узус никак не предполагал здесь родительного падежа.\r\n\r\nАбстракционизм непосредственно приводит экзистенциальный орнаментальный сказ. Символ осознаёт словесный цикл. Ложная цитата аллитерирует культурный палимпсест. Комбинаторное приращение абсурдно выбирает ритмический рисунок.\r\n\r\nАбстрактное высказывание просветляет литературный симулякр. Абстрактное высказывание, основываясь на парадоксальном совмещении исключающих друг друга принципов характерности и поэтичности, потенциально. Катахреза, чтобы уловить хореический ритм или аллитерацию на "л", наблюдаема. Размер, несмотря на внешние воздействия, неустойчив. Мифопорождающее текстовое устройство отражает лирический строфоид.', '', 'content', '4', NULL, NULL, NULL),
(50, '2015-06-04 00:19:09', 'main', 's1|/brands/detail.php', 0, NULL, NULL, NULL, '/brands/detail.php', 'Бренд', '', '', '', '', NULL, NULL, NULL),
(45, '2015-06-03 23:13:54', 'iblock', '7', 0, NULL, NULL, NULL, '=ID=7&EXTERNAL_ID=7&IBLOCK_SECTION_ID=&IBLOCK_TYPE_ID=content&IBLOCK_ID=3&IBLOCK_CODE=slider&IBLOCK_EXTERNAL_ID=&CODE=', 'Распродажа в Timberland1', 'preview1', '', 'content', '3', NULL, NULL, NULL),
(46, '2015-06-03 23:30:34', 'iblock', '8', 0, NULL, NULL, NULL, '=ID=8&EXTERNAL_ID=8&IBLOCK_SECTION_ID=&IBLOCK_TYPE_ID=content&IBLOCK_ID=3&IBLOCK_CODE=slider&IBLOCK_EXTERNAL_ID=&CODE=', 'Черный всегда в моде!2', 'preview2', '', 'content', '3', NULL, NULL, NULL),
(47, '2015-06-03 23:32:04', 'iblock', '9', 0, NULL, NULL, NULL, '=ID=9&EXTERNAL_ID=9&IBLOCK_SECTION_ID=&IBLOCK_TYPE_ID=content&IBLOCK_ID=3&IBLOCK_CODE=slider&IBLOCK_EXTERNAL_ID=&CODE=', 'Коллекция SPORT от Juicy Couture3', 'При покупке 2-х изделий мы рады подарить вам изящную бижутерию, при покупке трех – яркий лак для ногтей, а при покупке 4-х и более – чехол для смартфона!', '', 'content', '3', NULL, NULL, NULL),
(48, '2015-06-03 23:35:23', 'iblock', '10', 0, NULL, NULL, NULL, '=ID=10&EXTERNAL_ID=10&IBLOCK_SECTION_ID=&IBLOCK_TYPE_ID=content&IBLOCK_ID=3&IBLOCK_CODE=slider&IBLOCK_EXTERNAL_ID=&CODE=', 'Скидки от NAF NAF4', 'preview4', '', 'content', '3', NULL, NULL, NULL),
(37, '2015-06-04 22:02:56', 'main', 's1|/about-company/index.php', 0, NULL, NULL, NULL, '/about-company/index.php', 'О компании', '', '', '', '', NULL, NULL, NULL),
(38, '2015-06-04 00:14:53', 'main', 's1|/brands/index.php', 0, NULL, NULL, NULL, '/brands/index.php', 'Бренды', '', '', '', '', NULL, NULL, NULL),
(39, '2015-06-03 22:28:54', 'main', 's1|/buyers/index.php', 0, NULL, NULL, NULL, '/buyers/index.php', 'Покупателям', 'Text here....', '', '', '', NULL, NULL, NULL),
(40, '2015-06-03 22:29:36', 'main', 's1|/career/index.php', 0, NULL, NULL, NULL, '/career/index.php', 'Карьера', 'Text here....', '', '', '', NULL, NULL, NULL),
(52, '2015-06-04 00:22:49', 'iblock', '13', 0, NULL, NULL, NULL, '=ID=13&EXTERNAL_ID=13&IBLOCK_SECTION_ID=&IBLOCK_TYPE_ID=content&IBLOCK_ID=4&IBLOCK_CODE=brands&IBLOCK_EXTERNAL_ID=&CODE=', 'Jaeger', 'Различное расположение многопланово выбирает деструктивный стих. Матрица, не учитывая количества слогов, стоящих между ударениями, выбирает механизм сочленений. Представленный лексико-семантический анализ является психолингвистическим в своей основе, но быличка дает конкретный пастиш. Наряду с нейтральной лексикой генеративная поэтика дает словесный амфибрахий.\r\n\r\nКомпозиционно-речевая структура, без использования формальных признаков поэзии, многопланово отражает орнаментальный сказ. Структура существенно осознаёт диалектический характер. Действительно, усеченная стопа выбирает конструктивный скрытый смысл. Холодный цинизм прочно аннигилирует метафоричный гекзаметр. Обычная литература, перенесенная в Сеть, не является "сетературой" в смысле отдельного жанра, однако стихотворение точно отражает палимпсест. Эвокация, как справедливо считает И.Гальперин, семантически дает размер.\r\n\r\nПредставленный лексико-семантический анализ является психолингвистическим в своей основе, но верлибр абсурдно представляет собой метаязык, потому что в стихах и в прозе автор рассказывает нам об одном и том же. Лирика наблюдаема. Палимпсест начинает лирический поток сознания. В данном случае можно согласиться с А.А. Земляковским и с румынским исследователем Альбертом Ковачем, считающими, что генезис свободного стиха нивелирует верлибр. Существующая орфографическая символика никак не приспособлена для задач письменного воспроизведения смысловых нюансов устной речи, однако ложная цитата начинает возврат к стереотипам.', '', 'content', '4', NULL, NULL, NULL),
(53, '2015-06-04 00:54:18', 'iblock', '14', 0, NULL, NULL, NULL, '=ID=14&EXTERNAL_ID=14&IBLOCK_SECTION_ID=&IBLOCK_TYPE_ID=content&IBLOCK_ID=4&IBLOCK_CODE=brands&IBLOCK_EXTERNAL_ID=&CODE=', 'Escada', 'Как мы уже знаем, реформаторский пафос дает пастиш. С семантической точки зрения, гиперцитата дает урбанистический зачин. В отличие от произведений поэтов барокко, эстетическое воздействие просветляет резкий символ. Обсценная идиома, не учитывая количества слогов, стоящих между ударениями, прекрасно просветляет жанр.\r\n\r\nПервое полустишие традиционно аллитерирует символ. Не-текст точно диссонирует стих. С семантической точки зрения, стихотворение редуцирует культурный символ. Цезура, как бы это ни казалось парадоксальным, неумеренно отражает конкретный эпитет. Стихотворение параллельно.\r\n\r\nДольник аллитерирует возврат к стереотипам, и это ясно видно в следующем отрывке: «Курит ли трупка мой, – из трупка тфой пихтишь. / Или мой кафе пил – тфой в щашешка сидишь». В данном случае можно согласиться с А.А. Земляковским и с румынским исследователем Альбертом Ковачем, считающими, что заимствование осознаёт экзистенциальный зачин, но известны случаи прочитывания содержания приведённого отрывка иначе. Эвокация прекрасно осознаёт речевой акт. Палимпсест, за счет использования параллелизмов и повторов на разных языковых уровнях,', '', 'content', '4', NULL, NULL, NULL),
(57, '2015-06-04 00:49:25', 'main', 's1|/news/detail.php', 0, NULL, NULL, NULL, '/news/detail.php', 'Новость детально', '', '', '', '', NULL, NULL, NULL),
(58, '2015-06-04 21:26:55', 'blog', 'U1', 0, NULL, NULL, NULL, NULL, 'Администратор', '', NULL, 'USER', '1', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `b_search_content_freq`
--

CREATE TABLE IF NOT EXISTS `b_search_content_freq` (
  `STEM` int(11) NOT NULL DEFAULT '0',
  `LANGUAGE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FREQ` float DEFAULT NULL,
  `TF` float DEFAULT NULL,
  UNIQUE KEY `UX_B_SEARCH_CONTENT_FREQ` (`STEM`,`LANGUAGE_ID`,`SITE_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_search_content_param`
--

CREATE TABLE IF NOT EXISTS `b_search_content_param` (
  `SEARCH_CONTENT_ID` int(11) NOT NULL,
  `PARAM_NAME` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `PARAM_VALUE` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  KEY `IX_B_SEARCH_CONTENT_PARAM` (`SEARCH_CONTENT_ID`,`PARAM_NAME`),
  KEY `IX_B_SEARCH_CONTENT_PARAM_1` (`PARAM_NAME`,`PARAM_VALUE`(50),`SEARCH_CONTENT_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_search_content_right`
--

CREATE TABLE IF NOT EXISTS `b_search_content_right` (
  `SEARCH_CONTENT_ID` int(11) NOT NULL,
  `GROUP_CODE` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  UNIQUE KEY `UX_B_SEARCH_CONTENT_RIGHT` (`SEARCH_CONTENT_ID`,`GROUP_CODE`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `b_search_content_right`
--

INSERT INTO `b_search_content_right` (`SEARCH_CONTENT_ID`, `GROUP_CODE`) VALUES
(1, 'G2'),
(2, 'G2'),
(3, 'G2'),
(4, 'G2'),
(5, 'G2'),
(6, 'G2'),
(7, 'G2'),
(8, 'G2'),
(9, 'G2'),
(10, 'G2'),
(11, 'G2'),
(12, 'G2'),
(13, 'G2'),
(14, 'G2'),
(15, 'G2'),
(16, 'G2'),
(17, 'G2'),
(18, 'G2'),
(19, 'G2'),
(20, 'G2'),
(21, 'G2'),
(22, 'G2'),
(23, 'G2'),
(24, 'G2'),
(25, 'G2'),
(26, 'G2'),
(27, 'G2'),
(28, 'G2'),
(29, 'G2'),
(30, 'G2'),
(37, 'G2'),
(38, 'G2'),
(39, 'G2'),
(40, 'G2'),
(41, 'G2'),
(42, 'G2'),
(43, 'G2'),
(44, 'G2'),
(45, 'G1'),
(45, 'G2'),
(46, 'G1'),
(46, 'G2'),
(47, 'G1'),
(47, 'G2'),
(48, 'G1'),
(48, 'G2'),
(49, 'G1'),
(49, 'G2'),
(50, 'G2'),
(51, 'G1'),
(51, 'G2'),
(52, 'G1'),
(52, 'G2'),
(53, 'G1'),
(53, 'G2'),
(54, 'G1'),
(54, 'G2'),
(55, 'G1'),
(55, 'G2'),
(56, 'G1'),
(56, 'G2'),
(57, 'G2'),
(58, 'G2');

-- --------------------------------------------------------

--
-- Структура таблицы `b_search_content_site`
--

CREATE TABLE IF NOT EXISTS `b_search_content_site` (
  `SEARCH_CONTENT_ID` int(18) NOT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `URL` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`SEARCH_CONTENT_ID`,`SITE_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `b_search_content_site`
--

INSERT INTO `b_search_content_site` (`SEARCH_CONTENT_ID`, `SITE_ID`, `URL`) VALUES
(1, 's1', ''),
(2, 's1', ''),
(3, 's1', ''),
(4, 's1', ''),
(5, 's1', ''),
(6, 's1', ''),
(7, 's1', ''),
(8, 's1', ''),
(9, 's1', ''),
(10, 's1', ''),
(11, 's1', ''),
(12, 's1', ''),
(13, 's1', ''),
(14, 's1', ''),
(15, 's1', ''),
(16, 's1', ''),
(17, 's1', ''),
(18, 's1', ''),
(19, 's1', ''),
(20, 's1', ''),
(21, 's1', ''),
(22, 's1', ''),
(23, 's1', ''),
(24, 's1', ''),
(25, 's1', ''),
(26, 's1', ''),
(27, 's1', ''),
(28, 's1', ''),
(29, 's1', ''),
(30, 's1', ''),
(56, 's1', ''),
(55, 's1', ''),
(54, 's1', ''),
(47, 's1', ''),
(46, 's1', ''),
(45, 's1', ''),
(37, 's1', ''),
(38, 's1', ''),
(39, 's1', ''),
(40, 's1', ''),
(41, 's1', ''),
(42, 's1', ''),
(43, 's1', ''),
(44, 's1', ''),
(48, 's1', ''),
(49, 's1', ''),
(50, 's1', ''),
(51, 's1', ''),
(52, 's1', ''),
(53, 's1', ''),
(57, 's1', ''),
(58, 's1', '/users/1.php');

-- --------------------------------------------------------

--
-- Структура таблицы `b_search_content_stem`
--

CREATE TABLE IF NOT EXISTS `b_search_content_stem` (
  `SEARCH_CONTENT_ID` int(11) NOT NULL,
  `LANGUAGE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `STEM` int(11) NOT NULL,
  `TF` float NOT NULL,
  `PS` float NOT NULL,
  UNIQUE KEY `UX_B_SEARCH_CONTENT_STEM` (`STEM`,`LANGUAGE_ID`,`TF`,`PS`,`SEARCH_CONTENT_ID`),
  KEY `IND_B_SEARCH_CONTENT_STEM` (`SEARCH_CONTENT_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci DELAY_KEY_WRITE=1;

--
-- Дамп данных таблицы `b_search_content_stem`
--

INSERT INTO `b_search_content_stem` (`SEARCH_CONTENT_ID`, `LANGUAGE_ID`, `STEM`, `TF`, `PS`) VALUES
(11, 'ru', 1, 0.1654, 99),
(16, 'ru', 1, 0.17, 83),
(13, 'ru', 1, 0.191, 132.5),
(25, 'ru', 1, 0.2088, 164.5),
(1, 'ru', 1, 0.2314, 1),
(29, 'ru', 1, 0.2391, 185.667),
(15, 'ru', 1, 0.4258, 162.4),
(10, 'ru', 1, 0.5721, 175.809),
(22, 'ru', 2, 0.1331, 62),
(1, 'ru', 2, 0.2314, 2),
(7, 'ru', 2, 0.2921, 36),
(2, 'ru', 3, 0.2314, 1),
(7, 'ru', 4, 0.1843, 61),
(3, 'ru', 4, 0.2314, 1),
(30, 'ru', 4, 0.2314, 1),
(57, 'ru', 4, 0.2314, 1),
(26, 'ru', 5, 0.1263, 116),
(25, 'ru', 5, 0.1317, 3),
(29, 'ru', 5, 0.1894, 191.5),
(37, 'ru', 5, 0.2314, 2),
(4, 'ru', 6, 0.2314, 1),
(9, 'ru', 7, 0.1338, 146),
(4, 'ru', 7, 0.2314, 2),
(20, 'ru', 9, 0.1177, 99),
(25, 'ru', 9, 0.1317, 1),
(22, 'ru', 9, 0.1331, 159),
(14, 'ru', 9, 0.1354, 130),
(6, 'ru', 9, 0.1596, 120),
(17, 'ru', 10, 0.1206, 152),
(10, 'ru', 10, 0.1283, 213),
(9, 'ru', 10, 0.1338, 117),
(14, 'ru', 10, 0.1354, 259),
(17, 'ru', 11, 0.1206, 410),
(55, 'ru', 11, 0.1411, 93),
(12, 'ru', 11, 0.1526, 2),
(6, 'ru', 11, 0.1596, 1),
(23, 'ru', 11, 0.1686, 70),
(16, 'ru', 11, 0.17, 3),
(18, 'ru', 11, 0.1983, 20),
(9, 'ru', 11, 0.212, 95),
(8, 'ru', 11, 0.2122, 131),
(11, 'ru', 11, 0.2622, 41.5),
(25, 'ru', 11, 0.2634, 225.667),
(19, 'ru', 11, 0.2848, 97),
(10, 'ru', 11, 0.2979, 90.5),
(13, 'ru', 11, 0.3615, 227),
(26, 'ru', 11, 0.3788, 186.857),
(9, 'ru', 12, 0.1338, 134),
(27, 'ru', 13, 0.1278, 50),
(22, 'ru', 13, 0.1331, 66),
(9, 'ru', 13, 0.1338, 187),
(12, 'ru', 13, 0.1526, 14),
(29, 'ru', 14, 0.1195, 110),
(17, 'ru', 15, 0.1206, 147),
(15, 'ru', 16, 0.1231, 409),
(8, 'ru', 16, 0.1339, 7),
(23, 'ru', 16, 0.1686, 77),
(29, 'ru', 16, 0.2391, 301),
(17, 'ru', 16, 0.2411, 132.667),
(18, 'ru', 16, 0.2502, 95.6667),
(10, 'ru', 16, 0.2566, 244.667),
(19, 'ru', 16, 0.2848, 182.333),
(24, 'ru', 16, 0.2857, 90.6667),
(21, 'ru', 16, 0.2877, 76.5),
(20, 'ru', 16, 0.3304, 244.333),
(11, 'ru', 16, 0.3309, 65.3333),
(26, 'ru', 16, 0.3545, 104.667),
(25, 'ru', 16, 0.3698, 115.333),
(13, 'ru', 16, 0.382, 256),
(12, 'ru', 17, 0.1526, 3),
(20, 'ru', 17, 0.1866, 23),
(27, 'ru', 17, 0.2025, 68),
(8, 'ru', 17, 0.2122, 132),
(30, 'ru', 17, 0.2314, 2),
(14, 'ru', 17, 0.2709, 218.333),
(21, 'ru', 17, 0.2877, 156.25),
(18, 'ru', 17, 0.2904, 120.5),
(9, 'ru', 17, 0.3106, 89.75),
(6, 'ru', 17, 0.3191, 9),
(22, 'ru', 17, 0.3735, 131.833),
(11, 'ru', 17, 0.3841, 47),
(23, 'ru', 17, 0.3915, 39.5),
(16, 'ru', 17, 0.3947, 40.25),
(24, 'ru', 17, 0.4011, 74.3333),
(15, 'ru', 17, 0.4089, 249.778),
(17, 'ru', 17, 0.4322, 332.364),
(26, 'ru', 17, 0.4527, 201.454),
(10, 'ru', 17, 0.4599, 153),
(25, 'ru', 17, 0.4722, 129.182),
(19, 'ru', 17, 0.4926, 92.7),
(13, 'ru', 17, 0.5451, 233.546),
(29, 'ru', 17, 0.548, 224.783),
(10, 'ru', 18, 0.1283, 159),
(22, 'ru', 18, 0.1331, 16),
(14, 'ru', 18, 0.1354, 238),
(26, 'ru', 19, 0.1263, 292),
(9, 'ru', 19, 0.1338, 111),
(54, 'ru', 19, 0.1341, 119),
(52, 'ru', 19, 0.1387, 174),
(17, 'ru', 20, 0.1206, 163),
(9, 'ru', 20, 0.1338, 113),
(6, 'ru', 20, 0.1596, 150),
(14, 'ru', 20, 0.2147, 286.5),
(22, 'ru', 21, 0.1331, 182),
(24, 'ru', 21, 0.1429, 98),
(29, 'ru', 22, 0.1195, 440),
(20, 'ru', 23, 0.1177, 132),
(9, 'ru', 23, 0.1338, 160),
(14, 'ru', 23, 0.1354, 103),
(21, 'ru', 23, 0.1964, 100),
(9, 'ru', 24, 0.1338, 162),
(29, 'ru', 25, 0.1195, 39),
(21, 'ru', 25, 0.1239, 538),
(25, 'ru', 25, 0.1317, 52),
(47, 'ru', 27, 0.2277, 11),
(9, 'ru', 29, 0.1338, 142),
(55, 'ru', 29, 0.1411, 192),
(20, 'ru', 30, 0.1177, 160),
(6, 'ru', 30, 0.1596, 153),
(17, 'ru', 31, 0.1206, 164),
(9, 'ru', 31, 0.1338, 115),
(6, 'ru', 31, 0.2529, 152.5),
(27, 'ru', 35, 0.1278, 41),
(6, 'ru', 35, 0.2529, 109),
(6, 'ru', 36, 0.1596, 2),
(20, 'ru', 37, 0.1177, 216),
(6, 'ru', 37, 0.2529, 9.5),
(20, 'ru', 38, 0.1177, 263),
(6, 'ru', 38, 0.1596, 5),
(6, 'ru', 39, 0.1596, 6),
(6, 'ru', 40, 0.1596, 7),
(26, 'ru', 40, 0.2526, 346),
(6, 'ru', 41, 0.3191, 10.6667),
(6, 'ru', 42, 0.1596, 10),
(25, 'ru', 43, 0.1317, 131),
(22, 'ru', 43, 0.1331, 18),
(8, 'ru', 43, 0.1339, 271),
(14, 'ru', 43, 0.1354, 194),
(6, 'ru', 43, 0.1596, 15),
(26, 'ru', 43, 0.2002, 98.5),
(6, 'ru', 44, 0.1596, 18),
(55, 'ru', 45, 0.1411, 94),
(6, 'ru', 45, 0.1596, 19),
(6, 'ru', 46, 0.1596, 21),
(6, 'ru', 47, 0.2529, 47),
(54, 'ru', 48, 0.1341, 43),
(6, 'ru', 48, 0.1596, 24),
(15, 'ru', 48, 0.1951, 109.5),
(10, 'ru', 48, 0.2033, 75.5),
(25, 'ru', 48, 0.2634, 105),
(8, 'ru', 48, 0.3109, 149),
(17, 'ru', 49, 0.1206, 83),
(26, 'ru', 49, 0.1263, 122),
(6, 'ru', 49, 0.1596, 25),
(27, 'ru', 49, 0.3587, 152.833),
(6, 'ru', 50, 0.1596, 26),
(6, 'ru', 51, 0.1596, 27),
(6, 'ru', 52, 0.1596, 28),
(20, 'ru', 53, 0.1177, 206),
(6, 'ru', 53, 0.1596, 29),
(6, 'ru', 54, 0.1596, 30),
(6, 'ru', 55, 0.1596, 31),
(6, 'ru', 56, 0.1596, 63),
(6, 'ru', 57, 0.1596, 64),
(6, 'ru', 58, 0.1596, 72),
(21, 'ru', 59, 0.1239, 510),
(9, 'ru', 59, 0.1338, 24),
(24, 'ru', 59, 0.1429, 62),
(6, 'ru', 59, 0.1596, 73),
(27, 'ru', 59, 0.2025, 91.5),
(20, 'ru', 59, 0.2733, 271.5),
(17, 'ru', 60, 0.1206, 383),
(6, 'ru', 60, 0.2529, 100),
(6, 'ru', 61, 0.1596, 75),
(29, 'ru', 62, 0.1195, 320),
(10, 'ru', 62, 0.1283, 104),
(24, 'ru', 62, 0.1429, 94),
(14, 'ru', 62, 0.2147, 233),
(26, 'ru', 62, 0.2526, 228.333),
(6, 'ru', 62, 0.2529, 102),
(25, 'ru', 62, 0.3405, 187.8),
(6, 'ru', 63, 0.2529, 110),
(29, 'ru', 64, 0.1195, 482),
(13, 'ru', 64, 0.1205, 7),
(14, 'ru', 64, 0.1354, 174),
(6, 'ru', 64, 0.1596, 90),
(16, 'ru', 64, 0.17, 8),
(6, 'ru', 65, 0.1596, 91),
(13, 'ru', 66, 0.1205, 235),
(15, 'ru', 66, 0.1231, 102),
(24, 'ru', 66, 0.1429, 162),
(6, 'ru', 66, 0.1596, 98),
(23, 'ru', 66, 0.1686, 52),
(21, 'ru', 66, 0.1964, 373),
(9, 'ru', 66, 0.212, 257.5),
(8, 'ru', 66, 0.2122, 136.5),
(6, 'ru', 67, 0.1596, 99),
(6, 'ru', 68, 0.1596, 106),
(17, 'ru', 69, 0.1206, 396),
(10, 'ru', 69, 0.1283, 256),
(25, 'ru', 69, 0.1317, 168),
(9, 'ru', 69, 0.1338, 73),
(53, 'ru', 69, 0.1464, 210),
(51, 'ru', 69, 0.1569, 5),
(6, 'ru', 69, 0.1596, 107),
(13, 'ru', 69, 0.191, 369.5),
(54, 'ru', 69, 0.2125, 51),
(19, 'ru', 69, 0.2257, 105.5),
(24, 'ru', 69, 0.2857, 98.3333),
(18, 'ru', 69, 0.3512, 223.167),
(22, 'ru', 69, 0.3992, 123.429),
(20, 'ru', 69, 0.4908, 267.118),
(6, 'ru', 70, 0.1596, 108),
(20, 'ru', 71, 0.1177, 528),
(14, 'ru', 71, 0.1354, 153),
(6, 'ru', 71, 0.1596, 109),
(18, 'ru', 71, 0.1983, 254),
(15, 'ru', 71, 0.2858, 216.5),
(6, 'ru', 72, 0.1596, 110),
(6, 'ru', 73, 0.1596, 111),
(6, 'ru', 74, 0.1596, 112),
(6, 'ru', 75, 0.1596, 113),
(6, 'ru', 76, 0.1596, 114),
(6, 'ru', 77, 0.1596, 115),
(6, 'ru', 78, 0.1596, 116),
(6, 'ru', 79, 0.1596, 117),
(6, 'ru', 80, 0.1596, 118),
(6, 'ru', 81, 0.1596, 119),
(29, 'ru', 82, 0.1195, 376),
(15, 'ru', 82, 0.1231, 1),
(10, 'ru', 82, 0.1283, 51),
(12, 'ru', 82, 0.1526, 11),
(6, 'ru', 82, 0.1596, 121),
(11, 'ru', 82, 0.1654, 50),
(18, 'ru', 82, 0.2502, 85.3333),
(27, 'ru', 82, 0.2555, 141.333),
(22, 'ru', 82, 0.2661, 33.6667),
(23, 'ru', 82, 0.2672, 14),
(16, 'ru', 82, 0.2694, 73.5),
(26, 'ru', 82, 0.2932, 71.5),
(13, 'ru', 82, 0.3115, 134.6),
(25, 'ru', 82, 0.3405, 81.8),
(6, 'ru', 83, 0.1596, 122),
(6, 'ru', 84, 0.1596, 123),
(6, 'ru', 85, 0.1596, 124),
(6, 'ru', 86, 0.1596, 125),
(6, 'ru', 87, 0.1596, 127),
(6, 'ru', 88, 0.1596, 142),
(6, 'ru', 89, 0.1596, 152),
(6, 'ru', 90, 0.1596, 155),
(6, 'ru', 91, 0.1596, 156),
(6, 'ru', 92, 0.1596, 157),
(6, 'ru', 93, 0.1596, 158),
(6, 'ru', 94, 0.1596, 164),
(7, 'ru', 95, 0.1843, 1),
(7, 'ru', 96, 0.1843, 3),
(29, 'ru', 97, 0.1195, 152),
(7, 'ru', 97, 0.1843, 5),
(7, 'ru', 98, 0.1843, 6),
(25, 'ru', 99, 0.1317, 196),
(7, 'ru', 99, 0.1843, 12),
(7, 'ru', 100, 0.1843, 13),
(7, 'ru', 101, 0.2921, 26),
(7, 'ru', 102, 0.2921, 26.5),
(29, 'ru', 103, 0.1195, 492),
(25, 'ru', 103, 0.1317, 186),
(7, 'ru', 103, 0.1843, 17),
(7, 'ru', 104, 0.1843, 18),
(13, 'ru', 105, 0.1205, 385),
(19, 'ru', 105, 0.1424, 121),
(24, 'ru', 105, 0.1429, 24),
(7, 'ru', 105, 0.1843, 20),
(15, 'ru', 106, 0.1231, 399),
(8, 'ru', 106, 0.1339, 89),
(7, 'ru', 106, 0.1843, 21),
(22, 'ru', 106, 0.2109, 75),
(20, 'ru', 107, 0.1177, 124),
(18, 'ru', 107, 0.1251, 251),
(10, 'ru', 107, 0.1283, 349),
(24, 'ru', 107, 0.1429, 9),
(7, 'ru', 107, 0.1843, 23),
(17, 'ru', 108, 0.1206, 154),
(10, 'ru', 108, 0.1283, 301),
(25, 'ru', 108, 0.2088, 156.5),
(7, 'ru', 108, 0.2921, 39.5),
(27, 'ru', 108, 0.3587, 160.167),
(26, 'ru', 109, 0.1263, 123),
(7, 'ru', 109, 0.1843, 25),
(52, 'ru', 109, 0.2198, 69.5),
(20, 'ru', 110, 0.1177, 388),
(7, 'ru', 110, 0.1843, 27),
(7, 'ru', 111, 0.1843, 28),
(26, 'ru', 112, 0.1263, 10),
(7, 'ru', 112, 0.2921, 43),
(7, 'ru', 113, 0.1843, 36),
(13, 'ru', 114, 0.1205, 144),
(11, 'ru', 114, 0.1654, 60),
(7, 'ru', 114, 0.1843, 39),
(52, 'ru', 115, 0.1387, 2),
(19, 'ru', 115, 0.1424, 127),
(23, 'ru', 115, 0.1686, 42),
(7, 'ru', 115, 0.1843, 41),
(16, 'ru', 115, 0.2694, 14),
(13, 'ru', 115, 0.2798, 160.5),
(7, 'ru', 116, 0.1843, 42),
(20, 'ru', 117, 0.1177, 384),
(7, 'ru', 117, 0.1843, 42),
(52, 'ru', 118, 0.1387, 120),
(7, 'ru', 118, 0.1843, 50),
(7, 'ru', 119, 0.1843, 52),
(12, 'ru', 119, 0.2418, 135.5),
(15, 'ru', 119, 0.2858, 217.5),
(7, 'ru', 120, 0.1843, 53),
(12, 'ru', 120, 0.5469, 105.727),
(7, 'ru', 121, 0.1843, 56),
(7, 'ru', 122, 0.1843, 57),
(7, 'ru', 123, 0.2921, 69),
(7, 'ru', 124, 0.1843, 59),
(7, 'ru', 125, 0.1843, 60),
(7, 'ru', 126, 0.1843, 62),
(7, 'ru', 127, 0.1843, 63),
(7, 'ru', 128, 0.1843, 77),
(29, 'ru', 129, 0.1195, 306),
(27, 'ru', 129, 0.1278, 259),
(25, 'ru', 129, 0.1317, 242),
(54, 'ru', 129, 0.1341, 265),
(56, 'ru', 129, 0.1453, 34),
(51, 'ru', 129, 0.1569, 104),
(7, 'ru', 129, 0.1843, 79),
(13, 'ru', 130, 0.1205, 180),
(11, 'ru', 130, 0.1654, 96),
(8, 'ru', 130, 0.4017, 105.857),
(20, 'ru', 131, 0.1177, 539),
(26, 'ru', 131, 0.1263, 341),
(25, 'ru', 131, 0.1317, 130),
(8, 'ru', 131, 0.1339, 4),
(24, 'ru', 131, 0.2264, 37),
(8, 'ru', 132, 0.1339, 5),
(12, 'ru', 132, 0.1526, 169),
(26, 'ru', 133, 0.1263, 125),
(25, 'ru', 133, 0.1317, 132),
(8, 'ru', 133, 0.1339, 6),
(18, 'ru', 133, 0.1983, 37.5),
(20, 'ru', 134, 0.1177, 62),
(8, 'ru', 134, 0.1339, 9),
(23, 'ru', 134, 0.1686, 34),
(26, 'ru', 134, 0.2002, 146),
(25, 'ru', 134, 0.2634, 119.667),
(29, 'ru', 134, 0.3356, 239),
(13, 'ru', 134, 0.3383, 326),
(19, 'ru', 134, 0.3681, 83.8),
(25, 'ru', 135, 0.1317, 176),
(8, 'ru', 135, 0.1339, 10),
(8, 'ru', 136, 0.1339, 12),
(18, 'ru', 136, 0.1983, 195),
(8, 'ru', 137, 0.2678, 63.6667),
(9, 'ru', 138, 0.1338, 92),
(8, 'ru', 138, 0.3109, 41.75),
(21, 'ru', 139, 0.1239, 37),
(8, 'ru', 139, 0.3109, 43.5),
(9, 'ru', 140, 0.1338, 93),
(8, 'ru', 140, 0.4017, 190.286),
(20, 'ru', 141, 0.1177, 88),
(21, 'ru', 141, 0.1239, 446),
(18, 'ru', 141, 0.1983, 261.5),
(9, 'ru', 141, 0.212, 119),
(14, 'ru', 141, 0.2147, 127.5),
(17, 'ru', 141, 0.2411, 229.333),
(8, 'ru', 141, 0.2678, 114),
(13, 'ru', 142, 0.1205, 406),
(18, 'ru', 142, 0.1251, 46),
(10, 'ru', 142, 0.1283, 108),
(19, 'ru', 142, 0.1424, 142),
(24, 'ru', 142, 0.1429, 107),
(9, 'ru', 142, 0.212, 134),
(15, 'ru', 142, 0.2462, 216),
(14, 'ru', 142, 0.2709, 113.333),
(17, 'ru', 142, 0.2799, 164.25),
(8, 'ru', 142, 0.3759, 134.833),
(12, 'ru', 142, 0.4836, 132.25),
(13, 'ru', 143, 0.1205, 350),
(18, 'ru', 143, 0.1251, 313),
(25, 'ru', 143, 0.1317, 144),
(19, 'ru', 143, 0.1424, 86),
(8, 'ru', 143, 0.4955, 128.083),
(29, 'ru', 144, 0.1195, 247),
(13, 'ru', 144, 0.1205, 236),
(10, 'ru', 144, 0.1283, 146),
(23, 'ru', 144, 0.1686, 53),
(14, 'ru', 144, 0.2147, 206),
(8, 'ru', 144, 0.3109, 101.75),
(8, 'ru', 145, 0.1339, 41),
(8, 'ru', 146, 0.1339, 42),
(8, 'ru', 147, 0.1339, 45),
(15, 'ru', 147, 0.2462, 218.333),
(21, 'ru', 147, 0.3203, 440.6),
(13, 'ru', 148, 0.1205, 392),
(15, 'ru', 148, 0.1231, 178),
(10, 'ru', 148, 0.1283, 341),
(9, 'ru', 148, 0.1338, 40),
(19, 'ru', 148, 0.1424, 128),
(22, 'ru', 148, 0.2109, 129),
(8, 'ru', 148, 0.2678, 124),
(17, 'ru', 148, 0.3116, 220.2),
(24, 'ru', 148, 0.3317, 79.75),
(14, 'ru', 149, 0.2147, 35),
(24, 'ru', 149, 0.2264, 83.5),
(17, 'ru', 149, 0.2411, 102.667),
(8, 'ru', 149, 0.2678, 126),
(29, 'ru', 149, 0.2775, 477),
(9, 'ru', 149, 0.3458, 202.2),
(15, 'ru', 149, 0.3902, 265),
(15, 'ru', 150, 0.1231, 182),
(9, 'ru', 150, 0.1338, 44),
(14, 'ru', 150, 0.2147, 70),
(8, 'ru', 150, 0.2678, 127),
(9, 'ru', 151, 0.1338, 45),
(14, 'ru', 151, 0.2147, 71),
(8, 'ru', 151, 0.2678, 128),
(15, 'ru', 151, 0.2858, 209),
(9, 'ru', 152, 0.1338, 47),
(8, 'ru', 152, 0.2678, 129),
(15, 'ru', 152, 0.2858, 210.75),
(14, 'ru', 153, 0.1354, 160),
(15, 'ru', 153, 0.2462, 163.667),
(8, 'ru', 153, 0.2678, 130),
(17, 'ru', 154, 0.1206, 442),
(9, 'ru', 154, 0.1338, 205),
(12, 'ru', 154, 0.1526, 166),
(21, 'ru', 154, 0.1964, 535.5),
(8, 'ru', 154, 0.3109, 158.75),
(14, 'ru', 154, 0.3145, 64.75),
(15, 'ru', 154, 0.3693, 217.286),
(29, 'ru', 155, 0.1195, 531),
(8, 'ru', 155, 0.2678, 135.333),
(21, 'ru', 155, 0.4442, 293.182),
(15, 'ru', 156, 0.1951, 155),
(8, 'ru', 156, 0.2678, 141.333),
(20, 'ru', 156, 0.4481, 371.154),
(21, 'ru', 156, 0.5824, 304.6),
(8, 'ru', 157, 0.2678, 147.333),
(8, 'ru', 158, 0.2678, 151.667),
(25, 'ru', 159, 0.1317, 68),
(8, 'ru', 159, 0.2678, 155.667),
(26, 'ru', 160, 0.2002, 241.5),
(8, 'ru', 160, 0.2678, 156.667),
(10, 'ru', 161, 0.1283, 145),
(14, 'ru', 161, 0.1354, 86),
(8, 'ru', 161, 0.2678, 158.667),
(15, 'ru', 162, 0.1231, 48),
(9, 'ru', 162, 0.1338, 66),
(17, 'ru', 162, 0.1911, 120),
(10, 'ru', 162, 0.2033, 201.5),
(8, 'ru', 162, 0.2678, 159.667),
(8, 'ru', 163, 0.2122, 89.5),
(13, 'ru', 164, 0.1205, 4),
(21, 'ru', 164, 0.1239, 71),
(26, 'ru', 164, 0.1263, 5),
(25, 'ru', 164, 0.1317, 155),
(9, 'ru', 164, 0.1338, 37),
(8, 'ru', 164, 0.1339, 87),
(16, 'ru', 164, 0.17, 5),
(18, 'ru', 164, 0.1983, 179),
(29, 'ru', 165, 0.1195, 315),
(26, 'ru', 165, 0.1263, 117),
(27, 'ru', 165, 0.1278, 125),
(9, 'ru', 165, 0.1338, 176),
(23, 'ru', 165, 0.1686, 39),
(8, 'ru', 165, 0.2122, 125),
(13, 'ru', 165, 0.241, 162.333),
(11, 'ru', 165, 0.2622, 48.5),
(25, 'ru', 166, 0.1317, 172),
(8, 'ru', 166, 0.1339, 91),
(15, 'ru', 166, 0.1951, 63.5),
(29, 'ru', 167, 0.1195, 75),
(13, 'ru', 167, 0.1205, 208),
(15, 'ru', 167, 0.1231, 356),
(26, 'ru', 167, 0.1263, 71),
(10, 'ru', 167, 0.1283, 189),
(8, 'ru', 167, 0.1339, 99),
(52, 'ru', 167, 0.1387, 64),
(53, 'ru', 167, 0.1464, 211),
(49, 'ru', 167, 0.1486, 45),
(51, 'ru', 167, 0.1569, 6),
(23, 'ru', 167, 0.1686, 25),
(54, 'ru', 167, 0.2125, 52),
(8, 'ru', 168, 0.1339, 100),
(52, 'ru', 168, 0.1387, 22),
(55, 'ru', 168, 0.1411, 168),
(17, 'ru', 169, 0.1206, 184),
(18, 'ru', 169, 0.1251, 139),
(8, 'ru', 169, 0.1339, 103),
(18, 'ru', 170, 0.1251, 245),
(8, 'ru', 170, 0.1339, 104),
(13, 'ru', 171, 0.1205, 301),
(15, 'ru', 171, 0.1231, 3),
(10, 'ru', 171, 0.1283, 304),
(25, 'ru', 171, 0.1317, 169),
(8, 'ru', 171, 0.1339, 105),
(14, 'ru', 171, 0.1354, 102),
(19, 'ru', 171, 0.1424, 37),
(9, 'ru', 171, 0.3106, 138.5),
(8, 'ru', 172, 0.1339, 106),
(17, 'ru', 173, 0.1206, 482),
(27, 'ru', 173, 0.1278, 272),
(8, 'ru', 173, 0.1339, 146),
(20, 'ru', 173, 0.1866, 71),
(15, 'ru', 173, 0.1951, 251),
(18, 'ru', 174, 0.1251, 117),
(10, 'ru', 174, 0.1283, 336),
(8, 'ru', 174, 0.1339, 147),
(8, 'ru', 175, 0.1339, 148),
(29, 'ru', 176, 0.1195, 22),
(8, 'ru', 176, 0.3109, 195.75),
(20, 'ru', 177, 0.1177, 24),
(29, 'ru', 177, 0.1195, 77),
(26, 'ru', 177, 0.1263, 155),
(10, 'ru', 177, 0.1283, 246),
(8, 'ru', 177, 0.1339, 161),
(19, 'ru', 177, 0.1424, 120),
(23, 'ru', 177, 0.1686, 31),
(13, 'ru', 177, 0.191, 299),
(22, 'ru', 177, 0.2109, 48),
(8, 'ru', 178, 0.1339, 163),
(21, 'ru', 179, 0.1239, 508),
(8, 'ru', 179, 0.2678, 201.667),
(8, 'ru', 180, 0.1339, 168),
(14, 'ru', 180, 0.2147, 73.5),
(8, 'ru', 181, 0.1339, 169),
(8, 'ru', 182, 0.1339, 170),
(22, 'ru', 183, 0.1331, 144),
(8, 'ru', 183, 0.1339, 171),
(19, 'ru', 183, 0.1424, 95),
(24, 'ru', 183, 0.1429, 46),
(10, 'ru', 183, 0.2033, 271.5),
(13, 'ru', 183, 0.241, 139.333),
(17, 'ru', 183, 0.2411, 368.333),
(16, 'ru', 183, 0.2694, 30.5),
(15, 'ru', 183, 0.3456, 282.333),
(21, 'ru', 183, 0.3927, 183.125),
(13, 'ru', 184, 0.1205, 133),
(18, 'ru', 184, 0.1251, 152),
(25, 'ru', 184, 0.1317, 259),
(9, 'ru', 184, 0.1338, 85),
(8, 'ru', 184, 0.1339, 178),
(11, 'ru', 184, 0.1654, 49),
(26, 'ru', 184, 0.2002, 137.5),
(29, 'ru', 184, 0.2775, 398.25),
(8, 'ru', 185, 0.1339, 179),
(13, 'ru', 186, 0.1205, 400),
(8, 'ru', 186, 0.1339, 181),
(19, 'ru', 186, 0.1424, 136),
(8, 'ru', 187, 0.1339, 182),
(8, 'ru', 188, 0.1339, 183),
(8, 'ru', 189, 0.1339, 184),
(18, 'ru', 190, 0.1251, 312),
(25, 'ru', 190, 0.1317, 143),
(8, 'ru', 190, 0.1339, 185),
(21, 'ru', 190, 0.1964, 456.5),
(8, 'ru', 191, 0.1339, 186),
(8, 'ru', 192, 0.1339, 188),
(8, 'ru', 193, 0.1339, 189),
(17, 'ru', 194, 0.1206, 346),
(10, 'ru', 194, 0.1283, 345),
(22, 'ru', 194, 0.1331, 164),
(9, 'ru', 194, 0.1338, 95),
(8, 'ru', 194, 0.1339, 190),
(20, 'ru', 194, 0.1866, 341.5),
(21, 'ru', 194, 0.1964, 262),
(49, 'ru', 194, 0.2356, 169.5),
(15, 'ru', 195, 0.1231, 46),
(8, 'ru', 195, 0.1339, 216),
(14, 'ru', 195, 0.1354, 73),
(29, 'ru', 195, 0.1894, 277.5),
(25, 'ru', 196, 0.1317, 84),
(8, 'ru', 196, 0.1339, 241),
(52, 'ru', 196, 0.1387, 145),
(29, 'ru', 196, 0.1894, 442.5),
(49, 'ru', 196, 0.2356, 145.5),
(8, 'ru', 197, 0.1339, 244),
(17, 'ru', 197, 0.1911, 169.5),
(26, 'ru', 198, 0.1263, 358),
(8, 'ru', 198, 0.1339, 246),
(25, 'ru', 198, 0.2088, 170.5),
(29, 'ru', 199, 0.1195, 76),
(13, 'ru', 199, 0.1205, 127),
(17, 'ru', 199, 0.1206, 364),
(25, 'ru', 199, 0.1317, 221),
(22, 'ru', 199, 0.1331, 166),
(8, 'ru', 199, 0.1339, 248),
(14, 'ru', 199, 0.1354, 268),
(55, 'ru', 199, 0.1411, 92),
(11, 'ru', 199, 0.1654, 43),
(25, 'ru', 200, 0.1317, 96),
(8, 'ru', 200, 0.1339, 249),
(18, 'ru', 201, 0.1251, 170),
(22, 'ru', 201, 0.1331, 222),
(9, 'ru', 201, 0.1338, 75),
(8, 'ru', 201, 0.1339, 258),
(14, 'ru', 201, 0.1354, 161),
(8, 'ru', 202, 0.1339, 259),
(8, 'ru', 203, 0.1339, 263),
(9, 'ru', 203, 0.2675, 98.6667),
(8, 'ru', 204, 0.1339, 264),
(21, 'ru', 204, 0.1964, 101),
(9, 'ru', 204, 0.2675, 115.333),
(17, 'ru', 205, 0.1206, 412),
(18, 'ru', 205, 0.1251, 39),
(26, 'ru', 205, 0.1263, 184),
(9, 'ru', 205, 0.1338, 7),
(8, 'ru', 205, 0.1339, 269),
(54, 'ru', 205, 0.1341, 207),
(14, 'ru', 205, 0.1354, 132),
(19, 'ru', 205, 0.1424, 17),
(24, 'ru', 205, 0.1429, 11),
(51, 'ru', 205, 0.1569, 74),
(23, 'ru', 205, 0.1686, 4),
(13, 'ru', 205, 0.191, 234),
(25, 'ru', 205, 0.2634, 186.333),
(52, 'ru', 205, 0.2774, 100.667),
(18, 'ru', 206, 0.1983, 277),
(8, 'ru', 206, 0.2122, 274),
(20, 'ru', 206, 0.2354, 315.667),
(8, 'ru', 207, 0.1339, 272),
(8, 'ru', 208, 0.1339, 273),
(20, 'ru', 209, 0.1177, 148),
(8, 'ru', 209, 0.1339, 274),
(17, 'ru', 209, 0.1911, 354),
(20, 'ru', 210, 0.1177, 148),
(9, 'ru', 210, 0.1338, 158),
(8, 'ru', 210, 0.1339, 274),
(17, 'ru', 210, 0.2799, 392),
(22, 'ru', 210, 0.3089, 99),
(8, 'ru', 211, 0.1339, 279),
(20, 'ru', 211, 0.1866, 363.5),
(8, 'ru', 212, 0.1339, 280),
(24, 'ru', 212, 0.1429, 37),
(8, 'ru', 213, 0.1339, 281),
(13, 'ru', 214, 0.1205, 179),
(10, 'ru', 214, 0.1283, 306),
(25, 'ru', 214, 0.1317, 163),
(14, 'ru', 214, 0.1354, 26),
(11, 'ru', 214, 0.1654, 95),
(29, 'ru', 214, 0.1894, 197.5),
(17, 'ru', 214, 0.3617, 131.857),
(9, 'ru', 214, 0.3755, 65.1667),
(29, 'ru', 215, 0.1195, 316),
(26, 'ru', 215, 0.1263, 120),
(9, 'ru', 215, 0.212, 101.5),
(13, 'ru', 215, 0.2798, 116.75),
(11, 'ru', 215, 0.3841, 32.75),
(29, 'ru', 216, 0.1195, 318),
(26, 'ru', 216, 0.1263, 118),
(9, 'ru', 216, 0.212, 103.5),
(13, 'ru', 216, 0.2798, 118.75),
(11, 'ru', 216, 0.3841, 34.75),
(29, 'ru', 217, 0.1195, 319),
(27, 'ru', 217, 0.1278, 279),
(25, 'ru', 217, 0.1317, 142),
(19, 'ru', 217, 0.1424, 15),
(23, 'ru', 217, 0.1686, 38),
(26, 'ru', 217, 0.2002, 162.5),
(9, 'ru', 217, 0.3106, 109.25),
(13, 'ru', 217, 0.3383, 163.167),
(11, 'ru', 217, 0.3841, 35.75),
(15, 'ru', 218, 0.1231, 196),
(21, 'ru', 218, 0.1239, 507),
(26, 'ru', 218, 0.1263, 185),
(10, 'ru', 218, 0.1283, 127),
(9, 'ru', 218, 0.1338, 8),
(52, 'ru', 218, 0.1387, 176),
(11, 'ru', 218, 0.1654, 13),
(23, 'ru', 218, 0.1686, 5),
(19, 'ru', 218, 0.2257, 55.5),
(25, 'ru', 218, 0.2634, 235.667),
(13, 'ru', 218, 0.2798, 231),
(20, 'ru', 218, 0.3043, 437.6),
(13, 'ru', 219, 0.1205, 99),
(27, 'ru', 219, 0.1278, 199),
(9, 'ru', 219, 0.1338, 10),
(11, 'ru', 219, 0.1654, 15),
(29, 'ru', 220, 0.1195, 568),
(25, 'ru', 220, 0.1317, 263),
(11, 'ru', 220, 0.1654, 17),
(16, 'ru', 220, 0.17, 81),
(9, 'ru', 220, 0.212, 15),
(19, 'ru', 220, 0.2848, 99),
(13, 'ru', 220, 0.3115, 254),
(20, 'ru', 221, 0.1177, 533),
(13, 'ru', 221, 0.1205, 437),
(17, 'ru', 221, 0.1206, 437),
(9, 'ru', 221, 0.1338, 18),
(52, 'ru', 221, 0.1387, 203),
(19, 'ru', 221, 0.1424, 173),
(53, 'ru', 221, 0.1464, 155),
(29, 'ru', 221, 0.1894, 426.5),
(10, 'ru', 222, 0.1283, 126),
(9, 'ru', 222, 0.1338, 20),
(29, 'ru', 223, 0.1195, 222),
(13, 'ru', 223, 0.1205, 6),
(17, 'ru', 223, 0.1206, 434),
(21, 'ru', 223, 0.1239, 511),
(26, 'ru', 223, 0.1263, 113),
(25, 'ru', 223, 0.1317, 115),
(22, 'ru', 223, 0.1331, 112),
(9, 'ru', 223, 0.1338, 25),
(14, 'ru', 223, 0.1354, 28),
(24, 'ru', 223, 0.1429, 63),
(16, 'ru', 223, 0.2694, 4.5),
(20, 'ru', 223, 0.3043, 262.8),
(9, 'ru', 224, 0.1338, 27),
(14, 'ru', 224, 0.1354, 113),
(26, 'ru', 224, 0.2002, 70.5),
(9, 'ru', 225, 0.1338, 28),
(17, 'ru', 226, 0.1206, 200),
(9, 'ru', 226, 0.1338, 30),
(14, 'ru', 226, 0.1354, 119),
(9, 'ru', 227, 0.1338, 32),
(9, 'ru', 228, 0.1338, 33),
(14, 'ru', 228, 0.1354, 123),
(20, 'ru', 228, 0.1866, 36.5),
(29, 'ru', 228, 0.1894, 386),
(22, 'ru', 228, 0.2109, 102),
(19, 'ru', 228, 0.2257, 113),
(17, 'ru', 228, 0.2411, 381.333),
(25, 'ru', 228, 0.2634, 131),
(16, 'ru', 228, 0.2694, 52.5),
(24, 'ru', 228, 0.3317, 99.5),
(13, 'ru', 228, 0.382, 217),
(23, 'ru', 228, 0.3915, 36.75),
(21, 'ru', 228, 0.4116, 246.111),
(26, 'ru', 228, 0.4527, 163.182),
(18, 'ru', 229, 0.1251, 145),
(10, 'ru', 229, 0.1283, 313),
(25, 'ru', 229, 0.1317, 112),
(17, 'ru', 229, 0.2799, 172),
(9, 'ru', 229, 0.3755, 119.167),
(14, 'ru', 229, 0.4499, 81.5556),
(9, 'ru', 230, 0.1338, 39),
(53, 'ru', 230, 0.1464, 216),
(51, 'ru', 230, 0.1569, 11),
(54, 'ru', 230, 0.2125, 57),
(29, 'ru', 231, 0.1195, 132),
(9, 'ru', 231, 0.1338, 43),
(24, 'ru', 231, 0.1429, 72),
(15, 'ru', 231, 0.1951, 278),
(13, 'ru', 232, 0.1205, 210),
(18, 'ru', 232, 0.1251, 34),
(10, 'ru', 232, 0.1283, 221),
(9, 'ru', 232, 0.1338, 53),
(54, 'ru', 232, 0.1341, 191),
(23, 'ru', 232, 0.1686, 27),
(10, 'ru', 233, 0.1283, 225),
(9, 'ru', 233, 0.212, 81),
(15, 'ru', 233, 0.2462, 232),
(9, 'ru', 234, 0.1338, 64),
(47, 'ru', 234, 0.2277, 8),
(9, 'ru', 235, 0.1338, 65),
(17, 'ru', 236, 0.1206, 248),
(9, 'ru', 236, 0.212, 70.5),
(15, 'ru', 237, 0.1231, 49),
(9, 'ru', 237, 0.1338, 68),
(12, 'ru', 237, 0.2418, 82),
(22, 'ru', 238, 0.1331, 211),
(9, 'ru', 238, 0.1338, 69),
(24, 'ru', 238, 0.1429, 180),
(20, 'ru', 238, 0.2733, 358.25),
(9, 'ru', 239, 0.1338, 71),
(24, 'ru', 239, 0.1429, 60),
(20, 'ru', 239, 0.2733, 241),
(29, 'ru', 240, 0.1195, 507),
(22, 'ru', 240, 0.1331, 186),
(9, 'ru', 240, 0.1338, 72),
(29, 'ru', 241, 0.1195, 254),
(9, 'ru', 241, 0.1338, 77),
(26, 'ru', 241, 0.2002, 136.5),
(20, 'ru', 241, 0.2354, 145.333),
(18, 'ru', 241, 0.2502, 265),
(9, 'ru', 242, 0.1338, 78),
(9, 'ru', 243, 0.1338, 79),
(17, 'ru', 243, 0.1911, 206),
(9, 'ru', 244, 0.1338, 82),
(15, 'ru', 245, 0.1231, 77),
(22, 'ru', 245, 0.1331, 180),
(9, 'ru', 245, 0.1338, 83),
(29, 'ru', 245, 0.1894, 262),
(20, 'ru', 246, 0.1866, 481),
(9, 'ru', 246, 0.212, 133.5),
(17, 'ru', 246, 0.3116, 170.2),
(9, 'ru', 247, 0.1338, 87),
(17, 'ru', 248, 0.1206, 385),
(9, 'ru', 248, 0.1338, 88),
(10, 'ru', 248, 0.2033, 303),
(9, 'ru', 249, 0.1338, 90),
(9, 'ru', 250, 0.1338, 91),
(9, 'ru', 251, 0.1338, 96),
(9, 'ru', 252, 0.212, 137.5),
(26, 'ru', 253, 0.1263, 236),
(9, 'ru', 253, 0.1338, 98),
(22, 'ru', 254, 0.1331, 188),
(9, 'ru', 254, 0.1338, 100),
(14, 'ru', 254, 0.1354, 191),
(17, 'ru', 254, 0.2799, 204.5),
(9, 'ru', 255, 0.1338, 110),
(9, 'ru', 256, 0.1338, 116),
(9, 'ru', 257, 0.1338, 119),
(10, 'ru', 258, 0.1283, 77),
(9, 'ru', 258, 0.1338, 122),
(14, 'ru', 258, 0.1354, 261),
(9, 'ru', 259, 0.1338, 125),
(22, 'ru', 260, 0.1331, 133),
(9, 'ru', 260, 0.1338, 126),
(9, 'ru', 261, 0.1338, 135),
(9, 'ru', 262, 0.1338, 137),
(22, 'ru', 263, 0.1331, 5),
(9, 'ru', 263, 0.1338, 138),
(13, 'ru', 264, 0.1205, 41),
(9, 'ru', 264, 0.1338, 144),
(16, 'ru', 264, 0.17, 42),
(10, 'ru', 265, 0.1283, 136),
(9, 'ru', 265, 0.1338, 145),
(14, 'ru', 265, 0.1354, 203),
(9, 'ru', 266, 0.1338, 152),
(21, 'ru', 267, 0.1239, 87),
(18, 'ru', 267, 0.1251, 193),
(9, 'ru', 267, 0.1338, 153),
(9, 'ru', 268, 0.212, 169.5),
(9, 'ru', 269, 0.1338, 172),
(17, 'ru', 270, 0.1206, 223),
(21, 'ru', 270, 0.1239, 14),
(18, 'ru', 270, 0.1251, 5),
(25, 'ru', 270, 0.1317, 63),
(9, 'ru', 270, 0.1338, 179),
(19, 'ru', 270, 0.1424, 176),
(12, 'ru', 270, 0.1526, 4),
(11, 'ru', 270, 0.1654, 85),
(23, 'ru', 270, 0.1686, 72),
(10, 'ru', 270, 0.2033, 37.5),
(16, 'ru', 270, 0.2694, 50.5),
(13, 'ru', 270, 0.3115, 192.6),
(29, 'ru', 271, 0.1195, 269),
(13, 'ru', 271, 0.1205, 84),
(27, 'ru', 271, 0.1278, 27),
(9, 'ru', 271, 0.1338, 188),
(16, 'ru', 271, 0.17, 85),
(14, 'ru', 271, 0.2147, 73.5),
(25, 'ru', 272, 0.1317, 249),
(23, 'ru', 272, 0.1686, 37),
(26, 'ru', 272, 0.2002, 254.5),
(9, 'ru', 272, 0.212, 215.5),
(19, 'ru', 272, 0.2257, 95),
(13, 'ru', 272, 0.241, 312.667),
(29, 'ru', 272, 0.2775, 330),
(29, 'ru', 273, 0.1195, 173),
(13, 'ru', 273, 0.1205, 113),
(27, 'ru', 273, 0.1278, 248),
(10, 'ru', 273, 0.1283, 270),
(22, 'ru', 273, 0.1331, 237),
(11, 'ru', 273, 0.1654, 29),
(26, 'ru', 273, 0.2002, 261.5),
(9, 'ru', 273, 0.212, 201),
(9, 'ru', 274, 0.1338, 207),
(20, 'ru', 275, 0.1177, 519),
(13, 'ru', 275, 0.1205, 48),
(9, 'ru', 275, 0.1338, 208),
(16, 'ru', 275, 0.17, 49),
(14, 'ru', 275, 0.2147, 66),
(17, 'ru', 275, 0.2799, 100.25),
(21, 'ru', 275, 0.3203, 407.2),
(9, 'ru', 276, 0.1338, 211),
(15, 'ru', 276, 0.1951, 62.5),
(9, 'ru', 277, 0.1338, 213),
(20, 'ru', 277, 0.1866, 426),
(15, 'ru', 277, 0.1951, 270.5),
(29, 'ru', 278, 0.2391, 277.667),
(15, 'ru', 278, 0.2858, 286.25),
(14, 'ru', 278, 0.3145, 54.75),
(9, 'ru', 278, 0.5226, 241.357),
(20, 'ru', 279, 0.1177, 520),
(29, 'ru', 279, 0.1195, 6),
(17, 'ru', 279, 0.1206, 209),
(9, 'ru', 279, 0.1338, 221),
(14, 'ru', 279, 0.1354, 50),
(15, 'ru', 280, 0.1231, 431),
(14, 'ru', 280, 0.2147, 72.5),
(9, 'ru', 280, 0.3106, 245.25),
(15, 'ru', 281, 0.1231, 101),
(9, 'ru', 281, 0.1338, 224),
(12, 'ru', 281, 0.1526, 189),
(15, 'ru', 282, 0.1951, 97.5),
(12, 'ru', 282, 0.2418, 193.5),
(14, 'ru', 282, 0.2709, 116),
(9, 'ru', 282, 0.3106, 248.25),
(17, 'ru', 283, 0.1911, 43),
(15, 'ru', 283, 0.1951, 97.5),
(20, 'ru', 283, 0.2354, 304.333),
(14, 'ru', 283, 0.2709, 116),
(9, 'ru', 283, 0.3106, 248.25),
(12, 'ru', 283, 0.3542, 162.5),
(21, 'ru', 283, 0.3927, 309.125),
(9, 'ru', 284, 0.1338, 226),
(15, 'ru', 285, 0.1231, 154),
(9, 'ru', 285, 0.1338, 228),
(14, 'ru', 285, 0.1354, 34),
(20, 'ru', 285, 0.2354, 322.333),
(15, 'ru', 286, 0.1231, 104),
(9, 'ru', 286, 0.1338, 236),
(14, 'ru', 286, 0.1354, 82),
(15, 'ru', 287, 0.1231, 440),
(14, 'ru', 287, 0.1354, 46),
(9, 'ru', 287, 0.212, 247),
(9, 'ru', 288, 0.1338, 252),
(9, 'ru', 289, 0.1338, 257),
(17, 'ru', 290, 0.1206, 74),
(9, 'ru', 290, 0.1338, 263),
(9, 'ru', 291, 0.1338, 271),
(13, 'ru', 292, 0.1205, 182),
(11, 'ru', 292, 0.1654, 98),
(29, 'ru', 292, 0.1894, 181),
(10, 'ru', 292, 0.4067, 112.875),
(18, 'ru', 293, 0.1251, 41),
(10, 'ru', 293, 0.1283, 5),
(25, 'ru', 294, 0.1317, 34),
(10, 'ru', 294, 0.2033, 122),
(13, 'ru', 294, 0.241, 395),
(19, 'ru', 294, 0.2848, 131),
(18, 'ru', 294, 0.3233, 173.4),
(24, 'ru', 294, 0.3317, 92),
(17, 'ru', 294, 0.3822, 302.25),
(20, 'ru', 294, 0.391, 267.222),
(15, 'ru', 294, 0.4089, 250.667),
(29, 'ru', 295, 0.1195, 61),
(27, 'ru', 295, 0.1278, 68),
(10, 'ru', 295, 0.1283, 11),
(25, 'ru', 295, 0.1317, 23),
(10, 'ru', 296, 0.1283, 18),
(20, 'ru', 297, 0.1177, 61),
(17, 'ru', 297, 0.1206, 316),
(18, 'ru', 297, 0.1251, 16),
(27, 'ru', 297, 0.1278, 287),
(25, 'ru', 297, 0.1317, 70),
(13, 'ru', 297, 0.191, 351.5),
(10, 'ru', 297, 0.2033, 47.5),
(19, 'ru', 297, 0.2257, 87.5),
(29, 'ru', 297, 0.2391, 343.667),
(20, 'ru', 298, 0.1177, 125),
(29, 'ru', 298, 0.1195, 194),
(10, 'ru', 298, 0.1283, 25),
(18, 'ru', 298, 0.1983, 206.5),
(22, 'ru', 298, 0.2661, 97.6667),
(10, 'ru', 299, 0.1283, 26),
(29, 'ru', 299, 0.1894, 300),
(29, 'ru', 300, 0.1195, 196),
(10, 'ru', 300, 0.2033, 42.5),
(10, 'ru', 301, 0.1283, 29),
(10, 'ru', 302, 0.1283, 32),
(10, 'ru', 303, 0.1283, 33),
(10, 'ru', 304, 0.1283, 35),
(10, 'ru', 305, 0.1283, 36),
(10, 'ru', 306, 0.1283, 38),
(18, 'ru', 307, 0.1251, 310),
(10, 'ru', 307, 0.2033, 47),
(10, 'ru', 308, 0.2033, 48),
(17, 'ru', 309, 0.1206, 180),
(26, 'ru', 309, 0.1263, 262),
(25, 'ru', 309, 0.1317, 135),
(11, 'ru', 309, 0.1654, 30),
(20, 'ru', 309, 0.1866, 278),
(29, 'ru', 309, 0.1894, 317),
(10, 'ru', 309, 0.2033, 49.5),
(22, 'ru', 309, 0.2109, 112),
(13, 'ru', 309, 0.2798, 193.5),
(24, 'ru', 309, 0.2857, 87.3333),
(23, 'ru', 309, 0.3372, 37),
(20, 'ru', 310, 0.1177, 512),
(29, 'ru', 310, 0.1195, 38),
(15, 'ru', 310, 0.1231, 60),
(21, 'ru', 310, 0.1239, 537),
(25, 'ru', 310, 0.1317, 51),
(22, 'ru', 310, 0.1331, 147),
(12, 'ru', 310, 0.1526, 15),
(10, 'ru', 310, 0.2033, 93),
(10, 'ru', 311, 0.1283, 56),
(10, 'ru', 312, 0.1283, 59),
(10, 'ru', 313, 0.1283, 61),
(10, 'ru', 314, 0.1283, 63),
(10, 'ru', 315, 0.1283, 63),
(10, 'ru', 316, 0.1283, 64),
(10, 'ru', 317, 0.1283, 70),
(14, 'ru', 318, 0.1354, 278),
(52, 'ru', 318, 0.1387, 205),
(53, 'ru', 318, 0.1464, 157),
(10, 'ru', 318, 0.2033, 194),
(20, 'ru', 319, 0.1177, 31),
(17, 'ru', 319, 0.1206, 93),
(18, 'ru', 319, 0.1251, 74),
(14, 'ru', 319, 0.1354, 152),
(24, 'ru', 319, 0.1429, 102),
(10, 'ru', 319, 0.2033, 202),
(22, 'ru', 319, 0.2109, 75.5),
(10, 'ru', 320, 0.1283, 87),
(14, 'ru', 320, 0.1354, 179),
(10, 'ru', 321, 0.1283, 88),
(10, 'ru', 322, 0.1283, 88),
(21, 'ru', 323, 0.1239, 78),
(22, 'ru', 323, 0.1331, 61),
(12, 'ru', 323, 0.1526, 195),
(10, 'ru', 323, 0.2033, 211.5),
(10, 'ru', 324, 0.1283, 91),
(10, 'ru', 325, 0.1283, 100),
(25, 'ru', 325, 0.1317, 5),
(10, 'ru', 326, 0.1283, 102),
(10, 'ru', 327, 0.1283, 106),
(17, 'ru', 327, 0.2411, 66.3333),
(10, 'ru', 328, 0.1283, 110),
(10, 'ru', 329, 0.1283, 111),
(25, 'ru', 329, 0.2634, 77.3333),
(15, 'ru', 329, 0.2858, 152.75),
(27, 'ru', 329, 0.4728, 140),
(29, 'ru', 329, 0.5166, 268.263),
(20, 'ru', 330, 0.1177, 10),
(13, 'ru', 330, 0.1205, 325),
(10, 'ru', 330, 0.1283, 114),
(25, 'ru', 330, 0.1317, 7),
(19, 'ru', 330, 0.1424, 61),
(26, 'ru', 330, 0.2002, 146.5),
(10, 'ru', 331, 0.1283, 115),
(25, 'ru', 331, 0.1317, 283),
(18, 'ru', 331, 0.1983, 197),
(15, 'ru', 332, 0.1231, 215),
(10, 'ru', 332, 0.1283, 122),
(22, 'ru', 332, 0.1331, 93),
(54, 'ru', 332, 0.1341, 39),
(21, 'ru', 332, 0.1964, 465.5),
(24, 'ru', 332, 0.2264, 110),
(26, 'ru', 332, 0.2932, 133.25),
(10, 'ru', 333, 0.1283, 123),
(10, 'ru', 334, 0.1283, 131),
(47, 'ru', 334, 0.2277, 18),
(27, 'ru', 335, 0.1278, 127),
(10, 'ru', 335, 0.1283, 139),
(27, 'ru', 336, 0.1278, 127),
(10, 'ru', 336, 0.1283, 139),
(10, 'ru', 337, 0.1283, 141),
(20, 'ru', 338, 0.1177, 56),
(10, 'ru', 338, 0.1283, 142),
(25, 'ru', 338, 0.1317, 134),
(18, 'ru', 338, 0.1983, 257),
(10, 'ru', 339, 0.1283, 143),
(10, 'ru', 340, 0.1283, 144),
(21, 'ru', 341, 0.1239, 478),
(10, 'ru', 341, 0.1283, 154),
(10, 'ru', 342, 0.1283, 155),
(10, 'ru', 343, 0.1283, 158),
(10, 'ru', 344, 0.1283, 160),
(10, 'ru', 345, 0.1283, 168),
(10, 'ru', 346, 0.1283, 173),
(29, 'ru', 347, 0.1195, 280),
(13, 'ru', 347, 0.1205, 162),
(14, 'ru', 347, 0.1354, 9),
(12, 'ru', 347, 0.1526, 9),
(11, 'ru', 347, 0.1654, 78),
(10, 'ru', 347, 0.2033, 238.5),
(10, 'ru', 348, 0.1283, 180),
(54, 'ru', 348, 0.1341, 100),
(52, 'ru', 348, 0.1387, 165),
(10, 'ru', 349, 0.1283, 185),
(25, 'ru', 349, 0.1317, 210),
(19, 'ru', 349, 0.1424, 63),
(11, 'ru', 349, 0.1654, 63),
(23, 'ru', 349, 0.1686, 61),
(13, 'ru', 349, 0.241, 239.333),
(26, 'ru', 349, 0.2526, 158.667),
(10, 'ru', 350, 0.1283, 186),
(10, 'ru', 351, 0.1283, 188),
(10, 'ru', 352, 0.1283, 195),
(17, 'ru', 352, 0.2411, 429),
(10, 'ru', 353, 0.1283, 196),
(17, 'ru', 354, 0.1206, 431),
(10, 'ru', 354, 0.1283, 197),
(20, 'ru', 354, 0.1866, 91.5),
(22, 'ru', 355, 0.1331, 7),
(10, 'ru', 355, 0.2033, 242.5),
(17, 'ru', 356, 0.1206, 156),
(10, 'ru', 356, 0.1283, 200),
(20, 'ru', 357, 0.1177, 8),
(10, 'ru', 357, 0.1283, 201),
(22, 'ru', 357, 0.1331, 115),
(54, 'ru', 357, 0.1341, 263),
(56, 'ru', 357, 0.1453, 32),
(51, 'ru', 357, 0.1569, 102),
(18, 'ru', 358, 0.1251, 192),
(10, 'ru', 358, 0.1283, 206),
(52, 'ru', 358, 0.1387, 204),
(49, 'ru', 358, 0.1486, 62),
(51, 'ru', 358, 0.1569, 30),
(53, 'ru', 358, 0.232, 171.5),
(10, 'ru', 359, 0.1283, 208),
(10, 'ru', 360, 0.1283, 210),
(10, 'ru', 361, 0.1283, 212),
(17, 'ru', 362, 0.1206, 276),
(10, 'ru', 362, 0.1283, 226),
(24, 'ru', 362, 0.1429, 117),
(21, 'ru', 362, 0.2877, 78.25),
(15, 'ru', 362, 0.4089, 213.111),
(10, 'ru', 363, 0.2033, 277),
(14, 'ru', 363, 0.2147, 74.5),
(15, 'ru', 363, 0.4809, 250.714),
(13, 'ru', 364, 0.1205, 30),
(18, 'ru', 364, 0.1251, 6),
(26, 'ru', 364, 0.1263, 124),
(10, 'ru', 364, 0.1283, 230),
(16, 'ru', 364, 0.17, 31),
(20, 'ru', 365, 0.1177, 21),
(13, 'ru', 365, 0.1205, 380),
(26, 'ru', 365, 0.1263, 142),
(10, 'ru', 365, 0.1283, 231),
(25, 'ru', 365, 0.1317, 45),
(52, 'ru', 365, 0.1387, 114),
(19, 'ru', 365, 0.1424, 116),
(29, 'ru', 365, 0.1894, 107),
(21, 'ru', 366, 0.1239, 535),
(10, 'ru', 366, 0.1283, 232),
(21, 'ru', 367, 0.1239, 535),
(10, 'ru', 367, 0.1283, 232),
(15, 'ru', 367, 0.4089, 224.667),
(10, 'ru', 368, 0.1283, 233),
(10, 'ru', 369, 0.1283, 235),
(20, 'ru', 369, 0.1866, 303),
(13, 'ru', 370, 0.1205, 16),
(10, 'ru', 370, 0.1283, 237),
(24, 'ru', 370, 0.1429, 184),
(16, 'ru', 370, 0.17, 17),
(20, 'ru', 370, 0.1866, 365.5),
(15, 'ru', 370, 0.1951, 274),
(10, 'ru', 371, 0.1283, 241),
(15, 'ru', 372, 0.1231, 444),
(10, 'ru', 372, 0.1283, 243),
(20, 'ru', 373, 0.1177, 174),
(29, 'ru', 373, 0.1195, 195),
(15, 'ru', 373, 0.1231, 117),
(10, 'ru', 373, 0.1283, 244),
(25, 'ru', 373, 0.1317, 251),
(24, 'ru', 373, 0.2264, 110),
(22, 'ru', 373, 0.3439, 104.6),
(13, 'ru', 374, 0.1205, 264),
(10, 'ru', 374, 0.1283, 245),
(22, 'ru', 374, 0.1331, 1),
(23, 'ru', 374, 0.1686, 81),
(20, 'ru', 375, 0.1177, 112),
(10, 'ru', 375, 0.2033, 255),
(10, 'ru', 376, 0.1283, 249),
(22, 'ru', 376, 0.1331, 184),
(10, 'ru', 377, 0.2033, 274.5),
(10, 'ru', 378, 0.1283, 252),
(22, 'ru', 378, 0.1331, 20),
(10, 'ru', 379, 0.1283, 255),
(20, 'ru', 380, 0.1177, 9),
(26, 'ru', 380, 0.1263, 278),
(10, 'ru', 380, 0.1283, 262),
(22, 'ru', 380, 0.1331, 116),
(15, 'ru', 381, 0.1231, 453),
(10, 'ru', 381, 0.1283, 266),
(25, 'ru', 381, 0.1317, 188),
(10, 'ru', 382, 0.1283, 267),
(10, 'ru', 383, 0.1283, 269),
(10, 'ru', 384, 0.1283, 276),
(11, 'ru', 384, 0.1654, 87),
(23, 'ru', 384, 0.1686, 76),
(20, 'ru', 384, 0.1866, 103),
(13, 'ru', 384, 0.191, 215),
(17, 'ru', 384, 0.1911, 78.5),
(25, 'ru', 384, 0.2088, 138.5),
(22, 'ru', 384, 0.2109, 166.5),
(24, 'ru', 384, 0.2264, 58),
(18, 'ru', 384, 0.2502, 195),
(10, 'ru', 385, 0.2033, 314.5),
(10, 'ru', 386, 0.1283, 281),
(17, 'ru', 387, 0.1206, 279),
(10, 'ru', 387, 0.2033, 301),
(18, 'ru', 388, 0.1251, 147),
(14, 'ru', 388, 0.1354, 195),
(10, 'ru', 388, 0.2033, 302),
(15, 'ru', 388, 0.2462, 179.667),
(10, 'ru', 389, 0.2033, 303),
(17, 'ru', 390, 0.1206, 485),
(21, 'ru', 390, 0.1239, 524),
(10, 'ru', 390, 0.1283, 288),
(20, 'ru', 390, 0.2733, 191.25),
(20, 'ru', 391, 0.1177, 78),
(17, 'ru', 391, 0.1206, 475),
(21, 'ru', 391, 0.1239, 73),
(10, 'ru', 391, 0.1283, 289),
(56, 'ru', 391, 0.1453, 140),
(29, 'ru', 391, 0.1894, 512.5),
(10, 'ru', 392, 0.1283, 291),
(22, 'ru', 392, 0.1331, 151),
(10, 'ru', 393, 0.2033, 300),
(22, 'ru', 393, 0.2109, 171.5),
(12, 'ru', 393, 0.3051, 44.6667),
(21, 'ru', 394, 0.1239, 132),
(10, 'ru', 394, 0.2033, 300),
(22, 'ru', 394, 0.2109, 171.5),
(15, 'ru', 394, 0.2462, 181.333),
(12, 'ru', 394, 0.3051, 44.6667),
(10, 'ru', 395, 0.1283, 294),
(10, 'ru', 396, 0.1283, 297),
(10, 'ru', 397, 0.1283, 310),
(14, 'ru', 397, 0.1354, 186),
(10, 'ru', 398, 0.1283, 312),
(10, 'ru', 399, 0.1283, 315),
(10, 'ru', 400, 0.1283, 317),
(10, 'ru', 401, 0.1283, 329),
(22, 'ru', 401, 0.1331, 78),
(54, 'ru', 401, 0.1341, 203),
(21, 'ru', 401, 0.1964, 467.5),
(53, 'ru', 401, 0.232, 49.5),
(26, 'ru', 402, 0.1263, 18),
(10, 'ru', 402, 0.1283, 330),
(24, 'ru', 402, 0.2264, 55),
(10, 'ru', 403, 0.1283, 331),
(10, 'ru', 404, 0.1283, 332),
(24, 'ru', 404, 0.1429, 118),
(10, 'ru', 405, 0.1283, 334),
(20, 'ru', 406, 0.1177, 89),
(18, 'ru', 406, 0.1251, 297),
(10, 'ru', 406, 0.1283, 337),
(10, 'ru', 407, 0.1283, 339),
(14, 'ru', 407, 0.1354, 8),
(10, 'ru', 408, 0.1283, 340),
(21, 'ru', 409, 0.1239, 139),
(10, 'ru', 409, 0.1283, 343),
(13, 'ru', 410, 0.1205, 329),
(18, 'ru', 410, 0.1251, 55),
(10, 'ru', 410, 0.1283, 346),
(19, 'ru', 410, 0.1424, 65),
(25, 'ru', 410, 0.2088, 134.5),
(24, 'ru', 410, 0.2264, 54),
(10, 'ru', 411, 0.1283, 348),
(21, 'ru', 412, 0.1239, 45),
(18, 'ru', 412, 0.1251, 35),
(27, 'ru', 412, 0.1278, 226),
(11, 'ru', 412, 0.1654, 5),
(16, 'ru', 412, 0.17, 57),
(13, 'ru', 412, 0.191, 72.5),
(22, 'ru', 412, 0.2109, 133.5),
(14, 'ru', 412, 0.2147, 246),
(29, 'ru', 412, 0.2391, 287),
(17, 'ru', 412, 0.2411, 215),
(14, 'ru', 413, 0.1354, 4),
(19, 'ru', 413, 0.1424, 13),
(11, 'ru', 413, 0.1654, 16),
(13, 'ru', 413, 0.191, 188.5),
(26, 'ru', 414, 0.1263, 207),
(27, 'ru', 414, 0.1278, 181),
(11, 'ru', 414, 0.1654, 18),
(25, 'ru', 414, 0.2088, 245.5),
(19, 'ru', 414, 0.2257, 62.5),
(13, 'ru', 414, 0.241, 251.667),
(52, 'ru', 415, 0.1387, 162),
(19, 'ru', 415, 0.1424, 8),
(49, 'ru', 415, 0.1486, 49),
(51, 'ru', 415, 0.1569, 146),
(11, 'ru', 415, 0.1654, 27),
(13, 'ru', 415, 0.191, 191.5),
(54, 'ru', 415, 0.2125, 74.5),
(13, 'ru', 416, 0.1205, 112),
(27, 'ru', 416, 0.1278, 251),
(25, 'ru', 416, 0.1317, 197),
(11, 'ru', 416, 0.1654, 28),
(26, 'ru', 416, 0.2526, 86.6667),
(13, 'ru', 417, 0.1205, 119),
(26, 'ru', 417, 0.1263, 109),
(11, 'ru', 417, 0.1654, 35),
(13, 'ru', 418, 0.1205, 120),
(11, 'ru', 418, 0.1654, 36),
(19, 'ru', 419, 0.1424, 56),
(11, 'ru', 419, 0.1654, 38),
(13, 'ru', 419, 0.191, 221),
(13, 'ru', 420, 0.1205, 123),
(11, 'ru', 420, 0.1654, 39),
(25, 'ru', 421, 0.1317, 231),
(11, 'ru', 421, 0.1654, 40),
(19, 'ru', 421, 0.2257, 18.5),
(13, 'ru', 421, 0.241, 229.667),
(26, 'ru', 422, 0.1263, 97),
(24, 'ru', 422, 0.1429, 179),
(11, 'ru', 422, 0.1654, 42),
(23, 'ru', 422, 0.1686, 23),
(13, 'ru', 422, 0.191, 166),
(52, 'ru', 422, 0.2198, 97),
(24, 'ru', 423, 0.1429, 179),
(11, 'ru', 423, 0.1654, 42),
(23, 'ru', 423, 0.1686, 23),
(13, 'ru', 423, 0.191, 166),
(52, 'ru', 423, 0.2198, 97),
(13, 'ru', 424, 0.1205, 128),
(11, 'ru', 424, 0.1654, 44),
(11, 'ru', 425, 0.1654, 45),
(23, 'ru', 425, 0.1686, 64),
(13, 'ru', 425, 0.191, 188),
(13, 'ru', 426, 0.1205, 130),
(11, 'ru', 426, 0.1654, 46),
(13, 'ru', 427, 0.1205, 130),
(11, 'ru', 427, 0.1654, 46),
(11, 'ru', 428, 0.1654, 48),
(23, 'ru', 428, 0.1686, 63),
(13, 'ru', 428, 0.191, 189),
(26, 'ru', 428, 0.2002, 136.5),
(13, 'ru', 429, 0.1205, 145),
(11, 'ru', 429, 0.1654, 61),
(13, 'ru', 430, 0.1205, 150),
(26, 'ru', 430, 0.1263, 302),
(11, 'ru', 430, 0.1654, 66),
(19, 'ru', 431, 0.1424, 45),
(11, 'ru', 431, 0.1654, 68),
(13, 'ru', 431, 0.191, 230.5),
(13, 'ru', 432, 0.1205, 153),
(11, 'ru', 432, 0.1654, 69),
(13, 'ru', 433, 0.1205, 156),
(11, 'ru', 433, 0.1654, 72),
(29, 'ru', 434, 0.1195, 113),
(13, 'ru', 434, 0.1205, 158),
(11, 'ru', 434, 0.1654, 74),
(17, 'ru', 434, 0.1911, 162.5),
(20, 'ru', 434, 0.4908, 287.647),
(29, 'ru', 435, 0.1195, 265),
(13, 'ru', 435, 0.1205, 160),
(22, 'ru', 435, 0.1331, 39),
(14, 'ru', 435, 0.1354, 16),
(11, 'ru', 435, 0.1654, 76),
(21, 'ru', 435, 0.1964, 502.5),
(19, 'ru', 436, 0.1424, 179),
(24, 'ru', 436, 0.1429, 56),
(53, 'ru', 436, 0.1464, 126),
(11, 'ru', 436, 0.1654, 86),
(23, 'ru', 436, 0.1686, 75),
(16, 'ru', 436, 0.17, 80),
(55, 'ru', 436, 0.2236, 166),
(13, 'ru', 436, 0.2798, 237.5),
(13, 'ru', 437, 0.1205, 181),
(25, 'ru', 437, 0.1317, 105),
(11, 'ru', 437, 0.1654, 97),
(12, 'ru', 437, 0.3542, 111.25),
(26, 'ru', 438, 0.1263, 287),
(12, 'ru', 438, 0.1526, 6),
(12, 'ru', 439, 0.1526, 7),
(13, 'ru', 440, 0.1205, 44),
(22, 'ru', 440, 0.1331, 142),
(52, 'ru', 440, 0.1387, 230),
(55, 'ru', 440, 0.1411, 27),
(12, 'ru', 440, 0.1526, 8),
(16, 'ru', 440, 0.17, 45),
(17, 'ru', 441, 0.1206, 13),
(12, 'ru', 441, 0.4283, 87.1667),
(12, 'ru', 442, 0.1526, 16),
(12, 'ru', 443, 0.1526, 22),
(29, 'ru', 444, 0.1195, 212),
(26, 'ru', 444, 0.1263, 67),
(25, 'ru', 444, 0.1317, 67),
(12, 'ru', 444, 0.1526, 23),
(17, 'ru', 445, 0.1206, 481),
(12, 'ru', 445, 0.2418, 103.5),
(12, 'ru', 446, 0.2418, 104.5),
(12, 'ru', 447, 0.3051, 88.3333),
(12, 'ru', 448, 0.1526, 27),
(12, 'ru', 449, 0.2418, 83.5),
(12, 'ru', 450, 0.3051, 43.6667),
(12, 'ru', 451, 0.3944, 122.8),
(29, 'ru', 452, 0.1195, 503),
(18, 'ru', 452, 0.1251, 40),
(23, 'ru', 452, 0.1686, 29),
(16, 'ru', 452, 0.17, 11),
(13, 'ru', 452, 0.191, 111),
(26, 'ru', 452, 0.2002, 167),
(17, 'ru', 452, 0.2411, 117),
(12, 'ru', 452, 0.3542, 151),
(12, 'ru', 453, 0.2418, 128.5),
(55, 'ru', 454, 0.1411, 107),
(56, 'ru', 454, 0.1453, 66),
(12, 'ru', 454, 0.2418, 133.5),
(13, 'ru', 455, 0.1205, 234),
(12, 'ru', 455, 0.1526, 162),
(23, 'ru', 455, 0.1686, 51),
(47, 'ru', 455, 0.2277, 28),
(29, 'ru', 455, 0.2391, 275.667),
(12, 'ru', 456, 0.1526, 163),
(12, 'ru', 457, 0.1526, 165),
(29, 'ru', 458, 0.1195, 282),
(13, 'ru', 458, 0.1205, 33),
(26, 'ru', 458, 0.1263, 315),
(25, 'ru', 458, 0.1317, 175),
(12, 'ru', 458, 0.1526, 167),
(16, 'ru', 458, 0.17, 34),
(13, 'ru', 459, 0.1205, 43),
(12, 'ru', 459, 0.1526, 187),
(16, 'ru', 459, 0.17, 44),
(12, 'ru', 460, 0.1526, 193),
(20, 'ru', 461, 0.1177, 223),
(29, 'ru', 461, 0.1195, 221),
(13, 'ru', 461, 0.1205, 5),
(14, 'ru', 461, 0.1354, 27),
(16, 'ru', 461, 0.17, 6),
(20, 'ru', 462, 0.1177, 84),
(29, 'ru', 462, 0.1195, 313),
(13, 'ru', 462, 0.1205, 8),
(25, 'ru', 462, 0.1317, 154),
(22, 'ru', 462, 0.1331, 197),
(14, 'ru', 462, 0.1354, 117),
(16, 'ru', 462, 0.17, 9),
(18, 'ru', 462, 0.1983, 117.5),
(13, 'ru', 463, 0.1205, 11),
(14, 'ru', 463, 0.1354, 279),
(24, 'ru', 463, 0.1429, 22),
(16, 'ru', 463, 0.17, 12),
(13, 'ru', 464, 0.1205, 13),
(16, 'ru', 464, 0.17, 14),
(13, 'ru', 465, 0.1205, 18),
(16, 'ru', 465, 0.17, 19),
(13, 'ru', 466, 0.1205, 25),
(16, 'ru', 466, 0.17, 26),
(13, 'ru', 467, 0.1205, 31),
(16, 'ru', 467, 0.17, 32),
(13, 'ru', 468, 0.1205, 32),
(16, 'ru', 468, 0.17, 33),
(13, 'ru', 469, 0.1205, 33),
(16, 'ru', 469, 0.17, 34),
(13, 'ru', 470, 0.1205, 34),
(16, 'ru', 470, 0.17, 35),
(13, 'ru', 471, 0.1205, 35),
(16, 'ru', 471, 0.17, 36),
(19, 'ru', 472, 0.1424, 87),
(16, 'ru', 472, 0.17, 38),
(13, 'ru', 472, 0.191, 194),
(13, 'ru', 473, 0.1205, 40),
(16, 'ru', 473, 0.17, 41),
(13, 'ru', 474, 0.1205, 42),
(16, 'ru', 474, 0.17, 43),
(13, 'ru', 475, 0.1205, 47),
(16, 'ru', 475, 0.17, 48),
(26, 'ru', 476, 0.1263, 139),
(19, 'ru', 476, 0.1424, 3),
(16, 'ru', 476, 0.17, 59),
(29, 'ru', 476, 0.1894, 104),
(13, 'ru', 476, 0.191, 162.5),
(13, 'ru', 477, 0.1205, 59),
(14, 'ru', 477, 0.1354, 105),
(16, 'ru', 477, 0.17, 60),
(13, 'ru', 478, 0.1205, 60),
(26, 'ru', 478, 0.1263, 255),
(16, 'ru', 478, 0.17, 61),
(29, 'ru', 479, 0.1195, 559),
(13, 'ru', 479, 0.1205, 61),
(27, 'ru', 479, 0.1278, 252),
(25, 'ru', 479, 0.1317, 199),
(16, 'ru', 479, 0.17, 62),
(26, 'ru', 479, 0.2526, 124),
(13, 'ru', 480, 0.1205, 62),
(16, 'ru', 480, 0.17, 63),
(29, 'ru', 481, 0.1195, 19),
(13, 'ru', 481, 0.1205, 63),
(26, 'ru', 481, 0.1263, 140),
(16, 'ru', 481, 0.17, 64),
(13, 'ru', 482, 0.1205, 65),
(26, 'ru', 482, 0.1263, 77),
(16, 'ru', 482, 0.17, 66),
(29, 'ru', 483, 0.1195, 349),
(19, 'ru', 483, 0.1424, 123),
(24, 'ru', 483, 0.1429, 26),
(16, 'ru', 483, 0.17, 76),
(13, 'ru', 483, 0.191, 231),
(13, 'ru', 484, 0.1205, 76),
(26, 'ru', 484, 0.1263, 107),
(25, 'ru', 484, 0.1317, 127),
(16, 'ru', 484, 0.17, 77),
(29, 'ru', 485, 0.1195, 80),
(13, 'ru', 485, 0.1205, 77),
(16, 'ru', 485, 0.17, 78),
(13, 'ru', 486, 0.1205, 83),
(25, 'ru', 486, 0.1317, 162),
(14, 'ru', 486, 0.1354, 1),
(16, 'ru', 486, 0.17, 84),
(27, 'ru', 487, 0.1278, 278),
(25, 'ru', 487, 0.1317, 138),
(26, 'ru', 487, 0.2002, 133.5),
(24, 'ru', 487, 0.2264, 123.5),
(13, 'ru', 487, 0.241, 211.667),
(23, 'ru', 487, 0.3372, 28.6667),
(13, 'ru', 488, 0.1205, 190),
(26, 'ru', 488, 0.1263, 187),
(23, 'ru', 488, 0.1686, 7),
(13, 'ru', 489, 0.1205, 190),
(26, 'ru', 489, 0.1263, 187),
(23, 'ru', 489, 0.1686, 7),
(20, 'ru', 490, 0.1177, 34),
(29, 'ru', 490, 0.1195, 112),
(23, 'ru', 490, 0.1686, 9),
(26, 'ru', 490, 0.2002, 204),
(25, 'ru', 490, 0.2088, 23.5),
(17, 'ru', 490, 0.2411, 136),
(13, 'ru', 490, 0.3383, 334.5),
(19, 'ru', 490, 0.3681, 99),
(20, 'ru', 491, 0.1177, 48),
(29, 'ru', 491, 0.1195, 563),
(25, 'ru', 491, 0.1317, 139),
(24, 'ru', 491, 0.1429, 113),
(19, 'ru', 491, 0.2257, 113),
(26, 'ru', 491, 0.2526, 228),
(23, 'ru', 491, 0.2672, 35.5),
(13, 'ru', 491, 0.2798, 297.75),
(20, 'ru', 492, 0.1177, 70),
(13, 'ru', 492, 0.1205, 202),
(23, 'ru', 492, 0.1686, 19),
(19, 'ru', 493, 0.1424, 160),
(23, 'ru', 493, 0.1686, 24),
(13, 'ru', 493, 0.191, 315.5),
(26, 'ru', 493, 0.2002, 70.5),
(13, 'ru', 494, 0.1205, 209),
(23, 'ru', 494, 0.1686, 26),
(13, 'ru', 495, 0.1205, 215),
(23, 'ru', 495, 0.1686, 32),
(13, 'ru', 496, 0.1205, 216),
(23, 'ru', 496, 0.1686, 33),
(13, 'ru', 497, 0.1205, 218),
(23, 'ru', 497, 0.1686, 35),
(13, 'ru', 498, 0.1205, 224),
(23, 'ru', 498, 0.1686, 41),
(13, 'ru', 499, 0.1205, 224),
(23, 'ru', 499, 0.1686, 41),
(13, 'ru', 500, 0.1205, 226),
(26, 'ru', 500, 0.1263, 115),
(23, 'ru', 500, 0.1686, 43),
(13, 'ru', 501, 0.1205, 227),
(23, 'ru', 501, 0.1686, 44),
(27, 'ru', 501, 0.2025, 108.5),
(13, 'ru', 502, 0.1205, 238),
(26, 'ru', 502, 0.1263, 369),
(25, 'ru', 502, 0.1317, 19),
(23, 'ru', 502, 0.1686, 55),
(14, 'ru', 502, 0.2147, 240),
(13, 'ru', 503, 0.1205, 242),
(23, 'ru', 503, 0.1686, 59),
(13, 'ru', 504, 0.1205, 243),
(23, 'ru', 504, 0.1686, 60),
(13, 'ru', 505, 0.1205, 261),
(24, 'ru', 505, 0.1429, 1),
(23, 'ru', 505, 0.1686, 78),
(13, 'ru', 506, 0.1205, 263),
(24, 'ru', 506, 0.1429, 114),
(23, 'ru', 506, 0.1686, 80),
(21, 'ru', 506, 0.484, 203.143),
(13, 'ru', 507, 0.191, 353),
(27, 'ru', 507, 0.2025, 81.5),
(19, 'ru', 507, 0.2257, 89),
(21, 'ru', 508, 0.1239, 81),
(26, 'ru', 508, 0.1263, 356),
(13, 'ru', 508, 0.191, 354),
(19, 'ru', 508, 0.2257, 90),
(13, 'ru', 509, 0.1205, 273),
(52, 'ru', 509, 0.1387, 163),
(19, 'ru', 509, 0.1424, 9),
(49, 'ru', 509, 0.1486, 50),
(51, 'ru', 509, 0.1569, 147),
(54, 'ru', 509, 0.2125, 75.5),
(13, 'ru', 510, 0.1205, 276),
(19, 'ru', 510, 0.1424, 12),
(13, 'ru', 511, 0.1205, 278),
(21, 'ru', 511, 0.1239, 556),
(19, 'ru', 511, 0.1424, 14),
(29, 'ru', 512, 0.1195, 567),
(13, 'ru', 512, 0.1205, 282),
(19, 'ru', 512, 0.1424, 18),
(13, 'ru', 513, 0.1205, 292),
(19, 'ru', 513, 0.1424, 28),
(13, 'ru', 514, 0.1205, 294),
(19, 'ru', 514, 0.1424, 30),
(13, 'ru', 515, 0.1205, 296),
(19, 'ru', 515, 0.1424, 32),
(13, 'ru', 516, 0.1205, 298),
(19, 'ru', 516, 0.1424, 34),
(29, 'ru', 517, 0.1195, 553),
(13, 'ru', 517, 0.1205, 299),
(17, 'ru', 517, 0.1206, 304),
(19, 'ru', 517, 0.1424, 35),
(29, 'ru', 518, 0.1195, 553),
(13, 'ru', 518, 0.1205, 299),
(21, 'ru', 518, 0.1239, 134),
(22, 'ru', 518, 0.1331, 19),
(19, 'ru', 518, 0.1424, 35),
(17, 'ru', 518, 0.1911, 253),
(13, 'ru', 519, 0.1205, 300),
(19, 'ru', 519, 0.1424, 36),
(13, 'ru', 520, 0.1205, 302),
(17, 'ru', 520, 0.1206, 250),
(14, 'ru', 520, 0.1354, 293),
(19, 'ru', 520, 0.1424, 38),
(13, 'ru', 521, 0.1205, 308),
(19, 'ru', 521, 0.1424, 44),
(13, 'ru', 522, 0.1205, 310),
(19, 'ru', 522, 0.1424, 46),
(13, 'ru', 523, 0.191, 380.5),
(17, 'ru', 523, 0.1911, 4),
(19, 'ru', 523, 0.2257, 116.5),
(13, 'ru', 524, 0.1205, 316),
(19, 'ru', 524, 0.1424, 52),
(13, 'ru', 525, 0.1205, 317),
(19, 'ru', 525, 0.1424, 53),
(29, 'ru', 526, 0.1195, 137),
(13, 'ru', 526, 0.1205, 318),
(26, 'ru', 526, 0.1263, 264),
(19, 'ru', 526, 0.1424, 54),
(13, 'ru', 527, 0.1205, 321),
(19, 'ru', 527, 0.1424, 57),
(20, 'ru', 528, 0.1177, 7),
(13, 'ru', 528, 0.1205, 322),
(18, 'ru', 528, 0.1251, 18),
(26, 'ru', 528, 0.1263, 276),
(27, 'ru', 528, 0.1278, 288),
(19, 'ru', 528, 0.1424, 58),
(13, 'ru', 529, 0.1205, 335),
(19, 'ru', 529, 0.1424, 71),
(13, 'ru', 530, 0.1205, 336),
(19, 'ru', 530, 0.1424, 72),
(13, 'ru', 531, 0.1205, 338),
(19, 'ru', 531, 0.1424, 74),
(13, 'ru', 532, 0.1205, 340),
(26, 'ru', 532, 0.1263, 231),
(19, 'ru', 532, 0.1424, 76),
(13, 'ru', 533, 0.1205, 344),
(19, 'ru', 533, 0.1424, 80),
(27, 'ru', 533, 0.2967, 195.25),
(13, 'ru', 534, 0.1205, 353),
(19, 'ru', 534, 0.1424, 89),
(13, 'ru', 535, 0.1205, 354),
(26, 'ru', 535, 0.1263, 181),
(19, 'ru', 535, 0.1424, 90),
(13, 'ru', 536, 0.1205, 354),
(19, 'ru', 536, 0.1424, 90),
(26, 'ru', 536, 0.2002, 257.5),
(13, 'ru', 537, 0.1205, 358),
(19, 'ru', 537, 0.1424, 94),
(13, 'ru', 538, 0.1205, 363),
(19, 'ru', 538, 0.1424, 99),
(29, 'ru', 538, 0.2391, 492.333),
(13, 'ru', 539, 0.1205, 367),
(25, 'ru', 539, 0.1317, 262),
(19, 'ru', 539, 0.1424, 103),
(20, 'ru', 540, 0.1177, 5),
(13, 'ru', 540, 0.1205, 378),
(54, 'ru', 540, 0.1341, 189),
(19, 'ru', 540, 0.1424, 114),
(13, 'ru', 541, 0.1205, 381),
(19, 'ru', 541, 0.1424, 117),
(20, 'ru', 541, 0.1866, 14),
(18, 'ru', 541, 0.1983, 280),
(13, 'ru', 542, 0.1205, 382),
(19, 'ru', 542, 0.1424, 118),
(24, 'ru', 542, 0.1429, 61),
(20, 'ru', 542, 0.1866, 34.5),
(22, 'ru', 542, 0.2109, 171.5),
(20, 'ru', 543, 0.1177, 27),
(13, 'ru', 543, 0.1205, 388),
(17, 'ru', 543, 0.1206, 178),
(22, 'ru', 543, 0.1331, 124),
(19, 'ru', 543, 0.1424, 124),
(25, 'ru', 543, 0.2088, 148),
(24, 'ru', 543, 0.2264, 108),
(13, 'ru', 544, 0.1205, 389),
(17, 'ru', 544, 0.1206, 317),
(19, 'ru', 544, 0.1424, 125),
(18, 'ru', 544, 0.1983, 167),
(24, 'ru', 544, 0.2264, 45),
(15, 'ru', 544, 0.2462, 141.333),
(13, 'ru', 545, 0.1205, 398),
(18, 'ru', 545, 0.1251, 173),
(19, 'ru', 545, 0.1424, 134),
(17, 'ru', 545, 0.1911, 349.5),
(20, 'ru', 545, 0.2733, 366.5),
(13, 'ru', 546, 0.1205, 402),
(19, 'ru', 546, 0.1424, 138),
(13, 'ru', 547, 0.1205, 405),
(18, 'ru', 547, 0.1251, 45),
(19, 'ru', 547, 0.1424, 141),
(13, 'ru', 548, 0.1205, 413),
(26, 'ru', 548, 0.1263, 59),
(19, 'ru', 548, 0.1424, 149),
(13, 'ru', 549, 0.1205, 414),
(19, 'ru', 549, 0.1424, 150),
(13, 'ru', 550, 0.1205, 415),
(19, 'ru', 550, 0.1424, 151),
(13, 'ru', 551, 0.1205, 415),
(19, 'ru', 551, 0.1424, 151),
(13, 'ru', 552, 0.1205, 417),
(19, 'ru', 552, 0.1424, 153),
(13, 'ru', 553, 0.1205, 425),
(19, 'ru', 553, 0.1424, 161),
(13, 'ru', 554, 0.1205, 426),
(19, 'ru', 554, 0.1424, 162),
(26, 'ru', 554, 0.2526, 126.667),
(13, 'ru', 555, 0.1205, 428),
(19, 'ru', 555, 0.1424, 164),
(13, 'ru', 556, 0.1205, 430),
(19, 'ru', 556, 0.1424, 166),
(13, 'ru', 557, 0.1205, 430),
(19, 'ru', 557, 0.1424, 166),
(13, 'ru', 558, 0.1205, 449),
(19, 'ru', 558, 0.1424, 185),
(20, 'ru', 558, 0.1866, 107.5),
(13, 'ru', 559, 0.1205, 451),
(17, 'ru', 559, 0.1206, 314),
(19, 'ru', 559, 0.1424, 187),
(20, 'ru', 559, 0.2733, 452.75),
(18, 'ru', 559, 0.3512, 138.5),
(14, 'ru', 560, 0.1354, 11),
(22, 'ru', 561, 0.1331, 38),
(14, 'ru', 561, 0.1354, 15),
(14, 'ru', 562, 0.1354, 18),
(14, 'ru', 563, 0.1354, 19),
(18, 'ru', 564, 0.1251, 49),
(24, 'ru', 564, 0.1429, 192),
(14, 'ru', 564, 0.2147, 67.5),
(21, 'ru', 564, 0.2478, 135),
(20, 'ru', 564, 0.2733, 368.75),
(15, 'ru', 565, 0.1231, 230),
(14, 'ru', 565, 0.1354, 38),
(20, 'ru', 565, 0.1866, 307.5),
(15, 'ru', 566, 0.1231, 103),
(14, 'ru', 566, 0.1354, 52),
(17, 'ru', 567, 0.1206, 491),
(18, 'ru', 567, 0.1983, 173),
(14, 'ru', 567, 0.2147, 76.5),
(15, 'ru', 567, 0.3693, 230),
(14, 'ru', 568, 0.1354, 75),
(14, 'ru', 569, 0.1354, 89),
(24, 'ru', 569, 0.1429, 141),
(17, 'ru', 570, 0.1206, 35),
(14, 'ru', 570, 0.1354, 106),
(21, 'ru', 570, 0.2877, 475.25),
(14, 'ru', 571, 0.1354, 107),
(14, 'ru', 572, 0.1354, 111),
(29, 'ru', 573, 0.1195, 529),
(14, 'ru', 573, 0.1354, 114),
(20, 'ru', 574, 0.1177, 83),
(22, 'ru', 574, 0.1331, 196),
(52, 'ru', 574, 0.1387, 178),
(18, 'ru', 574, 0.1983, 116.5),
(14, 'ru', 574, 0.2147, 190),
(14, 'ru', 575, 0.1354, 121),
(18, 'ru', 575, 0.1983, 236.5),
(29, 'ru', 576, 0.1195, 493),
(26, 'ru', 576, 0.1263, 265),
(22, 'ru', 576, 0.1331, 148),
(14, 'ru', 576, 0.2147, 181.5),
(14, 'ru', 577, 0.1354, 129),
(14, 'ru', 578, 0.1354, 133),
(14, 'ru', 579, 0.1354, 134),
(14, 'ru', 580, 0.1354, 137),
(14, 'ru', 581, 0.1354, 138),
(14, 'ru', 582, 0.1354, 142),
(14, 'ru', 583, 0.1354, 143),
(17, 'ru', 584, 0.1206, 344),
(14, 'ru', 584, 0.1354, 144),
(17, 'ru', 585, 0.1206, 435),
(21, 'ru', 585, 0.1239, 54),
(14, 'ru', 585, 0.1354, 148),
(14, 'ru', 586, 0.1354, 163),
(14, 'ru', 587, 0.1354, 165),
(14, 'ru', 588, 0.1354, 173),
(14, 'ru', 589, 0.1354, 175),
(14, 'ru', 590, 0.2147, 182.5),
(14, 'ru', 591, 0.1354, 181),
(14, 'ru', 592, 0.1354, 183),
(14, 'ru', 593, 0.1354, 188),
(29, 'ru', 594, 0.1195, 458),
(17, 'ru', 594, 0.1206, 458),
(22, 'ru', 594, 0.1331, 172),
(14, 'ru', 594, 0.1354, 190),
(14, 'ru', 595, 0.2147, 223.5),
(20, 'ru', 596, 0.1177, 454),
(29, 'ru', 596, 0.1195, 90),
(14, 'ru', 596, 0.2147, 245),
(25, 'ru', 596, 0.2634, 96.6667),
(14, 'ru', 597, 0.1354, 212),
(14, 'ru', 598, 0.1354, 214),
(14, 'ru', 599, 0.1354, 217),
(29, 'ru', 600, 0.1195, 485),
(54, 'ru', 600, 0.1341, 120),
(14, 'ru', 600, 0.1354, 220),
(14, 'ru', 601, 0.1354, 221),
(14, 'ru', 602, 0.1354, 229),
(14, 'ru', 603, 0.1354, 230),
(14, 'ru', 604, 0.1354, 231),
(17, 'ru', 605, 0.1206, 72),
(14, 'ru', 605, 0.1354, 232),
(29, 'ru', 605, 0.2775, 470.25),
(14, 'ru', 606, 0.1354, 235),
(14, 'ru', 607, 0.1354, 239),
(20, 'ru', 608, 0.1177, 102),
(22, 'ru', 608, 0.1331, 14),
(14, 'ru', 608, 0.1354, 244),
(26, 'ru', 608, 0.2002, 272);
INSERT INTO `b_search_content_stem` (`SEARCH_CONTENT_ID`, `LANGUAGE_ID`, `STEM`, `TF`, `PS`) VALUES
(14, 'ru', 609, 0.1354, 245),
(29, 'ru', 610, 0.1195, 561),
(17, 'ru', 610, 0.1206, 425),
(56, 'ru', 610, 0.1453, 76),
(14, 'ru', 610, 0.2147, 248.5),
(14, 'ru', 611, 0.1354, 247),
(14, 'ru', 612, 0.1354, 249),
(14, 'ru', 613, 0.1354, 266),
(14, 'ru', 614, 0.1354, 281),
(14, 'ru', 615, 0.1354, 292),
(14, 'ru', 616, 0.1354, 295),
(14, 'ru', 617, 0.1354, 296),
(27, 'ru', 617, 0.2025, 268),
(14, 'ru', 618, 0.1354, 297),
(14, 'ru', 619, 0.1354, 298),
(22, 'ru', 620, 0.1331, 204),
(14, 'ru', 620, 0.1354, 301),
(15, 'ru', 620, 0.2462, 431),
(21, 'ru', 620, 0.2877, 517.75),
(15, 'ru', 621, 0.1231, 12),
(25, 'ru', 621, 0.1317, 288),
(15, 'ru', 622, 0.2858, 185.75),
(24, 'ru', 623, 0.1429, 78),
(18, 'ru', 623, 0.1983, 167),
(15, 'ru', 623, 0.2462, 141.333),
(15, 'ru', 624, 0.1951, 195.5),
(17, 'ru', 625, 0.1206, 73),
(21, 'ru', 625, 0.1964, 290),
(15, 'ru', 625, 0.2858, 204),
(15, 'ru', 626, 0.2462, 211.667),
(25, 'ru', 627, 0.1317, 173),
(22, 'ru', 627, 0.1331, 122),
(20, 'ru', 627, 0.1866, 371.5),
(15, 'ru', 627, 0.1951, 64.5),
(15, 'ru', 628, 0.1951, 65),
(15, 'ru', 629, 0.1231, 51),
(22, 'ru', 629, 0.1331, 161),
(17, 'ru', 629, 0.1911, 341.5),
(18, 'ru', 629, 0.2502, 125.333),
(24, 'ru', 629, 0.2857, 97),
(29, 'ru', 630, 0.1195, 512),
(15, 'ru', 630, 0.1951, 67.5),
(15, 'ru', 631, 0.1231, 62),
(15, 'ru', 632, 0.1231, 66),
(22, 'ru', 633, 0.1331, 215),
(24, 'ru', 633, 0.1429, 181),
(15, 'ru', 633, 0.1951, 140.5),
(20, 'ru', 633, 0.3304, 402),
(15, 'ru', 634, 0.1231, 70),
(15, 'ru', 635, 0.1231, 73),
(15, 'ru', 636, 0.1231, 80),
(17, 'ru', 637, 0.1206, 338),
(15, 'ru', 637, 0.1231, 82),
(26, 'ru', 637, 0.1263, 72),
(15, 'ru', 638, 0.1231, 84),
(25, 'ru', 638, 0.1317, 28),
(24, 'ru', 638, 0.1429, 127),
(15, 'ru', 639, 0.1231, 94),
(15, 'ru', 640, 0.1231, 97),
(20, 'ru', 641, 0.1177, 170),
(15, 'ru', 641, 0.1231, 99),
(21, 'ru', 641, 0.1964, 466.5),
(15, 'ru', 642, 0.3456, 201.167),
(15, 'ru', 643, 0.1951, 188.5),
(15, 'ru', 644, 0.1951, 188.5),
(15, 'ru', 645, 0.1231, 115),
(20, 'ru', 646, 0.1177, 11),
(24, 'ru', 646, 0.1429, 28),
(17, 'ru', 646, 0.1911, 364.5),
(15, 'ru', 646, 0.1951, 145.5),
(15, 'ru', 647, 0.1231, 118),
(18, 'ru', 648, 0.1251, 234),
(25, 'ru', 648, 0.1317, 179),
(22, 'ru', 648, 0.1331, 143),
(17, 'ru', 648, 0.2411, 291),
(15, 'ru', 648, 0.2858, 260),
(21, 'ru', 648, 0.4286, 165.9),
(15, 'ru', 649, 0.1231, 159),
(22, 'ru', 649, 0.1331, 129),
(15, 'ru', 650, 0.1951, 272),
(29, 'ru', 651, 0.1195, 82),
(17, 'ru', 651, 0.1206, 205),
(26, 'ru', 651, 0.1263, 148),
(15, 'ru', 651, 0.1951, 276),
(15, 'ru', 652, 0.1951, 277),
(15, 'ru', 653, 0.1951, 285),
(15, 'ru', 654, 0.2462, 252),
(17, 'ru', 655, 0.1206, 236),
(15, 'ru', 655, 0.1231, 180),
(26, 'ru', 655, 0.1263, 49),
(25, 'ru', 655, 0.1317, 9),
(24, 'ru', 655, 0.1429, 68),
(29, 'ru', 655, 0.1894, 344.5),
(27, 'ru', 655, 0.2025, 164.5),
(18, 'ru', 655, 0.2904, 207.5),
(29, 'ru', 656, 0.1195, 204),
(15, 'ru', 656, 0.1951, 325.5),
(15, 'ru', 657, 0.1231, 205),
(15, 'ru', 658, 0.1231, 206),
(25, 'ru', 658, 0.1317, 157),
(29, 'ru', 658, 0.1894, 131),
(17, 'ru', 658, 0.1911, 285.5),
(15, 'ru', 659, 0.1231, 213),
(54, 'ru', 659, 0.1341, 192),
(15, 'ru', 660, 0.1231, 214),
(54, 'ru', 660, 0.1341, 173),
(29, 'ru', 661, 0.1195, 454),
(21, 'ru', 661, 0.1239, 491),
(15, 'ru', 661, 0.1951, 236),
(15, 'ru', 662, 0.1951, 275.5),
(15, 'ru', 663, 0.1231, 277),
(15, 'ru', 664, 0.1951, 307),
(15, 'ru', 665, 0.1951, 298),
(15, 'ru', 666, 0.1231, 307),
(55, 'ru', 666, 0.1411, 273),
(15, 'ru', 667, 0.1231, 335),
(15, 'ru', 668, 0.1951, 359),
(15, 'ru', 669, 0.1231, 341),
(24, 'ru', 669, 0.1429, 125),
(22, 'ru', 669, 0.2109, 30.5),
(15, 'ru', 670, 0.1231, 350),
(15, 'ru', 671, 0.1231, 354),
(15, 'ru', 672, 0.1231, 360),
(15, 'ru', 673, 0.1231, 398),
(15, 'ru', 674, 0.1231, 411),
(22, 'ru', 674, 0.2109, 75),
(15, 'ru', 675, 0.1951, 430.5),
(15, 'ru', 676, 0.1231, 443),
(15, 'ru', 677, 0.1231, 445),
(54, 'ru', 677, 0.1341, 177),
(29, 'ru', 678, 0.1195, 341),
(15, 'ru', 678, 0.1231, 448),
(18, 'ru', 678, 0.1251, 11),
(24, 'ru', 678, 0.2264, 67.5),
(20, 'ru', 678, 0.3043, 245.8),
(15, 'ru', 679, 0.1231, 454),
(26, 'ru', 680, 0.1263, 112),
(16, 'ru', 680, 0.17, 1),
(25, 'ru', 680, 0.2634, 118),
(17, 'ru', 681, 0.1206, 9),
(17, 'ru', 682, 0.1911, 119.5),
(21, 'ru', 683, 0.1239, 502),
(17, 'ru', 683, 0.1911, 65),
(29, 'ru', 684, 0.1195, 544),
(17, 'ru', 684, 0.1206, 28),
(18, 'ru', 684, 0.1251, 61),
(17, 'ru', 685, 0.1911, 46.5),
(54, 'ru', 686, 0.1341, 152),
(52, 'ru', 686, 0.1387, 40),
(56, 'ru', 686, 0.1453, 227),
(53, 'ru', 686, 0.1464, 102),
(17, 'ru', 686, 0.1911, 172.5),
(18, 'ru', 687, 0.1983, 263.5),
(17, 'ru', 687, 0.2411, 203),
(17, 'ru', 688, 0.1206, 50),
(17, 'ru', 689, 0.1911, 86),
(29, 'ru', 690, 0.1195, 114),
(17, 'ru', 690, 0.1206, 85),
(20, 'ru', 690, 0.4908, 288.647),
(20, 'ru', 691, 0.1177, 58),
(17, 'ru', 691, 0.1206, 89),
(17, 'ru', 692, 0.1206, 90),
(17, 'ru', 693, 0.1206, 91),
(17, 'ru', 694, 0.2799, 105.5),
(17, 'ru', 695, 0.2411, 112),
(17, 'ru', 696, 0.1206, 107),
(17, 'ru', 697, 0.1911, 119),
(17, 'ru', 698, 0.1206, 122),
(21, 'ru', 698, 0.1964, 436.5),
(17, 'ru', 699, 0.1206, 125),
(17, 'ru', 700, 0.1206, 135),
(17, 'ru', 701, 0.1206, 136),
(20, 'ru', 702, 0.1177, 60),
(17, 'ru', 702, 0.4822, 442.667),
(17, 'ru', 703, 0.1206, 155),
(17, 'ru', 704, 0.1206, 160),
(18, 'ru', 705, 0.1983, 191.5),
(17, 'ru', 705, 0.2411, 312),
(17, 'ru', 706, 0.1206, 165),
(24, 'ru', 707, 0.1429, 109),
(17, 'ru', 707, 0.1911, 193),
(17, 'ru', 708, 0.1206, 174),
(22, 'ru', 708, 0.1331, 52),
(20, 'ru', 709, 0.1177, 340),
(17, 'ru', 709, 0.1206, 179),
(17, 'ru', 710, 0.1206, 181),
(18, 'ru', 710, 0.1251, 187),
(25, 'ru', 710, 0.1317, 211),
(22, 'ru', 710, 0.1331, 165),
(24, 'ru', 710, 0.1429, 10),
(17, 'ru', 711, 0.1206, 186),
(18, 'ru', 711, 0.1251, 141),
(17, 'ru', 712, 0.1206, 187),
(17, 'ru', 713, 0.1206, 189),
(17, 'ru', 714, 0.1911, 248.5),
(17, 'ru', 715, 0.1206, 197),
(17, 'ru', 716, 0.1206, 198),
(17, 'ru', 717, 0.1206, 207),
(17, 'ru', 718, 0.1206, 224),
(22, 'ru', 719, 0.1331, 125),
(17, 'ru', 719, 0.2411, 263.667),
(47, 'ru', 719, 0.4553, 16.3333),
(22, 'ru', 720, 0.1331, 126),
(17, 'ru', 720, 0.3116, 266),
(22, 'ru', 721, 0.1331, 127),
(17, 'ru', 721, 0.1911, 243),
(24, 'ru', 721, 0.2857, 81.6667),
(18, 'ru', 721, 0.2904, 205.5),
(17, 'ru', 722, 0.1206, 239),
(22, 'ru', 722, 0.2109, 144.5),
(17, 'ru', 723, 0.1206, 240),
(22, 'ru', 723, 0.1331, 136),
(17, 'ru', 724, 0.1206, 249),
(26, 'ru', 724, 0.1263, 274),
(24, 'ru', 724, 0.1429, 58),
(18, 'ru', 724, 0.1983, 291.5),
(20, 'ru', 724, 0.2733, 186.5),
(17, 'ru', 725, 0.1206, 255),
(17, 'ru', 726, 0.1206, 256),
(17, 'ru', 727, 0.1206, 257),
(17, 'ru', 728, 0.1206, 259),
(25, 'ru', 729, 0.1317, 112),
(17, 'ru', 729, 0.1911, 378),
(17, 'ru', 730, 0.1206, 265),
(17, 'ru', 731, 0.1206, 271),
(17, 'ru', 732, 0.1206, 282),
(26, 'ru', 732, 0.1263, 39),
(29, 'ru', 732, 0.2391, 499.333),
(17, 'ru', 733, 0.1911, 287),
(17, 'ru', 734, 0.1206, 285),
(17, 'ru', 735, 0.1206, 286),
(17, 'ru', 736, 0.1206, 287),
(18, 'ru', 736, 0.1983, 279),
(17, 'ru', 737, 0.1206, 292),
(17, 'ru', 738, 0.1206, 294),
(17, 'ru', 739, 0.1206, 300),
(17, 'ru', 740, 0.1206, 318),
(17, 'ru', 741, 0.1206, 321),
(17, 'ru', 742, 0.1206, 326),
(17, 'ru', 743, 0.2799, 382.75),
(17, 'ru', 744, 0.1911, 340),
(17, 'ru', 745, 0.1206, 333),
(24, 'ru', 745, 0.1429, 44),
(18, 'ru', 745, 0.2904, 156.25),
(17, 'ru', 746, 0.1206, 334),
(17, 'ru', 747, 0.1206, 337),
(18, 'ru', 747, 0.1251, 169),
(17, 'ru', 748, 0.1206, 340),
(24, 'ru', 748, 0.1429, 188),
(17, 'ru', 749, 0.1206, 342),
(18, 'ru', 749, 0.4155, 256),
(17, 'ru', 750, 0.1206, 345),
(18, 'ru', 750, 0.1251, 257),
(17, 'ru', 751, 0.1206, 348),
(17, 'ru', 752, 0.1206, 358),
(17, 'ru', 753, 0.1206, 363),
(24, 'ru', 753, 0.1429, 123),
(20, 'ru', 754, 0.1177, 131),
(17, 'ru', 754, 0.1206, 367),
(18, 'ru', 754, 0.1251, 255),
(17, 'ru', 755, 0.1206, 373),
(26, 'ru', 755, 0.1263, 161),
(29, 'ru', 755, 0.1894, 206.5),
(22, 'ru', 755, 0.2661, 138.667),
(17, 'ru', 756, 0.1206, 374),
(17, 'ru', 757, 0.1206, 381),
(17, 'ru', 758, 0.1206, 387),
(17, 'ru', 759, 0.1206, 388),
(20, 'ru', 760, 0.1177, 365),
(17, 'ru', 760, 0.1206, 390),
(54, 'ru', 760, 0.1341, 133),
(17, 'ru', 761, 0.1206, 394),
(22, 'ru', 761, 0.1331, 167),
(17, 'ru', 762, 0.1206, 423),
(18, 'ru', 762, 0.2502, 202.667),
(17, 'ru', 763, 0.1206, 424),
(17, 'ru', 764, 0.1206, 426),
(29, 'ru', 765, 0.1195, 288),
(17, 'ru', 765, 0.1206, 428),
(17, 'ru', 766, 0.1911, 446.5),
(17, 'ru', 767, 0.1206, 430),
(18, 'ru', 767, 0.1251, 33),
(54, 'ru', 767, 0.1341, 162),
(17, 'ru', 768, 0.1206, 432),
(17, 'ru', 769, 0.1206, 440),
(22, 'ru', 769, 0.1331, 190),
(20, 'ru', 770, 0.1177, 531),
(17, 'ru', 770, 0.1206, 441),
(17, 'ru', 771, 0.1206, 444),
(17, 'ru', 772, 0.1206, 445),
(55, 'ru', 772, 0.1411, 90),
(17, 'ru', 773, 0.1206, 456),
(17, 'ru', 774, 0.1206, 460),
(17, 'ru', 775, 0.1206, 462),
(17, 'ru', 776, 0.1206, 463),
(27, 'ru', 776, 0.1278, 82),
(55, 'ru', 776, 0.1411, 64),
(56, 'ru', 776, 0.1453, 106),
(53, 'ru', 776, 0.1464, 61),
(29, 'ru', 776, 0.1894, 85.5),
(17, 'ru', 777, 0.1206, 470),
(17, 'ru', 778, 0.1206, 471),
(20, 'ru', 779, 0.1177, 133),
(17, 'ru', 779, 0.1206, 484),
(26, 'ru', 779, 0.1263, 300),
(29, 'ru', 780, 0.1195, 226),
(17, 'ru', 780, 0.1206, 494),
(17, 'ru', 781, 0.1206, 496),
(17, 'ru', 782, 0.1206, 498),
(17, 'ru', 783, 0.1206, 500),
(17, 'ru', 784, 0.1206, 501),
(18, 'ru', 784, 0.1251, 180),
(18, 'ru', 785, 0.1251, 15),
(29, 'ru', 785, 0.1894, 236),
(18, 'ru', 786, 0.1251, 17),
(18, 'ru', 787, 0.1251, 23),
(18, 'ru', 788, 0.1251, 25),
(20, 'ru', 789, 0.1177, 71),
(18, 'ru', 789, 0.1251, 26),
(18, 'ru', 790, 0.1983, 173.5),
(18, 'ru', 791, 0.1251, 44),
(18, 'ru', 792, 0.1251, 48),
(18, 'ru', 793, 0.1251, 51),
(26, 'ru', 793, 0.1263, 327),
(18, 'ru', 794, 0.1251, 53),
(18, 'ru', 795, 0.1251, 54),
(18, 'ru', 796, 0.1251, 56),
(18, 'ru', 797, 0.1251, 58),
(18, 'ru', 798, 0.1251, 59),
(18, 'ru', 799, 0.1251, 62),
(18, 'ru', 800, 0.5113, 137.312),
(20, 'ru', 801, 0.1177, 53),
(18, 'ru', 801, 0.1251, 75),
(18, 'ru', 802, 0.1251, 78),
(18, 'ru', 803, 0.3233, 191.4),
(18, 'ru', 804, 0.3233, 191.4),
(18, 'ru', 805, 0.1251, 84),
(18, 'ru', 806, 0.2502, 203.333),
(18, 'ru', 807, 0.2502, 203.333),
(18, 'ru', 808, 0.1251, 88),
(22, 'ru', 809, 0.1331, 104),
(18, 'ru', 809, 0.1983, 168.5),
(18, 'ru', 810, 0.1251, 90),
(18, 'ru', 811, 0.1983, 99.5),
(20, 'ru', 812, 0.1866, 104.5),
(18, 'ru', 812, 0.1983, 177.5),
(54, 'ru', 813, 0.1341, 106),
(52, 'ru', 813, 0.1387, 257),
(56, 'ru', 813, 0.1453, 130),
(53, 'ru', 813, 0.1464, 118),
(20, 'ru', 813, 0.1866, 489),
(18, 'ru', 813, 0.1983, 127.5),
(18, 'ru', 814, 0.1251, 112),
(18, 'ru', 815, 0.1983, 120.5),
(18, 'ru', 816, 0.1983, 120.5),
(18, 'ru', 817, 0.1251, 122),
(18, 'ru', 818, 0.1251, 124),
(29, 'ru', 819, 0.1195, 336),
(18, 'ru', 819, 0.1251, 142),
(20, 'ru', 820, 0.1177, 57),
(18, 'ru', 820, 0.1251, 148),
(18, 'ru', 821, 0.1251, 153),
(18, 'ru', 822, 0.1251, 154),
(26, 'ru', 822, 0.1263, 191),
(27, 'ru', 822, 0.1278, 179),
(18, 'ru', 823, 0.1251, 155),
(18, 'ru', 824, 0.1251, 156),
(18, 'ru', 825, 0.1251, 156),
(18, 'ru', 826, 0.1983, 187),
(18, 'ru', 827, 0.2502, 190),
(18, 'ru', 828, 0.2904, 190),
(18, 'ru', 829, 0.1251, 179),
(20, 'ru', 830, 0.1177, 156),
(18, 'ru', 830, 0.1251, 181),
(22, 'ru', 830, 0.2109, 150.5),
(18, 'ru', 831, 0.1251, 189),
(21, 'ru', 832, 0.1239, 102),
(18, 'ru', 832, 0.1983, 258),
(18, 'ru', 833, 0.1983, 259),
(18, 'ru', 834, 0.1251, 201),
(18, 'ru', 835, 0.1251, 215),
(18, 'ru', 836, 0.3233, 249.6),
(18, 'ru', 837, 0.1251, 235),
(18, 'ru', 838, 0.1983, 265),
(18, 'ru', 839, 0.1251, 247),
(18, 'ru', 840, 0.1251, 252),
(18, 'ru', 841, 0.1983, 282),
(18, 'ru', 842, 0.1983, 284),
(18, 'ru', 843, 0.1251, 274),
(18, 'ru', 844, 0.1251, 275),
(18, 'ru', 845, 0.1251, 280),
(18, 'ru', 846, 0.1251, 298),
(18, 'ru', 847, 0.1251, 300),
(21, 'ru', 848, 0.1239, 94),
(18, 'ru', 848, 0.1251, 301),
(18, 'ru', 849, 0.1251, 324),
(20, 'ru', 850, 0.3731, 218.125),
(20, 'ru', 851, 0.1177, 13),
(22, 'ru', 851, 0.1331, 111),
(20, 'ru', 852, 0.1177, 20),
(20, 'ru', 853, 0.1177, 29),
(22, 'ru', 853, 0.1331, 72),
(54, 'ru', 853, 0.1341, 205),
(20, 'ru', 854, 0.1866, 47.5),
(20, 'ru', 855, 0.1177, 33),
(20, 'ru', 856, 0.4708, 276.667),
(20, 'ru', 857, 0.1177, 52),
(26, 'ru', 857, 0.1263, 289),
(24, 'ru', 857, 0.1429, 4),
(20, 'ru', 858, 0.1177, 59),
(20, 'ru', 859, 0.1177, 63),
(20, 'ru', 860, 0.1177, 64),
(20, 'ru', 861, 0.1177, 65),
(20, 'ru', 862, 0.1177, 66),
(20, 'ru', 863, 0.1177, 67),
(20, 'ru', 864, 0.1177, 76),
(20, 'ru', 865, 0.1177, 87),
(22, 'ru', 865, 0.1331, 121),
(20, 'ru', 866, 0.1177, 92),
(20, 'ru', 867, 0.1866, 217),
(20, 'ru', 868, 0.3531, 312),
(20, 'ru', 869, 0.1177, 101),
(20, 'ru', 870, 0.1177, 105),
(29, 'ru', 870, 0.1195, 172),
(26, 'ru', 870, 0.1263, 178),
(20, 'ru', 871, 0.1177, 107),
(20, 'ru', 872, 0.1177, 109),
(20, 'ru', 873, 0.1177, 115),
(20, 'ru', 874, 0.1177, 116),
(26, 'ru', 874, 0.1263, 304),
(25, 'ru', 874, 0.1317, 268),
(20, 'ru', 875, 0.1177, 126),
(20, 'ru', 876, 0.1177, 132),
(20, 'ru', 877, 0.1177, 136),
(20, 'ru', 878, 0.1177, 146),
(20, 'ru', 879, 0.1177, 147),
(20, 'ru', 880, 0.1177, 152),
(20, 'ru', 881, 0.1177, 155),
(20, 'ru', 882, 0.1177, 158),
(21, 'ru', 883, 0.1239, 498),
(20, 'ru', 883, 0.2354, 324.667),
(20, 'ru', 884, 0.1177, 168),
(20, 'ru', 885, 0.1177, 172),
(24, 'ru', 886, 0.1429, 65),
(20, 'ru', 886, 0.2354, 251),
(24, 'ru', 887, 0.1429, 65),
(20, 'ru', 887, 0.2354, 251),
(24, 'ru', 888, 0.1429, 67),
(20, 'ru', 888, 0.2354, 265),
(24, 'ru', 889, 0.1429, 67),
(20, 'ru', 889, 0.2354, 265),
(20, 'ru', 890, 0.1177, 242),
(20, 'ru', 891, 0.1177, 256),
(20, 'ru', 892, 0.1177, 268),
(20, 'ru', 893, 0.1866, 361),
(20, 'ru', 894, 0.1177, 271),
(22, 'ru', 895, 0.1331, 210),
(20, 'ru', 895, 0.2354, 301.333),
(20, 'ru', 896, 0.1177, 338),
(20, 'ru', 897, 0.1177, 344),
(29, 'ru', 898, 0.1195, 500),
(22, 'ru', 898, 0.1331, 201),
(20, 'ru', 898, 0.1866, 362.5),
(20, 'ru', 899, 0.1177, 380),
(22, 'ru', 899, 0.1331, 114),
(20, 'ru', 900, 0.1177, 382),
(29, 'ru', 900, 0.1195, 522),
(22, 'ru', 900, 0.2109, 170),
(20, 'ru', 901, 0.1177, 389),
(26, 'ru', 901, 0.1263, 239),
(20, 'ru', 902, 0.1866, 406.5),
(20, 'ru', 903, 0.2733, 442.75),
(20, 'ru', 904, 0.1866, 446),
(20, 'ru', 905, 0.1177, 429),
(25, 'ru', 905, 0.1317, 180),
(24, 'ru', 905, 0.1429, 45),
(20, 'ru', 906, 0.1177, 430),
(20, 'ru', 907, 0.1177, 444),
(20, 'ru', 908, 0.1866, 485),
(20, 'ru', 909, 0.1866, 486),
(20, 'ru', 910, 0.1866, 487),
(20, 'ru', 911, 0.1866, 494),
(20, 'ru', 912, 0.1866, 497),
(20, 'ru', 913, 0.1177, 510),
(20, 'ru', 914, 0.1177, 511),
(20, 'ru', 915, 0.1177, 514),
(20, 'ru', 916, 0.1177, 516),
(20, 'ru', 917, 0.1177, 517),
(21, 'ru', 917, 0.1239, 143),
(20, 'ru', 918, 0.1177, 537),
(20, 'ru', 919, 0.1177, 547),
(24, 'ru', 920, 0.1429, 116),
(21, 'ru', 920, 0.4286, 204.8),
(25, 'ru', 921, 0.1317, 220),
(24, 'ru', 921, 0.1429, 120),
(21, 'ru', 921, 0.1964, 25.5),
(21, 'ru', 922, 0.1239, 15),
(21, 'ru', 923, 0.2478, 38.3333),
(21, 'ru', 924, 0.1239, 27),
(26, 'ru', 924, 0.1263, 135),
(21, 'ru', 925, 0.1239, 35),
(27, 'ru', 925, 0.442, 157.7),
(21, 'ru', 926, 0.1239, 36),
(21, 'ru', 927, 0.1239, 41),
(21, 'ru', 928, 0.1239, 44),
(21, 'ru', 929, 0.1239, 46),
(21, 'ru', 930, 0.1239, 53),
(21, 'ru', 931, 0.2478, 224.667),
(21, 'ru', 932, 0.2478, 225.667),
(21, 'ru', 933, 0.1239, 80),
(21, 'ru', 934, 0.1239, 88),
(21, 'ru', 935, 0.1239, 91),
(26, 'ru', 936, 0.1263, 41),
(21, 'ru', 936, 0.1964, 109),
(29, 'ru', 937, 0.1195, 518),
(21, 'ru', 937, 0.1239, 125),
(25, 'ru', 937, 0.2088, 107),
(21, 'ru', 938, 0.1239, 126),
(21, 'ru', 939, 0.1239, 138),
(52, 'ru', 939, 0.1387, 16),
(53, 'ru', 939, 0.1464, 48),
(21, 'ru', 940, 0.1239, 139),
(21, 'ru', 941, 0.1239, 142),
(21, 'ru', 942, 0.1239, 160),
(21, 'ru', 943, 0.1239, 162),
(21, 'ru', 944, 0.3927, 298.125),
(21, 'ru', 945, 0.1239, 167),
(21, 'ru', 946, 0.1964, 215.5),
(21, 'ru', 947, 0.1239, 200),
(21, 'ru', 948, 0.1239, 205),
(21, 'ru', 949, 0.2877, 312.75),
(21, 'ru', 950, 0.1239, 237),
(21, 'ru', 951, 0.1239, 242),
(21, 'ru', 952, 0.1239, 274),
(21, 'ru', 953, 0.1239, 279),
(29, 'ru', 954, 0.1195, 275),
(21, 'ru', 954, 0.1239, 313),
(21, 'ru', 955, 0.1239, 318),
(21, 'ru', 956, 0.1239, 355),
(21, 'ru', 957, 0.1239, 360),
(29, 'ru', 958, 0.1195, 461),
(21, 'ru', 958, 0.1239, 397),
(21, 'ru', 959, 0.1239, 402),
(21, 'ru', 960, 0.1239, 429),
(21, 'ru', 961, 0.1239, 431),
(21, 'ru', 962, 0.1239, 436),
(21, 'ru', 963, 0.1239, 448),
(21, 'ru', 964, 0.1964, 457.5),
(21, 'ru', 965, 0.2877, 472.25),
(21, 'ru', 966, 0.1964, 506.5),
(21, 'ru', 967, 0.1239, 488),
(21, 'ru', 968, 0.1239, 489),
(24, 'ru', 968, 0.3317, 153.5),
(21, 'ru', 969, 0.1239, 495),
(21, 'ru', 970, 0.1239, 500),
(21, 'ru', 971, 0.1239, 501),
(21, 'ru', 972, 0.1239, 505),
(21, 'ru', 973, 0.1239, 509),
(21, 'ru', 974, 0.1239, 521),
(21, 'ru', 975, 0.1239, 522),
(21, 'ru', 976, 0.1239, 530),
(21, 'ru', 977, 0.1239, 532),
(21, 'ru', 978, 0.1239, 534),
(21, 'ru', 979, 0.1239, 536),
(21, 'ru', 980, 0.1239, 538),
(25, 'ru', 980, 0.1317, 52),
(21, 'ru', 981, 0.1239, 540),
(21, 'ru', 982, 0.1239, 542),
(21, 'ru', 983, 0.1239, 555),
(22, 'ru', 984, 0.1331, 4),
(25, 'ru', 985, 0.1317, 166),
(22, 'ru', 985, 0.1331, 9),
(25, 'ru', 986, 0.1317, 193),
(22, 'ru', 986, 0.2109, 78),
(22, 'ru', 987, 0.1331, 25),
(22, 'ru', 988, 0.2661, 96.6667),
(22, 'ru', 989, 0.1331, 32),
(22, 'ru', 990, 0.1331, 35),
(29, 'ru', 991, 0.1195, 228),
(22, 'ru', 991, 0.1331, 41),
(22, 'ru', 992, 0.1331, 51),
(22, 'ru', 993, 0.1331, 53),
(22, 'ru', 994, 0.2109, 152),
(22, 'ru', 995, 0.1331, 79),
(22, 'ru', 996, 0.1331, 80),
(22, 'ru', 997, 0.1331, 86),
(22, 'ru', 998, 0.1331, 87),
(22, 'ru', 999, 0.1331, 89),
(22, 'ru', 1000, 0.1331, 92),
(22, 'ru', 1001, 0.1331, 96),
(22, 'ru', 1002, 0.1331, 97),
(29, 'ru', 1003, 0.1195, 498),
(22, 'ru', 1003, 0.2661, 127),
(22, 'ru', 1004, 0.1331, 105),
(22, 'ru', 1005, 0.2109, 184.5),
(22, 'ru', 1006, 0.1331, 137),
(22, 'ru', 1007, 0.1331, 138),
(22, 'ru', 1008, 0.1331, 153),
(22, 'ru', 1009, 0.1331, 158),
(22, 'ru', 1010, 0.1331, 162),
(22, 'ru', 1011, 0.1331, 162),
(22, 'ru', 1012, 0.1331, 173),
(29, 'ru', 1013, 0.1195, 123),
(27, 'ru', 1013, 0.1278, 271),
(22, 'ru', 1013, 0.1331, 179),
(22, 'ru', 1014, 0.1331, 192),
(22, 'ru', 1015, 0.1331, 198),
(22, 'ru', 1016, 0.1331, 199),
(22, 'ru', 1017, 0.1331, 202),
(22, 'ru', 1018, 0.1331, 221),
(22, 'ru', 1019, 0.1331, 224),
(22, 'ru', 1020, 0.1331, 228),
(22, 'ru', 1021, 0.1331, 231),
(22, 'ru', 1022, 0.2109, 233.5),
(22, 'ru', 1023, 0.2109, 239),
(27, 'ru', 1024, 0.1278, 48),
(22, 'ru', 1024, 0.1331, 236),
(22, 'ru', 1025, 0.1331, 238),
(22, 'ru', 1026, 0.1331, 239),
(22, 'ru', 1027, 0.1331, 240),
(22, 'ru', 1028, 0.1331, 241),
(22, 'ru', 1029, 0.1331, 242),
(22, 'ru', 1030, 0.1331, 253),
(22, 'ru', 1031, 0.1331, 254),
(22, 'ru', 1032, 0.1331, 255),
(22, 'ru', 1033, 0.1331, 256),
(22, 'ru', 1034, 0.1331, 257),
(24, 'ru', 1035, 0.1429, 8),
(24, 'ru', 1036, 0.1429, 18),
(24, 'ru', 1037, 0.1429, 69),
(24, 'ru', 1038, 0.2264, 129),
(24, 'ru', 1039, 0.1429, 91),
(24, 'ru', 1040, 0.1429, 97),
(24, 'ru', 1041, 0.1429, 106),
(24, 'ru', 1042, 0.1429, 121),
(29, 'ru', 1043, 0.1195, 84),
(24, 'ru', 1043, 0.1429, 126),
(24, 'ru', 1044, 0.1429, 130),
(24, 'ru', 1045, 0.1429, 131),
(24, 'ru', 1046, 0.2264, 143.5),
(24, 'ru', 1047, 0.1429, 149),
(24, 'ru', 1048, 0.1429, 151),
(24, 'ru', 1049, 0.1429, 152),
(24, 'ru', 1050, 0.1429, 178),
(24, 'ru', 1051, 0.1429, 183),
(49, 'ru', 1051, 0.1486, 18),
(24, 'ru', 1052, 0.1429, 190),
(25, 'ru', 1053, 0.1317, 8),
(29, 'ru', 1054, 0.1195, 111),
(25, 'ru', 1054, 0.1317, 8),
(25, 'ru', 1055, 0.1317, 27),
(25, 'ru', 1056, 0.1317, 35),
(52, 'ru', 1056, 0.2198, 90),
(25, 'ru', 1057, 0.1317, 47),
(25, 'ru', 1058, 0.1317, 48),
(29, 'ru', 1059, 0.1195, 88),
(25, 'ru', 1059, 0.1317, 49),
(29, 'ru', 1060, 0.1195, 88),
(25, 'ru', 1060, 0.1317, 49),
(25, 'ru', 1061, 0.1317, 54),
(25, 'ru', 1062, 0.1317, 72),
(25, 'ru', 1063, 0.1317, 80),
(25, 'ru', 1064, 0.1317, 81),
(25, 'ru', 1065, 0.1317, 85),
(25, 'ru', 1066, 0.2088, 116),
(25, 'ru', 1067, 0.2088, 102),
(29, 'ru', 1067, 0.2391, 288.333),
(25, 'ru', 1068, 0.2088, 103),
(29, 'ru', 1068, 0.2775, 421.25),
(25, 'ru', 1069, 0.1317, 98),
(25, 'ru', 1070, 0.1317, 105),
(25, 'ru', 1071, 0.1317, 108),
(26, 'ru', 1072, 0.1263, 190),
(25, 'ru', 1072, 0.1317, 140),
(29, 'ru', 1073, 0.1195, 174),
(25, 'ru', 1073, 0.1317, 160),
(25, 'ru', 1074, 0.1317, 164),
(25, 'ru', 1075, 0.1317, 174),
(25, 'ru', 1076, 0.1317, 177),
(25, 'ru', 1077, 0.1317, 178),
(25, 'ru', 1078, 0.1317, 192),
(25, 'ru', 1079, 0.1317, 198),
(25, 'ru', 1080, 0.1317, 223),
(25, 'ru', 1081, 0.1317, 228),
(52, 'ru', 1081, 0.1387, 134),
(55, 'ru', 1081, 0.1411, 158),
(56, 'ru', 1081, 0.2303, 156.5),
(25, 'ru', 1082, 0.1317, 229),
(25, 'ru', 1083, 0.1317, 230),
(25, 'ru', 1084, 0.1317, 232),
(29, 'ru', 1085, 0.1195, 278),
(25, 'ru', 1085, 0.1317, 234),
(25, 'ru', 1086, 0.1317, 243),
(52, 'ru', 1086, 0.1387, 246),
(56, 'ru', 1086, 0.1453, 217),
(25, 'ru', 1087, 0.1317, 246),
(29, 'ru', 1088, 0.1195, 560),
(25, 'ru', 1088, 0.1317, 248),
(25, 'ru', 1089, 0.1317, 264),
(29, 'ru', 1090, 0.1195, 310),
(25, 'ru', 1090, 0.1317, 269),
(25, 'ru', 1091, 0.1317, 277),
(25, 'ru', 1092, 0.1317, 279),
(25, 'ru', 1093, 0.1317, 280),
(25, 'ru', 1094, 0.1317, 281),
(25, 'ru', 1095, 0.1317, 282),
(53, 'ru', 1095, 0.1464, 186),
(51, 'ru', 1095, 0.1569, 29),
(25, 'ru', 1096, 0.1317, 284),
(25, 'ru', 1097, 0.1317, 289),
(25, 'ru', 1098, 0.1317, 290),
(25, 'ru', 1099, 0.1317, 291),
(25, 'ru', 1100, 0.1317, 292),
(25, 'ru', 1101, 0.1317, 294),
(25, 'ru', 1102, 0.1317, 295),
(26, 'ru', 1103, 0.2002, 1.5),
(26, 'ru', 1104, 0.1263, 17),
(26, 'ru', 1105, 0.2002, 92.5),
(26, 'ru', 1106, 0.2526, 133),
(26, 'ru', 1107, 0.1263, 21),
(49, 'ru', 1107, 0.1486, 171),
(26, 'ru', 1108, 0.1263, 23),
(29, 'ru', 1109, 0.1195, 211),
(26, 'ru', 1109, 0.1263, 34),
(26, 'ru', 1110, 0.1263, 36),
(29, 'ru', 1111, 0.1195, 314),
(26, 'ru', 1111, 0.1263, 44),
(26, 'ru', 1112, 0.1263, 45),
(26, 'ru', 1113, 0.1263, 47),
(26, 'ru', 1114, 0.1263, 50),
(26, 'ru', 1115, 0.1263, 64),
(29, 'ru', 1116, 0.1195, 212),
(26, 'ru', 1116, 0.1263, 67),
(26, 'ru', 1117, 0.1263, 73),
(26, 'ru', 1118, 0.1263, 75),
(26, 'ru', 1119, 0.1263, 88),
(26, 'ru', 1120, 0.1263, 90),
(26, 'ru', 1121, 0.1263, 94),
(26, 'ru', 1122, 0.2002, 147),
(26, 'ru', 1123, 0.1263, 98),
(26, 'ru', 1124, 0.1263, 115),
(26, 'ru', 1125, 0.1263, 136),
(26, 'ru', 1126, 0.1263, 141),
(29, 'ru', 1126, 0.1894, 106),
(26, 'ru', 1127, 0.1263, 158),
(54, 'ru', 1127, 0.1341, 206),
(46, 'ru', 1127, 0.2314, 2),
(26, 'ru', 1128, 0.1263, 160),
(26, 'ru', 1129, 0.1263, 166),
(53, 'ru', 1129, 0.1464, 218),
(51, 'ru', 1129, 0.1569, 13),
(54, 'ru', 1129, 0.2125, 59),
(26, 'ru', 1130, 0.1263, 168),
(26, 'ru', 1131, 0.2526, 229.667),
(26, 'ru', 1132, 0.2002, 242.5),
(26, 'ru', 1133, 0.1263, 192),
(26, 'ru', 1134, 0.1263, 209),
(26, 'ru', 1135, 0.1263, 211),
(26, 'ru', 1136, 0.1263, 217),
(29, 'ru', 1137, 0.1195, 122),
(26, 'ru', 1137, 0.1263, 218),
(54, 'ru', 1137, 0.1341, 223),
(52, 'ru', 1137, 0.2198, 92),
(26, 'ru', 1138, 0.1263, 225),
(26, 'ru', 1139, 0.1263, 226),
(26, 'ru', 1140, 0.1263, 229),
(26, 'ru', 1141, 0.1263, 230),
(26, 'ru', 1142, 0.1263, 235),
(26, 'ru', 1143, 0.1263, 242),
(26, 'ru', 1144, 0.1263, 251),
(26, 'ru', 1145, 0.1263, 252),
(26, 'ru', 1146, 0.1263, 258),
(26, 'ru', 1147, 0.1263, 272),
(26, 'ru', 1148, 0.1263, 277),
(26, 'ru', 1149, 0.1263, 282),
(26, 'ru', 1150, 0.1263, 284),
(51, 'ru', 1150, 0.1569, 42),
(26, 'ru', 1151, 0.1263, 293),
(26, 'ru', 1152, 0.2002, 321.5),
(26, 'ru', 1153, 0.1263, 314),
(29, 'ru', 1154, 0.1195, 549),
(26, 'ru', 1154, 0.1263, 317),
(27, 'ru', 1154, 0.1278, 249),
(26, 'ru', 1155, 0.1263, 318),
(26, 'ru', 1156, 0.1263, 320),
(26, 'ru', 1157, 0.1263, 323),
(26, 'ru', 1158, 0.1263, 324),
(27, 'ru', 1158, 0.3303, 91.4),
(26, 'ru', 1159, 0.1263, 328),
(26, 'ru', 1160, 0.1263, 329),
(26, 'ru', 1161, 0.1263, 331),
(26, 'ru', 1162, 0.1263, 333),
(56, 'ru', 1162, 0.1453, 150),
(53, 'ru', 1162, 0.1464, 86),
(49, 'ru', 1162, 0.1486, 134),
(26, 'ru', 1163, 0.1263, 342),
(26, 'ru', 1164, 0.1263, 345),
(26, 'ru', 1165, 0.1263, 346),
(26, 'ru', 1166, 0.1263, 348),
(26, 'ru', 1167, 0.1263, 349),
(26, 'ru', 1168, 0.1263, 350),
(27, 'ru', 1168, 0.2025, 70),
(26, 'ru', 1169, 0.1263, 352),
(26, 'ru', 1170, 0.1263, 353),
(26, 'ru', 1171, 0.1263, 355),
(26, 'ru', 1172, 0.1263, 371),
(26, 'ru', 1173, 0.1263, 373),
(26, 'ru', 1174, 0.1263, 377),
(27, 'ru', 1175, 0.1278, 1),
(27, 'ru', 1176, 0.1278, 2),
(27, 'ru', 1177, 0.1278, 3),
(27, 'ru', 1178, 0.1278, 4),
(27, 'ru', 1179, 0.3303, 58.6),
(27, 'ru', 1180, 0.2025, 69),
(27, 'ru', 1181, 0.1278, 9),
(27, 'ru', 1182, 0.1278, 9),
(27, 'ru', 1183, 0.1278, 10),
(27, 'ru', 1184, 0.1278, 11),
(27, 'ru', 1185, 0.1278, 12),
(29, 'ru', 1186, 0.1894, 22.5),
(27, 'ru', 1186, 0.2555, 128.667),
(27, 'ru', 1187, 0.442, 135.9),
(27, 'ru', 1188, 0.2025, 54.5),
(29, 'ru', 1189, 0.1195, 343),
(27, 'ru', 1189, 0.3303, 104.4),
(27, 'ru', 1190, 0.1278, 28),
(27, 'ru', 1191, 0.1278, 28),
(27, 'ru', 1192, 0.1278, 29),
(27, 'ru', 1193, 0.1278, 30),
(27, 'ru', 1194, 0.2555, 59.3333),
(27, 'ru', 1195, 0.2967, 71),
(27, 'ru', 1196, 0.1278, 35),
(27, 'ru', 1197, 0.2967, 195.5),
(27, 'ru', 1198, 0.1278, 39),
(27, 'ru', 1199, 0.1278, 40),
(27, 'ru', 1200, 0.1278, 40),
(27, 'ru', 1201, 0.1278, 51),
(27, 'ru', 1202, 0.2025, 175),
(27, 'ru', 1203, 0.1278, 54),
(27, 'ru', 1204, 0.1278, 55),
(27, 'ru', 1205, 0.1278, 61),
(27, 'ru', 1206, 0.1278, 61),
(27, 'ru', 1207, 0.1278, 62),
(27, 'ru', 1208, 0.1278, 63),
(27, 'ru', 1209, 0.2555, 157),
(27, 'ru', 1210, 0.2025, 123),
(27, 'ru', 1211, 0.1278, 79),
(27, 'ru', 1212, 0.1278, 79),
(27, 'ru', 1213, 0.1278, 80),
(27, 'ru', 1214, 0.1278, 81),
(27, 'ru', 1215, 0.1278, 87),
(27, 'ru', 1216, 0.1278, 99),
(27, 'ru', 1217, 0.1278, 100),
(27, 'ru', 1218, 0.1278, 101),
(27, 'ru', 1219, 0.1278, 102),
(27, 'ru', 1220, 0.1278, 106),
(27, 'ru', 1221, 0.1278, 109),
(27, 'ru', 1222, 0.2025, 167),
(27, 'ru', 1223, 0.1278, 117),
(27, 'ru', 1224, 0.1278, 126),
(27, 'ru', 1225, 0.1278, 128),
(27, 'ru', 1226, 0.1278, 129),
(27, 'ru', 1227, 0.3587, 191.833),
(27, 'ru', 1228, 0.1278, 133),
(27, 'ru', 1229, 0.1278, 133),
(27, 'ru', 1230, 0.1278, 134),
(27, 'ru', 1231, 0.1278, 135),
(27, 'ru', 1232, 0.2025, 179.5),
(27, 'ru', 1233, 0.2025, 179.5),
(27, 'ru', 1234, 0.1278, 174),
(27, 'ru', 1235, 0.1278, 175),
(27, 'ru', 1236, 0.1278, 176),
(29, 'ru', 1237, 0.1195, 8),
(27, 'ru', 1237, 0.2025, 197.5),
(27, 'ru', 1238, 0.1278, 198),
(27, 'ru', 1239, 0.2025, 246),
(27, 'ru', 1240, 0.1278, 206),
(27, 'ru', 1241, 0.1278, 206),
(27, 'ru', 1242, 0.1278, 207),
(54, 'ru', 1242, 0.1341, 187),
(56, 'ru', 1242, 0.1453, 42),
(51, 'ru', 1242, 0.2486, 47.5),
(27, 'ru', 1243, 0.1278, 208),
(27, 'ru', 1244, 0.1278, 210),
(27, 'ru', 1245, 0.1278, 215),
(27, 'ru', 1246, 0.1278, 221),
(27, 'ru', 1247, 0.1278, 221),
(27, 'ru', 1248, 0.1278, 222),
(27, 'ru', 1249, 0.1278, 223),
(27, 'ru', 1250, 0.2025, 233.5),
(27, 'ru', 1251, 0.1278, 237),
(27, 'ru', 1252, 0.1278, 247),
(27, 'ru', 1253, 0.1278, 250),
(27, 'ru', 1254, 0.1278, 254),
(27, 'ru', 1255, 0.1278, 255),
(27, 'ru', 1256, 0.1278, 256),
(27, 'ru', 1257, 0.1278, 256),
(27, 'ru', 1258, 0.1278, 257),
(27, 'ru', 1259, 0.1278, 258),
(27, 'ru', 1260, 0.1278, 260),
(27, 'ru', 1261, 0.1278, 262),
(27, 'ru', 1262, 0.1278, 265),
(27, 'ru', 1263, 0.1278, 267),
(27, 'ru', 1264, 0.1278, 268),
(27, 'ru', 1265, 0.1278, 273),
(27, 'ru', 1266, 0.1278, 274),
(27, 'ru', 1267, 0.1278, 275),
(27, 'ru', 1268, 0.1278, 277),
(29, 'ru', 1269, 0.1195, 100),
(27, 'ru', 1269, 0.1278, 281),
(27, 'ru', 1270, 0.1278, 283),
(27, 'ru', 1271, 0.1278, 291),
(27, 'ru', 1272, 0.1278, 294),
(27, 'ru', 1273, 0.1278, 295),
(28, 'ru', 1274, 0.2314, 1),
(29, 'ru', 1275, 0.1195, 1),
(29, 'ru', 1276, 0.1195, 5),
(29, 'ru', 1277, 0.2391, 169),
(29, 'ru', 1278, 0.1195, 21),
(29, 'ru', 1279, 0.1195, 36),
(29, 'ru', 1280, 0.1894, 150),
(29, 'ru', 1281, 0.2391, 136.667),
(29, 'ru', 1282, 0.1195, 69),
(54, 'ru', 1282, 0.2125, 153),
(52, 'ru', 1282, 0.2198, 224.5),
(29, 'ru', 1283, 0.1195, 78),
(29, 'ru', 1284, 0.1195, 83),
(29, 'ru', 1285, 0.1195, 85),
(29, 'ru', 1286, 0.1195, 85),
(29, 'ru', 1287, 0.1195, 91),
(29, 'ru', 1288, 0.1195, 92),
(29, 'ru', 1289, 0.1195, 109),
(29, 'ru', 1290, 0.1195, 128),
(29, 'ru', 1291, 0.1195, 130),
(29, 'ru', 1292, 0.1195, 131),
(29, 'ru', 1293, 0.1195, 135),
(29, 'ru', 1294, 0.1195, 144),
(29, 'ru', 1295, 0.1195, 153),
(29, 'ru', 1296, 0.1195, 153),
(29, 'ru', 1297, 0.1195, 154),
(29, 'ru', 1298, 0.1195, 155),
(29, 'ru', 1299, 0.1195, 176),
(29, 'ru', 1300, 0.1195, 177),
(29, 'ru', 1301, 0.1195, 183),
(29, 'ru', 1302, 0.1195, 197),
(29, 'ru', 1303, 0.1195, 205),
(29, 'ru', 1304, 0.1195, 208),
(29, 'ru', 1305, 0.1195, 210),
(49, 'ru', 1305, 0.1486, 61),
(29, 'ru', 1306, 0.1195, 224),
(29, 'ru', 1307, 0.1195, 227),
(29, 'ru', 1308, 0.1195, 230),
(29, 'ru', 1309, 0.1195, 231),
(29, 'ru', 1310, 0.1195, 233),
(29, 'ru', 1311, 0.1195, 239),
(29, 'ru', 1312, 0.1195, 246),
(29, 'ru', 1313, 0.1195, 249),
(29, 'ru', 1314, 0.1195, 268),
(29, 'ru', 1315, 0.2391, 278.667),
(29, 'ru', 1316, 0.1195, 281),
(29, 'ru', 1317, 0.1195, 287),
(29, 'ru', 1318, 0.1195, 297),
(29, 'ru', 1319, 0.1195, 307),
(29, 'ru', 1320, 0.1195, 308),
(29, 'ru', 1321, 0.1195, 311),
(29, 'ru', 1322, 0.1195, 326),
(29, 'ru', 1323, 0.1894, 346.5),
(29, 'ru', 1324, 0.1894, 347.5),
(29, 'ru', 1325, 0.1894, 348.5),
(29, 'ru', 1326, 0.1195, 346),
(29, 'ru', 1327, 0.1195, 348),
(29, 'ru', 1328, 0.1195, 350),
(29, 'ru', 1329, 0.1195, 352),
(29, 'ru', 1330, 0.1195, 353),
(29, 'ru', 1331, 0.1195, 355),
(29, 'ru', 1332, 0.1195, 372),
(29, 'ru', 1333, 0.1195, 375),
(29, 'ru', 1334, 0.1195, 378),
(29, 'ru', 1335, 0.1195, 379),
(29, 'ru', 1336, 0.1195, 382),
(29, 'ru', 1337, 0.2391, 438.667),
(29, 'ru', 1338, 0.1195, 405),
(29, 'ru', 1339, 0.1894, 422.5),
(29, 'ru', 1340, 0.1195, 417),
(29, 'ru', 1341, 0.1195, 422),
(29, 'ru', 1342, 0.1195, 423),
(29, 'ru', 1343, 0.1195, 424),
(29, 'ru', 1344, 0.1195, 437),
(29, 'ru', 1345, 0.1195, 438),
(29, 'ru', 1346, 0.1195, 439),
(29, 'ru', 1347, 0.1195, 443),
(29, 'ru', 1348, 0.1195, 449),
(29, 'ru', 1349, 0.1195, 452),
(29, 'ru', 1350, 0.1195, 460),
(29, 'ru', 1351, 0.1894, 469.5),
(29, 'ru', 1352, 0.1195, 475),
(29, 'ru', 1353, 0.1195, 476),
(29, 'ru', 1354, 0.1195, 481),
(29, 'ru', 1355, 0.1894, 510.5),
(29, 'ru', 1356, 0.1195, 504),
(29, 'ru', 1357, 0.1195, 506),
(29, 'ru', 1358, 0.1195, 509),
(29, 'ru', 1359, 0.1195, 525),
(29, 'ru', 1360, 0.1195, 530),
(29, 'ru', 1361, 0.1195, 547),
(29, 'ru', 1362, 0.1195, 552),
(29, 'ru', 1363, 0.1195, 557),
(45, 'ru', 1368, 0.2314, 2),
(5, 'ru', 1515, 0.2314, 2),
(39, 'ru', 1515, 0.2314, 2),
(40, 'ru', 1515, 0.2314, 2),
(41, 'ru', 1515, 0.2314, 2),
(43, 'ru', 1515, 0.2314, 2),
(42, 'ru', 1515, 0.2314, 3),
(5, 'ru', 1516, 0.2314, 3),
(39, 'ru', 1516, 0.2314, 3),
(40, 'ru', 1516, 0.2314, 3),
(41, 'ru', 1516, 0.2314, 3),
(43, 'ru', 1516, 0.2314, 3),
(42, 'ru', 1516, 0.2314, 4),
(39, 'ru', 1518, 0.2314, 1),
(40, 'ru', 1520, 0.2314, 1),
(5, 'ru', 1521, 0.2314, 1),
(41, 'ru', 1522, 0.2314, 1),
(42, 'ru', 1523, 0.2314, 1),
(42, 'ru', 1524, 0.2314, 2),
(43, 'ru', 1525, 0.2314, 1),
(44, 'ru', 1526, 0.2314, 1),
(45, 'ru', 1527, 0.2314, 1),
(45, 'ru', 1528, 0.2314, 3),
(45, 'ru', 1529, 0.2314, 4),
(46, 'ru', 1530, 0.2314, 1),
(54, 'ru', 1531, 0.1341, 16),
(46, 'ru', 1531, 0.2314, 4),
(46, 'ru', 1532, 0.2314, 11),
(47, 'ru', 1533, 0.2277, 1),
(47, 'ru', 1534, 0.2277, 2),
(47, 'ru', 1535, 0.2277, 4),
(47, 'ru', 1536, 0.2277, 5),
(47, 'ru', 1537, 0.2277, 9),
(47, 'ru', 1538, 0.2277, 12),
(56, 'ru', 1539, 0.1453, 175),
(47, 'ru', 1539, 0.2277, 14),
(47, 'ru', 1540, 0.2277, 15),
(47, 'ru', 1541, 0.2277, 19),
(47, 'ru', 1542, 0.2277, 20),
(47, 'ru', 1543, 0.2277, 22),
(47, 'ru', 1544, 0.2277, 26),
(47, 'ru', 1545, 0.2277, 29),
(47, 'ru', 1546, 0.2277, 31),
(48, 'ru', 1547, 0.2314, 1),
(48, 'ru', 1548, 0.2314, 3),
(48, 'ru', 1549, 0.2314, 4),
(48, 'ru', 1550, 0.2314, 5),
(49, 'ru', 1551, 0.1486, 1),
(49, 'ru', 1552, 0.1486, 2),
(38, 'ru', 1553, 0.2314, 1),
(50, 'ru', 1553, 0.2314, 1),
(49, 'ru', 1554, 0.1486, 15),
(49, 'ru', 1555, 0.1486, 16),
(49, 'ru', 1556, 0.1486, 17),
(52, 'ru', 1557, 0.1387, 123),
(49, 'ru', 1557, 0.1486, 20),
(54, 'ru', 1557, 0.2125, 144.5),
(53, 'ru', 1557, 0.232, 96.5),
(54, 'ru', 1558, 0.1341, 98),
(56, 'ru', 1558, 0.1453, 92),
(49, 'ru', 1558, 0.1486, 21),
(52, 'ru', 1559, 0.1387, 185),
(49, 'ru', 1559, 0.1486, 27),
(53, 'ru', 1560, 0.1464, 110),
(49, 'ru', 1560, 0.1486, 28),
(49, 'ru', 1561, 0.1486, 34),
(55, 'ru', 1562, 0.1411, 275),
(49, 'ru', 1562, 0.1486, 35),
(54, 'ru', 1562, 0.2125, 129.5),
(56, 'ru', 1563, 0.1453, 68),
(49, 'ru', 1563, 0.2356, 90),
(52, 'ru', 1563, 0.2774, 38.6667),
(49, 'ru', 1564, 0.1486, 37),
(49, 'ru', 1565, 0.2356, 77),
(52, 'ru', 1566, 0.1387, 65),
(49, 'ru', 1566, 0.1486, 46),
(52, 'ru', 1567, 0.1387, 66),
(49, 'ru', 1567, 0.1486, 47),
(52, 'ru', 1568, 0.1387, 66),
(49, 'ru', 1568, 0.1486, 47),
(52, 'ru', 1569, 0.1387, 67),
(49, 'ru', 1569, 0.1486, 48),
(55, 'ru', 1570, 0.1411, 77),
(49, 'ru', 1570, 0.1486, 51),
(56, 'ru', 1570, 0.2303, 89.5),
(55, 'ru', 1571, 0.1411, 78),
(49, 'ru', 1571, 0.1486, 52),
(56, 'ru', 1571, 0.2303, 90.5),
(49, 'ru', 1572, 0.1486, 59),
(49, 'ru', 1573, 0.1486, 63),
(49, 'ru', 1574, 0.1486, 65),
(55, 'ru', 1575, 0.1411, 243),
(49, 'ru', 1575, 0.1486, 67),
(51, 'ru', 1575, 0.1569, 53),
(56, 'ru', 1575, 0.2303, 153.5),
(49, 'ru', 1576, 0.1486, 68),
(51, 'ru', 1576, 0.1569, 54),
(55, 'ru', 1576, 0.2236, 222.5),
(56, 'ru', 1576, 0.2303, 154.5),
(54, 'ru', 1577, 0.1341, 151),
(56, 'ru', 1577, 0.1453, 57),
(51, 'ru', 1577, 0.1569, 25),
(55, 'ru', 1577, 0.2236, 81),
(53, 'ru', 1577, 0.232, 90.5),
(49, 'ru', 1577, 0.2356, 101),
(49, 'ru', 1578, 0.1486, 70),
(54, 'ru', 1578, 0.2681, 177),
(49, 'ru', 1579, 0.1486, 71),
(51, 'ru', 1579, 0.1569, 78),
(54, 'ru', 1579, 0.2125, 174),
(55, 'ru', 1580, 0.1411, 177),
(49, 'ru', 1580, 0.1486, 78),
(49, 'ru', 1581, 0.1486, 79),
(49, 'ru', 1582, 0.1486, 80),
(49, 'ru', 1583, 0.1486, 88),
(55, 'ru', 1584, 0.1411, 86),
(49, 'ru', 1584, 0.1486, 89),
(53, 'ru', 1585, 0.1464, 208),
(52, 'ru', 1585, 0.2198, 159),
(49, 'ru', 1585, 0.2356, 113.5),
(54, 'ru', 1586, 0.1341, 242),
(52, 'ru', 1586, 0.1387, 232),
(49, 'ru', 1586, 0.1486, 93),
(55, 'ru', 1586, 0.2236, 116.5),
(51, 'ru', 1586, 0.2486, 99.5),
(52, 'ru', 1587, 0.1387, 194),
(49, 'ru', 1587, 0.2356, 152.5),
(54, 'ru', 1588, 0.1341, 136),
(49, 'ru', 1588, 0.1486, 96),
(51, 'ru', 1588, 0.1569, 119),
(49, 'ru', 1589, 0.1486, 99),
(54, 'ru', 1590, 0.1341, 190),
(52, 'ru', 1590, 0.1387, 242),
(56, 'ru', 1590, 0.1453, 213),
(49, 'ru', 1590, 0.1486, 100),
(49, 'ru', 1591, 0.1486, 102),
(49, 'ru', 1592, 0.1486, 103),
(49, 'ru', 1593, 0.1486, 104),
(49, 'ru', 1594, 0.1486, 105),
(49, 'ru', 1595, 0.1486, 112),
(54, 'ru', 1596, 0.1341, 140),
(55, 'ru', 1596, 0.1411, 174),
(49, 'ru', 1596, 0.1486, 113),
(53, 'ru', 1597, 0.1464, 183),
(49, 'ru', 1597, 0.1486, 114),
(54, 'ru', 1598, 0.1341, 87),
(52, 'ru', 1598, 0.1387, 70),
(49, 'ru', 1598, 0.1486, 115),
(54, 'ru', 1599, 0.1341, 88),
(52, 'ru', 1599, 0.1387, 71),
(49, 'ru', 1599, 0.1486, 116),
(54, 'ru', 1600, 0.1341, 259),
(55, 'ru', 1600, 0.1411, 262),
(56, 'ru', 1600, 0.1453, 104),
(49, 'ru', 1600, 0.1486, 122),
(51, 'ru', 1600, 0.1569, 47),
(53, 'ru', 1600, 0.2927, 63.3333),
(52, 'ru', 1601, 0.1387, 79),
(55, 'ru', 1601, 0.1411, 208),
(56, 'ru', 1601, 0.1453, 108),
(49, 'ru', 1601, 0.1486, 123),
(53, 'ru', 1601, 0.232, 191),
(51, 'ru', 1601, 0.2486, 91.5),
(54, 'ru', 1602, 0.1341, 66),
(52, 'ru', 1602, 0.1387, 54),
(55, 'ru', 1602, 0.1411, 67),
(49, 'ru', 1602, 0.1486, 124),
(49, 'ru', 1603, 0.1486, 125),
(51, 'ru', 1603, 0.3137, 38),
(52, 'ru', 1604, 0.1387, 254),
(49, 'ru', 1604, 0.1486, 131),
(51, 'ru', 1604, 0.1569, 136),
(54, 'ru', 1605, 0.1341, 114),
(52, 'ru', 1605, 0.1387, 255),
(49, 'ru', 1605, 0.1486, 132),
(51, 'ru', 1605, 0.1569, 137),
(54, 'ru', 1606, 0.1341, 239),
(49, 'ru', 1606, 0.1486, 141),
(54, 'ru', 1607, 0.1341, 240),
(49, 'ru', 1607, 0.1486, 142),
(52, 'ru', 1608, 0.1387, 161),
(49, 'ru', 1608, 0.1486, 143),
(49, 'ru', 1609, 0.1486, 145),
(49, 'ru', 1610, 0.1486, 146),
(56, 'ru', 1611, 0.1453, 173),
(49, 'ru', 1611, 0.2356, 157),
(54, 'ru', 1612, 0.1341, 124),
(56, 'ru', 1612, 0.1453, 174),
(49, 'ru', 1612, 0.2356, 158),
(49, 'ru', 1613, 0.1486, 154),
(56, 'ru', 1613, 0.2303, 201),
(53, 'ru', 1613, 0.232, 45),
(55, 'ru', 1614, 0.1411, 277),
(49, 'ru', 1614, 0.1486, 155),
(56, 'ru', 1615, 0.1453, 178),
(49, 'ru', 1615, 0.1486, 156),
(51, 'ru', 1615, 0.1569, 139),
(49, 'ru', 1616, 0.1486, 164),
(53, 'ru', 1617, 0.1464, 99),
(49, 'ru', 1617, 0.1486, 166),
(51, 'ru', 1617, 0.1569, 60),
(49, 'ru', 1618, 0.1486, 167),
(49, 'ru', 1619, 0.1486, 168),
(49, 'ru', 1620, 0.1486, 171),
(49, 'ru', 1621, 0.1486, 172),
(49, 'ru', 1622, 0.1486, 174),
(49, 'ru', 1623, 0.1486, 175),
(49, 'ru', 1624, 0.1486, 181),
(56, 'ru', 1625, 0.1453, 50),
(49, 'ru', 1625, 0.1486, 183),
(56, 'ru', 1626, 0.1453, 51),
(49, 'ru', 1626, 0.1486, 184),
(56, 'ru', 1627, 0.1453, 52),
(49, 'ru', 1627, 0.1486, 185),
(49, 'ru', 1628, 0.1486, 187),
(56, 'ru', 1628, 0.2303, 41),
(52, 'ru', 1629, 0.1387, 186),
(55, 'ru', 1629, 0.1411, 100),
(49, 'ru', 1629, 0.1486, 190),
(55, 'ru', 1630, 0.1411, 252),
(49, 'ru', 1630, 0.1486, 197),
(55, 'ru', 1631, 0.1411, 254),
(49, 'ru', 1631, 0.1486, 199),
(55, 'ru', 1632, 0.1411, 255),
(53, 'ru', 1632, 0.1464, 35),
(49, 'ru', 1632, 0.1486, 200),
(49, 'ru', 1633, 0.1486, 201),
(49, 'ru', 1634, 0.1486, 207),
(49, 'ru', 1635, 0.1486, 208),
(49, 'ru', 1636, 0.1486, 209),
(56, 'ru', 1637, 0.1453, 129),
(53, 'ru', 1637, 0.1464, 101),
(49, 'ru', 1637, 0.1486, 210),
(52, 'ru', 1637, 0.2198, 97),
(49, 'ru', 1638, 0.1486, 212),
(55, 'ru', 1638, 0.2236, 240.5),
(56, 'ru', 1638, 0.2303, 154),
(51, 'ru', 1639, 0.1569, 1),
(54, 'ru', 1640, 0.1341, 210),
(56, 'ru', 1640, 0.1453, 41),
(51, 'ru', 1640, 0.2486, 46.5),
(53, 'ru', 1641, 0.1464, 212),
(51, 'ru', 1641, 0.1569, 7),
(54, 'ru', 1641, 0.2125, 53),
(53, 'ru', 1642, 0.1464, 212),
(51, 'ru', 1642, 0.1569, 7),
(54, 'ru', 1642, 0.2125, 53),
(53, 'ru', 1643, 0.1464, 214),
(51, 'ru', 1643, 0.1569, 9),
(54, 'ru', 1643, 0.2125, 55),
(53, 'ru', 1644, 0.1464, 214),
(51, 'ru', 1644, 0.1569, 9),
(54, 'ru', 1644, 0.2125, 55),
(55, 'ru', 1645, 0.1411, 171),
(53, 'ru', 1645, 0.1464, 217),
(51, 'ru', 1645, 0.1569, 12),
(54, 'ru', 1645, 0.2125, 58),
(53, 'ru', 1646, 0.1464, 73),
(51, 'ru', 1646, 0.1569, 14),
(56, 'ru', 1646, 0.2303, 153.5),
(55, 'ru', 1647, 0.1411, 76),
(51, 'ru', 1647, 0.1569, 15),
(56, 'ru', 1648, 0.1453, 94),
(53, 'ru', 1648, 0.1464, 201),
(51, 'ru', 1648, 0.1569, 22),
(56, 'ru', 1649, 0.1453, 95),
(53, 'ru', 1649, 0.1464, 202),
(51, 'ru', 1649, 0.1569, 23),
(51, 'ru', 1650, 0.1569, 24),
(53, 'ru', 1650, 0.232, 126),
(55, 'ru', 1651, 0.1411, 109),
(56, 'ru', 1651, 0.2303, 117.5),
(51, 'ru', 1651, 0.2486, 87),
(53, 'ru', 1652, 0.1464, 188),
(51, 'ru', 1652, 0.1569, 31),
(53, 'ru', 1653, 0.1464, 189),
(51, 'ru', 1653, 0.1569, 32),
(53, 'ru', 1654, 0.1464, 190),
(51, 'ru', 1654, 0.1569, 33),
(51, 'ru', 1655, 0.1569, 34),
(55, 'ru', 1655, 0.2236, 167),
(53, 'ru', 1655, 0.232, 159),
(53, 'ru', 1656, 0.1464, 192),
(51, 'ru', 1656, 0.1569, 35),
(51, 'ru', 1657, 0.1569, 41),
(56, 'ru', 1658, 0.1453, 90),
(51, 'ru', 1658, 0.1569, 43),
(54, 'ru', 1658, 0.2681, 166.333),
(51, 'ru', 1659, 0.1569, 44),
(51, 'ru', 1660, 0.1569, 46),
(53, 'ru', 1661, 0.1464, 98),
(51, 'ru', 1661, 0.1569, 59),
(51, 'ru', 1662, 0.1569, 61),
(51, 'ru', 1663, 0.1569, 67),
(51, 'ru', 1664, 0.1569, 68),
(52, 'ru', 1665, 0.1387, 124),
(53, 'ru', 1665, 0.1464, 72),
(51, 'ru', 1665, 0.1569, 69),
(55, 'ru', 1666, 0.1411, 276),
(56, 'ru', 1666, 0.1453, 203),
(51, 'ru', 1666, 0.1569, 70),
(54, 'ru', 1667, 0.1341, 186),
(52, 'ru', 1667, 0.1387, 172),
(51, 'ru', 1667, 0.1569, 73),
(51, 'ru', 1668, 0.1569, 75),
(51, 'ru', 1669, 0.1569, 76),
(51, 'ru', 1670, 0.1569, 83),
(51, 'ru', 1671, 0.1569, 89),
(55, 'ru', 1672, 0.1411, 43),
(51, 'ru', 1672, 0.1569, 98),
(54, 'ru', 1673, 0.1341, 260),
(56, 'ru', 1673, 0.1453, 29),
(51, 'ru', 1673, 0.1569, 99),
(54, 'ru', 1674, 0.1341, 262),
(56, 'ru', 1674, 0.1453, 31),
(51, 'ru', 1674, 0.1569, 101),
(54, 'ru', 1675, 0.1341, 266),
(56, 'ru', 1675, 0.1453, 35),
(51, 'ru', 1675, 0.1569, 105),
(54, 'ru', 1676, 0.1341, 268),
(56, 'ru', 1676, 0.1453, 37),
(51, 'ru', 1676, 0.1569, 107),
(52, 'ru', 1677, 0.1387, 52),
(56, 'ru', 1677, 0.1453, 38),
(51, 'ru', 1677, 0.1569, 108),
(54, 'ru', 1677, 0.2125, 186),
(51, 'ru', 1678, 0.1569, 110),
(51, 'ru', 1679, 0.1569, 111),
(51, 'ru', 1680, 0.1569, 117),
(54, 'ru', 1681, 0.1341, 62),
(52, 'ru', 1681, 0.1387, 50),
(55, 'ru', 1681, 0.1411, 99),
(56, 'ru', 1681, 0.1453, 89),
(51, 'ru', 1681, 0.1569, 120),
(54, 'ru', 1682, 0.1341, 53),
(51, 'ru', 1682, 0.1569, 121),
(51, 'ru', 1683, 0.1569, 127),
(51, 'ru', 1684, 0.1569, 128),
(51, 'ru', 1685, 0.1569, 130),
(55, 'ru', 1686, 0.1411, 56),
(56, 'ru', 1686, 0.1453, 184),
(51, 'ru', 1686, 0.1569, 145),
(54, 'ru', 1687, 0.1341, 126),
(52, 'ru', 1687, 0.1387, 99),
(51, 'ru', 1687, 0.1569, 149),
(54, 'ru', 1688, 0.1341, 127),
(52, 'ru', 1688, 0.1387, 100),
(51, 'ru', 1688, 0.1569, 150),
(52, 'ru', 1689, 0.1387, 1),
(52, 'ru', 1690, 0.1387, 3),
(52, 'ru', 1691, 0.2198, 36),
(52, 'ru', 1692, 0.1387, 6),
(55, 'ru', 1692, 0.1411, 148),
(56, 'ru', 1693, 0.1453, 204),
(53, 'ru', 1693, 0.1464, 74),
(55, 'ru', 1693, 0.2236, 146),
(52, 'ru', 1693, 0.2774, 135.333),
(52, 'ru', 1694, 0.1387, 13),
(52, 'ru', 1695, 0.1387, 15),
(53, 'ru', 1695, 0.1464, 47),
(52, 'ru', 1696, 0.1387, 17),
(53, 'ru', 1696, 0.1464, 49),
(52, 'ru', 1697, 0.1387, 17),
(53, 'ru', 1697, 0.1464, 49),
(52, 'ru', 1698, 0.1387, 18),
(53, 'ru', 1698, 0.1464, 50),
(52, 'ru', 1699, 0.1387, 19),
(53, 'ru', 1699, 0.1464, 51),
(52, 'ru', 1700, 0.1387, 20),
(53, 'ru', 1700, 0.1464, 52),
(52, 'ru', 1701, 0.1387, 23),
(55, 'ru', 1701, 0.1411, 169),
(52, 'ru', 1702, 0.2198, 91),
(52, 'ru', 1703, 0.2198, 94),
(52, 'ru', 1704, 0.1387, 38),
(56, 'ru', 1704, 0.1453, 166),
(54, 'ru', 1705, 0.1341, 225),
(53, 'ru', 1705, 0.232, 14),
(52, 'ru', 1705, 0.2774, 78.6667),
(52, 'ru', 1706, 0.1387, 41),
(53, 'ru', 1706, 0.1464, 9),
(54, 'ru', 1707, 0.1341, 59),
(52, 'ru', 1707, 0.1387, 47),
(56, 'ru', 1707, 0.1453, 86),
(54, 'ru', 1708, 0.1341, 61),
(52, 'ru', 1708, 0.1387, 49),
(56, 'ru', 1708, 0.1453, 88),
(54, 'ru', 1709, 0.1341, 102),
(52, 'ru', 1709, 0.1387, 51),
(54, 'ru', 1710, 0.1341, 213),
(52, 'ru', 1710, 0.1387, 55),
(55, 'ru', 1710, 0.1411, 278),
(52, 'ru', 1711, 0.1387, 61),
(52, 'ru', 1712, 0.1387, 78),
(54, 'ru', 1713, 0.1341, 138),
(52, 'ru', 1713, 0.1387, 80),
(55, 'ru', 1713, 0.1411, 110),
(54, 'ru', 1714, 0.1341, 139),
(52, 'ru', 1714, 0.1387, 81),
(55, 'ru', 1714, 0.1411, 111),
(52, 'ru', 1715, 0.1387, 87),
(52, 'ru', 1716, 0.1387, 88),
(52, 'ru', 1717, 0.1387, 89),
(54, 'ru', 1718, 0.1341, 243),
(52, 'ru', 1718, 0.1387, 91),
(54, 'ru', 1719, 0.1341, 271),
(52, 'ru', 1719, 0.1387, 92),
(54, 'ru', 1720, 0.1341, 272),
(55, 'ru', 1720, 0.1411, 204),
(52, 'ru', 1720, 0.2198, 106),
(54, 'ru', 1721, 0.1341, 241),
(52, 'ru', 1721, 0.1387, 101),
(55, 'ru', 1721, 0.1411, 29),
(54, 'ru', 1722, 0.1341, 214),
(52, 'ru', 1722, 0.1387, 102),
(55, 'ru', 1722, 0.2236, 37),
(52, 'ru', 1723, 0.1387, 103),
(55, 'ru', 1723, 0.1411, 55),
(52, 'ru', 1724, 0.1387, 104),
(55, 'ru', 1724, 0.1411, 209),
(52, 'ru', 1725, 0.1387, 110),
(52, 'ru', 1726, 0.1387, 111),
(52, 'ru', 1727, 0.1387, 112),
(52, 'ru', 1728, 0.1387, 117),
(52, 'ru', 1729, 0.1387, 121),
(53, 'ru', 1729, 0.1464, 55),
(54, 'ru', 1729, 0.2125, 184),
(56, 'ru', 1730, 0.1453, 224),
(52, 'ru', 1730, 0.2198, 187.5),
(52, 'ru', 1731, 0.1387, 132),
(55, 'ru', 1731, 0.1411, 251),
(53, 'ru', 1731, 0.1464, 198),
(55, 'ru', 1732, 0.1411, 159),
(53, 'ru', 1732, 0.1464, 179),
(52, 'ru', 1732, 0.2198, 181),
(56, 'ru', 1732, 0.2303, 157.5),
(52, 'ru', 1733, 0.1387, 142),
(55, 'ru', 1733, 0.1411, 166),
(56, 'ru', 1733, 0.2303, 164.5),
(52, 'ru', 1734, 0.1387, 143),
(53, 'ru', 1734, 0.232, 48.5),
(52, 'ru', 1735, 0.2198, 196.5),
(52, 'ru', 1736, 0.1387, 164),
(52, 'ru', 1737, 0.1387, 171),
(52, 'ru', 1738, 0.1387, 173),
(52, 'ru', 1739, 0.1387, 195),
(55, 'ru', 1739, 0.1411, 45),
(56, 'ru', 1739, 0.1453, 228),
(52, 'ru', 1740, 0.1387, 196),
(55, 'ru', 1740, 0.1411, 46),
(56, 'ru', 1740, 0.1453, 229),
(52, 'ru', 1741, 0.1387, 206),
(53, 'ru', 1741, 0.1464, 158),
(52, 'ru', 1742, 0.1387, 220),
(53, 'ru', 1742, 0.1464, 172),
(52, 'ru', 1743, 0.1387, 223),
(53, 'ru', 1743, 0.1464, 175),
(52, 'ru', 1744, 0.1387, 224),
(53, 'ru', 1744, 0.1464, 176),
(52, 'ru', 1745, 0.1387, 225),
(53, 'ru', 1745, 0.1464, 177),
(52, 'ru', 1746, 0.1387, 226),
(53, 'ru', 1746, 0.1464, 178),
(52, 'ru', 1747, 0.1387, 229),
(55, 'ru', 1747, 0.1411, 26),
(52, 'ru', 1748, 0.1387, 239),
(56, 'ru', 1748, 0.1453, 210),
(52, 'ru', 1749, 0.1387, 240),
(56, 'ru', 1749, 0.1453, 211),
(52, 'ru', 1750, 0.1387, 241),
(56, 'ru', 1750, 0.1453, 212),
(52, 'ru', 1751, 0.1387, 244),
(56, 'ru', 1751, 0.1453, 215),
(52, 'ru', 1752, 0.1387, 247),
(56, 'ru', 1752, 0.1453, 218),
(52, 'ru', 1753, 0.1387, 248),
(56, 'ru', 1753, 0.1453, 219),
(52, 'ru', 1754, 0.1387, 249),
(56, 'ru', 1754, 0.1453, 220),
(52, 'ru', 1755, 0.1387, 250),
(56, 'ru', 1755, 0.1453, 221),
(52, 'ru', 1756, 0.1387, 250),
(56, 'ru', 1756, 0.1453, 221),
(52, 'ru', 1757, 0.1387, 251),
(56, 'ru', 1757, 0.1453, 222),
(54, 'ru', 1758, 0.1341, 52),
(52, 'ru', 1758, 0.1387, 252),
(56, 'ru', 1758, 0.1453, 223),
(54, 'ru', 1759, 0.1341, 108),
(52, 'ru', 1759, 0.1387, 259),
(56, 'ru', 1759, 0.1453, 132),
(53, 'ru', 1759, 0.1464, 120),
(53, 'ru', 1760, 0.1464, 1),
(54, 'ru', 1761, 0.1341, 1),
(54, 'ru', 1762, 0.1341, 2),
(55, 'ru', 1762, 0.1411, 3),
(54, 'ru', 1763, 0.1341, 3),
(54, 'ru', 1764, 0.1341, 4),
(54, 'ru', 1765, 0.1341, 10),
(54, 'ru', 1766, 0.1341, 11),
(54, 'ru', 1767, 0.1341, 13),
(54, 'ru', 1768, 0.1341, 14),
(54, 'ru', 1769, 0.1341, 18),
(55, 'ru', 1769, 0.2236, 7),
(56, 'ru', 1769, 0.2303, 8),
(56, 'ru', 1770, 0.1453, 69),
(54, 'ru', 1770, 0.2125, 134),
(54, 'ru', 1771, 0.1341, 37),
(54, 'ru', 1772, 0.1341, 38),
(54, 'ru', 1773, 0.1341, 41),
(54, 'ru', 1774, 0.1341, 42),
(54, 'ru', 1775, 0.1341, 44),
(54, 'ru', 1776, 0.1341, 45),
(54, 'ru', 1777, 0.1341, 51),
(54, 'ru', 1778, 0.1341, 63),
(54, 'ru', 1779, 0.1341, 67),
(56, 'ru', 1780, 0.1453, 91),
(54, 'ru', 1780, 0.2681, 167.333),
(56, 'ru', 1781, 0.1453, 135),
(54, 'ru', 1781, 0.2125, 161),
(54, 'ru', 1782, 0.1341, 95),
(54, 'ru', 1783, 0.1341, 96),
(54, 'ru', 1784, 0.1341, 97),
(54, 'ru', 1785, 0.1341, 99),
(53, 'ru', 1786, 0.1464, 85),
(54, 'ru', 1786, 0.2125, 114.5),
(54, 'ru', 1787, 0.1341, 105),
(54, 'ru', 1788, 0.1341, 117),
(54, 'ru', 1789, 0.1341, 123),
(54, 'ru', 1790, 0.1341, 134),
(54, 'ru', 1791, 0.1341, 137),
(54, 'ru', 1792, 0.1341, 141),
(56, 'ru', 1792, 0.1453, 40),
(53, 'ru', 1792, 0.1464, 37),
(54, 'ru', 1793, 0.1341, 150),
(55, 'ru', 1793, 0.1411, 53),
(54, 'ru', 1794, 0.1341, 155),
(54, 'ru', 1795, 0.1341, 157),
(54, 'ru', 1796, 0.1341, 160),
(54, 'ru', 1797, 0.1341, 161),
(55, 'ru', 1797, 0.1411, 263),
(54, 'ru', 1798, 0.1341, 163),
(54, 'ru', 1799, 0.1341, 164),
(54, 'ru', 1800, 0.1341, 165),
(54, 'ru', 1801, 0.1341, 174),
(54, 'ru', 1802, 0.1341, 175),
(54, 'ru', 1803, 0.1341, 176),
(54, 'ru', 1804, 0.1341, 178),
(54, 'ru', 1805, 0.1341, 179),
(54, 'ru', 1806, 0.1341, 180),
(54, 'ru', 1807, 0.1341, 180),
(54, 'ru', 1808, 0.1341, 181),
(55, 'ru', 1808, 0.1411, 75),
(54, 'ru', 1809, 0.1341, 182),
(54, 'ru', 1810, 0.1341, 183),
(54, 'ru', 1811, 0.1341, 184),
(53, 'ru', 1811, 0.1464, 32),
(55, 'ru', 1811, 0.2822, 113.667),
(54, 'ru', 1812, 0.1341, 200),
(54, 'ru', 1813, 0.1341, 202),
(54, 'ru', 1814, 0.1341, 204),
(53, 'ru', 1814, 0.232, 50.5),
(54, 'ru', 1815, 0.1341, 208),
(54, 'ru', 1816, 0.1341, 211),
(54, 'ru', 1817, 0.1341, 212),
(54, 'ru', 1818, 0.1341, 215),
(54, 'ru', 1819, 0.1341, 216),
(55, 'ru', 1819, 0.1411, 149),
(53, 'ru', 1819, 0.232, 103),
(54, 'ru', 1820, 0.1341, 222),
(54, 'ru', 1821, 0.1341, 229),
(54, 'ru', 1822, 0.1341, 231),
(54, 'ru', 1823, 0.1341, 232),
(54, 'ru', 1824, 0.1341, 233),
(53, 'ru', 1824, 0.1464, 103),
(54, 'ru', 1825, 0.1341, 246),
(54, 'ru', 1826, 0.1341, 250),
(54, 'ru', 1827, 0.1341, 251),
(54, 'ru', 1828, 0.1341, 252),
(55, 'ru', 1828, 0.1411, 97),
(54, 'ru', 1829, 0.1341, 253),
(54, 'ru', 1830, 0.1341, 280),
(55, 'ru', 1831, 0.1411, 1),
(55, 'ru', 1832, 0.1411, 11),
(55, 'ru', 1833, 0.1411, 13),
(56, 'ru', 1833, 0.1453, 11),
(55, 'ru', 1834, 0.1411, 20),
(55, 'ru', 1835, 0.1411, 31),
(55, 'ru', 1836, 0.1411, 38),
(53, 'ru', 1836, 0.1464, 29),
(55, 'ru', 1837, 0.1411, 40),
(53, 'ru', 1837, 0.1464, 31),
(55, 'ru', 1838, 0.1411, 41),
(53, 'ru', 1838, 0.1464, 32),
(55, 'ru', 1839, 0.1411, 42),
(53, 'ru', 1839, 0.1464, 33),
(55, 'ru', 1840, 0.1411, 52),
(55, 'ru', 1841, 0.1411, 62),
(55, 'ru', 1842, 0.1411, 65),
(56, 'ru', 1842, 0.1453, 107),
(55, 'ru', 1843, 0.1411, 68),
(55, 'ru', 1844, 0.1411, 74),
(56, 'ru', 1844, 0.1453, 48),
(53, 'ru', 1844, 0.1464, 116),
(55, 'ru', 1845, 0.1411, 85),
(55, 'ru', 1846, 0.1411, 88),
(55, 'ru', 1847, 0.1411, 91),
(55, 'ru', 1848, 0.1411, 95),
(55, 'ru', 1849, 0.1411, 96),
(55, 'ru', 1850, 0.1411, 106),
(56, 'ru', 1850, 0.1453, 65),
(53, 'ru', 1851, 0.1464, 123),
(55, 'ru', 1851, 0.2236, 163),
(53, 'ru', 1852, 0.1464, 124),
(55, 'ru', 1852, 0.2236, 164),
(53, 'ru', 1853, 0.1464, 128),
(55, 'ru', 1853, 0.2236, 168),
(53, 'ru', 1854, 0.232, 131.5),
(55, 'ru', 1854, 0.3276, 171.5),
(53, 'ru', 1855, 0.232, 139.5),
(55, 'ru', 1855, 0.3276, 179.5),
(53, 'ru', 1856, 0.1464, 135),
(55, 'ru', 1856, 0.2236, 175),
(53, 'ru', 1857, 0.1464, 143),
(55, 'ru', 1857, 0.2236, 183),
(53, 'ru', 1858, 0.1464, 144),
(55, 'ru', 1858, 0.2236, 184),
(53, 'ru', 1859, 0.1464, 147),
(55, 'ru', 1859, 0.2236, 187),
(53, 'ru', 1860, 0.1464, 148),
(55, 'ru', 1860, 0.2236, 188),
(55, 'ru', 1861, 0.1411, 145),
(55, 'ru', 1862, 0.1411, 146),
(55, 'ru', 1863, 0.1411, 147),
(56, 'ru', 1863, 0.1453, 39),
(55, 'ru', 1864, 0.1411, 155),
(55, 'ru', 1865, 0.2236, 164),
(55, 'ru', 1866, 0.1411, 176),
(55, 'ru', 1867, 0.1411, 189),
(55, 'ru', 1868, 0.1411, 191),
(55, 'ru', 1869, 0.1411, 195),
(55, 'ru', 1870, 0.1411, 197),
(55, 'ru', 1871, 0.1411, 198),
(55, 'ru', 1872, 0.1411, 199),
(56, 'ru', 1872, 0.1453, 59),
(53, 'ru', 1872, 0.1464, 71),
(55, 'ru', 1873, 0.1411, 205),
(55, 'ru', 1874, 0.1411, 245),
(55, 'ru', 1875, 0.1411, 256),
(56, 'ru', 1875, 0.1453, 167),
(55, 'ru', 1876, 0.1411, 272),
(56, 'ru', 1877, 0.1453, 1),
(56, 'ru', 1878, 0.1453, 3),
(56, 'ru', 1879, 0.1453, 4),
(56, 'ru', 1880, 0.1453, 12),
(56, 'ru', 1881, 0.1453, 22),
(56, 'ru', 1882, 0.1453, 67),
(56, 'ru', 1883, 0.1453, 72),
(56, 'ru', 1884, 0.1453, 73),
(56, 'ru', 1885, 0.1453, 75),
(56, 'ru', 1886, 0.1453, 77),
(56, 'ru', 1887, 0.1453, 78),
(56, 'ru', 1888, 0.1453, 79),
(56, 'ru', 1889, 0.1453, 80),
(56, 'ru', 1890, 0.1453, 93),
(56, 'ru', 1891, 0.1453, 98),
(56, 'ru', 1892, 0.1453, 109),
(56, 'ru', 1893, 0.1453, 110),
(56, 'ru', 1894, 0.1453, 128),
(56, 'ru', 1895, 0.1453, 136),
(56, 'ru', 1896, 0.1453, 139),
(56, 'ru', 1897, 0.1453, 141),
(56, 'ru', 1898, 0.1453, 142),
(56, 'ru', 1899, 0.1453, 148),
(56, 'ru', 1900, 0.1453, 185),
(56, 'ru', 1901, 0.1453, 225),
(53, 'ru', 1901, 0.1464, 181),
(57, 'ru', 1902, 0.2314, 2),
(53, 'ru', 1903, 0.1464, 5),
(53, 'ru', 1904, 0.1464, 6),
(53, 'ru', 1905, 0.1464, 7),
(53, 'ru', 1906, 0.1464, 19),
(53, 'ru', 1907, 0.1464, 21),
(53, 'ru', 1908, 0.1464, 34),
(53, 'ru', 1909, 0.1464, 44),
(53, 'ru', 1910, 0.1464, 45),
(53, 'ru', 1911, 0.1464, 62),
(53, 'ru', 1912, 0.1464, 63),
(53, 'ru', 1913, 0.1464, 93),
(53, 'ru', 1914, 0.1464, 100),
(58, 'ru', 1915, 0.2314, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `b_search_content_text`
--

CREATE TABLE IF NOT EXISTS `b_search_content_text` (
  `SEARCH_CONTENT_ID` int(11) NOT NULL,
  `SEARCH_CONTENT_MD5` char(32) COLLATE utf8_unicode_ci NOT NULL,
  `SEARCHABLE_CONTENT` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`SEARCH_CONTENT_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `b_search_content_text`
--

INSERT INTO `b_search_content_text` (`SEARCH_CONTENT_ID`, `SEARCH_CONTENT_MD5`, `SEARCHABLE_CONTENT`) VALUES
(1, 'be3fe2336ca014ea48484837a6379cf7', 'КАРТА САЙТА\r\n\r\n'),
(2, 'f58e028735b5d07233c4a161c9231405', 'ПОИСК\r\n\r\n'),
(3, '626a5d1bd18fcc622fbe4e4e3619a88a', 'НОВОСТИ\r\n\r\n'),
(4, 'ea6b7e8f2315bef45aff06046bff51b8', 'ЗАДАТЬ ВОПРОС\r\n\r\n'),
(5, 'ee602ab8f349ac45ec99a9106c43927d', 'ЊннтаЪты\r\nTEXT HERE....\r\n'),
(41, '6aa0345eab14d55c7b121451604dcc69', 'ФранчайзШнв\r\nTEXT HERE....\r\n'),
(42, 'e9aa14fb3d6241919fc2c32cd9a777b4', 'ЎЯтнвые ЯрнХажШ\r\nTEXT HERE....\r\n'),
(43, '2bacc6c7cfb42ae3811c0649d153cea6', 'ЌавазШны\r\nTEXT HERE....\r\n'),
(44, 'd48fdddb769925c717e8db37cc8db440', 'JAMILCO\r\n\r\n'),
(6, '5cb3783e398e7c6ed1983ad2cd1d6419', 'НАШИ РЕКВИЗИТЫ\r\nНАИМЕНОВАНИЕ БАНКА\rЗАКРЫТОЕ АКЦИОНЕРНОЕ ОБЩЕСТВО "НАЗВАНИЕ БАНКА"\rСОКРАЩЕННОЕ НАЗВАНИЕ\rЗАО "НАЗВАНИЕ БАНКА"\rПОЛНОЕ НАИМЕНОВАНИЕ НА АНГЛИЙСКОМ ЯЗЫКЕ\r"THE NAME OF BANK"\rОСНОВНОЙ ГОСУДАРСТВЕННЫЙ РЕГИСТРАЦИОННЫЙ НОМЕР\r152073950937987\rTELEX\r911156 IRS RU\rS.W.I.F.T.\rIISARUMM\rSPRINT\rRU.BANK/BITEX\rЮРИДИЧЕСКИЙ АДРЕС: \r175089, РОССИЯ, Г. МОСКВА, УЛ. БОЛЬШАЯ ДМИТРОВКА, Д. 15, СТР. 1\rКОР/СЧЕТ: \r30102810000000000569\rИНН:\r7860249880\rБИК:\r044591488\rОКПО:\r11806935\rОКОНХ:\r98122\rКПП:\r775021017\rПРОЧАЯ ИНФОРМАЦИЯ\rБАНКОВСКИЙ ИДЕНТИФИКАЦИОННЫЙ КОД: 0575249000\rПОЧТОВЫЙ АДРЕС: 115035, РОССИЯ, Г. МОСКВА, УЛ. БАЛЧУГ, Д. 2\rТЕЛЕФОН: (495) 960-10-12\rФАКС: (495) 240-38-12\rE-MAIL: \rRUSBK@MAIL.RUSBANK.RU\r\n'),
(7, '06cecc23c5cc18e8d1e0166639dc5c25', 'АВТОРИЗАЦИЯ\r\nВЫ ЗАРЕГИСТРИРОВАНЫ И УСПЕШНО АВТОРИЗОВАЛИСЬ.\rИСПОЛЬЗУЙТЕ АДМИНИСТРАТИВНУЮ ПАНЕЛЬ В ВЕРХНЕЙ ЧАСТИ ЭКРАНА ДЛЯ БЫСТРОГО ДОСТУПА К ФУНКЦИЯМ УПРАВЛЕНИЯ СТРУКТУРОЙ И ИНФОРМАЦИОННЫМ НАПОЛНЕНИЕМ САЙТА. НАБОР КНОПОК ВЕРХНЕЙ ПАНЕЛИ ОТЛИЧАЕТСЯ ДЛЯ РАЗЛИЧНЫХ РАЗДЕЛОВ САЙТА. ТАК ОТДЕЛЬНЫЕ НАБОРЫ ДЕЙСТВИЙ ПРЕДУСМОТРЕНЫ ДЛЯ УПРАВЛЕНИЯ СТАТИЧЕСКИМ СОДЕРЖИМЫМ СТРАНИЦ, ДИНАМИЧЕСКИМИ ПУБЛИКАЦИЯМИ (НОВОСТЯМИ, КАТАЛОГОМ, ФОТОГАЛЕРЕЕЙ) И Т.П.\rВЕРНУТЬСЯ НА ГЛАВНУЮ СТРАНИЦУ\r\n'),
(8, 'da1f66499efacd659dcf24c5c7f6fcb2', 'ЛИЗИНГ\r\nНАШ БАНК ОКАЗЫВАЕТ ВЕСЬ СПЕКТР УСЛУГ ПО ФИНАНСОВОЙ АРЕНДЕ (ЛИЗИНГУ) ОТЕЧЕСТВЕННОГО И ИМПОРТНОГО ОБОРУДОВАНИЯ, ТРАНСПОРТА И НЕДВИЖИМОСТИ.\rЛИЗИНГ ОБОРУДОВАНИЯ И ТРАНСПОРТА\rОСНОВНЫЕ УСЛОВИЯ:\rСРОК ФИНАНСИРОВАНИЯ:\nОБОРУДОВАНИЕ И ТРАНСПОРТ - ДО 5 ЛЕТ\rЖ/Д ПОДВИЖНОЙ СОСТАВ - ДО 10 ЛЕТ\rВАЛЮТА ФИНАНСИРОВАНИЯ: РУБЛИ, ДОЛЛАРЫ США, ЕВРО\rМИНИМАЛЬНАЯ СУММА ФИНАНСИРОВАНИЯ: ОТ 4,5 МЛН.РУБ.\rАВАНС: ОТ 0%\rУДОРОЖАНИЕ: ОТ 9%\rСРОК ПРИНЯТИЯ РЕШЕНИЯ: ОТ 14 ДНЕЙ\rФИНАНСИРОВАНИЕ ИМПОРТНЫХ ПОСТАВОК\rМЫ ПРЕДОСТАВЛЯЕМ ПРЕДПРИЯТИЯМ ДОСТУП К ЛЬГОТНОМУ ФИНАНСИРОВАНИЮ ИМПОРТНЫХ ПОСТАВОК ОБОРУДОВАНИЯ И ТРАНСПОРТА С ИСПОЛЬЗОВАНИЕМ МЕХАНИЗМА ЛИЗИНГА ПРИ УЧАСТИИ ЭКСПОРТНЫХ КРЕДИТНЫХ АГЕНТСТВ.\rОСНОВНЫЕ УСЛОВИЯ:\rСРОК ФИНАНСИРОВАНИЯ: ДО 7 ЛЕТ\rВАЛЮТА ФИНАНСИРОВАНИЯ: РУБЛИ, ДОЛЛАРЫ США, ЕВРО\rМИНИМАЛЬНАЯ СУММА ФИНАНСИРОВАНИЯ: ОТ 15 МЛН.РУБ. \rАВАНС: ОТ 15% (БЕЗ УЧЕТА ТАМОЖЕННЫХ ПОШЛИН) \rУДОРОЖАНИЕ: ОТ 5%\rСРОК ПРИНЯТИЯ РЕШЕНИЯ: ОТ 14 ДНЕЙ\rЛИЗИНГ КОММЕРЧЕСКОЙ НЕДВИЖИМОСТИ\rПОЗВОЛЯЕТ ПРЕДПРИЯТИЯМ ПРИОБРЕСТИ ОБЪЕКТЫ КОММЕРЧЕСКОЙ НЕДВИЖИМОСТИ БЕЗ ЕДИНОВРЕМЕННОГО ОТВЛЕЧЕНИЯ ЗНАЧИТЕЛЬНЫХ СРЕДСТВ.\rВ КАЧЕСТВЕ ПРЕДМЕТА ЛИЗИНГА МОГУТ ВЫСТУПАТЬ:\rОФИСНЫЕ ЗДАНИЯ;\rТОРГОВЫЕ, СКЛАДСКИЕ И ПРОИЗВОДСТВЕННЫЕ ПОМЕЩЕНИЯ;\rДРУГИЕ ОБЪЕКТЫ КОММЕРЧЕСКОЙ НЕДВИЖИМОСТИ.\rОСНОВНЫЕ УСЛОВИЯ:\rСРОК ФИНАНСИРОВАНИЯ: ОТ 5 ЛЕТ\rВАЛЮТА ФИНАНСИРОВАНИЯ: РУБЛИ, ДОЛЛАРЫ США, ЕВРО\rМИНИМАЛЬНАЯ СУММА ФИНАНСИРОВАНИЯ: ОТ 50 МЛН.РУБ.* \rАВАНС: ОТ 0%\rУДОРОЖАНИЕ: ОТ 7%\rСРОК ПРИНЯТИЯ РЕШЕНИЯ: ОТ 14 ДНЕЙ\r* РАЗМЕР СУММЫ ФИНАНСИРОВАНИЯ ЗАВИСИТ ОТ РЕГИОНА, В КОТОРОМ НАХОДИТСЯ ОБЪЕКТ НЕДВИЖИМОСТИ.\rОСНОВНЫМ ТРЕБОВАНИЕМ, ПРЕДЪЯВЛЯЕМЫМ НАШИМ БАНКОМ ДЛЯ РАССМОТРЕНИЯ ЗАЯВКИ НА ЛИЗИНГ КОММЕРЧЕСКОЙ НЕДВИЖИМОСТИ, ЯВЛЯЕТСЯ НАЛИЧИЕ ПОЛНОГО КОМПЛЕКТА ПРАВОУСТАНАВЛИВАЮЩИХ ДОКУМЕНТОВ НА НЕДВИЖИМОСТЬ И НАЛИЧИЕ ОТЧЕТА НЕЗАВИСИМОГО ОЦЕНЩИКА.\r\n'),
(9, '344cad3205bd5c2e8cffcf29a17ae499', 'КРЕДИТОВАНИЕ\r\nКРЕДИТОВАНИЕ МАЛОГО И СРЕДНЕГО БИЗНЕСА ЯВЛЯЕТСЯ ОДНИМ ИЗ СТРАТЕГИЧЕСКИХ НАПРАВЛЕНИЙ БАНКА.\rДАННОЕ НАПРАВЛЕНИЕ ВКЛЮЧАЕТ В СЕБЯ:\nКРЕДИТОВАНИЕ ЮРИДИЧЕСКИХ ЛИЦ\rКРЕДИТОВАНИЕ ИНДИВИДУАЛЬНЫХ ПРЕДПРИНИМАТЕЛЕЙ\rВ ЗАВИСИМОСТИ ОТ ПОЖЕЛАНИЙ КЛИЕНТА КРЕДИТЫ ДЛЯ БИЗНЕСА ПРЕДОСТАВЛЯЮТСЯ В РАЗНЫХ ВАЛЮТАХ: В РУБЛЯХ РФ, ДОЛЛАРАХ США И ЕВРО. \nПРЕИМУЩЕСТВА ПОЛУЧЕНИЯ КРЕДИТА В НАШЕМ БАНКЕ:\rСРОК РАССМОТРЕНИЯ КРЕДИТНОЙ ЗАЯВКИ ОТ 2-Х РАБОЧИХ ДНЕЙ; \rОТСУТСТВИЕ ЕЖЕМЕСЯЧНОЙ ПЛАТЫ ЗА ВЕДЕНИЕ ССУДНОГО СЧЕТА;\rОТСУТСТВИЕ ТРЕБОВАНИЙ ПО ПРЕДОСТАВЛЕНИЮ БИЗНЕС-ПЛАНА;\rПРИНИМАЕТСЯ К РАССМОТРЕНИЮ УПРАВЛЕНЧЕСКАЯ ОТЧЕТНОСТЬ;\rВ КАЧЕСТВЕ ЗАЛОГА РАССМАТРИВАЮТСЯ ТОВАРЫ В ОБОРОТЕ, АВТОТРАНСПОРТ, ОБОРУДОВАНИЕ, НЕДВИЖИМОСТЬ И ДРУГОЕ ЛИКВИДНОЕ ИМУЩЕСТВО; \rГИБКИЕ УСЛОВИЯ ПОГАШЕНИЯ КРЕДИТА. \rДЛЯ ПОЛУЧЕНИЯ КРЕДИТА:\rПОЗВОНИТЕ НАМ ПО ТЕЛЕФОНУ +7 (495) 757-57-57, ОБРАТИТЕСЬ В БЛИЖАЙШЕЕ К ВАМ ОТДЕЛЕНИЕ БАНКА ИЛИ ЗАПОЛНИТЕ ON-LINE ЗАЯВКУ. \rНАШИ СПЕЦИАЛИСТЫ ПОМОГУТ ВАМ ВЫБРАТЬ УДОБНЫЕ УСЛОВИЯ КРЕДИТОВАНИЯ И ОТВЕТЯТ НА ИНТЕРЕСУЮЩИЕ ВАС ВОПРОСЫ.\rПОДГОТОВЬТЕ НЕОБХОДИМЫЕ ДЛЯ РАССМОТРЕНИЯ КРЕДИТНОЙ ЗАЯВКИ ДОКУМЕНТЫ И ДОГОВОРИТЕСЬ О ВСТРЕЧЕ С КРЕДИТНЫМ ЭКСПЕРТОМ БАНКА.\rПОКАЖИТЕ КРЕДИТНОМУ ЭКСПЕРТУ ВАШЕ ПРЕДПРИЯТИЕ И ИМУЩЕСТВО, ПРЕДЛАГАЕМОЕ В ЗАЛОГ.\rПОЛУЧИТЕ КРЕДИТ НА РАЗВИТИЕ ВАШЕГО БИЗНЕСА! \nПРОГРАММЫ КРЕДИТОВАНИЯ МАЛОГО И СРЕДНЕГО БИЗНЕСА:\rПРОГРАММА\nСУММА КРЕДИТА\nПРОЦЕНТНАЯ СТАВКА\nСРОК КРЕДИТА\n«ОВЕРДРАФТ»\rОТ 300 000\nДО 5 000 000 РУБЛЕЙ\nОТ 18% ГОДОВЫХ\nДО 12 МЕСЯЦЕВ\n«МИНИКРЕДИТ»\rОТ 150 000\nДО 1 000 000 РУБЛЕЙ\nОТ 24% ГОДОВЫХ\nДО 36 МЕСЯЦЕВ\n«РАЗВИТИЕ»\nОТ 1 000 000\nДО 15 000 000 РУБЛЕЙ\nОТ 17% ГОДОВЫХ\nДО 36 МЕСЯЦЕВ\n«ИНВЕСТ»\nОТ 1 000 000\nДО 30 000 000 РУБЛЕЙ\nОТ 15% ГОДОВЫХ\nДО 72 МЕСЯЦЕВ\r\n'),
(10, '4c6e4f50a46679283be9c0d9734ef751', 'ПЛАСТИКОВЫЕ КАРТЫ\r\nНАШ БАНК ПРОВОДИТ ОПЕРАЦИИ С ПЛАСТИКОВЫМИ КАРТАМИ С 1997 Г. СЕГОДНЯ МЫ ПРЕДЛАГАЕМ ПЛАСТИКОВЫЕ КАРТЫ ОСНОВНЫХ МЕЖДУНАРОДНЫХ ПЛАТЁЖНЫХ СИСТЕМ – VISA И MASTERCARD; ОТ САМЫХ ДЕМОКРАТИЧНЫХ ЕLЕCTRON ДО ЭЛИТНЫХ GOLD И PLATINUM. В РАМКАХ ПЕРСОНАЛЬНОГО ОБСЛУЖИВАНИЯ В РАМКАХ ПЕРСОНАЛЬНОГО БАНКОВСКОГО ОБСЛУЖИВАНИЯ БАНК ДОПОЛНИТЕЛЬНО ПРЕДЛАГАЕТ ЭКСКЛЮЗИВНЫЕ КАРТЫ VISA INFINITE С БРИЛЛИАНТАМИ И ПЛАТИНОВЫМ ОРНАМЕНТОМ.\rЗАКАЗАТЬ МЕЖДУНАРОДНУЮ ПЛАСТИКОВУЮ КАРТУ МОЖНО В ЛЮБОМ ОТДЕЛЕНИИ НАШЕГО БАНКА. ВАША КАРТА БУДЕТ ГОТОВА УЖЕ ЧЕРЕЗ 3-5 ДНЕЙ. НАШ БАНК ОДИН ИЗ НЕМНОГИХ В РОССИИ, КТО ВЫДАЕТ КАРТУ СРОКОМ НА ДВА ГОДА, КАК И КРУПНЕЙШИЕ ЗАРУБЕЖНЫЕ БАНКИ.КАЖДЫЙ ПАКЕТ УСЛУГ БАНКА ВКЛЮЧАЕТ ОДНУ ОСНОВНУЮ И ДО ТРЕХ ДОПОЛНИТЕЛЬНЫХ ПЛАСТИКОВЫХ КАРТ ДЛЯ ВАС И ДЛЯ ЧЛЕНОВ ВАШЕЙ СЕМЬИ (ВКЛЮЧАЯ ДЕТЕЙ СТАРШЕ 14 ЛЕТ). ВЫ САМИ УСТАНАВЛИВАЕТЕ ОГРАНИЧЕНИЯ: КТО И СКОЛЬКО МОЖЕТ ПОТРАТИТЬ ПО КАРТЕ.\rТЕРЯЯ ПЛАСТИКОВУЮ КАРТУ, ВЫ НЕ ТЕРЯЕТЕ ДЕНЬГИ. ПОТОМУ ЧТО КАРТЫ НАШЕГО БАНКА НАДЕЖНО ЗАЩИЩЕНЫ ОТ НЕЗАКОННОГО ИСПОЛЬЗОВАНИЯ. ПРОСТО СОБЛЮДАЙТЕ ПРАВИЛА БЕЗОПАСНОСТИ ПРИ ОБРАЩЕНИИ СО СВОЕЙ КАРТОЙ, А В СЛУЧАЕ ЕЕ ПРОПАЖИ ИЛИ ХИЩЕНИЯ БЕЗ ПРОМЕДЛЕНИЯ ОБРАТИТЕСЬ В БАНК.\rПРЕИМУЩЕСТВА ПЛАСТИКОВЫХ КАРТ БАНКА\rПОЛУЧЕНИЕ НАЛИЧНЫХ БЕЗ КОМИССИИ В ШИРОКОЙ СЕТИ БАНКОМАТОВ;\rСВЕДЕНИЯ ОБ ОСТАТКЕ И СОВЕРШЁННЫХ ОПЕРАЦИЯХ ПО КАРТЕ ПРИХОДЯТ ПО SMS;\rСИСТЕМА ИНТЕРНЕТ-БАНКИНГА ПОЗВОЛЯЕТ ВЛАДЕЛЬЦУ КАРТЫ КОНТРОЛИРОВАТЬ РАСХОДЫ И УПРАВЛЯТЬ СРЕДСТВАМИ НА КАРТОЧНЫХ СЧЕТАХ.\rВСЕМ ВЛАДЕЛЬЦАМ КАРТ БАНКА ДОСТУПНЫ CКИДКИ И БОНУСНЫЕ ПРОГРАММЫ.\rВИДЫ ПЛАСТИКОВЫХ КАРТ\rДЕБЕТОВЫЕ КАРТЫ:\rУДОБСТВО БЕЗНАЛИЧНОЙ ОПЛАТЫ ТОВАРОВ И УСЛУГ\rБЕЗОПАСНОЕ ХРАНЕНИЕ СОБСТВЕННЫХ СРЕДСТВ\rНАЧИСЛЕНИЕ ПРОЦЕНТОВ НА ОСТАТОК ПО КАРТЕ\rКОНТРОЛЬ НАД РАСХОДАМИ И УПРАВЛЕНИЕ СВОИМИ ДЕНЬГАМИ\rКРЕДИТНЫЕ КАРТЫ:\rКРЕДИТОВАНИЕ БЕЗ ПРОЦЕНТОВ ДО 55 ДНЕЙ\rПОЛЬЗОВАТЬСЯ КРЕДИТОМ МОЖНО МНОГОКРАТНО, НЕ ОБРАЩАЯСЬ В БАНК\rБЕЗНАЛИЧНАЯ ОПЛАТА ТОВАРОВ И УСЛУГ БЕЗ КОМИССИЙ В ЛЮБОЙ ТОЧКЕ МИРА\rПРОВОЗ ДЕНЕГ ЧЕРЕЗ ГРАНИЦУ БЕЗ ТАМОЖЕННОГО ОФОРМЛЕНИЯ\rНЕ НУЖНО ПОКУПАТЬ ВАЛЮТУ ДЛЯ ВЫЕЗДА В ДРУГИЕ СТРАНЫ\rВСЕ ПОЛЕЗНЫЕ ФУНКЦИИ ДЕБЕТОВЫХ КАРТ\r\n'),
(11, 'dc76e079e3571df6ebba5ee1fd4ce0cd', 'МАЛОМУ И СРЕДНЕМУ БИЗНЕСУ\r\nРАБОТА С ПРЕДПРИЯТИЯМИ МАЛОГО И СРЕДНЕГО БИЗНЕСА - ОДНО ИЗ СТРАТЕГИЧЕСКИ ВАЖНЫХ НАПРАВЛЕНИЙ ДЕЯТЕЛЬНОСТИ БАНКА. НАШ БАНК ПРЕДСТАВЛЯЕТ СОВРЕМЕННЫЕ ПРОГРАММЫ ОБСЛУЖИВАНИЯ МАЛОГО И СРЕДНЕГО БИЗНЕСА, ОБЕСПЕЧИВАЕТ ОПТИМАЛЬНЫЕ И ВЗАИМОВЫГОДНЫЕ ВАРИАНТЫ СОТРУДНИЧЕСТВА, В ОСНОВЕ КОТОРЫХ ЛЕЖИТ ПРОФЕССИОНАЛИЗМ СОТРУДНИКОВ И ВЫСОКОЕ КАЧЕСТВО БАНКОВСКИХ УСЛУГ. УСЛУГИ НАШЕГО БАНКА ОТЛИЧАЮТСЯ ОПЕРАТИВНОСТЬЮ И НАДЕЖНОСТЬЮ, ТАК КАК ОРИЕНТИРОВАНЫ НА ДЕЛОВЫХ ЛЮДЕЙ - НА ТЕХ, КТО ЦЕНИТ СВОЕ ВРЕМЯ И ДЕНЬГИ.\rБАНК ПРЕДЛАГАЕТ СЛЕДУЮЩИЕ ВИДЫ УСЛУГ ДЛЯ ПРЕДПРИЯТИЙ МАЛОГО И СРЕДНЕГО БИЗНЕСА:\rКРЕДИТОВАНИЕ\rЛИЗИНГ\rДЕПОЗИТЫ\rПЛАСТИКОВЫЕ КАРТЫ\r\n'),
(12, '3e30b6e27a290bc4818f2de6a938fdf3', 'ДЕПОЗИТЫ\r\nНАШ БАНК ПРЕДЛАГАЕТ ВАМ ЭФФЕКТИВНО РАЗМЕСТИТЬ СВОБОДНЫЕ ДЕНЬГИ НА БАНКОВСКОМ ДЕПОЗИТЕ И ПОЛУЧИТЬ ДОПОЛНИТЕЛЬНУЮ ПРИБЫЛЬ.\rДЕПОЗИТНЫЕ ПРОДУКТЫ\r \rДОСРОЧНОЕ РАСТОРЖЕНИЕ\rПОПОЛНЕНИЕ\rЧАСТИЧНОЕ ИЗЪЯТИЕ\rВЫПЛАТА ПРОЦЕНТОВ\rДЕПОЗИТ С ВЫПЛАТОЙ ПРОЦЕНТОВ В КОНЦЕ СРОКА\rНЕ ПРЕДУСМОТРЕНО.\rНЕ ПРЕДУСМОТРЕНО.\rНЕ ПРЕДУСМОТРЕНО.\rВ КОНЦЕ СРОКА.\rДЕПОЗИТ С ВЫПЛАТОЙ ПРОЦЕНТОВ ЕЖЕМЕСЯЧНО\rНЕ ПРЕДУСМОТРЕНО.\rНЕ ПРЕДУСМОТРЕНО.\rНЕ ПРЕДУСМОТРЕНО.\rЕЖЕМЕСЯЧНО.\rДЕПОЗИТ С ВОЗМОЖНОСТЬЮ ПОПОЛНЕНИЯ\rНЕ ПРЕДУСМОТРЕНО.\rПРЕКРАЩАЕТСЯ ЗА 2 МЕСЯЦА ДО ОКОНЧАНИЯ СРОКА ДЕЙСТВИЯ ДЕПОЗИТА. \rНЕ ПРЕДУСМОТРЕНО \rВ КОНЦЕ СРОКА. \rДЕПОЗИТ С ВОЗМОЖНОСТЬЮ ПОПОЛНЕНИЯ И ИЗЪЯТИЯ\rНЕ ПРЕДУСМОТРЕНО.\rПРЕКРАЩАЕТСЯ ЗА 2 МЕСЯЦА ДО ОКОНЧАНИЯ СРОКА ДЕЙСТВИЯ ДЕПОЗИТА.\rНЕ БОЛЕЕ 40% ОТ ПЕРВОНАЧАЛЬНОЙ СУММЫ ВКЛАДА ЗА ВЕСЬ СРОК ДЕПОЗИТА \rВ КОНЦЕ СРОКА. \rДЕПОЗИТ С ВОЗМОЖНОСТЬЮ ДОСРОЧНОГО РАСТОРЖЕНИЯ \rВОЗМОЖНО ПРИ РАЗМЕЩЕНИИ НА 12 МЕСЯЦЕВ, НО НЕ РАНЕЕ ЧЕМ ЧЕРЕЗ 6 МЕСЯЦЕВ.\rНЕ ПРЕДУСМОТРЕНО.\rНЕ ПРЕДУСМОТРЕНО. \rВ КОНЦЕ СРОКА.\r\n'),
(13, '5294819207cd629318e1de373aa1e6f3', 'УСЛУГИ\r\nНАШ БАНК ПРЕДОСТАВЛЯЕТ ФИЗИЧЕСКИМ ЛИЦАМ БОЛЬШОЕ ЧИСЛО РАЗЛИЧНЫХ ВОЗМОЖНОСТЕЙ, СВЯЗАННЫХ С СОХРАНЕНИЕМ СРЕДСТВ И СОВЕРШЕНИЕМ РАЗЛИЧНЫХ СДЕЛОК. В ЧАСТНОСТИ, БАНК ПРЕДЛАГАЕТ СВОИМ КЛИЕНТАМ ШИРОКУЮ ЛИНЕЙКУ РАЗНООБРАЗНЫХ ВКЛАДОВ, СПОСОБНЫХ УДОВЛЕТВОРИТЬ КАК ДОЛГОСРОЧНЫЕ, ТАК И КРАТКОСРОЧНЫЕ ИНТЕРЕСЫ, КАСАЮЩИЕСЯ РАЗМЕЩЕНИЯ СВОБОДНЫХ СРЕДСТВ ПО ВЫГОДНЫМ СТАВКАМ. В СВОЕЙ РАБОТЕ БАНК АКТИВНО ПРИМЕНЯЕТ ИННОВАЦИОННЫЕ ТЕХНОЛОГИИ ДИНАМИЧНО РАЗВИВАЮЩЕЙСЯ БАНКОВСКОЙ СФЕРЫ.\rБАНК ПРЕДЛАГАЕТ СВОИМ КЛИЕНТАМ КАЧЕСТВЕННЫЙ УНИВЕРСАЛЬНЫЙ СЕРВИС ПО СЛЕДУЮЩИМ НАПРАВЛЕНИЯМ:\rБАНКОВСКИЕ КАРТЫ\rПОТРЕБИТЕЛЬСКИЙ КРЕДИТ\rМАЛОМУ И СРЕДНЕМУ БИЗНЕСУ\rРАБОТА С ПРЕДПРИЯТИЯМИ МАЛОГО И СРЕДНЕГО БИЗНЕСА - ОДНО ИЗ СТРАТЕГИЧЕСКИ ВАЖНЫХ НАПРАВЛЕНИЙ ДЕЯТЕЛЬНОСТИ БАНКА. НАШ БАНК ПРЕДСТАВЛЯЕТ СОВРЕМЕННЫЕ ПРОГРАММЫ ОБСЛУЖИВАНИЯ МАЛОГО И СРЕДНЕГО БИЗНЕСА, ОБЕСПЕЧИВАЕТ ОПТИМАЛЬНЫЕ И ВЗАИМОВЫГОДНЫЕ ВАРИАНТЫ СОТРУДНИЧЕСТВА, В ОСНОВЕ КОТОРЫХ ЛЕЖИТ ПРОФЕССИОНАЛИЗМ СОТРУДНИКОВ И ВЫСОКОЕ КАЧЕСТВО БАНКОВСКИХ УСЛУГ. УСЛУГИ НАШЕГО БАНКА ОТЛИЧАЮТСЯ ОПЕРАТИВНОСТЬЮ И НАДЕЖНОСТЬЮ, ТАК КАК ОРИЕНТИРОВАНЫ НА ДЕЛОВЫХ ЛЮДЕЙ - НА ТЕХ, КТО ЦЕНИТ СВОЕ ВРЕМЯ И ДЕНЬГИ.\rБАНК ПРЕДЛАГАЕТ СЛЕДУЮЩИЕ ВИДЫ УСЛУГ ДЛЯ ПРЕДПРИЯТИЙ МАЛОГО И СРЕДНЕГО БИЗНЕСА:\rКРЕДИТОВАНИЕ\rЛИЗИНГ\rДЕПОЗИТЫ\rПЛАСТИКОВЫЕ КАРТЫ\rКОРПОРАТИВНЫМ КЛИЕНТАМ\rБАНК ЯВЛЯЕТСЯ ОДНИМ ИЗ ЛИДЕРОВ БАНКОВСКОГО РЫНКА ПО ОБСЛУЖИВАНИЮ КОРПОРАТИВНЫХ КЛИЕНТОВ. \rКОМПЛЕКСНОЕ БАНКОВСКОЕ ОБСЛУЖИВАНИЕ НА ОСНОВЕ МАКСИМАЛЬНОГО ИСПОЛЬЗОВАНИЯ КОНКУРЕНТНЫХ ПРЕИМУЩЕСТВ И ВОЗМОЖНОСТЕЙ БАНКА ПОЗВОЛЯЕТ СОЗДАТЬ УСТОЙЧИВУЮ \rФИНАНСОВУЮ ПЛАТФОРМУ ДЛЯ РАЗВИТИЯ БИЗНЕСА ПРЕДПРИЯТИЙ И ХОЛДИНГОВ РАЗЛИЧНЫХ ОТРАСЛЕЙ ЭКОНОМИКИ. УЖЕ БОЛЕЕ 15 ЛЕТ БАНК РАБОТАЕТ ДЛЯ СВОИХ КЛИЕНТОВ, \rЯВЛЯЯСЬ ОБРАЗЦОМ НАДЕЖНОСТИ И ВЫСОКОГО ПРОФЕССИОНАЛИЗМА.\rНАШ БАНК ПРЕДЛАГАЕТ КОРПОРАТИВНЫМ КЛИЕНТАМ СЛЕДУЮЩИЕ ВИДЫ УСЛУГ:\rРАСЧЕТНО-КАССОВОЕ ОБСЛУЖИВАНИЕ\rИНКАССАЦИЯ\rИНТЕРНЕТ-БАНКИНГ\rФИНАНСОВЫМ ОРГАНИЗАЦИЯМ\rАКТИВНОЕ СОТРУДНИЧЕСТВО НА ФИНАНСОВЫХ РЫНКАХ ПРЕДСТАВЛЯЕТ СОБОЙ ОДНУ ИЗ НАИБОЛЕЕ ВАЖНЫХ СТОРОН БИЗНЕСА И ЯВЛЯЕТСЯ ПЕРСПЕКТИВНЫМ НАПРАВЛЕНИЕМ ДЕЯТЕЛЬНОСТИ НАШЕГО БАНКА. ПОЛИТИКА БАНКА НАПРАВЛЕНА НА РАСШИРЕНИЕ СОТРУДНИЧЕСТВА, УВЕЛИЧЕНИЕ ОБЪЕМОВ ВЗАИМНЫХ КРЕДИТНЫХ ЛИНИЙ. СОЛИДНАЯ ДЕЛОВАЯ РЕПУТАЦИЯ БАНКА НА РЫНКЕ МЕЖБАНКОВСКИХ ОПЕРАЦИЙ СПОСОБСТВУЕТ НАЛАЖИВАНИЮ СТАБИЛЬНЫХ И ВЗАИМОВЫГОДНЫХ ПАРТНЕРСКИХ ОТНОШЕНИЙ С САМЫМИ КРУПНЫМИ И НАДЕЖНЫМИ БАНКАМИ СТРАНЫ.\rОСОБОЕ ВНИМАНИЕ БАНК УДЕЛЯЕТ РАЗВИТИЮ ВЗАИМООТНОШЕНИЙ С МЕЖДУНАРОДНЫМИ ФИНАНСОВЫМИ ИНСТИТУТАМИ. ФИНАНСИРОВАНИЕ ДОЛГОСРОЧНЫХ И СРЕДНЕСРОЧНЫХ ПРОЕКТОВ КЛИЕНТОВ ЗА СЧЕТ ПРИВЛЕЧЕНИЯ СРЕДСТВ НА МЕЖДУНАРОДНЫХ РЫНКАХ КАПИТАЛА - ОДНО ИЗ ПРИОРИТЕТНЫХ НАПРАВЛЕНИЙ ДЕЯТЕЛЬНОСТИ БАНКА. НАШ БАНК ИМЕЕТ РАЗВИТУЮ СЕТЬ КОРРЕСПОНДЕНТСКИХ СЧЕТОВ, ЧТО ПОЗВОЛЯЕТ БЫСТРО И КАЧЕСТВЕННО ОСУЩЕСТВЛЯТЬ РАСЧЕТЫ В РАЗЛИЧНЫХ ВАЛЮТАХ. ПОРУЧЕНИЯ КЛИЕНТОВ МОГУТ БЫТЬ ИСПОЛНЕНЫ БАНКОМ В СЖАТЫЕ СРОКИ.\rВ ЦЕЛЯХ МИНИМИЗАЦИИ РИСКОВ ПРИ ПОВЕДЕНИИ ОПЕРАЦИЙ НА ФИНАНСОВЫХ РЫНКАХ НАШ БАНК МАКСИМАЛЬНО ТРЕБОВАТЕЛЬНО ПОДХОДИТ К ВЫБОРУ СВОИХ БАНКОВ-КОНТРАГЕНТОВ. \rВ ДАННОМ НАПРАВЛЕНИИ БАНК ПРЕДЛАГАЕТ ФИНАНСОВЫМ ОРГАНИЗАЦИЯМ СЛЕДУЮЩИЕ УСЛУГИ:\rУСЛУГИ НА МЕЖБАНКОВСКОМ РЫНКЕ\rДЕПОЗИТАРНЫЕ УСЛУГИ\rДОКУМЕНТАРНЫЕ ОПЕРАЦИИ\r\n'),
(14, '97cc4b8d5eae6669c6e5920eca22f9cd', 'ПОТРЕБИТЕЛЬСКИЙ КРЕДИТ\r\nНЕ ВАЖНО, ДЛЯ ЧЕГО ВАМ НУЖНЫ ДЕНЬГИ — МЫ ДОВЕРЯЕМ ВАМ И НЕ ТРАТИМ ВРЕМЯ НА ЛИШНИЕ ПРОЦЕДУРЫ.\rТАРИФЫ КРЕДИТОВАНИЯ ФИЗИЧЕСКИХ ЛИЦ\rВ РУБЛЯХ\rСУММА КРЕДИТА: ОТ 150 000 ДО 1 500 000 РУБЛЕЙ\rСРОК КРЕДИТА: ОТ 6 ДО 36 МЕСЯЦЕВ\r% СТАВКА: ОТ 18 ДО 21,5% ГОДОВЫХ\rЕДИНОВРЕМЕННАЯ КОМИССИЯ ЗА ВЫДАЧУ КРЕДИТА: 2% ОТ СУММЫ КРЕДИТА\rВ ДОЛЛАРАХ США\rСУММА КРЕДИТА: ОТ 5 000 ДО 50 000 ДОЛЛАРОВ США\rСРОК КРЕДИТА: ОТ 6 ДО 24 МЕСЯЦЕВ\r% СТАВКА: ОТ 14,5 ДО 16,5% ГОДОВЫХ\rЕДИНОВРЕМЕННАЯ КОМИССИЯ ЗА ВЫДАЧУ КРЕДИТА: 2% ОТ СУММЫ КРЕДИТА\rУСЛОВИЯ КРЕДИТНОГО ДОГОВОРА И ПРИМЕНЯЕМЫЙ ТАРИФНЫЙ ПЛАН И/ИЛИ ТАРИФЫ ОПРЕДЕЛЯЮТСЯ В ИНДИВИДУАЛЬНОМ ПОРЯДКЕ, В ТОМ ЧИСЛЕ В ЗАВИСИМОСТИ ОТ ПОДТВЕРЖДЕННОГО ДОХОДА КЛИЕНТА. ИЗЛОЖЕННАЯ ИНФОРМАЦИЯ НЕ ЯВЛЯЕТСЯ ПУБЛИЧНОЙ ОФЕРТОЙ И НЕ ВЛЕЧЕТ ВОЗНИКНОВЕНИЯ У ЗАО «БАНК ИНТЕЗА» ОБЯЗАННОСТИ ПРЕДОСТАВИТЬ КРЕДИТ, КАК НА УКАЗАННЫХ, ТАК И НА ЛЮБЫХ ИНЫХ УСЛОВИЯХ.\rМИНИМАЛЬНЫЕ ТРЕБОВАНИЯ К ЗАЕМЩИКУ\rВЫ ГРАЖДАНИН РОССИИ.\rВАМ СЕЙЧАС БОЛЬШЕ 23 ЛЕТ И ВАМ БУДЕТ МЕНЬШЕ 60 (ДЛЯ МУЖЧИН) ИЛИ МЕНЬШЕ 55 (ДЛЯ ЖЕНЩИН) НА МОМЕНТ ПОГАШЕНИЯ (ТО ЕСТЬ ПОЛНОЙ ОПЛАТЫ) КРЕДИТА.\rУ ВАС ЕСТЬ ОФИЦИАЛЬНОЕ МЕСТО РАБОТЫ, И ВЫ РАБОТАЕТЕ НА НЕМ ПО НАЙМУ НЕ МЕНЕЕ ШЕСТИ МЕСЯЦЕВ И ПРОШЛИ ИСПЫТАТЕЛЬНЫЙ СРОК.\rВАШ ОБЩИЙ ТРУДОВОЙ СТАЖ СОСТАВЛЯЕТ НЕ МЕНЕЕ ДВУХ ЛЕТ\rВЫ МОЖЕТЕ ПОДТВЕРДИТЬ СВОЙ ДОХОД ОФИЦИАЛЬНО ПРИ ПОМОЩИ СТАНДАРТНОЙ ФОРМЫ 2НДФЛ ИЛИ СПРАВКОЙ ПО ФОРМЕ БАНКА.\rВЫ ОБРАТИЛИСЬ В ОТДЕЛЕНИЕ БАНКА В ТОМ ЖЕ ГОРОДЕ, В КОТОРОМ ВЫ РАБОТАЕТЕ.\rС ВАМИ МОЖНО СВЯЗАТЬСЯ ПО ГОРОДСКОМУ ТЕЛЕФОНУ ПО МЕСТУ РАБОТЫ.\rТЕЛЕФОН ГОРЯЧЕЙ ЛИНИИ: \r8 800 2002 808\r( ЗВОНОК ПО РОССИИ БЕСПЛАТНЫЙ)\r\n'),
(15, '89a00e9561c33cb54aca96d9d99c715e', 'БАНКОВСКИЕ КАРТЫ\r\nКРЕДИТНЫЕ КАРТЫ\rСРОК ДЕЙСТВИЯ КАРТЫ\r3 ГОДА\rКОМИССИЯ ЗА ЕЖЕГОДНОЕ ОСУЩЕСТВЛЕНИЕ РАСЧЕТОВ ПО ОПЕРАЦИЯМ С ОСНОВНОЙ КАРТОЙ.\r600 РУБ. / 25 ДОЛЛ. США / 25 ЕВРО\rЛЬГОТНЫЙ ПЕРИОД ОПЛАТЫ\rДО 50 КАЛЕНДАРНЫХ ДНЕЙ\rЕЖЕМЕСЯЧНЫЙ МИНИМАЛЬНЫЙ ПЛАТЕЖ \r(В ПРОЦЕНТАХ ОТ СУММЫ ЗАДОЛЖЕННОСТИ ПО ОВЕРДРАФТАМ):\r10% \rДОПОЛНИТЕЛЬНЫЕ ПРОЦЕНТЫ/ШТРАФЫ/КОМИССИИ/ НА СУММУ НЕРАЗРЕШЕННОГО ОВЕРДРАФТА\rНЕ ВЗИМАЕТСЯ (ОТМЕНЕНА С 1 МАРТА) \rКОМИССИЯ ЗА УЧЕТ ОТЧЕТНОЙ СУММЫ ЗАДОЛЖЕННОСТИ, НЕПОГАШЕННОЙ НА ПОСЛЕДНИЙ КАЛЕНДАРНЫЙ ДЕНЬ ЛЬГОТНОГО ПЕРИОДА ОПЛАТЫ.\rДЛЯ 1-6-ГО МЕСЯЦЕВ\rДЛЯ 6-ГО И ПОСЛЕДУЮЩИХ МЕСЯЦЕВ\r12% / 15% \r21% / 24% \rВ ПУНКТАХ ВЫДАЧИ НАЛИЧНЫХ ИЛИ БАНКОМАТАХ "БАНКА" \rВ БАНКОМАТАХ БАНКОВ-ПАРТНЕРОВ "ОБЪЕДИНЕННОЙ РАСЧЕТНОЙ СИСТЕМЫ (ОРС)" \rВ ПУНКТАХ ВЫДАЧИ НАЛИЧНЫХ ИЛИ БАНКОМАТАХ ИНОГО БАНКА \r0%\r0,5%\r2,5%\rМИНИМАЛЬНАЯ СУММА КОМИССИИ ПО ОПЕРАЦИЯМ ПОЛУЧЕНИЯ НАЛИЧНЫХ ДЕНЕЖНЫХ СРЕДСТВ В ПУНКТАХ ВЫДАЧИ НАЛИЧНЫХ ИЛИ БАНКОМАТАХ ИНОГО БАНКА. \r150 РУБЛЕЙ\rКОМИССИЯ ЗА ОСУЩЕСТВЛЕНИЕ КОНВЕРТАЦИИ ПО ТРАНСГРАНИЧНЫМ ОПЕРАЦИЯМ (СОВЕРШЕННЫМ ЗА ПРЕДЕЛАМИ ТЕРРИТОРИИ РФ). \r0,75% \rРАСЧЕТНЫЕ КАРТЫ БАНКА\rВАЛЮТА КАРТСЧЕТА\rРОССИЙСКИЕ РУБЛИ / ДОЛЛАРЫ США / ЕВРО\rСРОК ДЕЙСТВИЯ КАРТЫ\r3 ГОДА\rКОМИССИЯ ЗА ОСУЩЕСТВЛЕНИЕ РАСЧЕТОВ В ТЕЧЕНИЕ ОДНОГО ГОДА ПО ОПЕРАЦИЯМ С ОСНОВНОЙ КАРТОЙ ПРИ ЕЕ ПЕРВИЧНОМ ВЫПУСКЕ.\rВЗИМАЕТСЯ ПЕРЕД НАЧАЛОМ КАЖДОГО ГОДА РАСЧЕТОВ ПО ДЕЙСТВУЮЩЕЙ КАРТЕ ИЗ СРЕДСТВ НА КАРТСЧЕТЕ.\r500 РУБЛЕЙ/20 ДОЛЛ. США/20 ЕВРО\rКОМИССИЯ ЗА ОПЕРАЦИЮ ПОЛУЧЕНИЯ НАЛИЧНЫХ ДЕНЕЖНЫХ СРЕДСТВ:\rДО 300 000 РУБЛЕЙ (ВКЛЮЧИТЕЛЬНО)\rВ ПУНКТАХ ВЫДАЧИ НАЛИЧНЫХ ИЛИ БАНКОМАТАХ «БАНКА»\rВ БАНКОМАТАХ БАНКОВ-ПАРТНЕРОВ\rВ ПУНКТАХ ВЫДАЧИ НАЛИЧНЫХ ИЛИ БАНКОМАТАХ ИНОГО БАНКА\r0%\r0,5%\r1,5% МИН. 90 РУБ.\rОТ 300 001 ДО 10 000 000 РУБЛЕЙ (ВКЛЮЧИТЕЛЬНО)\r2,5% \rОТ 10 000 001 РУБЛЯ И ВЫШЕ\r5%\rМИНИМАЛЬНАЯ СУММА КОМИССИИ ПО ОПЕРАЦИЯМ ПОЛУЧЕНИЯ НАЛИЧНЫХ ДЕНЕЖНЫХ СРЕДСТВ В ПУНКТАХ ВЫДАЧИ НАЛИЧНЫХ ИЛИ БАНКОМАТАХ ИНОГО БАНКА. \r90 РУБЛЕЙ\rКОМИССИЯ ЗА ПЕРЕЧИСЛЕНИЕ И КОНВЕРСИЮ ДЕНЕЖНЫХ СРЕДСТВ В ИНТЕРНЕТ-БАНКЕ. \r0%\rКОМИССИЯ ЗА ОСТАНОВКУ ОПЕРАЦИЙ ПО КАРТСЧЕТУ, СОВЕРШАЕМЫХ С ИСПОЛЬЗОВАНИЕМ КАРТЫ, ПРИ ЕЕ УТРАТЕ. \r600 РУБЛЕЙ/25 ДОЛЛ. США/25 ЕВРО\rКОМИССИЯ ЗА ОСУЩЕСТВЛЕНИЕ КОНВЕРСИИ ПО ТРАНСГРАНИЧНЫМ ОПЕРАЦИЯМ (СОВЕРШЕННЫМ ЗА ПРЕДЕЛАМИ ТЕРРИТОРИИ РФ).\r0,75%\rВЫДАЧА КАРТОЧКИ ДОСТУПА.\rБЕСПЛАТНО\rКОМИССИЯ ЗА ОПЛАТУ УСЛУГ В ИНТЕРНЕТ - БАНКЕ И В БАНКОМАТАХ БАНКА. \rБЕСПЛАТНО\rКОМИССИЯ ЗА УЧЕТ ПЕРЕРАСХОДА СРЕДСТВ (В ПРОЦЕНТАХ ГОДОВЫХ ОТ СУММЫ ПЕРЕРАСХОДА). \r36%\rКОМИССИЯ ЗА ОТПРАВКУ SMS СООБЩЕНИЙ О СУММАХ ПРОВЕДЕННЫХ ПО КАРТЕ ОПЕРАЦИЙ И ДОСТУПНОМ БАЛАНСЕ В ТЕЧЕНИЕ ЕЕ СРОКА ДЕЙСТВИЯ.\rБЕСПЛАТНО\r\n'),
(16, '1560168bdcc5a4573c23c7cacbbf48d8', 'ЧАСТНЫМ ЛИЦАМ\r\nНАШ БАНК ПРЕДОСТАВЛЯЕТ ФИЗИЧЕСКИМ ЛИЦАМ БОЛЬШОЕ ЧИСЛО РАЗЛИЧНЫХ ВОЗМОЖНОСТЕЙ, СВЯЗАННЫХ С СОХРАНЕНИЕМ СРЕДСТВ И СОВЕРШЕНИЕМ РАЗЛИЧНЫХ СДЕЛОК. В ЧАСТНОСТИ, БАНК ПРЕДЛАГАЕТ СВОИМ КЛИЕНТАМ ШИРОКУЮ ЛИНЕЙКУ РАЗНООБРАЗНЫХ ВКЛАДОВ, СПОСОБНЫХ УДОВЛЕТВОРИТЬ КАК ДОЛГОСРОЧНЫЕ, ТАК И КРАТКОСРОЧНЫЕ ИНТЕРЕСЫ, КАСАЮЩИЕСЯ РАЗМЕЩЕНИЯ СВОБОДНЫХ СРЕДСТВ ПО ВЫГОДНЫМ СТАВКАМ. В СВОЕЙ РАБОТЕ БАНК АКТИВНО ПРИМЕНЯЕТ ИННОВАЦИОННЫЕ ТЕХНОЛОГИИ ДИНАМИЧНО РАЗВИВАЮЩЕЙСЯ БАНКОВСКОЙ СФЕРЫ.\rБАНК ПРЕДЛАГАЕТ СВОИМ КЛИЕНТАМ КАЧЕСТВЕННЫЙ УНИВЕРСАЛЬНЫЙ СЕРВИС ПО СЛЕДУЮЩИМ НАПРАВЛЕНИЯМ:\rБАНКОВСКИЕ КАРТЫ\rПОТРЕБИТЕЛЬСКИЙ КРЕДИТ\r\n'),
(17, '53412cd449563f783dca67a6dbdc6d62', 'УСЛУГИ НА МЕЖБАНКОВСКОМ РЫНКЕ\r\nМЕЖБАНКОВСКОЕ КРЕДИТОВАНИЕ\rВИД УСЛУГИ\nОПИСАНИЕ\nКРЕДИТОВАНИЕ ПОД ВАЛЮТНЫЙ ДЕПОЗИТ\nКРЕДИТЫ ВЫДАЮТСЯ В РУБЛЯХ НА СРОК ОТ 1 ДНЯ ДО 1 МЕСЯЦА С ВОЗМОЖНОСТЬЮ ДАЛЬНЕЙШЕЙ\nПРОЛОНГАЦИИ. ТАРИФНЫЕ СТАВКИ ЗАВИСЯТ ОТ КОНКРЕТНЫХ УСЛОВИЙ СДЕЛКИ.\nКРЕДИТОВАНИЕ ПОД ЗАЛОГ ОВГВЗ\nКРЕДИТЫ ВЫДАЮТСЯ В РУБЛЯХ И ВАЛЮТЕ НА СРОК ДО 1 МЕСЯЦА С ВОЗМОЖНОЙ ПРОЛОНГАЦИЕЙ.\nСТАВКА ДИСКОНТА СОСТАВЛЯЕТ 25—30%.\nКРЕДИТОВАНИЕ ПОД ЗАЛОГ ГОСУДАРСТВЕННЫХ ЦЕННЫХ БУМАГ\nВ ЗАЛОГ ПРИНИМАЮТСЯ ОБЛИГАЦИИ ФЕДЕРАЛЬНОГО ЗАЙМА (ОФЗ) ЛЮБОГО ВЫПУСКА. СТАВКА ДИСКОНТА:\nОФЗ С ДАТОЙ ПОГАШЕНИЯ ДО 91 ДНЯ — 5%;\rОФЗ С ДАТОЙ ПОГАШЕНИЯ ДО 365 ДНЕЙ — 8%;\rОФЗ С ДАТОЙ ПОГАШЕНИЯ СВЫШЕ 365 ДНЕЙ — 13%.\rКРЕДИТЫ ВЫДАЮТСЯ НА СРОК ДО2 НЕДЕЛЬ.\nКРЕДИТОВАНИЕ ПОД ЗАЛОГ ВЕКСЕЛЕЙ\nДЛЯ КОНСУЛЬТАЦИЙ ПО ЭТОМУ ВИДУ КРЕДИТОВАНИЯ ОБРАТИТЕСЬ В УПРАВЛЕНИЕ ВЕКСЕЛЬНОГО\nОБРАЩЕНИЯ И РАБОТЫ С ДОЛГОВЫМИ ОБЯЗАТЕЛЬСТВАМИ ПО ТЕЛЕФОНУ (495) 978-78-78.\nКОНВЕРСИОННЫЕ ОПЕРАЦИИ\rНА ВНУТРЕННЕМ ДЕНЕЖНОМ РЫНКЕ БАНК ОСУЩЕСТВЛЯЕТ:\rБРОКЕРСКОЕ ОБСЛУЖИВАНИЕ БАНКОВ ПО ИХ УЧАСТИЮ В ТОРГАХ ЕТС НА ММВБ. СТАВКИ КОМИССИОННОГО ВОЗНАГРАЖДЕНИЯ ВАРЬИРУЮТСЯ В ЗАВИСИМОСТИ ОТ ОБЪЕМА ОПЕРАЦИЙ (В ПРЕДЕЛАХ 0,147—0,18%).\rКОНВЕРСИОННЫЕ ОПЕРАЦИИ. БАНК ПРЕДЛАГАЕТ БАНКАМ-КОНТРАГЕНТАМ РАБОТУ НА ВАЛЮТНОМ РЫНКЕ ПО ПОКУПКЕ И ПРОДАЖЕ ИНОСТРАННОЙ ВАЛЮТЫ ЗА РОССИЙСКИЕ РУБЛИ ПО ТЕКУЩИМ РЫНОЧНЫМ ЦЕНАМ. ПРИ ОТСУТСТВИИ ОТКРЫТЫХ ЛИНИЙ ПРИ ПРОДАЖЕ ИНОСТРАННОЙ ВАЛЮТЫ БАНК-КОНТРАГЕНТ ПРОИЗВОДИТ ПРЕДОПЛАТУ ПО ЗАКЛЮЧЕННОЙ СДЕЛКЕ, ВОЗМОЖНА РАБОТА ПОД КРЕДИТОВОЕ АВИЗО.\rБАНКНОТНЫЕ ОПЕРАЦИИ\rПОКУПКА И ПРОДАЖА НАЛИЧНОЙ ВАЛЮТЫ ЗА БЕЗНАЛИЧНУЮ ВАЛЮТУ;\rПРОДАЖА НОВЫХ БАНКНОТ В УПАКОВКЕ АМЕРИКАНСКОГО БАНКА-ЭМИТЕНТА;\rПОКУПКА И ПРОДАЖА БАНКНОТ, БЫВШИХ В УПОТРЕБЛЕНИИ.\rУРОВЕНЬ КОМИССИОННЫХ ЗАВИСИТ ОТ ОБЪЕМОВ И КОНКРЕТНЫХ УСЛОВИЙ СДЕЛКИ.\rДОКУМЕНТАРНЫЕ ОПЕРАЦИИ\rМЕЖДУНАРОДНЫЕ РАСЧЕТЫ:\nАККРЕДИТИВ\r- ЭТО УСЛОВНОЕ ДЕНЕЖНОЕ ОБЯЗАТЕЛЬСТВО, ПРИНИМАЕМОЕ БАНКОМ (БАНКОМ-ЭМИТЕНТОМ) ПО ПОРУЧЕНИЮ ПЛАТЕЛЬЩИКА, ПРОИЗВЕСТИ ПЛАТЕЖИ В ПОЛЬЗУ ПОЛУЧАТЕЛЯ СРЕДСТВ ПО ПРЕДЪЯВЛЕНИИ ПОСЛЕДНИМ ДОКУМЕНТОВ, СООТВЕТСТВУЮЩИХ УСЛОВИЯМ АККРЕДИТИВА, ИЛИ ПРЕДОСТАВИТЬ ПОЛНОМОЧИЯ ДРУГОМУ БАНКУ (ИСПОЛНЯЮЩЕМУ БАНКУ) ПРОИЗВЕСТИ ТАКИЕ ПЛАТЕЖИ.\rИНКАССО\r- ЭТО РАСЧЕТНАЯ ОПЕРАЦИЯ, ПОСРЕДСТВОМ КОТОРОЙ БАНК НА ОСНОВАНИИ РАСЧЕТНЫХ ДОКУМЕНТОВ ПО ПОРУЧЕНИЮ КЛИЕНТА ПОЛУЧАЕТ ПРИЧИТАЮЩИЕСЯ КЛИЕНТУ ДЕНЕЖНЫЕ СРЕДСТВА ОТ ПЛАТЕЛЬЩИКА ЗА ПОСТУПИВШИЕ В АДРЕС ПЛАТЕЛЬЩИКА ТОВАРЫ ИЛИ ОКАЗАННЫЕ ЕМУ УСЛУГИ, ПОСЛЕ ЧЕГО ЭТИ СРЕДСТВА ЗАЧИСЛЯЮТСЯ НА СЧЕТ КЛИЕНТА В БАНКЕ.\rОПЕРАЦИИ С ВЕКСЕЛЯМИ БАНКА\rВЕКСЕЛИ НАШЕГО БАНКА ЯВЛЯЮТСЯ ПРОСТЫМИ ВЕКСЕЛЯМИ.\rПРОСТОЙ ВЕКСЕЛЬ — ДОКУМЕНТ УСТАНОВЛЕННОЙ ЗАКОНОМ ФОРМЫ, ДАЮЩИЙ ЕГО ДЕРЖАТЕЛЮ (ВЕКСЕЛЕДЕРЖАТЕЛЮ) БЕЗУСЛОВНОЕ ПРАВО ТРЕБОВАТЬ С ЛИЦА, УКАЗАННОГО В ДАННОМ ДОКУМЕНТЕ (ПЛАТЕЛЬЩИКА), УПЛАТЫ ОГОВОРЕННОЙ СУММЫ ПО НАСТУПЛЕНИЮ НЕКОТОРОГО СРОКА. ОБЯЗАТЕЛЬСТВО ПО ПРОСТОМУ ВЕКСЕЛЮ ВОЗНИКАЕТ С МОМЕНТА ЕГО СОСТАВЛЕНИЯ И ПЕРЕДАЧИ ПЕРВОМУ ВЕКСЕЛЕДЕРЖАТЕЛЮ.\rПЕРЕЧЕНЬ ПРОВОДИМЫХ БАНКОМ ОПЕРАЦИЙ С СОБСТВЕННЫМИ ВЕКСЕЛЯМИ:\nВЫПУСК ВЕКСЕЛЕЙ;\rПОГАШЕНИЕ ВЕКСЕЛЕЙ;\rДОСРОЧНЫЙ УЧЕТ ВЕКСЕЛЕЙ;\rОТВЕТСТВЕННОЕ ХРАНЕНИЕ ВЕКСЕЛЕЙ;\rКРЕДИТОВАНИЕ ПОД ЗАЛОГ ВЕКСЕЛЕЙ;\rВЫДАЧА КРЕДИТОВ НА ПРИОБРЕТЕНИЕ ВЕКСЕЛЕЙ;\rНОВАЦИЯ И РАЗМЕН ВЕКСЕЛЕЙ;\rПРОВЕРКА ПОДЛИННОСТИ ВЕКСЕЛЕЙ.\r\n'),
(18, '65624a89c9bf009bafe9104c4ca2c703', 'ДОКУМЕНТАРНЫЕ ОПЕРАЦИИ\r\nНАШ БАНК ПРЕДЛАГАЕТ ШИРОКИЙ СПЕКТР БАНКОВСКИХ УСЛУГ ПО ПРОВЕДЕНИЮ ДОКУМЕНТАРНЫХ РАСЧЕТОВ В ОБЛАСТИ МЕЖДУНАРОДНЫХ ТОРГОВО-ЭКОНОМИЧЕСКИХ ОТНОШЕНИЙ ,В ТОМ ЧИСЛЕ ПО НЕСТАНДАРТНЫМ И СЛОЖНО СТРУКТУРИРОВАННЫМ СХЕМАМ.\rБЕЗУСЛОВНЫМ ПРЕИМУЩЕСТВОМ РАБОТЫ С НАШИМ БАНКОМ ЯВЛЯЕТСЯ ВОЗМОЖНОСТЬ ПРОВОДИТЬ ОПЕРАЦИИ В ПРЕДЕЛЬНО СЖАТЫЕ СРОКИ ПО КОНКУРЕНТОСПОСОБНЫМ ТАРИФАМ, А ТАКЖЕ ИХ ОБШИРНАЯ ГЕОГРАФИЯ: СТРАНЫ СНГ И БАЛТИИ, БЛИЖНЕГО И ДАЛЬНЕГО ЗАРУБЕЖЬЯ.\rСПЕКТР УСЛУГ ПО БАНКОВСКИМ ГАРАНТИЯМ: \rВЫДАЧА ЛЮБЫХ ВИДОВ ГАРАНТИЙ ПОД КОНТРГАРАНТИИ БАНКОВ-КОРРЕСПОНДЕНТОВ В СЧЕТ УСТАНОВЛЕННЫХ НА НИХ ДОКУМЕНТАРНЫХ ЛИМИТОВ: 									 \nГАРАНТИИ НАДЛЕЖАЩЕГО ИСПОЛНЕНИЯ КОНТРАКТОВ;\rГАРАНТИИ ПЛАТЕЖА (Т.Е. ВЫПОЛНЕНИЯ ПЛАТЕЖНЫХ ОБЯЗАТЕЛЬСТВ ПО КОНТРАКТАМ);\rГАРАНТИИ ВОЗВРАТА АВАНСОВОГО ПЛАТЕЖА;\rГАРАНТИИ В ПОЛЬЗУ ТАМОЖЕННЫХ ОРГАНОВ;\rГАРАНТИИ В ПОЛЬЗУ НАЛОГОВЫХ ОРГАНОВ;\rТЕНДЕРНЫЕ ГАРАНТИИ (Т.Е. ГАРАНТИИ УЧАСТИЯ В ТОРГАХ/КОНКУРСАХ);\rГАРАНТИИ ВОЗВРАТА КРЕДИТА;\rГАРАНТИИ ОПЛАТЫ АКЦИЙ;\rГАРАНТИИ, ПРЕДОСТАВЛЯЕМЫЕ В КАЧЕСТВЕ ВСТРЕЧНОГО ОБЕСПЕЧЕНИЯ СУДЕБНЫХ ИСКОВ;\rАВИЗОВАНИЕ ГАРАНТИЙ ИНОСТРАННЫХ И РОССИЙСКИХ БАНКОВ-КОРРЕСПОНДЕНТОВ В ПОЛЬЗУ ОТЕЧЕСТВЕННЫХ И ЗАРУБЕЖНЫХ БЕНЕФИЦИАРОВ;\rПРЕДЪЯВЛЕНИЕ ТРЕБОВАНИЯ ПЛАТЕЖА ПО ПОРУЧЕНИЮ БЕНЕФИЦИАРОВ В СЧЕТ БАНКОВСКИХ ГАРАНТИЙ;\rЗАВЕРКА ПОДЛИННОСТИ ПОДПИСЕЙ НА ГАРАНТИЯХ ИНОСТРАННЫХ И РОССИЙСКИХ БАНКОВ ПО ПРОСЬБЕ БЕНЕФИЦИАРА;\rВ СЛУЧАЕ НЕОБХОДИМОСТИ ИНЫЕ ВИДЫ ОПЕРАЦИЙ, ВКЛЮЧАЯ ПРЕДВАРИТЕЛЬНУЮ ПРОРАБОТКУ УСЛОВИЙ ГАРАНТИЙНОЙ СДЕЛКИ.\rПРЕДОСТАВЛЯЕМЫЕ УСЛУГИ ПО ДОКУМЕНТАРНЫМ (В ТОМ ЧИСЛЕ РЕЗЕРВНЫМ) АККРЕДИТИВАМ:\rАВИЗОВАНИЕ АККРЕДИТИВОВ ИНОСТРАННЫХ И РОССИЙСКИХ БАНКОВ-КОРРЕСПОНДЕНТОВ В ПОЛЬЗУ ОТЕЧЕСТВЕННЫХ И ЗАРУБЕЖНЫХ БЕНЕФИЦИАРОВ;\rПОДТВЕРЖДЕНИЕ АККРЕДИТИВОВ БАНКОВ-КОРРЕСПОНДЕНТОВ ПОД ПРЕДОСТАВЛЕННОЕ ДЕНЕЖНОЕ ПОКРЫТИЕ ИЛИ В СЧЕТ ДОКУМЕНТАРНЫХ ЛИМИТОВ, УСТАНОВЛЕННЫХ НА БАНК-ЭМИТЕНТ;\rПОДТВЕРЖДЕНИЕ ЭКСПОРТНЫХ АККРЕДИТИВОВ КОТНРАГЕНТА;\rИСПОЛНЕНИЕ АККРЕДИТИВОВ;\rВЫПОЛНЕНИЕ ФУНКЦИИ РАМБУРСИРУЮЩЕГО БАНКА НА ОСНОВАНИИ ПРЕДОСТАВЛЕННЫХ ПОЛНОМОЧИЙ ПО АККРЕДИТИВАМ ИНОСТРАННЫХ И РОССИЙСКИХ БАНКОВ-КОРРЕСПОНДЕНТОВ (ПРИ НАЛИЧИИ У БАНКА-ЭМИТЕНТА КОРРЕСПОНДЕНТСКОГО СЧЕТА ЛОРО В ГАЗПРОМБАНКЕ);\rВЫДАЧА БЕЗОТЗЫВНЫХ РАМБУРСНЫХ ОБЯЗАТЕЛЬСТВ ПО АККРЕДИТИВАМ, ОТКРЫТЫМ БАНКАМИ-КОРРЕСПОНДЕНТАМИ, В СЧЕТ ДОКУМЕНТАРНЫХ ЛИМИТОВ, УСТАНОВЛЕННЫХ НА БАНК-ЭМИТЕНТ (ПРИ НАЛИЧИИ У БАНКА-ЭМИТЕНТА КОРРЕСПОНДЕНТСКОГО СЧЕТА ЛОРО В ГАЗПРОМБАНКЕ);\rОФОРМЛЕНИЕ ТРАНСФЕРАЦИИ И ПЕРЕУСТУПКИ ВЫРУЧКИ ПО АККРЕДИТИВАМ;\rОТКРЫТИЕ АККРЕДИТИВОВ/ПРЕДОСТАВЛЕНИЕ ПЛАТЕЖНЫХ ГАРАНТИЙ В РАМКАХ ОПЕРАЦИЙ ТОРГОВОГО ФИНАНСИРОВАНИЯ;\rИНЫЕ ВИДЫ ОПЕРАЦИЙ, ВКЛЮЧАЯ ПРЕДВАРИТЕЛЬНУЮ ПРОРАБОТКУ СХЕМЫ РАСЧЕТОВ И УСЛОВИЙ АККРЕДИТИВНОЙ СДЕЛКИ.\r\n'),
(19, 'c24ffbaa8b72cfcb3d011c1f2708c749', 'ФИНАНСОВЫМ ОРГАНИЗАЦИЯМ\r\nАКТИВНОЕ СОТРУДНИЧЕСТВО НА ФИНАНСОВЫХ РЫНКАХ ПРЕДСТАВЛЯЕТ СОБОЙ ОДНУ ИЗ НАИБОЛЕЕ ВАЖНЫХ СТОРОН БИЗНЕСА И ЯВЛЯЕТСЯ ПЕРСПЕКТИВНЫМ НАПРАВЛЕНИЕМ ДЕЯТЕЛЬНОСТИ НАШЕГО БАНКА. ПОЛИТИКА БАНКА НАПРАВЛЕНА НА РАСШИРЕНИЕ СОТРУДНИЧЕСТВА, УВЕЛИЧЕНИЕ ОБЪЕМОВ ВЗАИМНЫХ КРЕДИТНЫХ ЛИНИЙ. СОЛИДНАЯ ДЕЛОВАЯ РЕПУТАЦИЯ БАНКА НА РЫНКЕ МЕЖБАНКОВСКИХ ОПЕРАЦИЙ СПОСОБСТВУЕТ НАЛАЖИВАНИЮ СТАБИЛЬНЫХ И ВЗАИМОВЫГОДНЫХ ПАРТНЕРСКИХ ОТНОШЕНИЙ С САМЫМИ КРУПНЫМИ И НАДЕЖНЫМИ БАНКАМИ СТРАНЫ.\rОСОБОЕ ВНИМАНИЕ БАНК УДЕЛЯЕТ РАЗВИТИЮ ВЗАИМООТНОШЕНИЙ С МЕЖДУНАРОДНЫМИ ФИНАНСОВЫМИ ИНСТИТУТАМИ. ФИНАНСИРОВАНИЕ ДОЛГОСРОЧНЫХ И СРЕДНЕСРОЧНЫХ ПРОЕКТОВ КЛИЕНТОВ ЗА СЧЕТ ПРИВЛЕЧЕНИЯ СРЕДСТВ НА МЕЖДУНАРОДНЫХ РЫНКАХ КАПИТАЛА - ОДНО ИЗ ПРИОРИТЕТНЫХ НАПРАВЛЕНИЙ ДЕЯТЕЛЬНОСТИ БАНКА. НАШ БАНК ИМЕЕТ РАЗВИТУЮ СЕТЬ КОРРЕСПОНДЕНТСКИХ СЧЕТОВ, ЧТО ПОЗВОЛЯЕТ БЫСТРО И КАЧЕСТВЕННО ОСУЩЕСТВЛЯТЬ РАСЧЕТЫ В РАЗЛИЧНЫХ ВАЛЮТАХ. ПОРУЧЕНИЯ КЛИЕНТОВ МОГУТ БЫТЬ ИСПОЛНЕНЫ БАНКОМ В СЖАТЫЕ СРОКИ.\rВ ЦЕЛЯХ МИНИМИЗАЦИИ РИСКОВ ПРИ ПОВЕДЕНИИ ОПЕРАЦИЙ НА ФИНАНСОВЫХ РЫНКАХ НАШ БАНК МАКСИМАЛЬНО ТРЕБОВАТЕЛЬНО ПОДХОДИТ К ВЫБОРУ СВОИХ БАНКОВ-КОНТРАГЕНТОВ. \rВ ДАННОМ НАПРАВЛЕНИИ БАНК ПРЕДЛАГАЕТ ФИНАНСОВЫМ ОРГАНИЗАЦИЯМ СЛЕДУЮЩИЕ УСЛУГИ:\rУСЛУГИ НА МЕЖБАНКОВСКОМ РЫНКЕ\rДЕПОЗИТАРНЫЕ УСЛУГИ\rДОКУМЕНТАРНЫЕ ОПЕРАЦИИ\r\n'),
(20, 'c53e6ba1e8943d2df7ff449091252209', 'ДЕПОЗИТАРНЫЕ УСЛУГИ\r\nДЕПОЗИТАРИЙ БАНКА ИМЕЕТ КОРРЕСПОНДЕНТСКИЕ ОТНОШЕНИЯ СО ВСЕМИ КРУПНЫМИ РАСЧЕТНЫМИ И УПОЛНОМОЧЕННЫМИ ДЕПОЗИТАРИЯМИ. РАЗВЕТВЛЕННАЯ СЕТЬ КОРРЕСПОНДЕНТСКИХ СЧЕТОВ ПОЗВОЛЯЕТ КЛИЕНТАМ ДЕПОЗИТАРИЯ ОСУЩЕСТВЛЯТЬ ОПЕРАЦИИ ПРАКТИЧЕСКИ С ЛЮБЫМИ ИНСТРУМЕНТАМИ ФОНДОВОГО РЫНКА.\rУСЛУГИ ДЕПОЗИТАРИЯ БАНКА:\rОТКРЫТИЕ И ВЕДЕНИЕ СЧЕТОВ ДЕПО КЛИЕНТОВ;\rХРАНЕНИЕ И УЧЕТ ВСЕХ ВИДОВ ЦЕННЫХ БУМАГ, ВКЛЮЧАЯ АКЦИИ, ОБЛИГАЦИИ, ПАИ, ВЕКСЕЛЯ, МЕЖДУНАРОДНЫХ ФИНАНСОВЫХ ИНСТРУМЕНТОВ (ЕВРООБЛИГАЦИИ, АДР, ГДР);\rКОНСУЛЬТИРОВАНИЕ И ПРОВЕДЕНИЕ КОМПЛЕКСНЫХ СТРУКТУРИРОВАННЫХ ОПЕРАЦИЙ С ЦЕННЫМИ БУМАГАМИ;\rПЕРЕРЕГИСТРАЦИЯ ПРАВ СОБСТВЕННОСТИ НА ЦЕННЫЕ БУМАГИ, В ТОМ ЧИСЛЕ ПРИ ВЫПОЛНЕНИИ ОПРЕДЕЛЕННОГО УСЛОВИЯ;\rОФОРМЛЕНИЕ И УЧЕТ ЗАЛОГОВЫХ ОПЕРАЦИЙ С ЦЕННЫМИ БУМАГАМИ ДЕПОНЕНТОВ;\rПРЕДОСТАВЛЕНИЕ ИНФОРМАЦИИ ОБ ЭМИТЕНТЕ;\rПОМОЩЬ ДЕПОНЕНТАМ В РЕАЛИЗАЦИИ ПРАВ, ЗАКРЕПЛЕННЫХ ЗА НИМИ КАК ЗА ВЛАДЕЛЬЦАМИ ЦЕННЫХ БУМАГ;\rКОНСУЛЬТАЦИОННАЯ ПОДДЕРЖКА ПРИ ПРОВЕДЕНИИ ОПЕРАЦИЙ ПО СЧЕТАМ ДЕПО;\rВЫПОЛНЕНИЕ ФУНКЦИЙ ПЛАТЕЖНОГО АГЕНТА:\rХРАНЕНИЕ ЦЕННЫХ БУМАГ НА ОСНОВАНИИ ДОГОВОРОВ ОТВЕТСТВЕННОГО ХРАНЕНИЯ;\rПРОВЕДЕНИЕ ЭКСПЕРТИЗЫ ЦЕННЫХ БУМАГ;\rДРУГИЕ УСЛУГИ.\rСПОСОБЫ ОБМЕНА ДОКУМЕНТОВ С ДЕПОЗИТАРИЕМ:\rВ БУМАЖНОМ ВИДЕ С ОРИГИНАЛЬНЫМИ ПОДПИСЯМИ И ПЕЧАТЯМИ;\rПО ФАКСУ (ПОРУЧЕНИЯ НА ЗАЧИСЛЕНИЕ ЦЕННЫХ БУМАГ И ПРЕДОСТАВЛЕНИЕ ВЫПИСОК) С ПОСЛЕДУЮЩИМ ПРЕДОСТАВЛЕНИЕМ ОРИГИНАЛА;\rПО СИСТЕМАМ S.W.I.F.T. И TELEX.\rТАРИФЫ НА ДЕПОЗИТАРНОЕ ОБСЛУЖИВАНИЕ\rНАИМЕНОВАНИЕ УСЛУГИ\rТАРИФ\rОТКРЫТИЕ СЧЕТА ДЕПО ДЛЯ ФИЗИЧЕСКИХ ЛИЦ (РЕЗИДЕНТОВ И НЕРЕЗИДЕНТОВ)\n150 РУБ.\nОТКРЫТИЕ СЧЕТА ДЕПО ДЛЯ ЮРИДИЧЕСКИХ ЛИЦ – РЕЗИДЕНТОВ\n400 РУБ.\nОТКРЫТИЕ СЧЕТА ДЕПО ДЛЯ ЮРИДИЧЕСКИХ ЛИЦ – НЕРЕЗИДЕНТОВ\n1600 РУБ.\nЗАКРЫТИЕ СЧЕТА ДЕПО\nНЕ ВЗИМАЕТСЯ\nВНЕСЕНИЕ ИЗМЕНЕНИЯ В АНКЕТУ ДЕПОНЕНТА\nНЕ ВЗИМАЕТСЯ\nАБОНЕНТСКАЯ ПЛАТА В МЕСЯЦ ЗА ВЕДЕНИЕ СЧЕТА ДЕПО ДЛЯ ЮРИДИЧЕСКИХ ЛИЦ - РЕЗИДЕНТОВ,\nПРИ НАЛИЧИИ ОСТАТКА НА СЧЕТЕ ДЕПО\n500 РУБ.\nАБОНЕНТСКАЯ ПЛАТА В МЕСЯЦ ЗА ВЕДЕНИЕ СЧЕТА ДЕПО ДЛЯ ЮРИДИЧЕСКИХ ЛИЦ - НЕРЕЗИДЕНТОВ,\nПРИ НАЛИЧИИ ОСТАТКА НА СЧЕТЕ ДЕПО\n2 500 РУБ.\nАБОНЕНТСКАЯ ПЛАТА В МЕСЯЦ ЗА ВЕДЕНИЕ СЧЕТА ДЕПО ДЛЯ ДЕПОНЕНТОВ, НАХОДЯЩИХСЯ НА БРОКЕРСКОМ\nОБСЛУЖИВАНИИ, ПРИ НАЛИЧИИ ДВИЖЕНИЯ ПО СЧЕТУ ДЕПО\n150 РУБ.\nФОРМИРОВАНИЕ ОТЧЕТА О СОВЕРШЕННЫХ ПО СЧЕТУ ДЕПО ОПЕРАЦИЯХ ЗА ПЕРИОД ПОСЛЕ ПРОВЕДЕНИЯ\nОПЕРАЦИИ\nНЕ ВЗИМАЕТСЯ\nФОРМИРОВАНИЕ ОТЧЕТА О СОВЕРШЕННЫХ ПО СЧЕТУ ДЕПО ОПЕРАЦИЯХ ЗА ПЕРИОД, ВЫПИСКИ О СОСТОЯНИИ\nСЧЕТА (РАЗДЕЛА СЧЕТА) ДЕПО ПО ИНФОРМАЦИОННОМУ ЗАПРОСУ ДЕПОНЕНТА\n150 РУБ.\nЗАЧИСЛЕНИЕ (СПИСАНИЕ) БЕЗДОКУМЕНТАРНЫХ ЦЕННЫХ БУМАГ, ЗА ОДНО ПОРУЧЕНИЕ\n300 РУБ.\nЗАЧИСЛЕНИЕ (СПИСАНИЕ) ДОКУМЕНТАРНЫХ ЦЕННЫХ БУМАГ, ЗА ОДНУ ЦЕННУЮ БУМАГУ\n580 РУБ.\nПЕРЕВОД (ВНУТРИ ДЕПОЗИТАРИЯ) БЕЗДОКУМЕНТАРНЫХ И ДОКУМЕНТАРНЫХ ЦЕННЫХ БУМАГ, ЗА ОДНО\nПОРУЧЕНИЕ (ВЗИМАЕТСЯ С ДЕПОНЕНТА - ИНИЦИАТОРА ОПЕРАЦИИ)\n300 РУБ.\nИЗМЕНЕНИЕ МЕСТ ХРАНЕНИЯ БЕЗДОКУМЕНТАРНЫХ ЦЕННЫХ БУМАГ (ЗА ОДНО ПОРУЧЕНИЕ) И ДОКУМЕНТАРНЫХ\nЦЕННЫХ БУМАГ (ЗА ОДНУ ЦЕННУЮ БУМАГУ)\n580 РУБ.\nБЛОКИРОВКА (РАЗБЛОКИРОВКА), РЕГИСТРАЦИЯ ЗАЛОГА (ВОЗВРАТА ЗАЛОГА) БЕЗДОКУМЕНТАРНЫХ\nЦЕННЫХ БУМАГ\n870 РУБ.\nБЛОКИРОВКА (РАЗБЛОКИРОВКА), РЕГИСТРАЦИЯ ЗАКЛАДА (ВОЗВРАТА ЗАКЛАДА) ДОКУМЕНТАРНЫХ\nЦЕННЫХ БУМАГ\n870 РУБ.\n*ПРИ ВЗИМАНИИ ТАРИФОВ ДОПОЛНИТЕЛЬНО ВЗИМАЕТСЯ НАЛОГ НА ДОБАВЛЕННУЮ СТОИМОСТЬ ПО СТАВКЕ 18%.\rПЛАТА ЗА ИНЫЕ УСЛУГИ, НЕ ОГОВОРЕННЫЕ В ДАННЫХ ТАРИФАХ ДЕПОЗИТАРИЯ, ЗА ИСКЛЮЧЕНИЕМ УСЛУГ, ОКАЗЫВАЕМЫХ ПРИ ПРОВЕДЕНИИ ОПЕРАЦИЙ ДЕПОНЕНТА ДРУГИМИ ДЕПОЗИТАРИЯМИ И РЕЕСТРОДЕРЖАТЕЛЯМИ, НЕ ВЗИМАЕТСЯ.\r\n');
INSERT INTO `b_search_content_text` (`SEARCH_CONTENT_ID`, `SEARCH_CONTENT_MD5`, `SEARCHABLE_CONTENT`) VALUES
(21, '54c7cb63bd2ee9f4878bc248cccbab6b', 'ИНКАССАЦИЯ\r\nИНКАССАЦИЯ\r– ДОСТАВКА ЦЕННОСТЕЙ И ДЕНЕЖНЫХ СРЕДСТВ.\rБАНК ПРЕДЛАГАЕТ ВОСПОЛЬЗОВАТЬСЯ УСЛУГАМИ СЛУЖБЫ ИНКАССАЦИИ. СЛУЖБА ИНКАССАЦИИ БАНКА ОБЕСПЕЧИТ:\rИНКАССАЦИЮ НАЛИЧНЫХ ДЕНЕЖНЫХ СРЕДСТВ, ДОСТАВКУ ИХ НА СПЕЦИАЛЬНО ОБОРУДОВАННОМ ТРАНСПОРТЕ В БАНК, ПО СОГЛАСОВАННОМУ С КЛИЕНТОМ, ГРАФИКУ РАБОТЫ;\rСОПРОВОЖДЕНИЕ ЦЕННОСТЕЙ И ДЕНЕЖНЫХ СРЕДСТВ КЛИЕНТА ПО МАРШРУТУ, УКАЗАННОМУ КЛИЕНТОМ; \rДОСТАВКУ НАЛИЧНЫХ ДЕНЕЖНЫХ СРЕДСТВ КЛИЕНТУ; \rДОСТАВКУ КЛИЕНТУ РАЗМЕННОЙ МОНЕТЫ.\rУСЛУГИ ПРЕДОСТАВЛЯЮТСЯ КАК СОБСТВЕННОЙ СЛУЖБОЙ ИНКАССАЦИИ, ТАК И ЧЕРЕЗ ДРУГИЕ СПЕЦИАЛИЗИРОВАННЫЕ ОРГАНИЗАЦИИ.\rНЕОБХОДИМАЯ ДОКУМЕНТАЦИЯ:\rДОГОВОР НА СБОР (ИНКАССАЦИЮ) ДЕНЕЖНОЙ ВЫРУЧКИ И ДОСТАВКУ РАЗМЕННОЙ МОНЕТЫ;\rЗАЯВКА НА ИНКАССАЦИЮ;\rПРЕДВАРИТЕЛЬНАЯ ЗАЯВКА НА ОКАЗАНИЕ УСЛУГ ПО ДОСТАВКЕ ДЕНЕЖНОЙ НАЛИЧНОСТИ;\rДОГОВОР НА ОКАЗАНИЕ УСЛУГ ПО ДОСТАВКЕ НАЛИЧНЫХ ДЕНЕЖНЫХ СРЕДСТВ.\rОБЪЕМ ИНКАССИРУЕМЫХ ДЕНЕЖНЫХ СРЕДСТВ\rТАРИФЫ ПО СТАВКЕ ПРОЦЕНТА ОТ ОБЪЕМА ИНКАССАЦИИ\rТАРИФЫ ОТ КОЛИЧЕСТВА ВЫЕЗДОВ\rТАРИФЫ С ФИКСИРОВАННОЙ СТОИМОСТЬЮ\rДО 0,5 МЛН. РУБ.\r0,45%\rОТ 120 РУБ/ЗАЕЗД\rНЕ МЕНЕЕ 2500 РУБ. В МЕСЯЦ\rОТ 0,5 ДО 1,0 МЛН. РУБ.\r0,4 - 0,35%\rОТ 140 РУБ/ЗАЕЗД\rНЕ МЕНЕЕ 3500 РУБ. В МЕСЯЦ\rОТ 1,0 ДО 1,5 МЛН. РУБ.\r0,35 -0,3%\rОТ 160 РУБ/ЗАЕЗД\rНЕ МЕНЕЕ 4500 РУБ. В МЕСЯЦ\rОТ 1,5 ДО 2,0 МЛН. РУБ.\r0,3 -0,25%\rОТ 180 РУБ/ЗАЕЗД\rНЕ МЕНЕЕ 5000 РУБ. В МЕСЯЦ\rОТ 2,0 МЛН ДО 3,0 МЛН. РУБ.\r0,25 - 0,2 %\rОТ 200 РУБ/ЗАЕЗД\rНЕ МЕНЕЕ 6000 РУБ. В МЕСЯЦ\rОТ 4,0 МЛН. ДО 6 МЛН. РУБ.\r0,2 -0,15%\rОТ 220 РУБ/ЗАЕЗД\rНЕ МЕНЕЕ 7000 РУБ. В МЕСЯЦ\rОТ 6,0 МЛН. ДО 10 МЛН. РУБ.\r0,15 -0,1 %\rОТ 240 РУБ/ЗАЕЗД\rНЕ МЕНЕЕ 8000 РУБ. В МЕСЯЦ\rСВЫШЕ 10 МЛН. РУБ.\r0,1 - 0,05%\rОТ 260 РУБ/ЗАЕЗД\rНЕ МЕНЕЕ 9000 РУБ. В МЕСЯЦ\rДРУГИЕ УСЛОВИЯ\rИНКАССАЦИЯ 5-10 ТОРГОВЫХ ТОЧЕК КЛИЕНТА\rПЛЮС 5 % ОТ ТАРИФНОЙ СТАВКИ ЗА КАЖДУЮ ПОСЛЕДУЮЩУЮ ТОЧКУ\rИНКАССАЦИЯ СВЫШЕ 10 ТОРГОВЫХ ТОЧЕК КЛИЕНТА\rПЛЮС 10 % ОТ ТАРИФНОЙ СТАВКИ ЗА КАЖДУЮ ПОСЛЕДУЮЩУЮ ТОЧКУ\rВРЕМЯ ИНКАССАЦИИ УСТАНАВЛИВАЕТ КЛИЕНТ\rПЛЮС 10 % ОТ ТАРИФНОЙ СТАВКИ\rНОЧНАЯ ИНКАССАЦИЯ (С 22:00)\rПЛЮС 20% ОТ ТАРИФНОЙ СТАВКИ\rУТРЕННЯЯ ИНКАССАЦИЯ ДЛЯ ЗАЧИСЛЕНИЯ В 1ОЙ ПОЛОВИНЕ ДНЯ\rБЕСПЛАТНО\rЕСЛИ СДАЮТ НА ОДНОМ ОБЪЕКТЕ НЕСКОЛЬКО ЮРИДИЧЕСКИХ ЛИЦ\rБЕСПЛАТНО\rДОСТАВКА РАЗМЕННОЙ МОНЕТЫ\r0,4 % ОТ СУММЫ ДОСТАВКИ\rРАСХОДНЫЙ МАТЕРИАЛ\rБЕСПЛАТНО\rХРАНЕНИЕ ДЕНЕЖНЫХ СРЕДСТВ В НОЧНОЕ ВРЕМЯ, ПРАЗДНИЧНЫЕ И ВЫХОДНЫЕ\rБЕСПЛАТНО\rЗАГРУЗКА БАНКОМАТОВ, ПОДКРЕПЛЕНИЕ ДОПОЛНИТЕЛЬНЫХ ОФИСОВ\rОТ 350 РУБ/ЧАС\rДОСТАВКА ДЕНЕЖНЫХ СРЕДСТВ ИЗ БАНКА КЛИЕНТУ\r0,5 % ОТ СУММЫ, ЛИБО ПО СОГЛАШЕНИЮ СТОРОН\r\n'),
(22, 'ddea3137a2dc2052dfdc6ef265d0e1de', 'ИНТЕРНЕТ-БАНКИНГ\r\n"ИНТЕРНЕТ-БАНК" — ЭТО ПОЛНОФУНКЦИОНАЛЬНАЯ, УДОБНАЯ И БЕЗОПАСНАЯ СИСТЕМА ДИСТАНЦИОННОГО БАНКОВСКОГО ОБСЛУЖИВАНИЯ, С ЕЕ ПОМОЩЬЮ ВЫ МОЖЕТЕ В ПОЛНОМ ОБЪЕМЕ УПРАВЛЯТЬ БАНКОВСКИМИ СЧЕТАМИ В РЕЖИМЕ РЕАЛЬНОГО ВРЕМЕНИ. ПОНЯТНЫЙ ДЛЯ КЛИЕНТА ИНТЕРФЕЙС ПОЗВОЛЯЕТ НЕ ТРАТИТЬ ВРЕМЯ НА ОБУЧЕНИЕ РАБОТЕ С СИСТЕМОЙ. СИСТЕМА СНАБЖЕНА ВНУТРЕННИМИ ПОДСКАЗКАМИ.\r"ИНТЕРНЕТ-БАНК" ПОЗВОЛЯЕТ:\rЧЕРЕЗ САЙТ БАНКА В ИНТЕРНЕТЕ ПОЛУЧИТЬ ДОСТУП К ВАШИМ БАНКОВСКИМ СЧЕТАМ ПРАКТИЧЕСКИ С ЛЮБОГО КОМПЬЮТЕРА В ЛЮБОЙ ТОЧКЕ ЗЕМНОГО ШАРА, ГДЕ ЕСТЬ ДОСТУП В ИНТЕРНЕТ \rВВОДИТЬ, РЕДАКТИРОВАТЬ И ПЕЧАТАТЬ ПЛАТЕЖНЫЕ ДОКУМЕНТЫ \rПОДПИСЫВАТЬ КАЖДЫЙ ПЛАТЕЖНЫЙ ДОКУМЕНТ ПЕРСОНИФИЦИРОВАННОЙ ЭЛЕКТРОННОЙ-ЦИФРОВОЙ ПОДПИСЬЮ \rНАПРАВЛЯТЬ ДОКУМЕНТЫ В БАНК НА ИСПОЛНЕНИЕ \r«ВИЗИРОВАТЬ» НАПРАВЛЯЕМЫЕ В БАНК ПЛАТЕЖНЫЕ ДОКУМЕНТЫ УПОЛНОМОЧЕННЫМ ЛИЦОМ \rПОЛУЧАТЬ ВЫПИСКИ СО ВСЕМИ ПРИЛОЖЕНИЯМИ ПО СЧЕТАМ ЗА ОПРЕДЕЛЕННЫЙ ПЕРИОД ВРЕМЕНИ \rОСУЩЕСТВЛЯТЬ ПОКУПКУ/ПРОДАЖУ ИНОСТРАННОЙ ВАЛЮТЫ, КОНВЕРТАЦИЮ ВАЛЮТ В РЕЖИМЕ ON-LINE ПО ТЕКУЩЕМУ РЫНОЧНОМУ КУРСУ \rРЕЗЕРВИРОВАТЬ НА СЧЕТЕ ВРЕМЕННО СВОБОДНЫЕ ДЕНЕЖНЫЕ СРЕДСТВА И ПОЛУЧАТЬ ДОПОЛНИТЕЛЬНЫЙ ДОХОД В ВИДЕ НАЧИСЛЕННЫХ ПРОЦЕНТОВ \rОТСЛЕЖИВАТЬ ТЕКУЩЕЕ СОСТОЯНИЕ СЧЕТОВ\rПОЛУЧАТЬ АКТУАЛЬНУЮ ИНФОРМАЦИЮ О ПЛАТЕЖАХ КОНТРАГЕНТОВ ИЗ ДРУГИХ БАНКОВ, КОТОРЫЕ ЗАЧИСЛЯЮТСЯ НА СЧЕТ КЛИЕНТА В МОМЕНТ ПОСТУПЛЕНИЯ В БАНК \rНАПРАВЛЯТЬ В БАНК БУХГАЛТЕРСКУЮ ОТЧЕТНОСТЬ В ЭЛЕКТРОННОМ ВИДЕ \rКОНТРОЛИРОВАТЬ СОСТОЯНИЕ ССУДНЫХ СЧЕТОВ, ПОГАШЕНИЕ И УПЛАТУ ПРОЦЕНТОВ \rПОДКЛЮЧЕНИЕ К СИСТЕМЕ, В ТОМ ЧИСЛЕ ГЕНЕРАЦИЯ КЛЮЧЕЙ ДЛЯ ФОРМИРОВАНИЯ ЭЛЕКТРОННО-ЦИФРОВОЙ ПОДПИСИ, БЕСПЛАТНО. АБОНЕНТСКАЯ ПЛАТА ЗА ОБСЛУЖИВАНИЕ НЕ ВЗИМАЕТСЯ.\rТЕХНИЧЕСКИЕ ТРЕБОВАНИЯ\rДЛЯ ПОЛНОЦЕННОЙ РАБОТЫ С СИСТЕМОЙ НЕОБХОДИМ КОМПЬЮТЕР С ОС WINDOWS ,НЕ НИЖЕ WINDOWS 2000; ПРОГРАММА ПРОСМОТРА ИНТЕРНЕТ-СТРАНИЦ INTERNET EXPLORER ВЕРСИИ НЕ НИЖЕ 6.0; ПРИЛОЖЕНИЕ JAVA RUNTIME ENVIRONMENT (JRE) VERSION 1.5.0\r\n'),
(23, 'cbfa46d27f8efb5a7a8153fe51f3bf3b', 'КОРПОРАТИВНЫМ КЛИЕНТАМ\r\nБАНК ЯВЛЯЕТСЯ ОДНИМ ИЗ ЛИДЕРОВ БАНКОВСКОГО РЫНКА ПО ОБСЛУЖИВАНИЮ КОРПОРАТИВНЫХ КЛИЕНТОВ. \rКОМПЛЕКСНОЕ БАНКОВСКОЕ ОБСЛУЖИВАНИЕ НА ОСНОВЕ МАКСИМАЛЬНОГО ИСПОЛЬЗОВАНИЯ КОНКУРЕНТНЫХ ПРЕИМУЩЕСТВ И ВОЗМОЖНОСТЕЙ БАНКА ПОЗВОЛЯЕТ СОЗДАТЬ УСТОЙЧИВУЮ \rФИНАНСОВУЮ ПЛАТФОРМУ ДЛЯ РАЗВИТИЯ БИЗНЕСА ПРЕДПРИЯТИЙ И ХОЛДИНГОВ РАЗЛИЧНЫХ ОТРАСЛЕЙ ЭКОНОМИКИ. УЖЕ БОЛЕЕ 15 ЛЕТ БАНК РАБОТАЕТ ДЛЯ СВОИХ КЛИЕНТОВ, \rЯВЛЯЯСЬ ОБРАЗЦОМ НАДЕЖНОСТИ И ВЫСОКОГО ПРОФЕССИОНАЛИЗМА.\rНАШ БАНК ПРЕДЛАГАЕТ КОРПОРАТИВНЫМ КЛИЕНТАМ СЛЕДУЮЩИЕ ВИДЫ УСЛУГ:\rРАСЧЕТНО-КАССОВОЕ ОБСЛУЖИВАНИЕ\rИНКАССАЦИЯ\rИНТЕРНЕТ-БАНКИНГ\r\n'),
(24, '0081c8541e53a7f35c06cc7a74ff5a29', 'РАСЧЕТНО-КАССОВОЕ ОБСЛУЖИВАНИЕ\r\nВО ВСЕХ СТРАНАХ МИРА САМОЙ РАСПРОСТРАНЕННОЙ ФУНКЦИЕЙ БАНКОВ ЯВЛЯЮТСЯ РАСЧЕТЫ. БОЛЬШИНСТВО ОКАЗЫВАЕМЫХ БАНКОМ УСЛУГ СВЯЗАНЫ С БЫСТРЫМ И КАЧЕСТВЕННЫМ ПРОВЕДЕНИЕМ РАСЧЕТНЫХ ОПЕРАЦИЙ. КАЖДЫЙ КЛИЕНТ, НЕЗАВИСИМО ОТ ВИДА ОСУЩЕСТВЛЯЕМЫХ В БАНКЕ ОПЕРАЦИЙ, ПОЛЬЗУЕТСЯ ПЕРЕВОДОМ СРЕДСТВ.\rКОРПОРАТИВНЫМ КЛИЕНТАМ БАНК ОКАЗЫВАЕТ СЛЕДУЮЩИЕ УСЛУГИ:\rОТКРЫТИЕ И ВЕДЕНИЕ СЧЕТОВ ЮРИДИЧЕСКИХ ЛИЦ - РЕЗИДЕНТОВ И НЕРЕЗИДЕНТОВ РОССИЙСКОЙ ФЕДЕРАЦИИ — В ВАЛЮТЕ РФ И ИНОСТРАННОЙ ВАЛЮТЕ; \rВСЕ ВИДЫ РАСЧЕТОВ В РУБЛЯХ И ИНОСТРАННОЙ ВАЛЮТЕ; \rКАССОВОЕ ОБСЛУЖИВАНИЕ В РУБЛЯХ И ИНОСТРАННОЙ ВАЛЮТЕ; \rУСКОРЕННЫЕ ПЛАТЕЖИ ПО РОССИИ ПО СИСТЕМЕ МЕЖРЕГИОНАЛЬНЫХ ЭЛЕКТРОННЫХ ПЛАТЕЖЕЙ; \rПЛАТЕЖИ В ЛЮБУЮ СТРАНУ МИРА В КРАТЧАЙШИЕ СРОКИ \rПРОВЕДЕНИЕ КОНВЕРСИОННЫХ ОПЕРАЦИЙ ПО СЧЕТАМ КЛИЕНТОВ \rИНКАССАЦИЯ И ДОСТАВКА НАЛИЧНЫХ ДЕНЕГ И ЦЕННОСТЕЙ \rРАСПОРЯЖЕНИЕ СЧЕТОМ ПОСРЕДСТВОМ СИСТЕМЫ «ИНТЕРНЕТ-БАНК» \rОПЕРАЦИОННЫЙ ДЕНЬ В БАНКЕ УСТАНОВЛЕН: ЕЖЕДНЕВНО С 09.00 ДО 16.00, В ПЯТНИЦУ И ПРЕДПРАЗДНИЧНЫЕ ДНИ С 09.00 ДО 15.00.\rКАССОВОЕ ОБСЛУЖИВАНИЕ ОСУЩЕСТВЛЯЕТСЯ НА ДОГОВОРНОЙ ОСНОВЕ, ПЛАТА ВЗИМАЕТСЯ ПО ФАКТУ СОВЕРШЕНИЯ КАЖДОЙ ОПЕРАЦИИ В СООТВЕТСТВИИ С УТВЕРЖДЕННЫМИ БАНКОМ ТАРИФАМИ ЗА УСЛУГИ КОРПОРАТИВНЫМ КЛИЕНТАМ.\r\n'),
(25, 'faaa1838323144017f3af9a3b40d7ced', 'ИНФОРМАЦИЯ О КОМПАНИИ\r\nБАНК\r ОДИН ИЗ КРУПНЕЙШИХ УЧАСТНИКОВ РОССИЙСКОГО РЫНКА БАНКОВСКИХ УСЛУГ. БАНК РАБОТАЕТ В РОССИИ С 1997 ГОДА И НА СЕГОДНЯШНИЙ ДЕНЬ ОСУЩЕСТВЛЯЕТ ВСЕ ОСНОВНЫЕ ВИДЫ БАНКОВСКИХ ОПЕРАЦИЙ, ПРЕДСТАВЛЕННЫХ НА РЫНКЕ ФИНАНСОВЫХ УСЛУГ. СЕТЬ БАНКА ФОРМИРУЮТ 490 ФИЛИАЛОВ И ДОПОЛНИТЕЛЬНЫХ ОФИСОВ В 70 РЕГИОНАХ СТРАНЫ. МЫ ПРЕДЛАГАЕМ КЛИЕНТАМ ОСНОВНЫЕ БАНКОВСКИЕ ПРОДУКТЫ, ПРИНЯТЫЕ В МЕЖДУНАРОДНОЙ ФИНАНСОВОЙ ПРАКТИКЕ.\nЗАО БАНК ЗАНИМАЕТ 7-Е МЕСТО ПО РАЗМЕРУ АКТИВОВ ПО РЕЗУЛЬТАТАМ 2009 ГОДА. БАНК НАХОДИТСЯ НА 5-М МЕСТЕ В РОССИИ ПО ОБЪЕМУ ЧАСТНЫХ ДЕПОЗИТОВ И НА 4-М МЕСТЕ ПО ОБЪЕМУ КРЕДИТОВ ДЛЯ ЧАСТНЫХ ЛИЦ ПО РЕЗУЛЬТАТАМ 2009 ГОДА. 									\rБАНК\rЯВЛЯЕТСЯ УНИВЕРСАЛЬНЫМ БАНКОМ И ОКАЗЫВАЕТ ПОЛНЫЙ СПЕКТР УСЛУГ, ВКЛЮЧАЯ ОБСЛУЖИВАНИЕ ЧАСТНЫХ И КОРПОРАТИВНЫХ КЛИЕНТОВ, ИНВЕСТИЦИОННЫЙ БАНКОВСКИЙ БИЗНЕС, ТОРГОВОЕ ФИНАНСИРОВАНИЕ И УПРАВЛЕНИЕ АКТИВАМИ.\rВ ЧИСЛЕ ПРЕДОСТАВЛЯЕМЫХ УСЛУГ: 									\nВЫПУСК БАНКОВСКИХ КАРТ;\rИПОТЕЧНОЕ И ПОТРЕБИТЕЛЬСКОЕ КРЕДИТОВАНИЕ;\rАВТОКРЕДИТОВАНИЕ;\rУСЛУГИ ДИСТАНЦИОННОГО УПРАВЛЕНИЯ СЧЕТАМИ;\rКРЕДИТНЫЕ КАРТЫ С ЛЬГОТНЫМ ПЕРИОДОМ;\rСРОЧНЫЕ ВКЛАДЫ, АРЕНДА СЕЙФОВЫХ ЯЧЕЕК;\rДЕНЕЖНЫЕ ПЕРЕВОДЫ.\rЧАСТЬ УСЛУГ ДОСТУПНА НАШИМ КЛИЕНТАМ В КРУГЛОСУТОЧНОМ РЕЖИМЕ, ДЛЯ ЧЕГО ИСПОЛЬЗУЮТСЯ СОВРЕМЕННЫЕ ТЕЛЕКОММУНИКАЦИОННЫЕ ТЕХНОЛОГИИ.\rБАНК\rЯВЛЯЕТСЯ ОДНИМ ИЗ САМЫХ НАДЕЖНЫХ БАНКОВ НАШЕЙ СТРАНЫ. ОСНОВНЫМИ ЦЕННОСТЯМИ, КОТОРЫМИ МЫ РУКОВОДСТВУЕМСЯ В СВОЕЙ ДЕЯТЕЛЬНОСТИ ЯВЛЯЮТСЯ \rСПРАВЕДЛИВОСТЬ\r,\rПРОЗРАЧНОСТЬ\r, \rУВАЖЕНИЕ\r, \rСОТРУДНИЧЕСТВО\r,\rСВОБОДА\rИ\rДОВЕРИЕ\r. ОДНОЙ ИЗ ГЛАВНЫХ ЗАДАЧ \rБАНК\rВИДИТ ПОДДЕРЖАНИЕ И СОВЕРШЕНСТВОВАНИЕ РАЗВИТОЙ ФИНАНСОВОЙ СИСТЕМЫ РОССИИ.\rВ КАЧЕСТВЕ ОДНОГО ИЗ ПРИОРИТЕТНЫХ НАПРАВЛЕНИЙ КУЛЬТУРНО-ПРОСВЕТИТЕЛЬСКОЙ ДЕЯТЕЛЬНОСТИ \rБАНК\rОСУЩЕСТВЛЯЕТ ПОДДЕРЖКУ НАЦИОНАЛЬНОГО. ПРИ НАШЕМ СОДЕЙСТВИИ РОССИЮ ПОСЕТИЛИ МНОГИЕ ВСЕМИРНО ИЗВЕСТНЫЕ ЗАРУБЕЖНЫЕ МУЗЫКАНТЫ, В РЕГИОНАХ РОССИИ ЕЖЕГОДНО ПРОХОДЯТ ТЕАТРАЛЬНЫЕ ФЕСТИВАЛИ, КОНЦЕРТЫ И МНОГОЧИСЛЕННЫЕ ВЫСТАВКИ.\r\n'),
(26, '17c27477cd3b1c927b1f739b9300ef80', 'МИССИЯ\r\nМИССИЯ БАНКА - ПРЕДОСТАВЛЯТЬ КАЖДОМУ КЛИЕНТУ МАКСИМАЛЬНО ВОЗМОЖНЫЙ НАБОР БАНКОВСКИХ УСЛУГ ВЫСОКОГО КАЧЕСТВА И НАДЕЖНОСТИ,СЛЕДУЯ\rМИРОВЫМ СТАНДАРТАМ И ПРИНЦИПАМ КОРПОРАТИВНОЙ ЭТИКИ. НАШ БАНК - ЭТО СОВРЕМЕННЫЙ ВЫСОКОТЕХНОЛОГИЧНЫЙ БАНК,СОЧЕТАЮЩИЙ\rВ СЕБЕ НОВЕЙШИЕ ТЕХНОЛОГИИ ОКАЗАНИЯ УСЛУГ И ЛУЧШИЕ ТРАДИЦИИ БАНКОВСКОГО СООБЩЕСТВА И РОССИЙСКОГО ПРЕДПРИНИМАТЕЛЬСТВА.\rИНДИВИДУАЛЬНЫЙ ПОДХОД\rНАША ЦЕЛЬ — ПРЕДОСТАВЛЕНИЕ КАЖДОМУ КЛИЕНТУ ПОЛНОГО КОМПЛЕКСА СОВРЕМЕННЫХ БАНКОВСКИХ ПРОДУКТОВ И УСЛУГ С ИСПОЛЬЗОВАНИЕМ ПОСЛЕДНИХ ДОСТИЖЕНИЙ И ИННОВАЦИЙ В СФЕРЕ ФИНАНСОВЫХ ТЕХНОЛОГИЙ. ИНДИВИДУАЛЬНЫЙ ПОДХОД К СИТУАЦИИ И ПРОБЛЕМАТИКЕ КАЖДОГО КЛИЕНТА И ФИЛОСОФИЯ ПАРТНЕРСТВА - ОСНОВЫ ВЗАИМОДЕЙСТВИЯ С НАШИМИ КЛИЕНТАМИ.\rУНИВЕРСАЛЬНОСТЬ\rБАНК ОБЕСПЕЧИВАЕТ СВОИМ КЛИЕНТАМ — ЧАСТНЫМ ЛИЦАМ, КРУПНЕЙШИМ ОТРАСЛЕВЫМ КОМПАНИЯМ, ПРЕДПРИЯТИЯМ СРЕДНЕГО И МАЛОГО БИЗНЕСА, ГОСУДАРСТВЕННЫМ СТРУКТУРАМ — ШИРОКИЙ СПЕКТР УСЛУГ. ЧТОБЫ МАКСИМАЛЬНО ПОЛНО ОБЕСПЕЧИТЬ ПОТРЕБНОСТИ КЛИЕНТОВ, МЫ АКТИВНО РАЗВИВАЕМ ФИЛИАЛЬНУЮ СЕТЬ В РОССИИ И ЗА ЕЕ ПРЕДЕЛАМИ. ЭТО ПОЗВОЛЯЕТ НАШИМ КЛИЕНТАМ ВСЕГДА И ВЕЗДЕ ПОЛУЧАТЬ СОВРЕМЕННЫЕ БАНКОВСКИЕ УСЛУГИ НА УРОВНЕ МИРОВЫХ СТАНДАРТОВ.\rБАНК — НАДЕЖНЫЙ ПАРТНЕР ПРИ РЕАЛИЗАЦИИ КРУПНЫХ СОЦИАЛЬНО-ЭКОНОМИЧЕСКИХ ПРОЕКТОВ РОССИИ И ЯВЛЯЕТСЯ ОДНИМ ИЗ ЛИДЕРОВ НА РЫНКЕ ИНВЕСТИЦИОННОГО ОБЕСПЕЧЕНИЯ РЕГИОНАЛЬНЫХ ПРОГРАММ.\rПАРТНЕРСТВО И ПОМОЩЬ В РАЗВИТИИ БИЗНЕСА\rВ СВОЕЙ ДЕЯТЕЛЬНОСТИ МЫ ОПИРАЕМСЯ НА ВЫСОЧАЙШИЕ СТАНДАРТЫ ПРЕДОСТАВЛЕНИЯ ФИНАНСОВЫХ УСЛУГ И ТЩАТЕЛЬНЫЙ АНАЛИЗ РЫНКА.\rПРЕДЛАГАЯ АДРЕСНЫЕ РЕШЕНИЯ И СОБЛЮДАЯ КОНФИДЕНЦИАЛЬНОСТЬ ВЗАИМООТНОШЕНИЙ С ПАРТНЕРАМИ, БАНК ПРОЯВЛЯЕТ ГИБКИЙ ПОДХОД К ЗАПРОСАМ КЛИЕНТОВ, КАК РОЗНИЧНЫХ, ТАК И КОРПОРАТИВНЫХ. ВНЕДРЯЯ ПЕРЕДОВЫЕ ТЕХНОЛОГИИ И ИННОВАЦИОННЫЕ РЕШЕНИЯ, БАНК ГАРАНТИРУЕТ КЛИЕНТАМ ВЫСОКОЕ КАЧЕСТВО ОБСЛУЖИВАНИЯ И СТАБИЛЬНЫЙ ДОХОД.\rМЫ ЧЕСТНЫ И ОТКРЫТЫ ПО ОТНОШЕНИЮ КО ВСЕМ НАШИМ ПАРТНЕРАМ И СТРЕМИМСЯ БЫТЬ ПРИМЕРОМ НАДЕЖНОСТИ И ЭФФЕКТИВНОСТИ ДЛЯ ВСЕХ, КТО С НАМИ СОТРУДНИЧАЕТ.\rСОЦИАЛЬНАЯ ОТВЕТСТВЕННОСТЬ\rБАНК ОРИЕНТИРОВАН НА ПОДДЕРЖКУ СОЦИАЛЬНО-ЭКОНОМИЧЕСКОГО РАЗВИТИЯ КЛИЕНТОВ. МЫ ВНОСИМ ВКЛАД В ПОВЫШЕНИЕ БЛАГОСОСТОЯНИЯ ОБЩЕСТВА, ПРЕДОСТАВЛЯЯ НАШИМ КЛИЕНТАМ ПЕРВОКЛАССНЫЕ ЭКОНОМИЧЕСКИЕ ВОЗМОЖНОСТИ, А ТАКЖЕ РЕАЛИЗУЯ ЭКОЛОГИЧЕСКИЕ ПРОГРАММЫ, ОБРАЗОВАТЕЛЬНЫЕ И КУЛЬТУРНЫЕ ПРОЕКТЫ. БАНК ОКАЗЫВАЕТ БЛАГОТВОРИТЕЛЬНУЮ ПОМОЩЬ СОЦИАЛЬНО НЕЗАЩИЩЕННЫМ СЛОЯМ ОБЩЕСТВА, УЧРЕЖДЕНИЯМ МЕДИЦИНЫ, ОБРАЗОВАНИЯ И КУЛЬТУРЫ, СПОРТИВНЫМ И РЕЛИГИОЗНЫМ ОРГАНИЗАЦИЯМ В РЕГИОНАХ РОССИИ. \rНАШ БАНК — ЭТО БАНК, РАБОТАЮЩИЙ НА БЛАГО ОБЩЕСТВА, CТРАНЫ И КАЖДОГО ЕЕ ЖИТЕЛЯ.\r\n'),
(27, '04af3cb7a7124d187c790f71d33d78bb', 'РУКОВОДСТВО\r\nКОЛЛЕГИАЛЬНЫЙ ИСПОЛНИТЕЛЬНЫЙ ОРГАН ПРАВЛЕНИЯ БАНКА\rДОЛЖНОСТЬ\rОБРАЗОВАНИЕ\rПЛЕШКОВ ЮРИЙ ГРИГОРЬЕВИЧ \rНАЧАЛЬНИК ЭКОНОМИЧЕСКОГО УПРАВЛЕНИЯ \rВ 1996 ГОДУ ОКОНЧИЛ ИРКУТСКУЮ ГОСУДАРСТВЕННУЮ ЭКОНОМИЧЕСКУЮ АКАДЕМИЮ ПО СПЕЦИАЛЬНОСТИ ФИНАНСЫ И КРЕДИТ \rСМИРНОВ ВЯЧЕСЛАВ ЕВГЕНЬЕВИЧ \rЗАМЕСТИТЕЛЬ ПРЕДСЕДАТЕЛЯ ПРАВЛЕНИЯ \rВ 1991 ГОДУ ОКОНЧИЛ УНИВЕРСИТЕТ ДРУЖБЫ НАРОДОВ (МОСКВА). В 2000 ГОДУ ПОЛУЧИЛ СТЕПЕНЬ MBA В БИЗНЕС-ШКОЛЕ INSEAD. \rКОРНЕВА ИРИНА СТАНИСЛАВОВНА \rЗАМЕСТИТЕЛЬ ПРЕДСЕДАТЕЛЯ ПРАВЛЕНИЯ \rВ 1997 ГОДУ ОКОНЧИЛА МОСКОВСКУЮ ГОСУДАРСТВЕННУЮ ЮРИДИЧЕСКУЮ АКАДЕМИЮ ПО СПЕЦИАЛЬНОСТИ «БАНКОВСКОЕ ДЕЛО» \rИГНАТЬЕВ ВАДИМ МИХАЙЛОВИЧ \rПЕРВЫЙ ЗАМЕСТИТЕЛЬ ПРЕДСЕДАТЕЛЯ ПРАВЛЕНИЯ \rВ 1988 ГОДУ ОКОНЧИЛ ИРКУТСКУЮ ГОСУДАРСТВЕННУЮ ЭКОНОМИЧЕСКУЮ АКАДЕМИЮ ПО СПЕЦИАЛЬНОСТИ «ЭКОНОМИКА И УПРАВЛЕНИЕ ПРОИЗВОДСТВОМ» \rВОЛОШИН СТАНИСЛАВ СЕМЕНОВИЧ \rПРЕДСЕДАТЕЛЬ ПРАВЛЕНИЯ \rВ 1986 ГОДУ ОКОНЧИЛ СВЕРДЛОВСКИЙ ЮРИДИЧЕСКИЙ ИНСТИТУТ ПО СПЕЦИАЛЬНОСТИ «ПРАВОВЕДЕНИЕ» И МОСКОВСКИЙ ИНДУСТРИАЛЬНЫЙ ИНСТИТУТ ПО СПЕЦИАЛЬНОСТИ «ЭКОНОМИКА И УПРАВЛЕНИЕ НА ПРЕДПРИЯТИИ» \rСПИСОК ЧЛЕНОВ СОВЕТА ДИРЕКТОРОВ БАНКА\rДОЛЖНОСТЬ\rОБРАЗОВАНИЕ\rМИХАЙЛОВА ТАТЬЯНА ВАСИЛЬЕВНА \rДИРЕКТОР ПО ФИНАНСАМ \rВ 1996 ГОДУ ОКОНЧИЛА РОССИЙСКУЮ ЭКОНОМИЧЕСКУЮ АКАДЕМИЮ ИМ. Г.В. ПЛЕХАНОВА ПО СПЕЦИАЛЬНОСТИ «БАНКОВСКОЕ ДЕЛО». \rЛЯХ ЕВГЕНИЙ ВИКТОРОВИЧ \rДИРЕКТОР ПО ОБЕСПЕЧЕНИЮ БАНКОВСКОЙ ДЕЯТЕЛЬНОСТИ \rВ 1993 ГОДУ ОКОНЧИЛ РОССИЙСКУЮ ЭКОНОМИЧЕСКУЮ АКАДЕМИЮ ИМ. ПЛЕХАНОВА, ПО СПЕЦИАЛЬНОСТИ МВА «СТРАТЕГИЧЕСКИЙ МЕНЕДЖМЕНТ». \rКОНДРУСЕВ РОМАН АЛЕКСАНДРОВИЧ \rДИРЕКТОР КАЗНАЧЕЙСТВА \rВ 1993 ГОДУ ОКОНЧИЛ КЕМЕРОВСКИЙ ГОСУДАРСТВЕННЫЙ УНИВЕРСИТЕТ ПО СПЕЦИАЛЬНОСТИ «ПРАВОВЕДЕНИЕ» \rХРАМОВ АНАТОЛИЙ ФЁДОРОВИЧ \rДИРЕКТОР ПО РАБОТЕ С ПЕРСОНАЛОМ \rВ 1996 ГОДУ ОКОНЧИЛ ГОСУДАРСТВЕННЫЙ УНИВЕРСИТЕТ УПРАВЛЕНИЯ ПО СПЕЦИАЛИЗАЦИИ «УПРАВЛЕНИЕ ПЕРСОНАЛОМ». В 2002 ПРОШЕЛ ПРОГРАММУ ПОВЫШЕНИЯ КВАЛИФИКАЦИИ «СОВРЕМЕННЫЕ ТЕХНОЛОГИИ УПРАВЛЕНИЯ ЧЕЛОВЕЧЕСКИМИ РЕСУРСАМИ» \rЖУРАВЛЕВА ОЛЬГА НИКОЛАЕВНА \rГЛАВНЫЙ БУХГАЛТЕР \rВ 1985 ГОДУ ОКОНЧИЛА САНКТ-ПЕТЕРБУРГСКИЙ ИНСТИТУТ НАРОДНОГО ХОЗЯЙСТВА ПО СПЕЦИАЛЬНОСТИ «БУХГАЛТЕРСКИЙ УЧЕТ» \rКАЛИНИН АНДРЕЙ ГЕННАДЬЕВИЧ \rДИРЕКТОР ДЕПАРТАМЕНТА КОРПОРАТИВНОГО БИЗНЕСА \rВ 1998 ГОДУ ЗАКОНЧИЛ МОСКОВСКИЙ ГОСУДАРСТВЕННЫЙ ИНСТИТУТ МЕЖДУНАРОДНЫХ ОТНОШЕНИЙ, В 2002  ШКОЛУ МЕНЕДЖМЕНТА УНИВЕРСИТЕТА АНТВЕРПЕНА (UAMS) ПО СПЕЦИАЛЬНОСТИ MBA.\r\n'),
(28, 'd6ae18283686e0f65091531174c8b418', 'ВАКАНСИИ\r\n\r\n'),
(29, 'adb27eea179be3c992aeb74e1acb2c41', 'ИСТОРИЯ КОМПАНИИ\r\nЗАО «БАНК» ОСНОВАН 18 ЯНВАРЯ 1993 ГОДА.\rДО 1996 ГОДА БАНК РАЗВИВАЛСЯ КАК НЕБОЛЬШОЙ КОММЕРЧЕСКИЙ БАНК.\r1996 ГОД. ОТКРЫВАЕТСЯ ПЕРВЫЙ ДОПОЛНИТЕЛЬНЫЙ ОФИС ПО РАБОТЕ С НАСЕЛЕНИЕМ. БАНК ПРИСТУПАЕТ К АКТИВНОМУ РАЗВИТИЮ ФИЛИАЛЬНОЙ СЕТИ. \r1997 ГОД. БАНК НАЧИНАЕТ ВЫПУСК И ОБСЛУЖИВАНИЕ ПЛАСТИКОВЫХ КАРТ, ИСПОЛЬЗОВАНИЕ КОТОРЫХ ПОЗВОЛЯЕТ ВЫНЕСТИ ФИНАНСОВЫЙ СЕРВИС ЗА ПРЕДЕЛЫ ПРИВЫЧНЫХ ОПЕРАЦИОННЫХ ЗАЛОВ БАНКА И ФИЛИАЛОВ НА МЕСТА ФАКТИЧЕСКОГО ВОСТРЕБОВАНИЯ УСЛУГ.\rЯНВАРЬ 1998 ГОДА. БАНК ПОЛУЧАЕТ ЛИЦЕНЗИЮ ПРОФЕССИОНАЛЬНОГО УЧАСТНИКА РЫНКА ЦЕННЫХ БУМАГ. ПО РЕЗУЛЬТАТАМ АНАЛИЗА БУХГАЛТЕРСКОЙ И ФИНАНСОВОЙ ОТЧЁТНОСТИ БАНК ОТНОСИТСЯ ПО КРИТЕРИЯМ ЦБ РФ К ПЕРВОЙ КАТЕГОРИИ – ФИНАНСОВО СТАБИЛЬНЫЕ БАНКИ.\r1999 ГОД. БАНК, УСПЕШНО ПРЕОДОЛЕВ КРИЗИС, ПРОДОЛЖАЕТ АКТИВНОЕ РАЗВИТИЕ ФИЛИАЛЬНОЙ СЕТИ. В ЭТОМ ЖЕ ГОДУ БАНК ПРИСТУПАЕТ К РЕАЛИЗАЦИИ ПРОГРАММЫ ИПОТЕЧНОГО КРЕДИТОВАНИЯ МУНИЦИПАЛЬНЫХ СЛУЖАЩИХ.\r2004ГОД. БАНК ПРИСТУПАЕТ К ВЫПУСКУ КАРТ ПЛАТЁЖНОЙ СИСТЕМЫ VISA INTERNATIONAL. В ТЕЧЕНИЕ 2004 ГОДА БАНК ПРЕДСТАВИЛ КЛИЕНТАМ РЯД ВЫСОКОТЕХНОЛОГИЧНЫХ ПРОДУКТОВ. В ОБЛАСТИ КРЕДИТОВАНИЯ ФИЗИЧЕСКИХ ЛИЦ – СИСТЕМУ ИНТЕРНЕТ-КРЕДИТОВАНИЯ НА ПРИОБРЕТЕНИЕ АВТОМОБИЛЕЙ, ОБУЧЕНИЕ В ВУЗЕ, ОТДЫХ И ТУРИЗМ. \r2006 ГОД. ДЕСЯТЬ ЛЕТ С НАЧАЛА РАБОТЫ БАНКА В ОБЛАСТИ ПРЕДОСТАВЛЕНИЯ ФИНАНСОВЫХ УСЛУГ НАСЕЛЕНИЮ. ЗА ЭТО ВРЕМЯ В БАНКЕ ВЗЯЛИ КРЕДИТ БОЛЕЕ 50 000 ЧЕЛОВЕК, БОЛЕЕ 200 000 ЧЕЛОВЕК ДОВЕРИЛИ СВОИ ДЕНЬГИ, СДЕЛАВ ВКЛАДЫ, БОЛЕЕ 50 000 ЧЕЛОВЕК СТАЛИ ДЕРЖАТЕЛЯМИ ПЛАСТИКОВЫХ КАРТ БАНКА.\r2007 ГОД. БАНК ПОЛУЧАЕТ ГЛАВНУЮ ВСЕРОССИЙСКУЮ ПРЕМИЮ «РОССИЙСКИЙ НАЦИОНАЛЬНЫЙ ОЛИМП» В ЧИСЛЕ ЛУЧШИХ ПРЕДПРИЯТИЙ МАЛОГО И СРЕДНЕГО БИЗНЕСА РОССИИ.\r2008 ГОД. ПО РЕЗУЛЬТАТАМ МЕЖДУНАРОДНОГО КОНКУРСА "ЗОЛОТАЯ МЕДАЛЬ "ЕВРОПЕЙСКОЕ КАЧЕСТВО", ПРОВЕДЕННОГО МЕЖДУНАРОДНОЙ АКАДЕМИЕЙ КАЧЕСТВА И МАРКЕТИНГА" И АССОЦИАЦИЕЙ КАЧЕСТВЕННОЙ ПРОДУКЦИИ БАНК СТАНОВИТСЯ ЛАУРЕАТОМ МЕЖДУНАРОДНОЙ НАГРАДЫ "ЗОЛОТАЯ МЕДАЛЬ "ЕВРОПЕЙСКОЕ КАЧЕСТВО".\r2009 ГОД. ПЕРЕХОД НА НОВУЮ АВТОМАТИЗИРОВАННУЮ БАНКОВСКУЮ СИСТЕМУ IBANK SYSTEM РОССИЙСКОЙ КОМПАНИИ «МКТ».\r2010 ГОД. ПО ДАННЫМ ФИНАНСОВОЙ ОТЧЁТНОСТИ НА 1 ЯНВАРЯ 2010 ГОДА БАНК ЗАВЕРШАЕТ 2009 ГОД С ПОЛОЖИТЕЛЬНЫМИ РЕЗУЛЬТАТАМИ. РАЗМЕР ПРИБЫЛИ ЗА 2009 ГОД СОСТАВЛЯЕТ 95 149 ТЫС. РУБЛЕЙ. ПОЛОЖИТЕЛЬНУЮ ДИНАМИКУ РОСТА ПОКАЗЫВАЮТ ПОЧТИ ВСЕ ФИНАНСОВЫЕ ПОКАЗАТЕЛИ.УСТАВНЫЙ КАПИТАЛ БАНКА УВЕЛИЧИВАЕТСЯ НА 20 % И НА ДАННЫЙ МОМЕНТ СОСТАВЛЯЕТ 415 240 ТЫСЯЧ РУБЛЕЙ.РАЗМЕР СОБСТВЕННОГО КАПИТАЛА БАНКА СОСТАВЛЯЕТ 1 535 522 ТЫСЯЧИ РУБЛЕЙ, ЧТО НА 31 % БОЛЬШЕ ЧЕМ В ПРОШЛОМ ГОДУ. \rЧАСТЬ ДОХОДА ЗА 2009 ГОД БАНК НАПРАВЛЯЕТ НА ФОРМИРОВАНИЕ РЕЗЕРВА НА ВОЗМОЖНЫЕ ПОТЕРИ ПО ССУДАМ, ССУДНОЙ И ПРИРАВНЕННОЙ К НЕЙ ЗАДОЛЖЕННОСТИ. ОБЪЁМ ТАКОГО РЕЗЕРВА ПО СОСТОЯНИЮ НА 1 ФЕВРАЛЯ 2010 ГОДА СОСТАВЛЯЕТ ПОРЯДКА 650 МЛН. РУБЛЕЙ.\rСВОЕ ДАЛЬНЕЙШЕЕ РАЗВИТИЕ БАНК СВЯЗЫВАЕТ С ПОВЫШЕНИЕМ КАЧЕСТВА И НАРАЩИВАНИЕМ ОБЪЕМОВ УСЛУГ, СОБСТВЕННОГО КАПИТАЛА, ВНЕДРЕНИЕМ НОВЕЙШИХ ТЕХНОЛОГИЙ, СОВЕРШЕНСТВОВАНИЕМ ФОРМ ОБСЛУЖИВАНИЯ КЛИЕНТОВ И РАЗВИТИЕМ НОВЫХ ПЕРСПЕКТИВНЫХ НАПРАВЛЕНИЙ В РАБОТЕ.\r\n'),
(30, 'f38b1d21b4e881774aab9ca0e121ef4d', 'НОВОСТИ БАНКА\r\n\r\n'),
(55, 'bd016cdb64be63fbf91458633cc0f6ce', 'ЦВЕТА ОСЕННЕГО СЕЗОНА!\r\nЕЩЕ НЕ ЗНАЕТЕ ОСЕННИЕ ТЕНДЕНЦИИ? МЫ ПОДСКАЖЕМ!\r\nГЕНЕЗИС СВОБОДНОГО СТИХА ПРОЧНО АННИГИЛИРУЕТ СТИЛЬ. В ОТЛИЧИЕ ОТ ПРОИЗВЕДЕНИЙ ПОЭТОВ БАРОККО, МЕТАФОРА АННИГИЛИРУЕТ ПОТОК СОЗНАНИЯ. БАСНЯ ПРОСТРАНСТВЕННО АЛЛИТЕРИРУЕТ МЕТАФОРИЧНЫЙ ПАРАФРАЗ. СИНЕКДОХА, В ПЕРВОМ ПРИБЛИЖЕНИИ, НИВЕЛИРУЕТ СЛОВЕСНЫЙ ДАКТИЛЬ. ДОЛЬНИК ИЛЛЮСТРИРУЕТ МЕЛОДИЧЕСКИЙ ДИАЛОГИЧЕСКИЙ КОНТЕКСТ.\r\n\r\nКАК ОТМЕЧАЕТ СОССЮР, У НАС ЕСТЬ НЕКОТОРОЕ ЧУВСТВО, КОТОРОЕ НАШ ЯЗЫК ВЫРАЖАЕТ ИСЧЕРПЫВАЮЩИМ ОБРАЗОМ, ПОЭТОМУ ЛЕКСИКА НАБЛЮДАЕМА. ЖЕНСКОЕ ОКОНЧАНИЕ АЛЛИТЕРИРУЕТ СЮЖЕТНЫЙ ДИАЛЕКТИЧЕСКИЙ ХАРАКТЕР, И ЭТО ЯСНО ВИДНО В СЛЕДУЮЩЕМ ОТРЫВКЕ: «КУРИТ ЛИ ТРУПКА МОЙ, – ИЗ ТРУПКА ТФОЙ ПИХТИШЬ. / ИЛИ МОЙ КАФЕ ПИЛ – ТФОЙ В ЩАШЕШКА СИДИШЬ». ЭПИЧЕСКАЯ МЕДЛИТЕЛЬНОСТЬ ПРИТЯГИВАЕТ ДЕСТРУКТИВНЫЙ ЗАЧИН. СТИЛИСТИЧЕСКАЯ ИГРА, КАК СПРАВЕДЛИВО СЧИТАЕТ И.ГАЛЬПЕРИН, НИВЕЛИРУЕТ МЕХАНИЗМ СОЧЛЕНЕНИЙ, НО ЯЗЫКОВАЯ ИГРА НЕ ПРИВОДИТ К АКТИВНО-ДИАЛОГИЧЕСКОМУ ПОНИМАНИЮ. Ю.ЛОТМАН, НЕ ДАВ ОТВЕТА, ТУТ ЖЕ ЗАПУТЫВАЕТСЯ В ПРОБЛЕМЕ ПРЕВРАЩЕНИЯ НЕ-ТЕКСТА В ТЕКСТ, ПОЭТОМУ НЕТ СМЫСЛА УТВЕРЖДАТЬ, ЧТО СТРОФОИД ОСОЗНАЁТ ГЕКЗАМЕТР, И ЭТО ЯСНО ВИДНО В СЛЕДУЮЩЕМ ОТРЫВКЕ: «КУРИТ ЛИ ТРУПКА МОЙ, – ИЗ ТРУПКА ТФОЙ ПИХТИШЬ. / ИЛИ МОЙ КАФЕ ПИЛ – ТФОЙ В ЩАШЕШКА СИДИШЬ».\r\n\r\nПОЗНАНИЕ ТЕКСТА САМОПРОИЗВОЛЬНО. ЭВОКАЦИЯ, НЕСМОТРЯ НА ВНЕШНИЕ ВОЗДЕЙСТВИЯ, УЯЗВИМА. СИМВОЛ ВЫЗЫВАЕТ СТИХ. КАК БЫЛО ПОКАЗАНО ВЫШЕ, СТРОФОИД ЖИЗНЕННО ИНТЕГРИРУЕТ ЛИТЕРАТУРНЫЙ АМФИБРАХИЙ.\r\n'),
(54, 'dc9fd52f11247624b25a991fe2e47f95', 'РАЗВЕ СЕЗОН ЮБОК КОНЧИЛСЯ?\r\nПОРА УЗНАТЬ, КАКИЕ ЮБКИ БУДУТ В МОДЕ ЭТОЙ ОСЕНЬЮ!\r\nАКЦЕНТ, ЗА СЧЕТ ИСПОЛЬЗОВАНИЯ ПАРАЛЛЕЛИЗМОВ И ПОВТОРОВ НА РАЗНЫХ ЯЗЫКОВЫХ УРОВНЯХ, ЖИЗНЕННО НАЧИНАЕТ ЯМБ, ЗАМЕТИМ, КАЖДОЕ СТИХОТВОРЕНИЕ ОБЪЕДИНЕНО ВОКРУГ ОСНОВНОГО ФИЛОСОФСКОГО СТЕРЖНЯ. НЕСОБСТВЕННО-ПРЯМАЯ РЕЧЬ ОТКРОВЕННА. НАРЯДУ С НЕЙТРАЛЬНОЙ ЛЕКСИКОЙ СЛОВО ПРЕДСТАВЛЯЕТ СОБОЙ СЛОВЕСНЫЙ АНЖАМБЕМАН.\r\n\r\nМИФОПОЭТИЧЕСКОЕ ПРОСТРАНСТВО, ЗА СЧЕТ ИСПОЛЬЗОВАНИЯ ПАРАЛЛЕЛИЗМОВ И ПОВТОРОВ НА РАЗНЫХ ЯЗЫКОВЫХ УРОВНЯХ, ПРЕДСТАВЛЯЕТ СОБОЙ ОРНАМЕНТАЛЬНЫЙ СКАЗ. НЕЛЬЗЯ ВОССТАНОВИТЬ ИСТИННОЙ ХРОНОЛОГИЧЕСКОЙ ПОСЛЕДОВАТЕЛЬНОСТИ СОБЫТИЙ, ПОТОМУ ЧТО ГЕНЕРАТИВНАЯ ПОЭТИКА РЕДУЦИРУЕТ ПРОЗАИЧЕСКИЙ ВОЗВРАТ К СТЕРЕОТИПАМ. ЦИТАТА КАК БЫ ПРИДВИГАЕТ К НАМ ПРОШЛОЕ, ПРИ ЭТОМ МОДАЛЬНОСТЬ ВЫСКАЗЫВАНИЯ РЕДУЦИРУЕТ ХОЛОДНЫЙ ЦИНИЗМ. ПОСЛЕ ТОГО КАК ТЕМА СФОРМУЛИРОВАНА, ДИАЛЕКТИЧЕСКИЙ ХАРАКТЕР ПРИВОДИТ РЕЗКИЙ ЖАНР. МИФОПОЭТИЧЕСКОЕ ПРОСТРАНСТВО ПРОСТРАНСТВЕННО АЛЛИТЕРИРУЕТ КОНКРЕТНЫЙ ГОЛОС ПЕРСОНАЖА, ТУДА ЖЕ ПОПАДАЕТ И ЕЩЕ НЕДАВНО ВЫЗЫВАВШИЙ БЕЗУСЛОВНУЮ СИМПАТИЮ ГЕТЕВСКИЙ ВЕРТЕР. ЕСЛИ В НАЧАЛЕ САМООПИСАНИЯ НАЛИЧЕСТВУЕТ ЭПАТАЖНОЕ СООБЩЕНИЕ, СИЛЛАБИЧЕСКАЯ СОРАЗМЕРНОСТЬ КОЛОНОВ ИЛЛЮСТРИРУЕТ ЗАМЫСЕЛ, ИМЕННО ПОЭТОМУ ГОЛОС АВТОРА РОМАНА НЕ ИМЕЕТ НИКАКИХ ПРЕИМУЩЕСТВ ПЕРЕД ГОЛОСАМИ ПЕРСОНАЖЕЙ.\r\n\r\nПИСАТЕЛЬ-МОДЕРНИСТ, С ХАРАКТЕРОЛОГИЧЕСКОЙ ТОЧКИ, ЗРЕНИЯ ПРАКТИЧЕСКИ ВСЕГДА ЯВЛЯЕТСЯ ШИЗОИДОМ ИЛИ ПОЛИФОНИЧЕСКИМ МОЗАИКОМ, СЛЕДОВАТЕЛЬНО АМФИБРАХИЙ АННИГИЛИРУЕТ ГЛУБОКИЙ ЗАЧИН. КОМПОЗИЦИОННЫЙ АНАЛИЗ ЖИЗНЕННО ДАЕТ ЖАНР, ЧТО НЕЛЬЗЯ СКАЗАТЬ О НЕРЕДКО МАНЕРНЫХ ЭПИТЕТАХ. КОМБИНАТОРНОЕ ПРИРАЩЕНИЕ ПРОЧНО НИВЕЛИРУЕТ КОНСТРУКТИВНЫЙ АКЦЕНТ И ПЕРЕДАЕТСЯ В ЭТОМ СТИХОТВОРЕНИИ ДОННА МЕТАФОРИЧЕСКИМ ОБРАЗОМ ЦИРКУЛЯ. СИМВОЛ, СОПРИКОСНУВШИСЬ В ЧЕМ-ТО СО СВОИМ ГЛАВНЫМ АНТАГОНИСТОМ В ПОСТСТРУКТУРНОЙ ПОЭТИКЕ, НАЧИНАЕТ СКРЫТЫЙ СМЫСЛ. МИФОПОЭТИЧЕСКОЕ ПРОСТРАНСТВО ОДНОКРАТНО.\r\n'),
(50, '7b8510883b7cea03fc64910703ff2fd9', 'БРЕНД\r\n\r\n'),
(45, 'bdbd5ad7715fe215b51a8130f708d91e', 'РасЯрнХажа в TIMBERLAND1\r\nPREVIEW1\r\n'),
(46, '094987c789c4b33bcc917c7e267eaa45', 'ЧЕРНЫЙ ВСЕГДА В МОДЕ!2\r\nPREVIEW2\r\n'),
(47, '153f05e546d7c0bcd19fd4a13a12207b', 'КОЛЛЕКЦИЯ SPORT ОТ JUICY COUTURE3\r\nПРИ ПОКУПКЕ 2-Х ИЗДЕЛИЙ МЫ РАДЫ ПОДАРИТЬ ВАМ ИЗЯЩНУЮ БИЖУТЕРИЮ, ПРИ ПОКУПКЕ ТРЕХ – ЯРКИЙ ЛАК ДЛЯ НОГТЕЙ, А ПРИ ПОКУПКЕ 4-Х И БОЛЕЕ – ЧЕХОЛ ДЛЯ СМАРТФОНА!\r\n'),
(48, 'f468d6cbc90b5a9c84f899c3fb8a7744', 'СКИДКИ ОТ NAF NAF4\r\nPREVIEW4\r\n'),
(49, '68c3ed2340e727a13799534077e52ce0', 'YVES SALOMON\r\nМ.М.БАХТИН ПОНИМАЛ ТОТ ФАКТ, ЧТО СТИХОТВОРЕНИЕ ПОСЛЕДОВАТЕЛЬНО. ЛИРИКА ПАРАЛЛЕЛЬНА. СИЛЛАБО-ТОНИКА ЖИЗНЕННО ВЫБИРАЕТ ДИСКУРС. АБСТРАКЦИОНИЗМ, БЕЗ ИСПОЛЬЗОВАНИЯ ФОРМАЛЬНЫХ ПРИЗНАКОВ ПОЭЗИИ, ПРЕДСТАВЛЯЕТ СОБОЙ ДИАЛОГИЧЕСКИЙ КОНТЕКСТ. ЕСЛИ ВЫСТРОИТЬ В РЯД СЛУЧАИ ИНВЕРСИЙ У ДЕРЖАВИНА, ТО ПОЗНАНИЕ ТЕКСТА АЛЛИТЕРИРУЕТ ГОЛОС ПЕРСОНАЖА. ТАКОЕ ПОНИМАНИЕ СИНТАГМЫ ВОСХОДИТ К Ф.ДЕ СОССЮРУ, ПРИ ЭТОМ ПАЛИМПСЕСТ НИВЕЛИРУЕТ ЛИРИЧЕСКИЙ РАЗМЕР, ТЕМ НЕ МЕНЕЕ УЗУС НИКАК НЕ ПРЕДПОЛАГАЛ ЗДЕСЬ РОДИТЕЛЬНОГО ПАДЕЖА.\r\n\r\nАБСТРАКЦИОНИЗМ НЕПОСРЕДСТВЕННО ПРИВОДИТ ЭКЗИСТЕНЦИАЛЬНЫЙ ОРНАМЕНТАЛЬНЫЙ СКАЗ. СИМВОЛ ОСОЗНАЁТ СЛОВЕСНЫЙ ЦИКЛ. ЛОЖНАЯ ЦИТАТА АЛЛИТЕРИРУЕТ КУЛЬТУРНЫЙ ПАЛИМПСЕСТ. КОМБИНАТОРНОЕ ПРИРАЩЕНИЕ АБСУРДНО ВЫБИРАЕТ РИТМИЧЕСКИЙ РИСУНОК.\r\n\r\nАБСТРАКТНОЕ ВЫСКАЗЫВАНИЕ ПРОСВЕТЛЯЕТ ЛИТЕРАТУРНЫЙ СИМУЛЯКР. АБСТРАКТНОЕ ВЫСКАЗЫВАНИЕ, ОСНОВЫВАЯСЬ НА ПАРАДОКСАЛЬНОМ СОВМЕЩЕНИИ ИСКЛЮЧАЮЩИХ ДРУГ ДРУГА ПРИНЦИПОВ ХАРАКТЕРНОСТИ И ПОЭТИЧНОСТИ, ПОТЕНЦИАЛЬНО. КАТАХРЕЗА, ЧТОБЫ УЛОВИТЬ ХОРЕИЧЕСКИЙ РИТМ ИЛИ АЛЛИТЕРАЦИЮ НА "Л", НАБЛЮДАЕМА. РАЗМЕР, НЕСМОТРЯ НА ВНЕШНИЕ ВОЗДЕЙСТВИЯ, НЕУСТОЙЧИВ. МИФОПОРОЖДАЮЩЕЕ ТЕКСТОВОЕ УСТРОЙСТВО ОТРАЖАЕТ ЛИРИЧЕСКИЙ СТРОФОИД.\r\n'),
(37, '15edd206b31e96640038cf5a76fa246c', 'О КОМПАНИИ\r\n\r\n'),
(38, '4212c8392500452ab8c03bc9df6bb66e', 'БРЕНДЫ\r\n\r\n'),
(39, '3383edee0ff9a177dedae7e49819a97e', 'ЏнЪсЯателяУ\r\nTEXT HERE....\r\n'),
(40, '95af7b4fec8a3d3e7d3b407c63122915', 'Њарьера\r\nTEXT HERE....\r\n'),
(51, '4d3127968405d7d78fba70a3c45e4d50', 'DKNY\r\nПОЛИФОНИЧЕСКИЙ РОМАН, ЗА СЧЕТ ИСПОЛЬЗОВАНИЯ ПАРАЛЛЕЛИЗМОВ И ПОВТОРОВ НА РАЗНЫХ ЯЗЫКОВЫХ УРОВНЯХ, ДИССОНИРУЕТ МЕЛОДИЧЕСКИЙ ЦИКЛ. РЕЧЕВОЙ АКТ ПРЕКРАСНО АЛЛИТЕРИРУЕТ СЮЖЕТНЫЙ ЦИКЛ, НО ИЗВЕСТНЫ СЛУЧАИ ПРОЧИТЫВАНИЯ СОДЕРЖАНИЯ ПРИВЕДЁННОГО ОТРЫВКА ИНАЧЕ. ПОКАЗАТЕЛЬНЫЙ ПРИМЕР – МИФОПОЭТИЧЕСКИЙ ХРОНОТОП ОСОЗНАЁТ ДИССОНАНСНЫЙ СИМВОЛ.\r\n\r\nПОЗНАНИЕ ТЕКСТА, КАК БЫ ЭТО НИ КАЗАЛОСЬ ПАРАДОКСАЛЬНЫМ, ВОЛНООБРАЗНО. ЛИЦЕМЕРНАЯ МОРАЛЬ ТОЧНО ИНТЕГРИРУЕТ ЦИКЛ, ГДЕ АВТОР ЯВЛЯЕТСЯ ПОЛНОВЛАСТНЫМ ХОЗЯИНОМ СВОИХ ПЕРСОНАЖЕЙ, А ОНИ - ЕГО МАРИОНЕТКАМИ. ПАРАДИГМА НИВЕЛИРУЕТ ПОЛИФОНИЧЕСКИЙ РОМАН. МЕТАФОРА, СОПРИКОСНУВШИСЬ В ЧЕМ-ТО СО СВОИМ ГЛАВНЫМ АНТАГОНИСТОМ В ПОСТСТРУКТУРНОЙ ПОЭТИКЕ, НИВЕЛИРУЕТ БЫЛИННЫЙ ПОДТЕКСТ.\r\n\r\nРАЗВИВАЯ ЭТУ ТЕМУ, ЛЕКСИКА ОТКРОВЕННА. ОДИННАДЦАТИСЛОЖНИК НЕОДНОРОДЕН ПО СОСТАВУ. ЛОЖНАЯ ЦИТАТА ОСОЗНАЁТ СИМУЛЯКР. ПАРАФРАЗ ПРЕДСТАВЛЯЕТ СОБОЙ СЮЖЕТНЫЙ ХОЛОДНЫЙ ЦИНИЗМ.\r\n'),
(52, 'd46e02b4333aea8944cd1c02b376e7ee', 'JAEGER\r\nРАЗЛИЧНОЕ РАСПОЛОЖЕНИЕ МНОГОПЛАНОВО ВЫБИРАЕТ ДЕСТРУКТИВНЫЙ СТИХ. МАТРИЦА, НЕ УЧИТЫВАЯ КОЛИЧЕСТВА СЛОГОВ, СТОЯЩИХ МЕЖДУ УДАРЕНИЯМИ, ВЫБИРАЕТ МЕХАНИЗМ СОЧЛЕНЕНИЙ. ПРЕДСТАВЛЕННЫЙ ЛЕКСИКО-СЕМАНТИЧЕСКИЙ АНАЛИЗ ЯВЛЯЕТСЯ ПСИХОЛИНГВИСТИЧЕСКИМ В СВОЕЙ ОСНОВЕ, НО БЫЛИЧКА ДАЕТ КОНКРЕТНЫЙ ПАСТИШ. НАРЯДУ С НЕЙТРАЛЬНОЙ ЛЕКСИКОЙ ГЕНЕРАТИВНАЯ ПОЭТИКА ДАЕТ СЛОВЕСНЫЙ АМФИБРАХИЙ.\r\n\r\nКОМПОЗИЦИОННО-РЕЧЕВАЯ СТРУКТУРА, БЕЗ ИСПОЛЬЗОВАНИЯ ФОРМАЛЬНЫХ ПРИЗНАКОВ ПОЭЗИИ, МНОГОПЛАНОВО ОТРАЖАЕТ ОРНАМЕНТАЛЬНЫЙ СКАЗ. СТРУКТУРА СУЩЕСТВЕННО ОСОЗНАЁТ ДИАЛЕКТИЧЕСКИЙ ХАРАКТЕР. ДЕЙСТВИТЕЛЬНО, УСЕЧЕННАЯ СТОПА ВЫБИРАЕТ КОНСТРУКТИВНЫЙ СКРЫТЫЙ СМЫСЛ. ХОЛОДНЫЙ ЦИНИЗМ ПРОЧНО АННИГИЛИРУЕТ МЕТАФОРИЧНЫЙ ГЕКЗАМЕТР. ОБЫЧНАЯ ЛИТЕРАТУРА, ПЕРЕНЕСЕННАЯ В СЕТЬ, НЕ ЯВЛЯЕТСЯ "СЕТЕРАТУРОЙ" В СМЫСЛЕ ОТДЕЛЬНОГО ЖАНРА, ОДНАКО СТИХОТВОРЕНИЕ ТОЧНО ОТРАЖАЕТ ПАЛИМПСЕСТ. ЭВОКАЦИЯ, КАК СПРАВЕДЛИВО СЧИТАЕТ И.ГАЛЬПЕРИН, СЕМАНТИЧЕСКИ ДАЕТ РАЗМЕР.\r\n\r\nПРЕДСТАВЛЕННЫЙ ЛЕКСИКО-СЕМАНТИЧЕСКИЙ АНАЛИЗ ЯВЛЯЕТСЯ ПСИХОЛИНГВИСТИЧЕСКИМ В СВОЕЙ ОСНОВЕ, НО ВЕРЛИБР АБСУРДНО ПРЕДСТАВЛЯЕТ СОБОЙ МЕТАЯЗЫК, ПОТОМУ ЧТО В СТИХАХ И В ПРОЗЕ АВТОР РАССКАЗЫВАЕТ НАМ ОБ ОДНОМ И ТОМ ЖЕ. ЛИРИКА НАБЛЮДАЕМА. ПАЛИМПСЕСТ НАЧИНАЕТ ЛИРИЧЕСКИЙ ПОТОК СОЗНАНИЯ. В ДАННОМ СЛУЧАЕ МОЖНО СОГЛАСИТЬСЯ С А.А. ЗЕМЛЯКОВСКИМ И С РУМЫНСКИМ ИССЛЕДОВАТЕЛЕМ АЛЬБЕРТОМ КОВАЧЕМ, СЧИТАЮЩИМИ, ЧТО ГЕНЕЗИС СВОБОДНОГО СТИХА НИВЕЛИРУЕТ ВЕРЛИБР. СУЩЕСТВУЮЩАЯ ОРФОГРАФИЧЕСКАЯ СИМВОЛИКА НИКАК НЕ ПРИСПОСОБЛЕНА ДЛЯ ЗАДАЧ ПИСЬМЕННОГО ВОСПРОИЗВЕДЕНИЯ СМЫСЛОВЫХ НЮАНСОВ УСТНОЙ РЕЧИ, ОДНАКО ЛОЖНАЯ ЦИТАТА НАЧИНАЕТ ВОЗВРАТ К СТЕРЕОТИПАМ.\r\n'),
(53, '9f4e9e854454d43ca864fae71ef9b8bc', 'ESCADA\r\nКАК МЫ УЖЕ ЗНАЕМ, РЕФОРМАТОРСКИЙ ПАФОС ДАЕТ ПАСТИШ. С СЕМАНТИЧЕСКОЙ ТОЧКИ ЗРЕНИЯ, ГИПЕРЦИТАТА ДАЕТ УРБАНИСТИЧЕСКИЙ ЗАЧИН. В ОТЛИЧИЕ ОТ ПРОИЗВЕДЕНИЙ ПОЭТОВ БАРОККО, ЭСТЕТИЧЕСКОЕ ВОЗДЕЙСТВИЕ ПРОСВЕТЛЯЕТ РЕЗКИЙ СИМВОЛ. ОБСЦЕННАЯ ИДИОМА, НЕ УЧИТЫВАЯ КОЛИЧЕСТВА СЛОГОВ, СТОЯЩИХ МЕЖДУ УДАРЕНИЯМИ, ПРЕКРАСНО ПРОСВЕТЛЯЕТ ЖАНР.\r\n\r\nПЕРВОЕ ПОЛУСТИШИЕ ТРАДИЦИОННО АЛЛИТЕРИРУЕТ СИМВОЛ. НЕ-ТЕКСТ ТОЧНО ДИССОНИРУЕТ СТИХ. С СЕМАНТИЧЕСКОЙ ТОЧКИ ЗРЕНИЯ, СТИХОТВОРЕНИЕ РЕДУЦИРУЕТ КУЛЬТУРНЫЙ СИМВОЛ. ЦЕЗУРА, КАК БЫ ЭТО НИ КАЗАЛОСЬ ПАРАДОКСАЛЬНЫМ, НЕУМЕРЕННО ОТРАЖАЕТ КОНКРЕТНЫЙ ЭПИТЕТ. СТИХОТВОРЕНИЕ ПАРАЛЛЕЛЬНО.\r\n\r\nДОЛЬНИК АЛЛИТЕРИРУЕТ ВОЗВРАТ К СТЕРЕОТИПАМ, И ЭТО ЯСНО ВИДНО В СЛЕДУЮЩЕМ ОТРЫВКЕ: «КУРИТ ЛИ ТРУПКА МОЙ, – ИЗ ТРУПКА ТФОЙ ПИХТИШЬ. / ИЛИ МОЙ КАФЕ ПИЛ – ТФОЙ В ЩАШЕШКА СИДИШЬ». В ДАННОМ СЛУЧАЕ МОЖНО СОГЛАСИТЬСЯ С А.А. ЗЕМЛЯКОВСКИМ И С РУМЫНСКИМ ИССЛЕДОВАТЕЛЕМ АЛЬБЕРТОМ КОВАЧЕМ, СЧИТАЮЩИМИ, ЧТО ЗАИМСТВОВАНИЕ ОСОЗНАЁТ ЭКЗИСТЕНЦИАЛЬНЫЙ ЗАЧИН, НО ИЗВЕСТНЫ СЛУЧАИ ПРОЧИТЫВАНИЯ СОДЕРЖАНИЯ ПРИВЕДЁННОГО ОТРЫВКА ИНАЧЕ. ЭВОКАЦИЯ ПРЕКРАСНО ОСОЗНАЁТ РЕЧЕВОЙ АКТ. ПАЛИМПСЕСТ, ЗА СЧЕТ ИСПОЛЬЗОВАНИЯ ПАРАЛЛЕЛИЗМОВ И ПОВТОРОВ НА РАЗНЫХ ЯЗЫКОВЫХ УРОВНЯХ,\r\n'),
(56, '780ecb6c88931d875c96871f5fe9a7e1', 'ВСТРЕЧАЕМ ОСЕНЬ 2014 МОДНО!\r\nКАКИЕ ТЕНДЕНЦИИ НАБЛЮДАЮТСЯ ЭТОЙ ОСЕНЬЮ?\r\nДИАЛОГИЧЕСКИЙ КОНТЕКСТ СЛОЖЕН. АЛЛИТЕРАЦИЯ, СОПРИКОСНУВШИСЬ В ЧЕМ-ТО СО СВОИМ ГЛАВНЫМ АНТАГОНИСТОМ В ПОСТСТРУКТУРНОЙ ПОЭТИКЕ, ПРИТЯГИВАЕТ РЕЗКИЙ ПОЛИФОНИЧЕСКИЙ РОМАН. ДОЛЬНИК, ЧТОБЫ УЛОВИТЬ ХОРЕИЧЕСКИЙ РИТМ ИЛИ АЛЛИТЕРАЦИЮ НА "Л", АЛЛИТЕРИРУЕТ СЮЖЕТНЫЙ НЕ-ТЕКСТ. ЖЕНСКОЕ ОКОНЧАНИЕ ФОНЕТИЧЕСКИ ВЫБИРАЕТ АКЦЕНТ, ОБ ЭТОМ СВИДЕТЕЛЬСТВУЮТ КРАТКОСТЬ И ЗАВЕРШЕННОСТЬ ФОРМЫ, БЕССЮЖЕТНОСТЬ, СВОЕОБРАЗИЕ ТЕМАТИЧЕСКОГО РАЗВЕРТЫВАНИЯ. НАРЯДУ С НЕЙТРАЛЬНОЙ ЛЕКСИКОЙ МИФОПОЭТИЧЕСКОЕ ПРОСТРАНСТВО ПОСЛЕДОВАТЕЛЬНО ОТТАЛКИВАЕТ РЕЧЕВОЙ АКТ, НО НЕ РИФМАМИ.\r\n\r\nСИМВОЛ, В ПЕРВОМ ПРИБЛИЖЕНИИ, ОСОЗНАЁТ КОММУНАЛЬНЫЙ МОДЕРНИЗМ. ПОЗНАНИЕ ТЕКСТА, КАК СПРАВЕДЛИВО СЧИТАЕТ И.ГАЛЬПЕРИН, ОДНОРОДНО ОТРАЖАЕТ ВОЗВРАТ К СТЕРЕОТИПАМ, ПРИ ЭТОМ НЕЛЬЗЯ ГОВОРИТЬ, ЧТО ЭТО ЯВЛЕНИЯ СОБСТВЕННО ФОНИКИ, ЗВУКОПИСИ. РЕФЛЕКСИЯ ДИССОНИРУЕТ КУЛЬТУРНЫЙ СТРОФОИД. СТРОФОИД ДИССОНИРУЕТ ДИАЛОГИЧЕСКИЙ КОНТЕКСТ. БЫЛИЧКА УЯЗВИМА.\r\n\r\nАБСТРАКТНОЕ ВЫСКАЗЫВАНИЕ ИЗЯЩНО ПРОСВЕТЛЯЕТ СЮЖЕТНЫЙ СИМУЛЯКР. ПАРАФРАЗ СЛАБОПРОНИЦАЕМ. ПОЗНАНИЕ ТЕКСТА, КАК СПРАВЕДЛИВО СЧИТАЕТ И.ГАЛЬПЕРИН, ИНТЕГРИРУЕТ СТИХ. СУЩЕСТВУЮЩАЯ ОРФОГРАФИЧЕСКАЯ СИМВОЛИКА НИКАК НЕ ПРИСПОСОБЛЕНА ДЛЯ ЗАДАЧ ПИСЬМЕННОГО ВОСПРОИЗВЕДЕНИЯ СМЫСЛОВЫХ НЮАНСОВ УСТНОЙ РЕЧИ, ОДНАКО ЗАИМСТВОВАНИЕ ПРОСВЕТЛЯЕТ КОНКРЕТНЫЙ ПОТОК СОЗНАНИЯ.\r\n'),
(57, 'e59c2be69dcdcd2d7c474be56529d32a', 'НОВОСТЬ ДЕТАЛЬНО\r\n\r\n'),
(58, '3de756ae24822a101de2da811ebc5d5b', 'АДМИНИСТРАТОР\r\n\r\n');

-- --------------------------------------------------------

--
-- Структура таблицы `b_search_content_title`
--

CREATE TABLE IF NOT EXISTS `b_search_content_title` (
  `SEARCH_CONTENT_ID` int(11) NOT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `POS` int(11) NOT NULL,
  `WORD` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  UNIQUE KEY `UX_B_SEARCH_CONTENT_TITLE` (`SITE_ID`,`WORD`,`SEARCH_CONTENT_ID`,`POS`),
  KEY `IND_B_SEARCH_CONTENT_TITLE` (`SEARCH_CONTENT_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci DELAY_KEY_WRITE=1;

--
-- Дамп данных таблицы `b_search_content_title`
--

INSERT INTO `b_search_content_title` (`SEARCH_CONTENT_ID`, `SITE_ID`, `POS`, `WORD`) VALUES
(46, 's1', 21, '2'),
(56, 's1', 16, '2014'),
(47, 's1', 25, 'COUTURE3'),
(51, 's1', 0, 'DKNY'),
(53, 's1', 0, 'ESCADA'),
(52, 's1', 0, 'JAEGER'),
(44, 's1', 0, 'JAMILCO'),
(47, 's1', 19, 'JUICY'),
(48, 's1', 10, 'NAF'),
(48, 's1', 14, 'NAF4'),
(49, 's1', 5, 'SALOMON'),
(47, 's1', 10, 'SPORT'),
(45, 's1', 24, 'TIMBERLAND1'),
(49, 's1', 0, 'YVES'),
(43, 's1', 1, 'авазШны'),
(7, 's1', 0, 'АВТОРИЗАЦИЯ'),
(58, 's1', 0, 'АДМИНИСТРАТОР'),
(40, 's1', 1, 'арьера'),
(30, 's1', 8, 'БАНКА'),
(15, 's1', 0, 'БАНКОВСКИЕ'),
(11, 's1', 18, 'БИЗНЕСУ'),
(50, 's1', 0, 'БРЕНД'),
(38, 's1', 0, 'БРЕНДЫ'),
(45, 's1', 21, 'в'),
(46, 's1', 7, 'В'),
(28, 's1', 0, 'ВАКАНСИИ'),
(4, 's1', 7, 'ВОПРОС'),
(46, 's1', 7, 'ВСЕГДА'),
(56, 's1', 0, 'ВСТРЕЧАЕМ'),
(20, 's1', 0, 'ДЕПОЗИТАРНЫЕ'),
(12, 's1', 0, 'ДЕПОЗИТЫ'),
(57, 's1', 8, 'ДЕТАЛЬНО'),
(18, 's1', 0, 'ДОКУМЕНТАРНЫЕ'),
(4, 's1', 0, 'ЗАДАТЬ'),
(11, 's1', 7, 'И'),
(21, 's1', 0, 'ИНКАССАЦИЯ'),
(22, 's1', 0, 'ИНТЕРНЕТ-БАНКИНГ'),
(25, 's1', 0, 'ИНФОРМАЦИЯ'),
(29, 's1', 0, 'ИСТОРИЯ'),
(1, 's1', 0, 'КАРТА'),
(10, 's1', 12, 'КАРТЫ'),
(15, 's1', 11, 'КАРТЫ'),
(23, 's1', 14, 'КЛИЕНТАМ'),
(47, 's1', 0, 'КОЛЛЕКЦИЯ'),
(25, 's1', 13, 'КОМПАНИИ'),
(29, 's1', 8, 'КОМПАНИИ'),
(37, 's1', 2, 'КОМПАНИИ'),
(54, 's1', 17, 'КОНЧИЛСЯ'),
(23, 's1', 0, 'КОРПОРАТИВНЫМ'),
(14, 's1', 16, 'КРЕДИТ'),
(9, 's1', 0, 'КРЕДИТОВАНИЕ'),
(8, 's1', 0, 'ЛИЗИНГ'),
(16, 's1', 8, 'ЛИЦАМ'),
(11, 's1', 0, 'МАЛОМУ'),
(17, 's1', 10, 'МЕЖБАНКОВСКОМ'),
(26, 's1', 0, 'МИССИЯ'),
(46, 's1', 16, 'МОДЕ'),
(56, 's1', 21, 'МОДНО'),
(17, 's1', 7, 'НА'),
(6, 's1', 0, 'НАШИ'),
(5, 's1', 1, 'ннтаЪты'),
(3, 's1', 0, 'НОВОСТИ'),
(30, 's1', 0, 'НОВОСТИ'),
(57, 's1', 0, 'НОВОСТЬ'),
(39, 's1', 1, 'нЪсЯателяУ'),
(25, 's1', 3, 'О'),
(37, 's1', 0, 'О'),
(24, 's1', 18, 'ОБСЛУЖИВАНИЕ'),
(18, 's1', 14, 'ОПЕРАЦИИ'),
(19, 's1', 11, 'ОРГАНИЗАЦИЯМ'),
(55, 's1', 6, 'ОСЕННЕГО'),
(56, 's1', 10, 'ОСЕНЬ'),
(47, 's1', 16, 'ОТ'),
(48, 's1', 7, 'ОТ'),
(10, 's1', 0, 'ПЛАСТИКОВЫЕ'),
(2, 's1', 0, 'ПОИСК'),
(14, 's1', 0, 'ПОТРЕБИТЕЛЬСКИЙ'),
(54, 's1', 0, 'РАЗВЕ'),
(24, 's1', 0, 'РАСЧЕТНО-КАССОВОЕ'),
(45, 's1', 0, 'РасЯрнХажа'),
(6, 's1', 5, 'РЕКВИЗИТЫ'),
(27, 's1', 0, 'РУКОВОДСТВО'),
(17, 's1', 24, 'РЫНКЕ'),
(1, 's1', 6, 'САЙТА'),
(54, 's1', 6, 'СЕЗОН'),
(55, 's1', 15, 'СЕЗОНА'),
(48, 's1', 0, 'СКИДКИ'),
(11, 's1', 9, 'СРЕДНЕМУ'),
(13, 's1', 0, 'УСЛУГИ'),
(17, 's1', 0, 'УСЛУГИ'),
(20, 's1', 13, 'УСЛУГИ'),
(19, 's1', 0, 'ФИНАНСОВЫМ'),
(41, 's1', 0, 'ФранчайзШнв'),
(55, 's1', 0, 'ЦВЕТА'),
(16, 's1', 0, 'ЧАСТНЫМ'),
(46, 's1', 0, 'ЧЕРНЫЙ'),
(54, 's1', 12, 'ЮБОК'),
(42, 's1', 14, 'ЯрнХажШ'),
(42, 's1', 1, 'Ятнвые');

-- --------------------------------------------------------

--
-- Структура таблицы `b_search_custom_rank`
--

CREATE TABLE IF NOT EXISTS `b_search_custom_rank` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `APPLIED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `RANK` int(11) NOT NULL DEFAULT '0',
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `MODULE_ID` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `PARAM1` text COLLATE utf8_unicode_ci,
  `PARAM2` text COLLATE utf8_unicode_ci,
  `ITEM_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IND_B_SEARCH_CUSTOM_RANK` (`SITE_ID`,`MODULE_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `b_search_phrase`
--

CREATE TABLE IF NOT EXISTS `b_search_phrase` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` datetime NOT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `RESULT_COUNT` int(11) NOT NULL,
  `PAGES` int(11) NOT NULL,
  `SESSION_ID` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `PHRASE` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TAGS` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `URL_TO` text COLLATE utf8_unicode_ci,
  `URL_TO_404` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `URL_TO_SITE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `STAT_SESS_ID` int(18) DEFAULT NULL,
  `EVENT1` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IND_PK_B_SEARCH_PHRASE_SESS_PH` (`SESSION_ID`,`PHRASE`(50)),
  KEY `IND_PK_B_SEARCH_PHRASE_SESS_TG` (`SESSION_ID`,`TAGS`(50)),
  KEY `IND_PK_B_SEARCH_PHRASE_TIME` (`TIMESTAMP_X`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `b_search_stem`
--

CREATE TABLE IF NOT EXISTS `b_search_stem` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `STEM` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UX_B_SEARCH_STEM` (`STEM`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1916 ;

--
-- Дамп данных таблицы `b_search_stem`
--

INSERT INTO `b_search_stem` (`ID`, `STEM`) VALUES
(1, 'КАРТ'),
(2, 'САЙТ'),
(3, 'ПОИСК'),
(4, 'НОВОСТ'),
(5, 'КОМПАН'),
(6, 'ЗАДА'),
(7, 'ВОПРОС'),
(8, 'КОНТАКТН'),
(9, 'ИНФОРМАЦ'),
(10, 'ОБРАТ'),
(11, 'НАШ'),
(12, 'СПЕЦИАЛИСТ'),
(13, 'ПОЛУЧ'),
(14, 'ПРОФЕССИОНАЛЬН'),
(15, 'КОНСУЛЬТАЦ'),
(16, 'УСЛУГ'),
(17, 'БАНК'),
(18, 'МОЖЕТ'),
(19, 'НАМ'),
(20, 'ТЕЛЕФОН'),
(21, 'ЭЛЕКТРОН'),
(22, 'ПОЧТ'),
(23, 'ДОГОВОР'),
(24, 'ВСТРЕЧ'),
(25, 'ОФИС'),
(26, 'БУД'),
(27, 'РАД'),
(28, 'ПОМОЧ'),
(29, 'ОТВЕТ'),
(30, 'ФАКС'),
(31, '495'),
(32, '212-85-06'),
(33, '212-85-07'),
(34, '212-85-08'),
(35, 'МОСКВ'),
(36, 'РЕКВИЗИТ'),
(37, 'НАИМЕНОВАН'),
(38, 'ЗАКРЫТ'),
(39, 'АКЦИОНЕРН'),
(40, 'ОБЩЕСТВ'),
(41, 'НАЗВАН'),
(42, 'СОКРАЩЕН'),
(43, 'ПОЛН'),
(44, 'АНГЛИЙСК'),
(45, 'ЯЗЫК'),
(46, 'NAME'),
(47, 'BANK'),
(48, 'ОСНОВН'),
(49, 'ГОСУДАРСТВЕН'),
(50, 'РЕГИСТРАЦИОН'),
(51, 'НОМЕР'),
(52, '152073950937987'),
(53, 'TELEX'),
(54, '911156'),
(55, 'IR'),
(56, 'IISARUMM'),
(57, 'SPRINT'),
(58, 'BITEX'),
(59, 'ЮРИДИЧЕСК'),
(60, 'АДРЕС'),
(61, '175089'),
(62, 'РОСС'),
(63, 'УЛ'),
(64, 'БОЛЬШ'),
(65, 'ДМИТРОВК'),
(66, '15'),
(67, 'СТР'),
(68, 'КОР'),
(69, 'СЧЕТ'),
(70, '30102810000000000569'),
(71, 'ИН'),
(72, '7860249880'),
(73, 'БИК'),
(74, '044591488'),
(75, 'ОКП'),
(76, '11806935'),
(77, 'ОКОНХ'),
(78, '98122'),
(79, 'КПП'),
(80, '775021017'),
(81, 'ПРОЧ'),
(82, 'БАНКОВСК'),
(83, 'ИДЕНТИФИКАЦИОН'),
(84, 'КОД'),
(85, '0575249000'),
(86, 'ПОЧТОВ'),
(87, '115035'),
(88, 'БАЛЧУГ'),
(89, '960-10-12'),
(90, '240-38-12'),
(91, 'E-MAIL'),
(92, 'RUSBK'),
(93, 'MAIL'),
(94, 'RUSBANK'),
(95, 'АВТОРИЗАЦ'),
(96, 'ЗАРЕГИСТРИРОВА'),
(97, 'УСПЕШН'),
(98, 'АВТОРИЗОВА'),
(99, 'ИСПОЛЬЗ'),
(100, 'АДМИНИСТРАТИВН'),
(101, 'ПАНЕЛ'),
(102, 'ВЕРХН'),
(103, 'ЧАСТ'),
(104, 'ЭКРА'),
(105, 'БЫСТР'),
(106, 'ДОСТУП'),
(107, 'ФУНКЦ'),
(108, 'УПРАВЛЕН'),
(109, 'СТРУКТУР'),
(110, 'ИНФОРМАЦИОН'),
(111, 'НАПОЛНЕН'),
(112, 'НАБОР'),
(113, 'КНОПОК'),
(114, 'ОТЛИЧА'),
(115, 'РАЗЛИЧН'),
(116, 'РАЗДЕЛОВ'),
(117, 'РАЗДЕЛ'),
(118, 'ОТДЕЛЬН'),
(119, 'ДЕЙСТВ'),
(120, 'ПРЕДУСМОТР'),
(121, 'СТАТИЧЕСК'),
(122, 'СОДЕРЖИМ'),
(123, 'СТРАНИЦ'),
(124, 'ДИНАМИЧЕСК'),
(125, 'ПУБЛИКАЦ'),
(126, 'КАТАЛОГ'),
(127, 'ФОТОГАЛЕРЕ'),
(128, 'ВЕРНУТ'),
(129, 'ГЛАВН'),
(130, 'ЛИЗИНГ'),
(131, 'ОКАЗЫВА'),
(132, 'ВЕ'),
(133, 'СПЕКТР'),
(134, 'ФИНАНСОВ'),
(135, 'АРЕНД'),
(136, 'ОТЕЧЕСТВЕН'),
(137, 'ИМПОРТН'),
(138, 'ОБОРУДОВАН'),
(139, 'ТРАНСПОРТ'),
(140, 'НЕДВИЖИМ'),
(141, 'УСЛОВ'),
(142, 'СРОК'),
(143, 'ФИНАНСИРОВАН'),
(144, 'ЛЕТ'),
(145, 'ПОДВИЖН'),
(146, 'СОСТА'),
(147, '10'),
(148, 'ВАЛЮТ'),
(149, 'РУБЛ'),
(150, 'ДОЛЛАР'),
(151, 'США'),
(152, 'ЕВР'),
(153, 'МИНИМАЛЬН'),
(154, 'СУММ'),
(155, 'МЛН'),
(156, 'РУБ'),
(157, 'АВАНС'),
(158, 'УДОРОЖАН'),
(159, 'ПРИНЯТ'),
(160, 'РЕШЕН'),
(161, '14'),
(162, 'ДНЕ'),
(163, 'ПОСТАВОК'),
(164, 'ПРЕДОСТАВЛЯ'),
(165, 'ПРЕДПРИЯТ'),
(166, 'ЛЬГОТН'),
(167, 'ИСПОЛЬЗОВАН'),
(168, 'МЕХАНИЗМ'),
(169, 'УЧАСТ'),
(170, 'ЭКСПОРТН'),
(171, 'КРЕДИТН'),
(172, 'АГЕНТСТВ'),
(173, 'УЧЕТ'),
(174, 'ТАМОЖЕН'),
(175, 'ПОШЛИН'),
(176, 'КОММЕРЧЕСК'),
(177, 'ПОЗВОЛЯ'),
(178, 'ПРИОБРЕСТ'),
(179, 'ОБЪЕКТ'),
(180, 'ЕДИНОВРЕМЕН'),
(181, 'ОТВЛЕЧЕН'),
(182, 'ЗНАЧИТЕЛЬН'),
(183, 'СРЕДСТВ'),
(184, 'КАЧЕСТВ'),
(185, 'ПРЕДМЕТ'),
(186, 'МОГУТ'),
(187, 'ВЫСТУПА'),
(188, 'ОФИСН'),
(189, 'ЗДАН'),
(190, 'ТОРГОВ'),
(191, 'СКЛАДСК'),
(192, 'ПРОИЗВОДСТВЕН'),
(193, 'ПОМЕЩЕН'),
(194, 'ДРУГ'),
(195, '50'),
(196, 'РАЗМЕР'),
(197, 'ЗАВИС'),
(198, 'РЕГИОН'),
(199, 'КОТОР'),
(200, 'НАХОД'),
(201, 'ТРЕБОВАН'),
(202, 'ПРЕДЪЯВЛЯ'),
(203, 'РАССМОТРЕН'),
(204, 'ЗАЯВК'),
(205, 'ЯВЛЯ'),
(206, 'НАЛИЧ'),
(207, 'КОМПЛЕКТ'),
(208, 'ПРАВОУСТАНАВЛИВА'),
(209, 'ДОКУМЕНТОВ'),
(210, 'ДОКУМЕНТ'),
(211, 'ОТЧЕТ'),
(212, 'НЕЗАВИСИМ'),
(213, 'ОЦЕНЩИК'),
(214, 'КРЕДИТОВАН'),
(215, 'МАЛ'),
(216, 'СРЕДН'),
(217, 'БИЗНЕС'),
(218, 'ОДН'),
(219, 'СТРАТЕГИЧЕСК'),
(220, 'НАПРАВЛЕН'),
(221, 'ДАН'),
(222, 'ВКЛЮЧА'),
(223, 'ЛИЦ'),
(224, 'ИНДИВИДУАЛЬН'),
(225, 'ПРЕДПРИНИМАТЕЛ'),
(226, 'ЗАВИСИМ'),
(227, 'ПОЖЕЛАН'),
(228, 'КЛИЕНТ'),
(229, 'КРЕДИТ'),
(230, 'РАЗН'),
(231, 'РФ'),
(232, 'ПРЕИМУЩЕСТВ'),
(233, 'ПОЛУЧЕН'),
(234, '2-Х'),
(235, 'РАБОЧ'),
(236, 'ОТСУТСТВ'),
(237, 'ЕЖЕМЕСЯЧН'),
(238, 'ПЛАТ'),
(239, 'ВЕДЕН'),
(240, 'ССУДН'),
(241, 'ПРЕДОСТАВЛЕН'),
(242, 'БИЗНЕС-ПЛА'),
(243, 'ПРИНИМА'),
(244, 'УПРАВЛЕНЧЕСК'),
(245, 'ОТЧЕТН'),
(246, 'ЗАЛОГ'),
(247, 'РАССМАТРИВА'),
(248, 'ТОВАР'),
(249, 'ОБОРОТ'),
(250, 'АВТОТРАНСПОРТ'),
(251, 'ЛИКВИДН'),
(252, 'ИМУЩЕСТВ'),
(253, 'ГИБК'),
(254, 'ПОГАШЕН'),
(255, 'ПОЗВОН'),
(256, '757-57-57'),
(257, 'БЛИЖАЙШ'),
(258, 'ОТДЕЛЕН'),
(259, 'ЗАПОЛН'),
(260, 'ON-LINE'),
(261, 'ПОМОГУТ'),
(262, 'ВЫБРА'),
(263, 'УДОБН'),
(264, 'ИНТЕРЕС'),
(265, 'ВАС'),
(266, 'ПОДГОТОВЬТ'),
(267, 'НЕОБХОДИМ'),
(268, 'ЭКСПЕРТ'),
(269, 'ПОКАЖ'),
(270, 'ПРЕДЛАГА'),
(271, 'КРЕД'),
(272, 'РАЗВИТ'),
(273, 'ПРОГРАММ'),
(274, 'ПРОЦЕНТН'),
(275, 'СТАВК'),
(276, 'ОВЕРДРАФТ'),
(277, '300'),
(278, '000'),
(279, '18'),
(280, 'ГОДОВ'),
(281, '12'),
(282, 'МЕСЯЦЕВ'),
(283, 'МЕСЯЦ'),
(284, 'МИНИКРЕД'),
(285, '150'),
(286, '24'),
(287, '36'),
(288, '17'),
(289, 'ИНВЕСТ'),
(290, '30'),
(291, '72'),
(292, 'ПЛАСТИКОВ'),
(293, 'ПРОВОД'),
(294, 'ОПЕРАЦ'),
(295, '1997'),
(296, 'СЕГОДН'),
(297, 'МЕЖДУНАРОДН'),
(298, 'ПЛАТЕЖН'),
(299, 'СИСТ'),
(300, 'VISA'),
(301, 'MASTERCARD'),
(302, 'ДЕМОКРАТИЧН'),
(303, 'ЕLЕCTRON'),
(304, 'ЭЛИТН'),
(305, 'GOLD'),
(306, 'PLATINUM'),
(307, 'РАМК'),
(308, 'ПЕРСОНАЛЬН'),
(309, 'ОБСЛУЖИВАН'),
(310, 'ДОПОЛНИТЕЛЬН'),
(311, 'ЭКСКЛЮЗИВН'),
(312, 'INFINIT'),
(313, 'БРИЛЛИАНТ'),
(314, 'ПЛАТИНОВ'),
(315, 'ПЛАТИН'),
(316, 'ОРНАМЕНТ'),
(317, 'ЗАКАЗА'),
(318, 'МОЖН'),
(319, 'ЛЮБ'),
(320, 'БУДЕТ'),
(321, 'ГОТОВ'),
(322, 'ГОТ'),
(323, 'ЧЕРЕЗ'),
(324, '3-5'),
(325, 'ОДИН'),
(326, 'НЕМНОГ'),
(327, 'ВЫДА'),
(328, 'ДВА'),
(329, 'ГОД'),
(330, 'КРУПН'),
(331, 'ЗАРУБЕЖН'),
(332, 'КАЖД'),
(333, 'ПАКЕТ'),
(334, 'ТРЕХ'),
(335, 'ЧЛЕНОВ'),
(336, 'ЧЛЕН'),
(337, 'СЕМ'),
(338, 'ВКЛЮЧ'),
(339, 'ДЕТ'),
(340, 'СТАРШ'),
(341, 'УСТАНАВЛИВА'),
(342, 'ОГРАНИЧЕН'),
(343, 'СКОЛЬК'),
(344, 'ПОТРАТ'),
(345, 'ТЕР'),
(346, 'ТЕРЯ'),
(347, 'ДЕНЬГ'),
(348, 'ПОТ'),
(349, 'НАДЕЖН'),
(350, 'ЗАЩИЩ'),
(351, 'НЕЗАКОН'),
(352, 'ПРОСТ'),
(353, 'СОБЛЮДА'),
(354, 'ПРАВ'),
(355, 'БЕЗОПАСН'),
(356, 'ОБРАЩЕН'),
(357, 'СО'),
(358, 'СЛУЧА'),
(359, 'ПРОПАЖ'),
(360, 'ХИЩЕН'),
(361, 'ПРОМЕДЛЕН'),
(362, 'НАЛИЧН'),
(363, 'КОМИСС'),
(364, 'ШИРОК'),
(365, 'СЕТ'),
(366, 'БАНКОМАТОВ'),
(367, 'БАНКОМАТ'),
(368, 'СВЕДЕН'),
(369, 'ОСТАТК'),
(370, 'СОВЕРШЕН'),
(371, 'ПРИХОД'),
(372, 'SMS'),
(373, 'СИСТЕМ'),
(374, 'ИНТЕРНЕТ-БАНКИНГ'),
(375, 'ВЛАДЕЛЬЦ'),
(376, 'КОНТРОЛИРОВА'),
(377, 'РАСХОД'),
(378, 'УПРАВЛЯ'),
(379, 'КАРТОЧН'),
(380, 'ВСЕМ'),
(381, 'ДОСТУПН'),
(382, 'CКИДК'),
(383, 'БОНУСН'),
(384, 'ВИД'),
(385, 'ДЕБЕТОВ'),
(386, 'УДОБСТВ'),
(387, 'БЕЗНАЛИЧН'),
(388, 'ОПЛАТ'),
(389, 'ТОВАРОВ'),
(390, 'ХРАНЕН'),
(391, 'СОБСТВЕН'),
(392, 'НАЧИСЛЕН'),
(393, 'ПРОЦЕНТОВ'),
(394, 'ПРОЦЕНТ'),
(395, 'ОСТАТОК'),
(396, 'КОНТРОЛ'),
(397, '55'),
(398, 'ПОЛЬЗОВА'),
(399, 'МНОГОКРАТН'),
(400, 'ОБРА'),
(401, 'ТОЧК'),
(402, 'МИР'),
(403, 'ПРОВОЗ'),
(404, 'ДЕНЕГ'),
(405, 'ГРАНИЦ'),
(406, 'ОФОРМЛЕН'),
(407, 'НУЖН'),
(408, 'ПОКУПА'),
(409, 'ВЫЕЗД'),
(410, 'СТРАН'),
(411, 'ПОЛЕЗН'),
(412, 'РАБОТ'),
(413, 'ВАЖН'),
(414, 'ДЕЯТЕЛЬН'),
(415, 'ПРЕДСТАВЛЯ'),
(416, 'СОВРЕМЕН'),
(417, 'ОБЕСПЕЧИВА'),
(418, 'ОПТИМАЛЬН'),
(419, 'ВЗАИМОВЫГОДН'),
(420, 'ВАРИАНТ'),
(421, 'СОТРУДНИЧЕСТВ'),
(422, 'ОСНОВ'),
(423, 'ОСН'),
(424, 'ЛЕЖ'),
(425, 'ПРОФЕССИОНАЛИЗМ'),
(426, 'СОТРУДНИКОВ'),
(427, 'СОТРУДНИК'),
(428, 'ВЫСОК'),
(429, 'ОПЕРАТИВН'),
(430, 'ОРИЕНТИРОВА'),
(431, 'ДЕЛОВ'),
(432, 'ЛЮД'),
(433, 'ТЕХ'),
(434, 'ЦЕН'),
(435, 'ВРЕМ'),
(436, 'СЛЕД'),
(437, 'ДЕПОЗИТ'),
(438, 'ЭФФЕКТИВН'),
(439, 'РАЗМЕСТ'),
(440, 'СВОБОДН'),
(441, 'ДЕПОЗ'),
(442, 'ПРИБЫЛ'),
(443, 'ДЕПОЗИТН'),
(444, 'ПРОДУКТ'),
(445, 'ДОСРОЧН'),
(446, 'РАСТОРЖЕН'),
(447, 'ПОПОЛНЕН'),
(448, 'ЧАСТИЧН'),
(449, 'ИЗЪЯТ'),
(450, 'ВЫПЛАТ'),
(451, 'КОНЦ'),
(452, 'ВОЗМОЖН'),
(453, 'ПРЕКРАЩА'),
(454, 'ОКОНЧАН'),
(455, 'БОЛ'),
(456, '40'),
(457, 'ПЕРВОНАЧАЛЬН'),
(458, 'ВКЛАД'),
(459, 'РАЗМЕЩЕН'),
(460, 'РАН'),
(461, 'ФИЗИЧЕСК'),
(462, 'ЧИСЛ'),
(463, 'СВЯЗА'),
(464, 'СОХРАНЕН'),
(465, 'СДЕЛОК'),
(466, 'ЧАСТНОСТ'),
(467, 'ЛИНЕЙК'),
(468, 'РАЗНООБРАЗН'),
(469, 'ВКЛАДОВ'),
(470, 'СПОСОБН'),
(471, 'УДОВЛЕТВОР'),
(472, 'ДОЛГОСРОЧН'),
(473, 'КРАТКОСРОЧН'),
(474, 'КАСА'),
(475, 'ВЫГОДН'),
(476, 'АКТИВН'),
(477, 'ПРИМЕНЯ'),
(478, 'ИННОВАЦИОН'),
(479, 'ТЕХНОЛОГ'),
(480, 'ДИНАМИЧН'),
(481, 'РАЗВИВА'),
(482, 'СФЕР'),
(483, 'КАЧЕСТВЕН'),
(484, 'УНИВЕРСАЛЬН'),
(485, 'СЕРВИС'),
(486, 'ПОТРЕБИТЕЛЬСК'),
(487, 'КОРПОРАТИВН'),
(488, 'ЛИДЕРОВ'),
(489, 'ЛИДЕР'),
(490, 'РЫНК'),
(491, 'КЛИЕНТОВ'),
(492, 'КОМПЛЕКСН'),
(493, 'МАКСИМАЛЬН'),
(494, 'КОНКУРЕНТН'),
(495, 'СОЗДА'),
(496, 'УСТОЙЧИВ'),
(497, 'ПЛАТФОРМ'),
(498, 'ХОЛДИНГОВ'),
(499, 'ХОЛДИНГ'),
(500, 'ОТРАСЛ'),
(501, 'ЭКОНОМИК'),
(502, 'РАБОТА'),
(503, 'ЯВЛ'),
(504, 'ОБРАЗЦ'),
(505, 'РАСЧЕТНО-КАССОВ'),
(506, 'ИНКАССАЦ'),
(507, 'ФИНАНС'),
(508, 'ОРГАНИЗАЦ'),
(509, 'СОБ'),
(510, 'НАИБОЛ'),
(511, 'СТОРОН'),
(512, 'ПЕРСПЕКТИВН'),
(513, 'ПОЛИТИК'),
(514, 'НАПРАВЛ'),
(515, 'РАСШИРЕН'),
(516, 'УВЕЛИЧЕН'),
(517, 'ОБЪЕМОВ'),
(518, 'ОБЪЕМ'),
(519, 'ВЗАИМН'),
(520, 'ЛИН'),
(521, 'СОЛИДН'),
(522, 'РЕПУТАЦ'),
(523, 'МЕЖБАНКОВСК'),
(524, 'СПОСОБСТВ'),
(525, 'НАЛАЖИВАН'),
(526, 'СТАБИЛЬН'),
(527, 'ПАРТНЕРСК'),
(528, 'ОТНОШЕН'),
(529, 'ОСОБ'),
(530, 'ВНИМАН'),
(531, 'УДЕЛЯ'),
(532, 'ВЗАИМООТНОШЕН'),
(533, 'ИНСТИТУТ'),
(534, 'СРЕДНЕСРОЧН'),
(535, 'ПРОЕКТОВ'),
(536, 'ПРОЕКТ'),
(537, 'ПРИВЛЕЧЕН'),
(538, 'КАПИТА'),
(539, 'ПРИОРИТЕТН'),
(540, 'ИМЕЕТ'),
(541, 'КОРРЕСПОНДЕНТСК'),
(542, 'СЧЕТОВ'),
(543, 'ОСУЩЕСТВЛЯ'),
(544, 'РАСЧЕТ'),
(545, 'ПОРУЧЕН'),
(546, 'ИСПОЛН'),
(547, 'СЖАТ'),
(548, 'ЦЕЛ'),
(549, 'МИНИМИЗАЦ'),
(550, 'РИСКОВ'),
(551, 'РИСК'),
(552, 'ПОВЕДЕН'),
(553, 'ТРЕБОВАТЕЛЬН'),
(554, 'ПОДХОД'),
(555, 'ВЫБОР'),
(556, 'БАНКОВ-КОНТРАГЕНТОВ'),
(557, 'БАНКОВ-КОНТРАГЕНТ'),
(558, 'ДЕПОЗИТАРН'),
(559, 'ДОКУМЕНТАРН'),
(560, 'ДОВЕРЯ'),
(561, 'ТРАТ'),
(562, 'ЛИШН'),
(563, 'ПРОЦЕДУР'),
(564, 'ТАРИФ'),
(565, '500'),
(566, '21'),
(567, 'ВЫДАЧ'),
(568, 'ДОЛЛАРОВ'),
(569, '16'),
(570, 'ТАРИФН'),
(571, 'ПЛАН'),
(572, 'ОПРЕДЕЛЯ'),
(573, 'ПОРЯДК'),
(574, 'ТОМ'),
(575, 'ПОДТВЕРЖДЕН'),
(576, 'ДОХОД'),
(577, 'ИЗЛОЖЕН'),
(578, 'ПУБЛИЧН'),
(579, 'ОФЕРТ'),
(580, 'ВЛЕЧЕТ'),
(581, 'ВОЗНИКНОВЕН'),
(582, 'ИНТЕЗ'),
(583, 'ОБЯЗАН'),
(584, 'ПРЕДОСТАВ'),
(585, 'УКАЗА'),
(586, 'ЗАЕМЩИК'),
(587, 'ГРАЖДАНИН'),
(588, 'СЕЙЧАС'),
(589, '23'),
(590, 'МЕНЬШ'),
(591, '60'),
(592, 'МУЖЧИН'),
(593, 'ЖЕНЩИН'),
(594, 'МОМЕНТ'),
(595, 'ОФИЦИАЛЬН'),
(596, 'МЕСТ'),
(597, 'НЕМ'),
(598, 'НАЙМ'),
(599, 'ШЕСТ'),
(600, 'ПРОШЛ'),
(601, 'ИСПЫТАТЕЛЬН'),
(602, 'ОБЩ'),
(603, 'ТРУДОВ'),
(604, 'СТАЖ'),
(605, 'СОСТАВЛЯ'),
(606, 'ДВУХ'),
(607, 'ПОДТВЕРД'),
(608, 'ПОМОЩ'),
(609, 'СТАНДАРТН'),
(610, 'ФОРМ'),
(611, '2НДФЛ'),
(612, 'СПРАВК'),
(613, 'ГОРОД'),
(614, 'ГОРОДСК'),
(615, 'ГОРЯЧ'),
(616, '800'),
(617, '2002'),
(618, '808'),
(619, 'ЗВОНОК'),
(620, 'БЕСПЛАТН'),
(621, 'ЕЖЕГОДН'),
(622, 'ОСУЩЕСТВЛЕН'),
(623, 'РАСЧЕТОВ'),
(624, '600'),
(625, '25'),
(626, 'ДОЛЛ'),
(627, 'ПЕРИОД'),
(628, 'КАЛЕНДАРН'),
(629, 'ПЛАТЕЖ'),
(630, 'ЗАДОЛЖЕН'),
(631, 'ШТРАФ'),
(632, 'НЕРАЗРЕШЕН'),
(633, 'ВЗИМА'),
(634, 'ОТМЕН'),
(635, 'МАРТ'),
(636, 'НЕПОГАШЕН'),
(637, 'ПОСЛЕДН'),
(638, 'ДЕН'),
(639, '1-6-ГО'),
(640, '6-ГО'),
(641, 'ПОСЛЕД'),
(642, 'ПУНКТ'),
(643, 'БАНКОВ-ПАРТНЕРОВ'),
(644, 'БАНКОВ-ПАРТНЕР'),
(645, 'ОБЪЕДИНЕН'),
(646, 'РАСЧЕТН'),
(647, 'ОРС'),
(648, 'ДЕНЕЖН'),
(649, 'КОНВЕРТАЦ'),
(650, 'ТРАНСГРАНИЧН'),
(651, 'ПРЕДЕЛ'),
(652, 'ТЕРРИТОР'),
(653, '75'),
(654, 'КАРТСЧЕТ'),
(655, 'РОССИЙСК'),
(656, 'ТЕЧЕН'),
(657, 'ПЕРВИЧН'),
(658, 'ВЫПУСК'),
(659, 'ПЕРЕД'),
(660, 'НАЧАЛ'),
(661, '20'),
(662, 'ВКЛЮЧИТЕЛЬН'),
(663, 'МИН'),
(664, '90'),
(665, '001'),
(666, 'ВЫШ'),
(667, 'ПЕРЕЧИСЛЕН'),
(668, 'КОНВЕРС'),
(669, 'ИНТЕРНЕТ-БАНК'),
(670, 'ОСТАНОВК'),
(671, 'СОВЕРША'),
(672, 'УТРАТ'),
(673, 'КАРТОЧК'),
(674, 'ИНТЕРНЕТ'),
(675, 'ПЕРЕРАСХОД'),
(676, 'ОТПРАВК'),
(677, 'СООБЩЕН'),
(678, 'ПРОВЕДЕН'),
(679, 'БАЛАНС'),
(680, 'ЧАСТН'),
(681, 'ОПИСАН'),
(682, 'ВАЛЮТН'),
(683, 'ДНЯ'),
(684, 'ДАЛЬН'),
(685, 'ПРОЛОНГАЦ'),
(686, 'КОНКРЕТН'),
(687, 'СДЕЛК'),
(688, 'ОВГВЗ'),
(689, 'ДИСКОНТ'),
(690, 'БУМАГ'),
(691, 'ОБЛИГАЦ'),
(692, 'ФЕДЕРАЛЬН'),
(693, 'ЗАЙМ'),
(694, 'ОФЗ'),
(695, 'ДАТ'),
(696, '91'),
(697, '365'),
(698, 'СВЫШ'),
(699, '13'),
(700, 'ДО2'),
(701, 'НЕДЕЛ'),
(702, 'ВЕКСЕЛ'),
(703, 'ВЕКСЕЛЬН'),
(704, 'ДОЛГОВ'),
(705, 'ОБЯЗАТЕЛЬСТВ'),
(706, '978-78-78'),
(707, 'КОНВЕРСИОН'),
(708, 'ВНУТРЕН'),
(709, 'БРОКЕРСК'),
(710, 'БАНКОВ'),
(711, 'ТОРГ'),
(712, 'ЕТС'),
(713, 'ММВБ'),
(714, 'КОМИССИОН'),
(715, 'ВОЗНАГРАЖДЕН'),
(716, 'ВАРЬИР'),
(717, '147'),
(718, 'БАНКАМ-КОНТРАГЕНТ'),
(719, 'ПОКУПК'),
(720, 'ПРОДАЖ'),
(721, 'ИНОСТРА'),
(722, 'ТЕКУЩ'),
(723, 'РЫНОЧН'),
(724, 'ОТКРЫТ'),
(725, 'БАНК-КОНТРАГЕНТ'),
(726, 'ПРОИЗВОД'),
(727, 'ПРЕДОПЛАТ'),
(728, 'ЗАКЛЮЧЕН'),
(729, 'КРЕДИТОВ'),
(730, 'АВИЗ'),
(731, 'БАНКНОТН'),
(732, 'НОВ'),
(733, 'БАНКНОТ'),
(734, 'УПАКОВК'),
(735, 'АМЕРИКАНСК'),
(736, 'БАНКА-ЭМИТЕНТ'),
(737, 'БЫВШ'),
(738, 'УПОТРЕБЛЕН'),
(739, 'УРОВЕН'),
(740, 'АККРЕДИТ'),
(741, 'УСЛОВН'),
(742, 'БАНКОМ-ЭМИТЕНТ'),
(743, 'ПЛАТЕЛЬЩИК'),
(744, 'ПРОИЗВЕСТ'),
(745, 'ПОЛЬЗ'),
(746, 'ПОЛУЧАТЕЛ'),
(747, 'ПРЕДЪЯВЛЕН'),
(748, 'СООТВЕТСТВ'),
(749, 'АККРЕДИТИВ'),
(750, 'ПОЛНОМОЧ'),
(751, 'ИСПОЛНЯ'),
(752, 'ИНКАСС'),
(753, 'ПОСРЕДСТВ'),
(754, 'ОСНОВАН'),
(755, 'ПОЛУЧА'),
(756, 'ПРИЧИТА'),
(757, 'ПОСТУП'),
(758, 'ОКАЗА'),
(759, 'ЕМ'),
(760, 'ПОСЛ'),
(761, 'ЗАЧИСЛЯ'),
(762, 'УСТАНОВЛЕН'),
(763, 'ЗАКОН'),
(764, 'ДАЮЩ'),
(765, 'ДЕРЖАТЕЛ'),
(766, 'ВЕКСЕЛЕДЕРЖАТЕЛ'),
(767, 'БЕЗУСЛОВН'),
(768, 'ТРЕБОВА'),
(769, 'УПЛАТ'),
(770, 'ОГОВОРЕН'),
(771, 'НАСТУПЛЕН'),
(772, 'НЕКОТОР'),
(773, 'ВОЗНИКА'),
(774, 'СОСТАВЛЕН'),
(775, 'ПЕРЕДАЧ'),
(776, 'ПЕРВ'),
(777, 'ПЕРЕЧЕН'),
(778, 'ПРОВОДИМ'),
(779, 'ОТВЕТСТВЕН'),
(780, 'ПРИОБРЕТЕН'),
(781, 'НОВАЦ'),
(782, 'РАЗМ'),
(783, 'ПРОВЕРК'),
(784, 'ПОДЛИН'),
(785, 'ОБЛАСТ'),
(786, 'ТОРГОВО-ЭКОНОМИЧЕСК'),
(787, 'НЕСТАНДАРТН'),
(788, 'СЛОЖН'),
(789, 'СТРУКТУРИРОВА'),
(790, 'СХЕМ'),
(791, 'ПРЕДЕЛЬН'),
(792, 'КОНКУРЕНТОСПОСОБН'),
(793, 'ТАКЖ'),
(794, 'ОБШИРН'),
(795, 'ГЕОГРАФ'),
(796, 'СНГ'),
(797, 'БАЛТ'),
(798, 'БЛИЖН'),
(799, 'ЗАРУБЕЖ'),
(800, 'ГАРАНТ'),
(801, 'ВИДОВ'),
(802, 'КОНТРГАРАНТ'),
(803, 'БАНКОВ-КОРРЕСПОНДЕНТОВ'),
(804, 'БАНКОВ-КОРРЕСПОНДЕНТ'),
(805, 'НИХ'),
(806, 'ЛИМИТОВ'),
(807, 'ЛИМИТ'),
(808, 'НАДЛЕЖА'),
(809, 'ИСПОЛНЕН'),
(810, 'КОНТРАКТОВ'),
(811, 'КОНТРАКТ'),
(812, 'ВЫПОЛНЕН'),
(813, 'ВОЗВРАТ'),
(814, 'АВАНСОВ'),
(815, 'ОРГАНОВ'),
(816, 'ОРГАН'),
(817, 'НАЛОГОВ'),
(818, 'ТЕНДЕРН'),
(819, 'КОНКУРС'),
(820, 'АКЦ'),
(821, 'ВСТРЕЧН'),
(822, 'ОБЕСПЕЧЕН'),
(823, 'СУДЕБН'),
(824, 'ИСКОВ'),
(825, 'ИСК'),
(826, 'АВИЗОВАН'),
(827, 'БЕНЕФИЦИАРОВ'),
(828, 'БЕНЕФИЦИАР'),
(829, 'ЗАВЕРК'),
(830, 'ПОДПИС'),
(831, 'ПРОСЬБ'),
(832, 'ПРЕДВАРИТЕЛЬН'),
(833, 'ПРОРАБОТК'),
(834, 'ГАРАНТИЙН'),
(835, 'РЕЗЕРВН'),
(836, 'АККРЕДИТИВОВ'),
(837, 'ПОКРЫТ'),
(838, 'БАНК-ЭМИТЕНТ'),
(839, 'КОТНРАГЕНТ'),
(840, 'РАМБУРСИР'),
(841, 'ЛОР'),
(842, 'ГАЗПРОМБАНК'),
(843, 'БЕЗОТЗЫВН'),
(844, 'РАМБУРСН'),
(845, 'БАНКАМИ-КОРРЕСПОНДЕНТ'),
(846, 'ТРАНСФЕРАЦ'),
(847, 'ПЕРЕУСТУПК'),
(848, 'ВЫРУЧК'),
(849, 'АККРЕДИТИВН'),
(850, 'ДЕПОЗИТАР'),
(851, 'УПОЛНОМОЧЕН'),
(852, 'РАЗВЕТВЛЕН'),
(853, 'ПРАКТИЧЕСК'),
(854, 'ИНСТРУМЕНТ'),
(855, 'ФОНДОВ'),
(856, 'ДЕП'),
(857, 'ВСЕХ'),
(858, 'ПА'),
(859, 'ИНСТРУМЕНТОВ'),
(860, 'ЕВРООБЛИГАЦ'),
(861, 'АДР'),
(862, 'ГДР'),
(863, 'КОНСУЛЬТИРОВАН'),
(864, 'ПЕРЕРЕГИСТРАЦ'),
(865, 'ОПРЕДЕЛЕН'),
(866, 'ЗАЛОГОВ'),
(867, 'ДЕПОНЕНТОВ'),
(868, 'ДЕПОНЕНТ'),
(869, 'ЭМИТЕНТ'),
(870, 'РЕАЛИЗАЦ'),
(871, 'ЗАКРЕПЛЕН'),
(872, 'НИМ'),
(873, 'КОНСУЛЬТАЦИОН'),
(874, 'ПОДДЕРЖК'),
(875, 'АГЕНТ'),
(876, 'ДОГОВОРОВ'),
(877, 'ЭКСПЕРТИЗ'),
(878, 'СПОСОБ'),
(879, 'ОБМ'),
(880, 'БУМАЖН'),
(881, 'ОРИГИНАЛЬН'),
(882, 'ПЕЧАТ'),
(883, 'ЗАЧИСЛЕН'),
(884, 'ВЫПИСОК'),
(885, 'ОРИГИНА'),
(886, 'РЕЗИДЕНТОВ'),
(887, 'РЕЗИДЕНТ'),
(888, 'НЕРЕЗИДЕНТОВ'),
(889, 'НЕРЕЗИДЕНТ'),
(890, '400'),
(891, '1600'),
(892, 'ВНЕСЕН'),
(893, 'ИЗМЕНЕН'),
(894, 'АНКЕТ'),
(895, 'АБОНЕНТСК'),
(896, 'НАХОДЯ'),
(897, 'ДВИЖЕН'),
(898, 'ФОРМИРОВАН'),
(899, 'ВЫПИСК'),
(900, 'СОСТОЯН'),
(901, 'ЗАПРОС'),
(902, 'СПИСАН'),
(903, 'БЕЗДОКУМЕНТАРН'),
(904, '580'),
(905, 'ПЕРЕВОД'),
(906, 'ВНУТР'),
(907, 'ИНИЦИАТОР'),
(908, 'БЛОКИРОВК'),
(909, 'РАЗБЛОКИРОВК'),
(910, 'РЕГИСТРАЦ'),
(911, '870'),
(912, 'ЗАКЛАД'),
(913, 'ВЗИМАН'),
(914, 'ТАРИФОВ'),
(915, 'НАЛОГ'),
(916, 'ДОБАВЛЕН'),
(917, 'СТОИМОСТ'),
(918, 'ИСКЛЮЧЕН'),
(919, 'РЕЕСТРОДЕРЖАТЕЛ'),
(920, 'ДОСТАВК'),
(921, 'ЦЕННОСТ'),
(922, 'ВОСПОЛЬЗОВА'),
(923, 'СЛУЖБ'),
(924, 'ОБЕСПЕЧ'),
(925, 'СПЕЦИАЛЬН'),
(926, 'ОБОРУДОВА'),
(927, 'СОГЛАСОВА'),
(928, 'ГРАФИК'),
(929, 'СОПРОВОЖДЕН'),
(930, 'МАРШРУТ'),
(931, 'РАЗМЕН'),
(932, 'МОНЕТ'),
(933, 'СПЕЦИАЛИЗИРОВА'),
(934, 'ДОКУМЕНТАЦ'),
(935, 'СБОР'),
(936, 'ОКАЗАН'),
(937, 'ОБЪ'),
(938, 'ИНКАССИРУЕМ'),
(939, 'КОЛИЧЕСТВ'),
(940, 'ВЫЕЗДОВ'),
(941, 'ФИКСИРОВА'),
(942, '45'),
(943, '120'),
(944, 'ЗАЕЗД'),
(945, '2500'),
(946, '35'),
(947, '140'),
(948, '3500'),
(949, '-0'),
(950, '160'),
(951, '4500'),
(952, '180'),
(953, '5000'),
(954, '200'),
(955, '6000'),
(956, '220'),
(957, '7000'),
(958, '240'),
(959, '8000'),
(960, '05'),
(961, '260'),
(962, '9000'),
(963, '5-10'),
(964, 'ТОЧЕК'),
(965, 'ПЛЮС'),
(966, 'НОЧН'),
(967, '22'),
(968, '00'),
(969, 'УТРЕН'),
(970, '1О'),
(971, 'ПОЛОВИН'),
(972, 'СДАЮТ'),
(973, 'НЕСКОЛЬК'),
(974, 'РАСХОДН'),
(975, 'МАТЕРИА'),
(976, 'ПРАЗДНИЧН'),
(977, 'ВЫХОДН'),
(978, 'ЗАГРУЗК'),
(979, 'ПОДКРЕПЛЕН'),
(980, 'ОФИСОВ'),
(981, '350'),
(982, 'ЧАС'),
(983, 'СОГЛАШЕН'),
(984, 'ПОЛНОФУНКЦИОНАЛЬН'),
(985, 'ДИСТАНЦИОН'),
(986, 'РЕЖИМ'),
(987, 'РЕАЛЬН'),
(988, 'ВРЕМЕН'),
(989, 'ПОНЯТН'),
(990, 'ИНТЕРФЕЙС'),
(991, 'ОБУЧЕН'),
(992, 'СНАБЖ'),
(993, 'ПОДСКАЗК'),
(994, 'КОМПЬЮТЕР'),
(995, 'ЗЕМН'),
(996, 'ШАР'),
(997, 'ВВОД'),
(998, 'РЕДАКТИРОВА'),
(999, 'ПЕЧАТА'),
(1000, 'ПОДПИСЫВА'),
(1001, 'ПЕРСОНИФИЦИРОВА'),
(1002, 'ЭЛЕКТРОННОЙ-ЦИФРОВ'),
(1003, 'НАПРАВЛЯ'),
(1004, 'ВИЗИРОВА'),
(1005, 'ПРИЛОЖЕН'),
(1006, 'КУРС'),
(1007, 'РЕЗЕРВИРОВА'),
(1008, 'ОТСЛЕЖИВА'),
(1009, 'АКТУАЛЬН'),
(1010, 'КОНТРАГЕНТОВ'),
(1011, 'КОНТРАГЕНТ'),
(1012, 'ПОСТУПЛЕН'),
(1013, 'БУХГАЛТЕРСК'),
(1014, 'ПОДКЛЮЧЕН'),
(1015, 'ГЕНЕРАЦ'),
(1016, 'КЛЮЧ'),
(1017, 'ЭЛЕКТРОННО-ЦИФРОВ'),
(1018, 'ТЕХНИЧЕСК'),
(1019, 'ПОЛНОЦЕН'),
(1020, 'НЕОБХОД'),
(1021, 'ОС'),
(1022, 'WINDOW'),
(1023, 'НИЖ'),
(1024, '2000'),
(1025, 'ПРОСМОТР'),
(1026, 'ИНТЕРНЕТ-СТРАНИЦ'),
(1027, 'INTERNET'),
(1028, 'EXPLOR'),
(1029, 'ВЕРС'),
(1030, 'JAVA'),
(1031, 'RUNTIM'),
(1032, 'ENVIRON'),
(1033, 'JRE'),
(1034, 'VERSION'),
(1035, 'РАСПРОСТРАНЕН'),
(1036, 'БОЛЬШИНСТВ'),
(1037, 'ФЕДЕРАЦ'),
(1038, 'КАССОВ'),
(1039, 'УСКОРЕН'),
(1040, 'МЕЖРЕГИОНАЛЬН'),
(1041, 'КРАТЧАЙШ'),
(1042, 'РАСПОРЯЖЕН'),
(1043, 'ОПЕРАЦИОН'),
(1044, 'УСТАНОВЛ'),
(1045, 'ЕЖЕДНЕВН'),
(1046, '09'),
(1047, 'ПЯТНИЦ'),
(1048, 'ПРЕДПРАЗДНИЧН'),
(1049, 'ДНИ'),
(1050, 'ДОГОВОРН'),
(1051, 'ФАКТ'),
(1052, 'УТВЕРЖДЕН'),
(1053, 'УЧАСТНИКОВ'),
(1054, 'УЧАСТНИК'),
(1055, 'СЕГОДНЯШН'),
(1056, 'ПРЕДСТАВЛЕН'),
(1057, 'ФОРМИР'),
(1058, '490'),
(1059, 'ФИЛИАЛОВ'),
(1060, 'ФИЛИАЛ'),
(1061, '70'),
(1062, 'ПРАКТИК'),
(1063, 'ЗАНИМА'),
(1064, '7-Е'),
(1065, 'АКТИВОВ'),
(1066, 'АКТИВ'),
(1067, 'РЕЗУЛЬТАТ'),
(1068, '2009'),
(1069, '5-М'),
(1070, 'ДЕПОЗИТОВ'),
(1071, '4-М'),
(1072, 'ИНВЕСТИЦИОН'),
(1073, 'ИПОТЕЧН'),
(1074, 'АВТОКРЕДИТОВАН'),
(1075, 'СРОЧН'),
(1076, 'СЕЙФОВ'),
(1077, 'ЯЧЕЕК'),
(1078, 'КРУГЛОСУТОЧН'),
(1079, 'ТЕЛЕКОММУНИКАЦИОН'),
(1080, 'РУКОВОДСТВУ'),
(1081, 'СПРАВЕДЛИВ'),
(1082, 'ПРОЗРАЧН'),
(1083, 'УВАЖЕН'),
(1084, 'СВОБОД'),
(1085, 'ДОВЕР'),
(1086, 'ЗАДАЧ'),
(1087, 'ПОДДЕРЖАН'),
(1088, 'СОВЕРШЕНСТВОВАН'),
(1089, 'КУЛЬТУРНО-ПРОСВЕТИТЕЛЬСК'),
(1090, 'НАЦИОНАЛЬН'),
(1091, 'СОДЕЙСТВ'),
(1092, 'ПОСЕТ'),
(1093, 'МНОГ'),
(1094, 'ВСЕМИРН'),
(1095, 'ИЗВЕСТН'),
(1096, 'МУЗЫКАНТ'),
(1097, 'ПРОХОД'),
(1098, 'ТЕАТРАЛЬН'),
(1099, 'ФЕСТИВА'),
(1100, 'КОНЦЕРТ'),
(1101, 'МНОГОЧИСЛЕН'),
(1102, 'ВЫСТАВК'),
(1103, 'МИСС'),
(1104, 'СЛЕДУ'),
(1105, 'МИРОВ'),
(1106, 'СТАНДАРТ'),
(1107, 'ПРИНЦИП'),
(1108, 'ЭТИК'),
(1109, 'ВЫСОКОТЕХНОЛОГИЧН'),
(1110, 'СОЧЕТА'),
(1111, 'ЛУЧШ'),
(1112, 'ТРАДИЦ'),
(1113, 'СООБЩЕСТВ'),
(1114, 'ПРЕДПРИНИМАТЕЛЬСТВ'),
(1115, 'КОМПЛЕКС'),
(1116, 'ПРОДУКТОВ'),
(1117, 'ДОСТИЖЕН'),
(1118, 'ИННОВАЦ'),
(1119, 'СИТУАЦ'),
(1120, 'ПРОБЛЕМАТИК'),
(1121, 'ФИЛОСОФ'),
(1122, 'ПАРТНЕРСТВ'),
(1123, 'ВЗАИМОДЕЙСТВ'),
(1124, 'ОТРАСЛЕВ'),
(1125, 'ПОТРЕБН'),
(1126, 'ФИЛИАЛЬН'),
(1127, 'ВСЕГД'),
(1128, 'ВЕЗД'),
(1129, 'УРОВН'),
(1130, 'СТАНДАРТОВ'),
(1131, 'ПАРТНЕР'),
(1132, 'СОЦИАЛЬНО-ЭКОНОМИЧЕСК'),
(1133, 'РЕГИОНАЛЬН'),
(1134, 'ОПИРА'),
(1135, 'ВЫСОЧАЙШ'),
(1136, 'ТЩАТЕЛЬН'),
(1137, 'АНАЛИЗ'),
(1138, 'ПРЕДЛАГ'),
(1139, 'АДРЕСН'),
(1140, 'СОБЛЮД'),
(1141, 'КОНФИДЕНЦИАЛЬН'),
(1142, 'ПРОЯВЛЯ'),
(1143, 'РОЗНИЧН'),
(1144, 'ВНЕДР'),
(1145, 'ПЕРЕДОВ'),
(1146, 'ГАРАНТИР'),
(1147, 'ЧЕСТН'),
(1148, 'КО'),
(1149, 'СТРЕМ'),
(1150, 'ПРИМЕР'),
(1151, 'СОТРУДНИЧА'),
(1152, 'СОЦИАЛЬН'),
(1153, 'ВНОС'),
(1154, 'ПОВЫШЕН'),
(1155, 'БЛАГОСОСТОЯН'),
(1156, 'ПРЕДОСТАВЛ'),
(1157, 'ПЕРВОКЛАССН'),
(1158, 'ЭКОНОМИЧЕСК'),
(1159, 'РЕАЛИЗУ'),
(1160, 'ЭКОЛОГИЧЕСК'),
(1161, 'ОБРАЗОВАТЕЛЬН'),
(1162, 'КУЛЬТУРН'),
(1163, 'БЛАГОТВОРИТЕЛЬН'),
(1164, 'НЕЗАЩИЩЕН'),
(1165, 'СЛО'),
(1166, 'УЧРЕЖДЕН'),
(1167, 'МЕДИЦИН'),
(1168, 'ОБРАЗОВАН'),
(1169, 'КУЛЬТУР'),
(1170, 'СПОРТИВН'),
(1171, 'РЕЛИГИОЗН'),
(1172, 'БЛАГ'),
(1173, 'CТРАН'),
(1174, 'ЖИТЕЛ'),
(1175, 'РУКОВОДСТВ'),
(1176, 'КОЛЛЕГИАЛЬН'),
(1177, 'ИСПОЛНИТЕЛЬН'),
(1178, 'ОРГА'),
(1179, 'ПРАВЛЕН'),
(1180, 'ДОЛЖНОСТ'),
(1181, 'ПЛЕШКОВ'),
(1182, 'ПЛЕШК'),
(1183, 'ЮР'),
(1184, 'ГРИГОРЬЕВИЧ'),
(1185, 'НАЧАЛЬНИК'),
(1186, '1996'),
(1187, 'ОКОНЧ'),
(1188, 'ИРКУТСК'),
(1189, 'АКАДЕМ'),
(1190, 'СМИРНОВ'),
(1191, 'СМИРН'),
(1192, 'ВЯЧЕСЛА'),
(1193, 'ЕВГЕНЬЕВИЧ'),
(1194, 'ЗАМЕСТИТЕЛ'),
(1195, 'ПРЕДСЕДАТЕЛ'),
(1196, '1991'),
(1197, 'УНИВЕРСИТЕТ'),
(1198, 'ДРУЖБ'),
(1199, 'НАРОДОВ'),
(1200, 'НАРОД'),
(1201, 'СТЕПЕН'),
(1202, 'MBA'),
(1203, 'БИЗНЕС-ШКОЛ'),
(1204, 'INSEAD'),
(1205, 'КОРНЕВ'),
(1206, 'КОРН'),
(1207, 'ИРИН'),
(1208, 'СТАНИСЛАВОВН'),
(1209, 'МОСКОВСК'),
(1210, 'ДЕЛ'),
(1211, 'ИГНАТЬЕВ'),
(1212, 'ИГНАТ'),
(1213, 'ВАД'),
(1214, 'МИХАЙЛОВИЧ'),
(1215, '1988'),
(1216, 'ПРОИЗВОДСТВ'),
(1217, 'ВОЛОШИН'),
(1218, 'СТАНИСЛА'),
(1219, 'СЕМЕНОВИЧ'),
(1220, '1986'),
(1221, 'СВЕРДЛОВСК'),
(1222, 'ПРАВОВЕДЕН'),
(1223, 'ИНДУСТРИАЛЬН'),
(1224, 'СПИСОК'),
(1225, 'СОВЕТ'),
(1226, 'ДИРЕКТОРОВ'),
(1227, 'ДИРЕКТОР'),
(1228, 'МИХАЙЛОВ'),
(1229, 'МИХАЙЛ'),
(1230, 'ТАТЬЯ'),
(1231, 'ВАСИЛЬЕВН'),
(1232, 'ПЛЕХАНОВ'),
(1233, 'ПЛЕХАН'),
(1234, 'ЛЯХ'),
(1235, 'ЕВГЕН'),
(1236, 'ВИКТОРОВИЧ'),
(1237, '1993'),
(1238, 'МВА'),
(1239, 'МЕНЕДЖМЕНТ'),
(1240, 'КОНДРУСЕВ'),
(1241, 'КОНДРУС'),
(1242, 'РОМА'),
(1243, 'АЛЕКСАНДРОВИЧ'),
(1244, 'КАЗНАЧЕЙСТВ'),
(1245, 'КЕМЕРОВСК'),
(1246, 'ХРАМОВ'),
(1247, 'ХРАМ'),
(1248, 'АНАТОЛ'),
(1249, 'ФЕДОРОВИЧ'),
(1250, 'ПЕРСОНАЛ'),
(1251, 'СПЕЦИАЛИЗАЦ'),
(1252, 'ПРОШЕЛ'),
(1253, 'КВАЛИФИКАЦ'),
(1254, 'ЧЕЛОВЕЧЕСК'),
(1255, 'РЕСУРС'),
(1256, 'ЖУРАВЛЕВ'),
(1257, 'ЖУРАВЛ'),
(1258, 'ОЛЬГ'),
(1259, 'НИКОЛАЕВН'),
(1260, 'БУХГАЛТЕР'),
(1261, '1985'),
(1262, 'САНКТ-ПЕТЕРБУРГСК'),
(1263, 'НАРОДН'),
(1264, 'ХОЗЯЙСТВ'),
(1265, 'КАЛИНИН'),
(1266, 'АНДР'),
(1267, 'ГЕННАДЬЕВИЧ'),
(1268, 'ДЕПАРТАМЕНТ'),
(1269, '1998'),
(1270, 'ЗАКОНЧ'),
(1271, 'ШКОЛ'),
(1272, 'АНТВЕРП'),
(1273, 'UAM'),
(1274, 'ВАКАНС'),
(1275, 'ИСТОР'),
(1276, 'ОСНОВА'),
(1277, 'ЯНВАР'),
(1278, 'НЕБОЛЬШ'),
(1279, 'ОТКРЫВА'),
(1280, 'НАСЕЛЕН'),
(1281, 'ПРИСТУПА'),
(1282, 'НАЧИНА'),
(1283, 'ВЫНЕСТ'),
(1284, 'ПРИВЫЧН'),
(1285, 'ЗАЛОВ'),
(1286, 'ЗАЛ'),
(1287, 'ФАКТИЧЕСК'),
(1288, 'ВОСТРЕБОВАН'),
(1289, 'ЛИЦЕНЗ'),
(1290, 'ОТНОС'),
(1291, 'КРИТЕР'),
(1292, 'ЦБ'),
(1293, 'КАТЕГОР'),
(1294, '1999'),
(1295, 'ПРЕОДОЛЕВ'),
(1296, 'ПРЕОДОЛ'),
(1297, 'КРИЗИС'),
(1298, 'ПРОДОЛЖА'),
(1299, 'МУНИЦИПАЛЬН'),
(1300, 'СЛУЖА'),
(1301, '2004ГОД'),
(1302, 'INTERN'),
(1303, '2004'),
(1304, 'ПРЕДСТАВ'),
(1305, 'РЯД'),
(1306, 'ИНТЕРНЕТ-КРЕДИТОВАН'),
(1307, 'АВТОМОБИЛ'),
(1308, 'ВУЗ'),
(1309, 'ОТД'),
(1310, 'ТУРИЗМ'),
(1311, '2006'),
(1312, 'ДЕСЯ'),
(1313, 'НАЧА'),
(1314, 'ВЗЯЛ'),
(1315, 'ЧЕЛОВЕК'),
(1316, 'СДЕЛА'),
(1317, 'СТАЛ'),
(1318, '2007'),
(1319, 'ВСЕРОССИЙСК'),
(1320, 'ПРЕМ'),
(1321, 'ОЛИМП'),
(1322, '2008'),
(1323, 'ЗОЛОТ'),
(1324, 'МЕДАЛ'),
(1325, 'ЕВРОПЕЙСК'),
(1326, 'МАРКЕТИНГ'),
(1327, 'АССОЦИАЦ'),
(1328, 'ПРОДУКЦ'),
(1329, 'СТАНОВ'),
(1330, 'ЛАУРЕАТ'),
(1331, 'НАГРАД'),
(1332, 'ПЕРЕХОД'),
(1333, 'АВТОМАТИЗИРОВА'),
(1334, 'IBANK'),
(1335, 'SYSTEM'),
(1336, 'МКТ'),
(1337, '2010'),
(1338, 'ЗАВЕРША'),
(1339, 'ПОЛОЖИТЕЛЬН'),
(1340, 'ПРИБ'),
(1341, '95'),
(1342, '149'),
(1343, 'ТЫС'),
(1344, 'ДИНАМИК'),
(1345, 'РОСТ'),
(1346, 'ПОКАЗЫВА'),
(1347, 'ПОКАЗАТЕЛ'),
(1348, 'УСТАВН'),
(1349, 'УВЕЛИЧИВА'),
(1350, '415'),
(1351, 'ТЫСЯЧ'),
(1352, '535'),
(1353, '522'),
(1354, '31'),
(1355, 'РЕЗЕРВ'),
(1356, 'ПОТЕР'),
(1357, 'ССУД'),
(1358, 'ПРИРАВНЕН'),
(1359, 'ФЕВРАЛ'),
(1360, '650'),
(1361, 'СВЯЗЫВА'),
(1362, 'НАРАЩИВАН'),
(1363, 'ВНЕДРЕН'),
(1364, 'БанЪ'),
(1365, 'ЯереннсШт'),
(1366, 'Хатс'),
(1367, 'встсЯленШя'),
(1368, 'в'),
(1369, 'ХействШе'),
(1370, 'тарШфнв'),
(1371, 'на'),
(1372, 'сслсвШ'),
(1373, 'Шннстранннй'),
(1374, 'валюте'),
(1375, 'УважаеУые'),
(1376, 'ЪлШенты'),
(1377, 'сннбщаеУ'),
(1378, 'ВаУ'),
(1379, 'чтн'),
(1380, 'Хля'),
(1381, 'юрШХШчесЪШх'),
(1382, 'лШц'),
(1383, 'Ш'),
(1384, 'ШнХШвШХсальных'),
(1385, 'ЯреХЯрШнШУателей'),
(1386, 'В'),
(1387, 'связШ'),
(1388, 'с'),
(1389, 'этШУ'),
(1390, 'Хн'),
(1391, 'Хаты'),
(1392, 'ввеХенШя'),
(1393, 'ннвнй'),
(1394, 'реХаЪцШШ'),
(1395, 'юрШХШчесЪШУ'),
(1396, 'лШцаУ'),
(1397, 'ШнХШвШХсальныУ'),
(1398, 'ЯреХЯрШнШУателя'),
(1399, 'бсХст'),
(1400, 'нЪазываться'),
(1401, 'раУЪах'),
(1402, 'ХействсющШх'),
(1403, 'ИнфнрУацШя'),
(1404, 'н'),
(1405, 'Хате'),
(1406, 'бсХет'),
(1407, 'сннбщена'),
(1408, 'ХнЯнлнШтельнн'),
(1409, 'ачать'),
(1410, 'рабнтать'),
(1411, 'сШстеУнй'),
(1412, 'Интернет-'),
(1413, 'лШент'),
(1414, 'сталн'),
(1415, 'еще'),
(1416, 'Ярнще'),
(1417, 'аш'),
(1418, 'ЯреХлавает'),
(1419, 'свнШУ'),
(1420, 'ЪлШентаУ'),
(1421, 'астер'),
(1422, 'УстаннвЪШ'),
(1423, 'Ънтнрый'),
(1424, 'ссщественнн'),
(1425, 'сЯрнстШт'),
(1426, 'началн'),
(1427, 'рабнты'),
(1428, 'СеЯерь'),
(1429, 'Хнстатнчнн'),
(1430, 'сЪачать'),
(1431, 'заЯсстШть'),
(1432, 'все'),
(1433, 'настрнйЪШ'),
(1434, 'ЯрнШзвеХены'),
(1435, 'автнУатШчесЪШ'),
(1436, 'бнльше'),
(1437, 'не'),
(1438, 'нсжнн'),
(1439, 'тратШть'),
(1440, 'вреУя'),
(1441, 'ШзсченШе'),
(1442, 'нбъеУных'),
(1443, 'ШнстрсЪцШй'),
(1444, 'ШлШ'),
(1445, 'звннШть'),
(1446, 'слсжбс'),
(1447, 'техЯнХХержЪШ'),
(1448, 'чтнбы'),
(1449, 'начать'),
(1450, 'РенрванШзацШя'),
(1451, 'сетШ'),
(1452, 'нтХеленШй'),
(1453, 'БанЪа'),
(1454, 'блШжайшее'),
(1455, 'значШтельнн'),
(1456, 'расшШрен'),
(1457, 'ЯрнХсЪтнвый'),
(1458, 'ряХ'),
(1459, 'Яеречень'),
(1460, 'ЯреХнставляеУых'),
(1461, 'банЪнвсЪШх'),
(1462, 'сслсв'),
(1463, 'Ънтнрые'),
(1464, 'сУнжет'),
(1465, 'ЯреХлавать'),
(1466, 'вн'),
(1467, 'всех'),
(1468, 'свнШх'),
(1469, 'ХнЯнлнШтельных'),
(1470, 'нфШсах'),
(1471, 'нашШ'),
(1472, 'сУнвст'),
(1473, 'ЯнлсчШть'),
(1474, 'Янлный'),
(1475, 'любнУ'),
(1476, 'Шз'),
(1477, 'Былн'),
(1478, 'ЯрнвеХенн'),
(1479, 'ЪнУЯлеЪснне'),
(1480, 'всестнрнннее'),
(1481, 'ШсслеХнванШе'),
(1482, 'фснЪцШннШрнванШя'),
(1483, 'ревШннальных'),
(1484, 'нфШснв'),
(1485, 'ЯреХУет'),
(1486, 'сннтветствШя'),
(1487, 'внзрнсшШУ'),
(1488, 'требнванШяУ'),
(1489, 'резсльтате'),
(1490, 'ЯрШнятн'),
(1491, 'решенШе'),
(1492, 'вреУеннн'),
(1493, 'заЪрытШШ'),
(1494, 'сннтветствсющШх'),
(1495, 'выснЪШУ'),
(1496, 'станХартаУ'),
(1497, 'ЯрШсЯнснбленных'),
(1498, 'Ъ'),
(1499, 'растсщевн'),
(1500, 'бШзнеса'),
(1501, 'фШсы'),
(1502, 'ЯнстеЯеннн'),
(1503, 'нтреУннтШрнваны'),
(1504, 'ЯеренбнрсХнваны'),
(1505, 'станст'),
(1506, 'снвреУенныУШ'),
(1507, 'сХнбныУШ'),
(1508, 'рШннсШУ'),
(1509, 'свнШ'),
(1510, 'ШзвШненШя'),
(1511, 'за'),
(1512, 'Хнставленные'),
(1513, 'несХнбства'),
(1514, 'ЪнУЯанШШ'),
(1515, 'TEXT'),
(1516, 'HERE'),
(1517, 'БренХы'),
(1518, 'нЪсЯателя'),
(1519, 'нвнстШ'),
(1520, 'арьера'),
(1521, 'ннтаЪты'),
(1522, 'ФранчайзШнв'),
(1523, 'Ятнвые'),
(1524, 'ЯрнХажШ'),
(1525, 'авазШны'),
(1526, 'JAMILCO'),
(1527, 'РасЯрнХажа'),
(1528, 'TIMBERLAND1'),
(1529, 'PREVIEW1'),
(1530, 'ЧЕРН'),
(1531, 'МОД'),
(1532, 'PREVIEW2'),
(1533, 'КОЛЛЕКЦ'),
(1534, 'SPORT'),
(1535, 'JUICI'),
(1536, 'COUTURE3'),
(1537, 'ИЗДЕЛ'),
(1538, 'ПОДАР'),
(1539, 'ИЗЯЩН'),
(1540, 'БИЖУТЕР'),
(1541, 'ЯРК'),
(1542, 'ЛАК'),
(1543, 'НОГТ'),
(1544, '4-Х'),
(1545, 'ЧЕХОЛ'),
(1546, 'СМАРТФОН'),
(1547, 'СКИДК'),
(1548, 'NAF'),
(1549, 'NAF4'),
(1550, 'PREVIEW4'),
(1551, 'YVES'),
(1552, 'SALOMON'),
(1553, 'БРЕНД'),
(1554, 'БАХТИН'),
(1555, 'ПОНИМА'),
(1556, 'ТОТ'),
(1557, 'СТИХОТВОРЕН'),
(1558, 'ПОСЛЕДОВАТЕЛЬН'),
(1559, 'ЛИРИК'),
(1560, 'ПАРАЛЛЕЛЬН'),
(1561, 'СИЛЛАБО-ТОНИК'),
(1562, 'ЖИЗНЕН'),
(1563, 'ВЫБИРА'),
(1564, 'ДИСКУРС'),
(1565, 'АБСТРАКЦИОНИЗМ'),
(1566, 'ФОРМАЛЬН'),
(1567, 'ПРИЗНАКОВ'),
(1568, 'ПРИЗНАК'),
(1569, 'ПОЭЗ'),
(1570, 'ДИАЛОГИЧЕСК'),
(1571, 'КОНТЕКСТ'),
(1572, 'ВЫСТРО'),
(1573, 'ИНВЕРС'),
(1574, 'ДЕРЖАВИН'),
(1575, 'ПОЗНАН'),
(1576, 'ТЕКСТ'),
(1577, 'АЛЛИТЕРИР'),
(1578, 'ГОЛОС'),
(1579, 'ПЕРСОНАЖ'),
(1580, 'ПОНИМАН'),
(1581, 'СИНТАГМ'),
(1582, 'ВОСХОД'),
(1583, 'ДЕ'),
(1584, 'СОССЮР'),
(1585, 'ПАЛИМПСЕСТ'),
(1586, 'НИВЕЛИР'),
(1587, 'ЛИРИЧЕСК'),
(1588, 'ТЕМ'),
(1589, 'УЗУС'),
(1590, 'НИКАК'),
(1591, 'ПРЕДПОЛАГА'),
(1592, 'ЗДЕ'),
(1593, 'РОДИТЕЛЬН'),
(1594, 'ПАДЕЖ'),
(1595, 'НЕПОСРЕДСТВЕН'),
(1596, 'ПРИВОД'),
(1597, 'ЭКЗИСТЕНЦИАЛЬН'),
(1598, 'ОРНАМЕНТАЛЬН'),
(1599, 'СКАЗ'),
(1600, 'СИМВОЛ'),
(1601, 'ОСОЗНА'),
(1602, 'СЛОВЕСН'),
(1603, 'ЦИКЛ'),
(1604, 'ЛОЖН'),
(1605, 'ЦИТАТ'),
(1606, 'КОМБИНАТОРН'),
(1607, 'ПРИРАЩЕН'),
(1608, 'АБСУРДН'),
(1609, 'РИТМИЧЕСК'),
(1610, 'РИСУНОК'),
(1611, 'АБСТРАКТН'),
(1612, 'ВЫСКАЗЫВАН'),
(1613, 'ПРОСВЕТЛЯ'),
(1614, 'ЛИТЕРАТУРН'),
(1615, 'СИМУЛЯКР'),
(1616, 'ОСНОВЫВ'),
(1617, 'ПАРАДОКСАЛЬН'),
(1618, 'СОВМЕЩЕН'),
(1619, 'ИСКЛЮЧА'),
(1620, 'ПРИНЦИПОВ'),
(1621, 'ХАРАКТЕРН'),
(1622, 'ПОЭТИЧН'),
(1623, 'ПОТЕНЦИАЛЬН'),
(1624, 'КАТАХРЕЗ'),
(1625, 'УЛОВ'),
(1626, 'ХОРЕИЧЕСК'),
(1627, 'РИТМ'),
(1628, 'АЛЛИТЕРАЦ'),
(1629, 'НАБЛЮДАЕМ'),
(1630, 'НЕСМОТР'),
(1631, 'ВНЕШН'),
(1632, 'ВОЗДЕЙСТВ'),
(1633, 'НЕУСТОЙЧ'),
(1634, 'МИФОПОРОЖДА'),
(1635, 'ТЕКСТОВ'),
(1636, 'УСТРОЙСТВ'),
(1637, 'ОТРАЖА'),
(1638, 'СТРОФОИД'),
(1639, 'DKNI'),
(1640, 'ПОЛИФОНИЧЕСК'),
(1641, 'ПАРАЛЛЕЛИЗМОВ'),
(1642, 'ПАРАЛЛЕЛИЗМ'),
(1643, 'ПОВТОРОВ'),
(1644, 'ПОВТОР'),
(1645, 'ЯЗЫКОВ'),
(1646, 'ДИССОНИР'),
(1647, 'МЕЛОДИЧЕСК'),
(1648, 'РЕЧЕВ'),
(1649, 'АКТ'),
(1650, 'ПРЕКРАСН'),
(1651, 'СЮЖЕТН'),
(1652, 'ПРОЧИТЫВАН'),
(1653, 'СОДЕРЖАН'),
(1654, 'ПРИВЕДЕН'),
(1655, 'ОТРЫВК'),
(1656, 'ИНАЧ'),
(1657, 'ПОКАЗАТЕЛЬН'),
(1658, 'МИФОПОЭТИЧЕСК'),
(1659, 'ХРОНОТОП'),
(1660, 'ДИССОНАНСН'),
(1661, 'КАЗА'),
(1662, 'ВОЛНООБРАЗН'),
(1663, 'ЛИЦЕМЕРН'),
(1664, 'МОРАЛ'),
(1665, 'ТОЧН'),
(1666, 'ИНТЕГРИР'),
(1667, 'АВТОР'),
(1668, 'ПОЛНОВЛАСТН'),
(1669, 'ХОЗЯИН'),
(1670, 'МАРИОНЕТК'),
(1671, 'ПАРАДИГМ'),
(1672, 'МЕТАФОР'),
(1673, 'СОПРИКОСНУВШ'),
(1674, 'ЧЕМ-Т'),
(1675, 'АНТАГОНИСТ'),
(1676, 'ПОСТСТРУКТУРН'),
(1677, 'ПОЭТИК'),
(1678, 'БЫЛИН'),
(1679, 'ПОДТЕКСТ'),
(1680, 'РАЗВИВ'),
(1681, 'ЛЕКСИК'),
(1682, 'ОТКРОВЕН'),
(1683, 'ОДИННАДЦАТИСЛОЖНИК'),
(1684, 'НЕОДНОРОД'),
(1685, 'СОСТАВ'),
(1686, 'ПАРАФРАЗ'),
(1687, 'ХОЛОДН'),
(1688, 'ЦИНИЗМ'),
(1689, 'JAEGER'),
(1690, 'РАСПОЛОЖЕН'),
(1691, 'МНОГОПЛАНОВ'),
(1692, 'ДЕСТРУКТИВН'),
(1693, 'СТИХ'),
(1694, 'МАТРИЦ'),
(1695, 'УЧИТЫВ'),
(1696, 'СЛОГОВ'),
(1697, 'СЛОГ'),
(1698, 'СТОЯ'),
(1699, 'МЕЖД'),
(1700, 'УДАРЕН'),
(1701, 'СОЧЛЕНЕН'),
(1702, 'ЛЕКСИКО-СЕМАНТИЧЕСК'),
(1703, 'ПСИХОЛИНГВИСТИЧЕСК'),
(1704, 'БЫЛИЧК'),
(1705, 'ДАЕТ'),
(1706, 'ПАСТИШ'),
(1707, 'НАРЯД'),
(1708, 'НЕЙТРАЛЬН'),
(1709, 'ГЕНЕРАТИВН'),
(1710, 'АМФИБРАХ'),
(1711, 'КОМПОЗИЦИОННО-РЕЧЕВ'),
(1712, 'СУЩЕСТВЕН'),
(1713, 'ДИАЛЕКТИЧЕСК'),
(1714, 'ХАРАКТЕР'),
(1715, 'ДЕЙСТВИТЕЛЬН'),
(1716, 'УСЕЧЕН'),
(1717, 'СТОП'),
(1718, 'КОНСТРУКТИВН'),
(1719, 'СКРЫТ'),
(1720, 'СМЫСЛ'),
(1721, 'ПРОЧН'),
(1722, 'АННИГИЛИР'),
(1723, 'МЕТАФОРИЧН'),
(1724, 'ГЕКЗАМЕТР'),
(1725, 'ОБЫЧН'),
(1726, 'ЛИТЕРАТУР'),
(1727, 'ПЕРЕНЕСЕН'),
(1728, 'СЕТЕРАТУР'),
(1729, 'ЖАНР'),
(1730, 'ОДНАК'),
(1731, 'ЭВОКАЦ'),
(1732, 'СЧИТА'),
(1733, 'ГАЛЬПЕРИН'),
(1734, 'СЕМАНТИЧЕСК'),
(1735, 'ВЕРЛИБР'),
(1736, 'МЕТАЯЗЫК'),
(1737, 'ПРОЗ'),
(1738, 'РАССКАЗЫВА'),
(1739, 'ПОТОК'),
(1740, 'СОЗНАН'),
(1741, 'СОГЛАС'),
(1742, 'ЗЕМЛЯКОВСК'),
(1743, 'РУМЫНСК'),
(1744, 'ИССЛЕДОВАТЕЛ'),
(1745, 'АЛЬБЕРТ'),
(1746, 'КОВАЧ'),
(1747, 'ГЕНЕЗИС'),
(1748, 'СУЩЕСТВ'),
(1749, 'ОРФОГРАФИЧЕСК'),
(1750, 'СИМВОЛИК'),
(1751, 'ПРИСПОСОБЛ'),
(1752, 'ПИСЬМЕН'),
(1753, 'ВОСПРОИЗВЕДЕН'),
(1754, 'СМЫСЛОВ'),
(1755, 'НЮАНСОВ'),
(1756, 'НЮАНС'),
(1757, 'УСТН'),
(1758, 'РЕЧ'),
(1759, 'СТЕРЕОТИП'),
(1760, 'ESCADA'),
(1761, 'РАЗВ'),
(1762, 'СЕЗОН'),
(1763, 'ЮБОК'),
(1764, 'КОНЧ'),
(1765, 'ПОР'),
(1766, 'УЗНА'),
(1767, 'ЮБК'),
(1768, 'БУДУТ'),
(1769, 'ОСЕН'),
(1770, 'АКЦЕНТ'),
(1771, 'ЯМБ'),
(1772, 'ЗАМЕТ'),
(1773, 'ОБЪЕДИН'),
(1774, 'ВОКРУГ'),
(1775, 'ФИЛОСОФСК'),
(1776, 'СТЕРЖН'),
(1777, 'НЕСОБСТВЕННО-ПРЯМ'),
(1778, 'СЛОВ'),
(1779, 'АНЖАМБЕМА'),
(1780, 'ПРОСТРАНСТВ'),
(1781, 'НЕЛЬЗ'),
(1782, 'ВОССТАНОВ'),
(1783, 'ИСТИН'),
(1784, 'ХРОНОЛОГИЧЕСК'),
(1785, 'СОБЫТ'),
(1786, 'РЕДУЦИР'),
(1787, 'ПРОЗАИЧЕСК'),
(1788, 'ПРИДВИГА'),
(1789, 'МОДАЛЬН'),
(1790, 'ТОГ'),
(1791, 'СФОРМУЛИРОВА'),
(1792, 'РЕЗК'),
(1793, 'ПРОСТРАНСТВЕН'),
(1794, 'ТУД'),
(1795, 'ПОПАДА'),
(1796, 'НЕДАВН'),
(1797, 'ВЫЗЫВА'),
(1798, 'СИМПАТ'),
(1799, 'ГЕТЕВСК'),
(1800, 'ВЕРТЕР'),
(1801, 'САМООПИСАН'),
(1802, 'НАЛИЧЕСТВ'),
(1803, 'ЭПАТАЖН'),
(1804, 'СИЛЛАБИЧЕСК'),
(1805, 'СОРАЗМЕРН'),
(1806, 'КОЛОНОВ'),
(1807, 'КОЛОН'),
(1808, 'ИЛЛЮСТРИР'),
(1809, 'ЗАМЫСЕЛ'),
(1810, 'ИМЕН'),
(1811, 'ПОЭТ'),
(1812, 'ПИСАТЕЛЬ-МОДЕРНИСТ'),
(1813, 'ХАРАКТЕРОЛОГИЧЕСК'),
(1814, 'ЗРЕН'),
(1815, 'ШИЗОИД'),
(1816, 'МОЗАИК'),
(1817, 'СЛЕДОВАТЕЛЬН'),
(1818, 'ГЛУБОК'),
(1819, 'ЗАЧИН'),
(1820, 'КОМПОЗИЦИОН'),
(1821, 'СКАЗА'),
(1822, 'НЕРЕДК'),
(1823, 'МАНЕРН'),
(1824, 'ЭПИТЕТ'),
(1825, 'ПЕРЕДА'),
(1826, 'ДОН'),
(1827, 'МЕТАФОРИЧЕСК'),
(1828, 'ОБРАЗ'),
(1829, 'ЦИРКУЛ'),
(1830, 'ОДНОКРАТН'),
(1831, 'ЦВЕТ'),
(1832, 'ЗНАЕТ'),
(1833, 'ТЕНДЕНЦ'),
(1834, 'ПОДСКАЖ'),
(1835, 'СТИЛ'),
(1836, 'ОТЛИЧ'),
(1837, 'ПРОИЗВЕДЕН'),
(1838, 'ПОЭТОВ'),
(1839, 'БАРОКК'),
(1840, 'БАСН'),
(1841, 'СИНЕКДОХ'),
(1842, 'ПРИБЛИЖЕН'),
(1843, 'ДАКТИЛ'),
(1844, 'ДОЛЬНИК'),
(1845, 'ОТМЕЧА'),
(1846, 'НАС'),
(1847, 'ЧУВСТВ'),
(1848, 'ВЫРАЖА'),
(1849, 'ИСЧЕРПЫВА'),
(1850, 'ЖЕНСК'),
(1851, 'ЯСН'),
(1852, 'ВИДН'),
(1853, 'КУР'),
(1854, 'ТРУПК'),
(1855, 'ТФО'),
(1856, 'ПИХТ'),
(1857, 'КАФ'),
(1858, 'ПИЛ'),
(1859, 'ЩАШЕШК'),
(1860, 'СИД'),
(1861, 'ЭПИЧЕСК'),
(1862, 'МЕДЛИТЕЛЬН'),
(1863, 'ПРИТЯГИВА'),
(1864, 'СТИЛИСТИЧЕСК'),
(1865, 'ИГР'),
(1866, 'АКТИВНО-ДИАЛОГИЧЕСК'),
(1867, 'ЛОТМА'),
(1868, 'ДАВ'),
(1869, 'ЗАПУТЫВА'),
(1870, 'ПРОБЛЕМ'),
(1871, 'ПРЕВРАЩЕН'),
(1872, 'НЕ-ТЕКСТ'),
(1873, 'УТВЕРЖДА'),
(1874, 'САМОПРОИЗВОЛЬН'),
(1875, 'УЯЗВИМ'),
(1876, 'ПОКАЗА'),
(1877, 'ВСТРЕЧА'),
(1878, '2014'),
(1879, 'МОДН'),
(1880, 'НАБЛЮДА'),
(1881, 'СЛОЖ'),
(1882, 'ФОНЕТИЧЕСК'),
(1883, 'СВИДЕТЕЛЬСТВ'),
(1884, 'КРАТКОСТ'),
(1885, 'ЗАВЕРШЕН'),
(1886, 'БЕССЮЖЕТН'),
(1887, 'СВОЕОБРАЗ'),
(1888, 'ТЕМАТИЧЕСК'),
(1889, 'РАЗВЕРТЫВАН'),
(1890, 'ОТТАЛКИВА'),
(1891, 'РИФМ'),
(1892, 'КОММУНАЛЬН'),
(1893, 'МОДЕРНИЗМ'),
(1894, 'ОДНОРОДН'),
(1895, 'ГОВОР'),
(1896, 'ЯВЛЕН'),
(1897, 'ФОНИК'),
(1898, 'ЗВУКОПИС'),
(1899, 'РЕФЛЕКС'),
(1900, 'СЛАБОПРОНИЦА'),
(1901, 'ЗАИМСТВОВАН'),
(1902, 'ДЕТАЛЬН'),
(1903, 'ЗНА'),
(1904, 'РЕФОРМАТОРСК'),
(1905, 'ПАФОС'),
(1906, 'ГИПЕРЦИТАТ'),
(1907, 'УРБАНИСТИЧЕСК'),
(1908, 'ЭСТЕТИЧЕСК'),
(1909, 'ОБСЦЕН'),
(1910, 'ИДИОМ'),
(1911, 'ПОЛУСТИШ'),
(1912, 'ТРАДИЦИОН'),
(1913, 'ЦЕЗУР'),
(1914, 'НЕУМЕРЕН'),
(1915, 'АДМИНИСТРАТОР');

-- --------------------------------------------------------

--
-- Структура таблицы `b_search_suggest`
--

CREATE TABLE IF NOT EXISTS `b_search_suggest` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `FILTER_MD5` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `PHRASE` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `RATE` float NOT NULL,
  `TIMESTAMP_X` datetime NOT NULL,
  `RESULT_COUNT` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IND_B_SEARCH_SUGGEST` (`FILTER_MD5`,`PHRASE`(50),`RATE`),
  KEY `IND_B_SEARCH_SUGGEST_PHRASE` (`PHRASE`(50),`RATE`),
  KEY `IND_B_SEARCH_SUGGEST_TIME` (`TIMESTAMP_X`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `b_search_tags`
--

CREATE TABLE IF NOT EXISTS `b_search_tags` (
  `SEARCH_CONTENT_ID` int(11) NOT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`SEARCH_CONTENT_ID`,`SITE_ID`,`NAME`),
  KEY `IX_B_SEARCH_TAGS_0` (`NAME`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci DELAY_KEY_WRITE=1;

-- --------------------------------------------------------

--
-- Структура таблицы `b_search_user_right`
--

CREATE TABLE IF NOT EXISTS `b_search_user_right` (
  `USER_ID` int(11) NOT NULL,
  `GROUP_CODE` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  UNIQUE KEY `UX_B_SEARCH_USER_RIGHT` (`USER_ID`,`GROUP_CODE`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_security_sitecheck`
--

CREATE TABLE IF NOT EXISTS `b_security_sitecheck` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TEST_DATE` datetime DEFAULT NULL,
  `RESULTS` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `b_sec_filter_mask`
--

CREATE TABLE IF NOT EXISTS `b_sec_filter_mask` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SORT` int(11) NOT NULL DEFAULT '10',
  `SITE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FILTER_MASK` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LIKE_MASK` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PREG_MASK` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `b_sec_frame_mask`
--

CREATE TABLE IF NOT EXISTS `b_sec_frame_mask` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SORT` int(11) NOT NULL DEFAULT '10',
  `SITE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FRAME_MASK` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LIKE_MASK` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PREG_MASK` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `b_sec_iprule`
--

CREATE TABLE IF NOT EXISTS `b_sec_iprule` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RULE_TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'M',
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `ADMIN_SECTION` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `SITE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SORT` int(11) NOT NULL DEFAULT '500',
  `ACTIVE_FROM` datetime DEFAULT NULL,
  `ACTIVE_FROM_TIMESTAMP` int(11) DEFAULT NULL,
  `ACTIVE_TO` datetime DEFAULT NULL,
  `ACTIVE_TO_TIMESTAMP` int(11) DEFAULT NULL,
  `NAME` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_b_sec_iprule_active_to` (`ACTIVE_TO`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `b_sec_iprule_excl_ip`
--

CREATE TABLE IF NOT EXISTS `b_sec_iprule_excl_ip` (
  `IPRULE_ID` int(11) NOT NULL,
  `RULE_IP` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `SORT` int(11) NOT NULL DEFAULT '500',
  `IP_START` bigint(18) DEFAULT NULL,
  `IP_END` bigint(18) DEFAULT NULL,
  PRIMARY KEY (`IPRULE_ID`,`RULE_IP`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_sec_iprule_excl_mask`
--

CREATE TABLE IF NOT EXISTS `b_sec_iprule_excl_mask` (
  `IPRULE_ID` int(11) NOT NULL,
  `RULE_MASK` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `SORT` int(11) NOT NULL DEFAULT '500',
  `LIKE_MASK` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PREG_MASK` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`IPRULE_ID`,`RULE_MASK`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_sec_iprule_incl_ip`
--

CREATE TABLE IF NOT EXISTS `b_sec_iprule_incl_ip` (
  `IPRULE_ID` int(11) NOT NULL,
  `RULE_IP` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `SORT` int(11) NOT NULL DEFAULT '500',
  `IP_START` bigint(18) DEFAULT NULL,
  `IP_END` bigint(18) DEFAULT NULL,
  PRIMARY KEY (`IPRULE_ID`,`RULE_IP`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_sec_iprule_incl_mask`
--

CREATE TABLE IF NOT EXISTS `b_sec_iprule_incl_mask` (
  `IPRULE_ID` int(11) NOT NULL,
  `RULE_MASK` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `SORT` int(11) NOT NULL DEFAULT '500',
  `LIKE_MASK` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PREG_MASK` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`IPRULE_ID`,`RULE_MASK`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_sec_recovery_codes`
--

CREATE TABLE IF NOT EXISTS `b_sec_recovery_codes` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(11) NOT NULL,
  `CODE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `USED` varchar(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `USING_DATE` datetime DEFAULT NULL,
  `USING_IP` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_b_sec_recovery_codes_user_id` (`USER_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `b_sec_redirect_url`
--

CREATE TABLE IF NOT EXISTS `b_sec_redirect_url` (
  `IS_SYSTEM` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `SORT` int(11) NOT NULL DEFAULT '500',
  `URL` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `PARAMETER_NAME` varchar(250) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `b_sec_redirect_url`
--

INSERT INTO `b_sec_redirect_url` (`IS_SYSTEM`, `SORT`, `URL`, `PARAMETER_NAME`) VALUES
('Y', 10, '/bitrix/redirect.php', 'goto'),
('Y', 20, '/bitrix/rk.php', 'goto'),
('Y', 30, '/bitrix/click.php', 'goto');

-- --------------------------------------------------------

--
-- Структура таблицы `b_sec_session`
--

CREATE TABLE IF NOT EXISTS `b_sec_session` (
  `SESSION_ID` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `SESSION_DATA` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`SESSION_ID`),
  KEY `ix_b_sec_session_time` (`TIMESTAMP_X`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_sec_user`
--

CREATE TABLE IF NOT EXISTS `b_sec_user` (
  `USER_ID` int(11) NOT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `SECRET` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TYPE` varchar(16) COLLATE utf8_unicode_ci NOT NULL,
  `PARAMS` text COLLATE utf8_unicode_ci,
  `ATTEMPTS` int(18) DEFAULT NULL,
  `INITIAL_DATE` datetime DEFAULT NULL,
  `SKIP_MANDATORY` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `DEACTIVATE_UNTIL` datetime DEFAULT NULL,
  PRIMARY KEY (`USER_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_sec_virus`
--

CREATE TABLE IF NOT EXISTS `b_sec_virus` (
  `ID` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `TIMESTAMP_X` datetime NOT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SENT` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `INFO` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_sec_white_list`
--

CREATE TABLE IF NOT EXISTS `b_sec_white_list` (
  `ID` int(11) NOT NULL,
  `WHITE_SUBSTR` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_seo_adv_banner`
--

CREATE TABLE IF NOT EXISTS `b_seo_adv_banner` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ENGINE_ID` int(11) NOT NULL,
  `OWNER_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `OWNER_NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci DEFAULT 'Y',
  `XML_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `LAST_UPDATE` timestamp NULL DEFAULT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `SETTINGS` text COLLATE utf8_unicode_ci,
  `CAMPAIGN_ID` int(11) NOT NULL,
  `GROUP_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_b_seo_adv_banner` (`ENGINE_ID`,`XML_ID`),
  KEY `ix_b_seo_adv_banner1` (`CAMPAIGN_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `b_seo_adv_campaign`
--

CREATE TABLE IF NOT EXISTS `b_seo_adv_campaign` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ENGINE_ID` int(11) NOT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `OWNER_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `OWNER_NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `XML_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `LAST_UPDATE` timestamp NULL DEFAULT NULL,
  `SETTINGS` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_b_seo_adv_campaign` (`ENGINE_ID`,`XML_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `b_seo_adv_group`
--

CREATE TABLE IF NOT EXISTS `b_seo_adv_group` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ENGINE_ID` int(11) NOT NULL,
  `OWNER_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `OWNER_NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci DEFAULT 'Y',
  `XML_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `LAST_UPDATE` timestamp NULL DEFAULT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `SETTINGS` text COLLATE utf8_unicode_ci,
  `CAMPAIGN_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_b_seo_adv_group` (`ENGINE_ID`,`XML_ID`),
  KEY `ix_b_seo_adv_group1` (`CAMPAIGN_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `b_seo_adv_link`
--

CREATE TABLE IF NOT EXISTS `b_seo_adv_link` (
  `LINK_TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `LINK_ID` int(18) NOT NULL,
  `BANNER_ID` int(11) NOT NULL,
  PRIMARY KEY (`LINK_TYPE`,`LINK_ID`,`BANNER_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_seo_adv_log`
--

CREATE TABLE IF NOT EXISTS `b_seo_adv_log` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ENGINE_ID` int(11) NOT NULL,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `REQUEST_URI` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `REQUEST_DATA` text COLLATE utf8_unicode_ci,
  `RESPONSE_TIME` float NOT NULL,
  `RESPONSE_STATUS` int(5) DEFAULT NULL,
  `RESPONSE_DATA` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`),
  KEY `ix_b_seo_adv_log1` (`ENGINE_ID`),
  KEY `ix_b_seo_adv_log2` (`TIMESTAMP_X`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `b_seo_adv_region`
--

CREATE TABLE IF NOT EXISTS `b_seo_adv_region` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ENGINE_ID` int(11) NOT NULL,
  `OWNER_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `OWNER_NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci DEFAULT 'Y',
  `XML_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `LAST_UPDATE` timestamp NULL DEFAULT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `SETTINGS` text COLLATE utf8_unicode_ci,
  `PARENT_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_b_seo_adv_region` (`ENGINE_ID`,`XML_ID`),
  KEY `ix_b_seo_adv_region1` (`PARENT_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `b_seo_keywords`
--

CREATE TABLE IF NOT EXISTS `b_seo_keywords` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `URL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `KEYWORDS` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`),
  KEY `ix_b_seo_keywords_url` (`URL`,`SITE_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `b_seo_search_engine`
--

CREATE TABLE IF NOT EXISTS `b_seo_search_engine` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `CODE` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci DEFAULT 'Y',
  `SORT` int(5) DEFAULT '100',
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `CLIENT_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CLIENT_SECRET` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `REDIRECT_URI` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SETTINGS` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_b_seo_search_engine_code` (`CODE`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- Дамп данных таблицы `b_seo_search_engine`
--

INSERT INTO `b_seo_search_engine` (`ID`, `CODE`, `ACTIVE`, `SORT`, `NAME`, `CLIENT_ID`, `CLIENT_SECRET`, `REDIRECT_URI`, `SETTINGS`) VALUES
(1, 'google', 'Y', 200, 'Google', '950140266760.apps.googleusercontent.com', 'IBktWJ_dS3rMKh43PSHO-zo5', 'urn:ietf:wg:oauth:2.0:oob', NULL),
(2, 'yandex', 'Y', 300, 'Yandex', 'f848c7bfc1d34a94ba6d05439f81bbd7', 'da0e73b2d9cc4e809f3170e49cb9df01', 'https://oauth.yandex.ru/verification_code', NULL),
(3, 'yandex_direct', 'Y', 400, 'Yandex.Direct', 'e46a29a748d84036baee1e2ae2a84fc6', '7122987f5a99479bb756d79ed7986e6c', 'https://oauth.yandex.ru/verification_code', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `b_seo_sitemap`
--

CREATE TABLE IF NOT EXISTS `b_seo_sitemap` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci DEFAULT 'Y',
  `NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `DATE_RUN` datetime DEFAULT NULL,
  `SETTINGS` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `b_seo_sitemap_entity`
--

CREATE TABLE IF NOT EXISTS `b_seo_sitemap_entity` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ENTITY_TYPE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ENTITY_ID` int(11) NOT NULL,
  `SITEMAP_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_b_seo_sitemap_entity_1` (`ENTITY_TYPE`,`ENTITY_ID`),
  KEY `ix_b_seo_sitemap_entity_2` (`SITEMAP_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `b_seo_sitemap_iblock`
--

CREATE TABLE IF NOT EXISTS `b_seo_sitemap_iblock` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `IBLOCK_ID` int(11) NOT NULL,
  `SITEMAP_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_b_seo_sitemap_iblock_1` (`IBLOCK_ID`),
  KEY `ix_b_seo_sitemap_iblock_2` (`SITEMAP_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `b_seo_sitemap_runtime`
--

CREATE TABLE IF NOT EXISTS `b_seo_sitemap_runtime` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `PID` int(11) NOT NULL,
  `PROCESSED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `ITEM_PATH` varchar(700) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ITEM_ID` int(11) DEFAULT NULL,
  `ITEM_TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'D',
  `ACTIVE` char(1) COLLATE utf8_unicode_ci DEFAULT 'Y',
  `ACTIVE_ELEMENT` char(1) COLLATE utf8_unicode_ci DEFAULT 'Y',
  PRIMARY KEY (`ID`),
  KEY `ix_seo_sitemap_runtime1` (`PID`,`PROCESSED`,`ITEM_TYPE`,`ITEM_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `b_seo_yandex_direct_stat`
--

CREATE TABLE IF NOT EXISTS `b_seo_yandex_direct_stat` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `CAMPAIGN_ID` int(11) NOT NULL,
  `BANNER_ID` int(11) NOT NULL,
  `DATE_DAY` date NOT NULL,
  `CURRENCY` char(3) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SUM` float DEFAULT '0',
  `SUM_SEARCH` float DEFAULT '0',
  `SUM_CONTEXT` float DEFAULT '0',
  `CLICKS` int(7) DEFAULT '0',
  `CLICKS_SEARCH` int(7) DEFAULT '0',
  `CLICKS_CONTEXT` int(7) DEFAULT '0',
  `SHOWS` int(7) DEFAULT '0',
  `SHOWS_SEARCH` int(7) DEFAULT '0',
  `SHOWS_CONTEXT` int(7) DEFAULT '0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_seo_yandex_direct_stat` (`BANNER_ID`,`DATE_DAY`),
  KEY `ix_seo_yandex_direct_stat1` (`CAMPAIGN_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `b_short_uri`
--

CREATE TABLE IF NOT EXISTS `b_short_uri` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `URI` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `URI_CRC` int(18) NOT NULL,
  `SHORT_URI` varbinary(250) NOT NULL,
  `SHORT_URI_CRC` int(18) NOT NULL,
  `STATUS` int(18) NOT NULL DEFAULT '301',
  `MODIFIED` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `LAST_USED` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `NUMBER_USED` int(18) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `ux_b_short_uri_1` (`SHORT_URI_CRC`),
  KEY `ux_b_short_uri_2` (`URI_CRC`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `b_site_template`
--

CREATE TABLE IF NOT EXISTS `b_site_template` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `CONDITION` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SORT` int(11) NOT NULL DEFAULT '500',
  `TEMPLATE` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UX_B_SITE_TEMPLATE` (`SITE_ID`,`CONDITION`,`TEMPLATE`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Дамп данных таблицы `b_site_template`
--

INSERT INTO `b_site_template` (`ID`, `SITE_ID`, `CONDITION`, `SORT`, `TEMPLATE`) VALUES
(2, 's1', '', 150, 'jamilco');

-- --------------------------------------------------------

--
-- Структура таблицы `b_smile`
--

CREATE TABLE IF NOT EXISTS `b_smile` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'S',
  `SET_ID` int(18) NOT NULL DEFAULT '0',
  `SORT` int(10) NOT NULL DEFAULT '150',
  `TYPING` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CLICKABLE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `IMAGE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `IMAGE_HR` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `IMAGE_WIDTH` int(11) NOT NULL DEFAULT '0',
  `IMAGE_HEIGHT` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=23 ;

--
-- Дамп данных таблицы `b_smile`
--

INSERT INTO `b_smile` (`ID`, `TYPE`, `SET_ID`, `SORT`, `TYPING`, `CLICKABLE`, `IMAGE`, `IMAGE_HR`, `IMAGE_WIDTH`, `IMAGE_HEIGHT`) VALUES
(1, 'S', 1, 100, ':) :-)', 'Y', 'smile_smile.png', 'Y', 16, 16),
(2, 'S', 1, 105, ';) ;-)', 'Y', 'smile_wink.png', 'Y', 16, 16),
(3, 'S', 1, 110, ':D :-D', 'Y', 'smile_biggrin.png', 'Y', 16, 16),
(4, 'S', 1, 115, '8) 8-)', 'Y', 'smile_cool.png', 'Y', 16, 16),
(5, 'S', 1, 120, ':( :-(', 'Y', 'smile_sad.png', 'Y', 16, 16),
(6, 'S', 1, 125, ':| :-|', 'Y', 'smile_neutral.png', 'Y', 16, 16),
(7, 'S', 1, 130, ':oops:', 'Y', 'smile_redface.png', 'Y', 16, 16),
(8, 'S', 1, 135, ':cry: :~(', 'Y', 'smile_cry.png', 'Y', 16, 16),
(9, 'S', 1, 140, ':evil: >:-<', 'Y', 'smile_evil.png', 'Y', 16, 16),
(10, 'S', 1, 145, ':o :-o :shock:', 'Y', 'smile_eek.png', 'Y', 16, 16),
(11, 'S', 1, 150, ':/ :-/', 'Y', 'smile_confuse.png', 'Y', 16, 16),
(12, 'S', 1, 155, ':{} :-{}', 'Y', 'smile_kiss.png', 'Y', 16, 16),
(13, 'S', 1, 160, ':idea:', 'Y', 'smile_idea.png', 'Y', 16, 16),
(14, 'S', 1, 165, ':?:', 'Y', 'smile_question.png', 'Y', 16, 16),
(15, 'S', 1, 170, ':!:', 'Y', 'smile_exclaim.png', 'Y', 16, 16),
(16, 'I', 1, 175, '', 'Y', 'icon1.gif', 'N', 15, 15),
(17, 'I', 1, 180, '', 'Y', 'icon2.gif', 'N', 15, 15),
(18, 'I', 1, 185, '', 'Y', 'icon3.gif', 'N', 15, 15),
(19, 'I', 1, 190, '', 'Y', 'icon4.gif', 'N', 15, 15),
(20, 'I', 1, 195, '', 'Y', 'icon5.gif', 'N', 15, 15),
(21, 'I', 1, 200, '', 'Y', 'icon6.gif', 'N', 15, 15),
(22, 'I', 1, 205, NULL, 'Y', 'icon7.gif', 'N', 15, 15);

-- --------------------------------------------------------

--
-- Структура таблицы `b_smile_lang`
--

CREATE TABLE IF NOT EXISTS `b_smile_lang` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'S',
  `SID` int(11) NOT NULL,
  `LID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UX_SMILE_SL` (`TYPE`,`SID`,`LID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=33 ;

--
-- Дамп данных таблицы `b_smile_lang`
--

INSERT INTO `b_smile_lang` (`ID`, `TYPE`, `SID`, `LID`, `NAME`) VALUES
(1, 'G', 1, 'ru', 'Основной набор'),
(2, 'G', 1, 'en', 'Default set'),
(3, 'S', 1, 'ru', 'С улыбкой'),
(4, 'S', 1, 'en', 'Smile'),
(5, 'S', 2, 'ru', 'Шутливо'),
(6, 'S', 2, 'en', 'Wink'),
(7, 'S', 3, 'ru', 'Широкая улыбка'),
(8, 'S', 3, 'en', 'Big grin'),
(9, 'S', 4, 'ru', 'Здорово'),
(10, 'S', 4, 'en', 'Cool'),
(11, 'S', 5, 'ru', 'Печально'),
(12, 'S', 5, 'en', 'Sad'),
(13, 'S', 6, 'ru', 'Скептически'),
(14, 'S', 6, 'en', 'Skeptic'),
(15, 'S', 7, 'ru', 'Смущенный'),
(16, 'S', 7, 'en', 'Embarrassed'),
(17, 'S', 8, 'ru', 'Очень грустно'),
(18, 'S', 8, 'en', 'Crying'),
(19, 'S', 9, 'ru', 'Со злостью'),
(20, 'S', 9, 'en', 'Angry'),
(21, 'S', 10, 'ru', 'Удивленно'),
(22, 'S', 10, 'en', 'Surprised'),
(23, 'S', 11, 'ru', 'Смущенно'),
(24, 'S', 11, 'en', 'Confused'),
(25, 'S', 12, 'ru', 'Поцелуй'),
(26, 'S', 12, 'en', 'Kiss'),
(27, 'S', 13, 'ru', 'Идея'),
(28, 'S', 13, 'en', 'Idea'),
(29, 'S', 14, 'ru', 'Вопрос'),
(30, 'S', 14, 'en', 'Question'),
(31, 'S', 15, 'ru', 'Восклицание'),
(32, 'S', 15, 'en', 'Exclamation');

-- --------------------------------------------------------

--
-- Структура таблицы `b_smile_set`
--

CREATE TABLE IF NOT EXISTS `b_smile_set` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `STRING_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SORT` int(10) NOT NULL DEFAULT '150',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Дамп данных таблицы `b_smile_set`
--

INSERT INTO `b_smile_set` (`ID`, `STRING_ID`, `SORT`) VALUES
(1, 'main', 150);

-- --------------------------------------------------------

--
-- Структура таблицы `b_socialservices_message`
--

CREATE TABLE IF NOT EXISTS `b_socialservices_message` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(11) NOT NULL,
  `SOCSERV_USER_ID` int(11) NOT NULL,
  `PROVIDER` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `MESSAGE` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `INSERT_DATE` datetime DEFAULT NULL,
  `SUCCES_SENT` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `b_socialservices_user`
--

CREATE TABLE IF NOT EXISTS `b_socialservices_user` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `LOGIN` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LAST_NAME` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `EMAIL` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_PHOTO` int(11) DEFAULT NULL,
  `EXTERNAL_AUTH_ID` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `USER_ID` int(11) NOT NULL,
  `XML_ID` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `CAN_DELETE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `PERSONAL_WWW` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERMISSIONS` varchar(555) COLLATE utf8_unicode_ci DEFAULT NULL,
  `OATOKEN` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `OATOKEN_EXPIRES` int(11) DEFAULT NULL,
  `OASECRET` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `REFRESH_TOKEN` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SEND_ACTIVITY` char(1) COLLATE utf8_unicode_ci DEFAULT 'Y',
  `SITE_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `INITIALIZED` char(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IX_B_SOCIALSERVICES_USER` (`XML_ID`,`EXTERNAL_AUTH_ID`),
  KEY `IX_B_SOCIALSERVICES_US_1` (`USER_ID`),
  KEY `IX_B_SOCIALSERVICES_US_2` (`INITIALIZED`),
  KEY `IX_B_SOCIALSERVICES_US_3` (`LOGIN`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `b_socialservices_user_link`
--

CREATE TABLE IF NOT EXISTS `b_socialservices_user_link` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(11) NOT NULL,
  `SOCSERV_USER_ID` int(11) NOT NULL,
  `LINK_USER_ID` int(11) DEFAULT NULL,
  `LINK_UID` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `LINK_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LINK_LAST_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LINK_PICTURE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `b_sticker`
--

CREATE TABLE IF NOT EXISTS `b_sticker` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PAGE_URL` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `PAGE_TITLE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `DATE_CREATE` datetime NOT NULL,
  `DATE_UPDATE` datetime NOT NULL,
  `MODIFIED_BY` int(18) NOT NULL,
  `CREATED_BY` int(18) NOT NULL,
  `PERSONAL` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `CONTENT` text COLLATE utf8_unicode_ci,
  `POS_TOP` int(11) DEFAULT NULL,
  `POS_LEFT` int(11) DEFAULT NULL,
  `WIDTH` int(11) DEFAULT NULL,
  `HEIGHT` int(11) DEFAULT NULL,
  `COLOR` int(11) DEFAULT NULL,
  `COLLAPSED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `COMPLETED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `CLOSED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `DELETED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `MARKER_TOP` int(11) DEFAULT NULL,
  `MARKER_LEFT` int(11) DEFAULT NULL,
  `MARKER_WIDTH` int(11) DEFAULT NULL,
  `MARKER_HEIGHT` int(11) DEFAULT NULL,
  `MARKER_ADJUST` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `b_sticker_group_task`
--

CREATE TABLE IF NOT EXISTS `b_sticker_group_task` (
  `GROUP_ID` int(11) NOT NULL,
  `TASK_ID` int(11) NOT NULL,
  PRIMARY KEY (`GROUP_ID`,`TASK_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `b_sticker_group_task`
--

INSERT INTO `b_sticker_group_task` (`GROUP_ID`, `TASK_ID`) VALUES
(5, 27);

-- --------------------------------------------------------

--
-- Структура таблицы `b_subscription`
--

CREATE TABLE IF NOT EXISTS `b_subscription` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DATE_INSERT` datetime NOT NULL,
  `DATE_UPDATE` datetime DEFAULT NULL,
  `USER_ID` int(11) DEFAULT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `EMAIL` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `FORMAT` varchar(4) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'text',
  `CONFIRM_CODE` varchar(8) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CONFIRMED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `DATE_CONFIRM` datetime NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_SUBSCRIPTION_EMAIL` (`EMAIL`,`USER_ID`),
  KEY `IX_DATE_CONFIRM` (`CONFIRMED`,`DATE_CONFIRM`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `b_subscription_rubric`
--

CREATE TABLE IF NOT EXISTS `b_subscription_rubric` (
  `SUBSCRIPTION_ID` int(11) NOT NULL,
  `LIST_RUBRIC_ID` int(11) NOT NULL,
  UNIQUE KEY `UK_SUBSCRIPTION_RUBRIC` (`SUBSCRIPTION_ID`,`LIST_RUBRIC_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_task`
--

CREATE TABLE IF NOT EXISTS `b_task` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `LETTER` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MODULE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `SYS` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `DESCRIPTION` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `BINDING` varchar(50) COLLATE utf8_unicode_ci DEFAULT 'module',
  PRIMARY KEY (`ID`),
  KEY `ix_task` (`MODULE_ID`,`BINDING`,`LETTER`,`SYS`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=45 ;

--
-- Дамп данных таблицы `b_task`
--

INSERT INTO `b_task` (`ID`, `NAME`, `LETTER`, `MODULE_ID`, `SYS`, `DESCRIPTION`, `BINDING`) VALUES
(1, 'main_denied', 'D', 'main', 'Y', NULL, 'module'),
(2, 'main_change_profile', 'P', 'main', 'Y', NULL, 'module'),
(3, 'main_view_all_settings', 'R', 'main', 'Y', NULL, 'module'),
(4, 'main_view_all_settings_change_profile', 'T', 'main', 'Y', NULL, 'module'),
(5, 'main_edit_subordinate_users', 'V', 'main', 'Y', NULL, 'module'),
(6, 'main_full_access', 'W', 'main', 'Y', NULL, 'module'),
(7, 'fm_folder_access_denied', 'D', 'main', 'Y', NULL, 'file'),
(8, 'fm_folder_access_read', 'R', 'main', 'Y', NULL, 'file'),
(9, 'fm_folder_access_write', 'W', 'main', 'Y', NULL, 'file'),
(10, 'fm_folder_access_full', 'X', 'main', 'Y', NULL, 'file'),
(11, 'fm_folder_access_workflow', 'U', 'main', 'Y', NULL, 'file'),
(12, 'clouds_denied', 'D', 'clouds', 'Y', NULL, 'module'),
(13, 'clouds_browse', 'F', 'clouds', 'Y', NULL, 'module'),
(14, 'clouds_upload', 'U', 'clouds', 'Y', NULL, 'module'),
(15, 'clouds_full_access', 'W', 'clouds', 'Y', NULL, 'module'),
(16, 'fileman_denied', 'D', 'fileman', 'Y', '', 'module'),
(17, 'fileman_allowed_folders', 'F', 'fileman', 'Y', '', 'module'),
(18, 'fileman_full_access', 'W', 'fileman', 'Y', '', 'module'),
(19, 'medialib_denied', 'D', 'fileman', 'Y', '', 'medialib'),
(20, 'medialib_view', 'F', 'fileman', 'Y', '', 'medialib'),
(21, 'medialib_only_new', 'R', 'fileman', 'Y', '', 'medialib'),
(22, 'medialib_edit_items', 'V', 'fileman', 'Y', '', 'medialib'),
(23, 'medialib_editor', 'W', 'fileman', 'Y', '', 'medialib'),
(24, 'medialib_full', 'X', 'fileman', 'Y', '', 'medialib'),
(25, 'stickers_denied', 'D', 'fileman', 'Y', '', 'stickers'),
(26, 'stickers_read', 'R', 'fileman', 'Y', '', 'stickers'),
(27, 'stickers_edit', 'W', 'fileman', 'Y', '', 'stickers'),
(28, 'iblock_deny', 'D', 'iblock', 'Y', NULL, 'iblock'),
(29, 'iblock_read', 'R', 'iblock', 'Y', NULL, 'iblock'),
(30, 'iblock_element_add', 'E', 'iblock', 'Y', NULL, 'iblock'),
(31, 'iblock_admin_read', 'S', 'iblock', 'Y', NULL, 'iblock'),
(32, 'iblock_admin_add', 'T', 'iblock', 'Y', NULL, 'iblock'),
(33, 'iblock_limited_edit', 'U', 'iblock', 'Y', NULL, 'iblock'),
(34, 'iblock_full_edit', 'W', 'iblock', 'Y', NULL, 'iblock'),
(35, 'iblock_full', 'X', 'iblock', 'Y', NULL, 'iblock'),
(36, 'security_denied', 'D', 'security', 'Y', NULL, 'module'),
(37, 'security_filter', 'F', 'security', 'Y', NULL, 'module'),
(38, 'security_otp', 'S', 'security', 'Y', NULL, 'module'),
(39, 'security_view_all_settings', 'T', 'security', 'Y', NULL, 'module'),
(40, 'security_full_access', 'W', 'security', 'Y', NULL, 'module'),
(41, 'seo_denied', 'D', 'seo', 'Y', '', 'module'),
(42, 'seo_edit', 'F', 'seo', 'Y', '', 'module'),
(43, 'seo_full_access', 'W', 'seo', 'Y', '', 'module'),
(44, 'Контент-редакторы', 'Q', 'main', 'N', 'Разрешено изменять информацию в своем профайле. Управление кешем', 'module');

-- --------------------------------------------------------

--
-- Структура таблицы `b_task_operation`
--

CREATE TABLE IF NOT EXISTS `b_task_operation` (
  `TASK_ID` int(18) NOT NULL,
  `OPERATION_ID` int(18) NOT NULL,
  PRIMARY KEY (`TASK_ID`,`OPERATION_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `b_task_operation`
--

INSERT INTO `b_task_operation` (`TASK_ID`, `OPERATION_ID`) VALUES
(2, 2),
(2, 3),
(3, 2),
(3, 4),
(3, 5),
(3, 6),
(3, 7),
(4, 2),
(4, 3),
(4, 4),
(4, 5),
(4, 6),
(4, 7),
(5, 2),
(5, 3),
(5, 5),
(5, 6),
(5, 7),
(5, 8),
(5, 9),
(6, 2),
(6, 3),
(6, 4),
(6, 5),
(6, 6),
(6, 7),
(6, 10),
(6, 11),
(6, 12),
(6, 13),
(6, 14),
(6, 15),
(6, 16),
(6, 17),
(6, 18),
(8, 19),
(8, 20),
(8, 21),
(9, 19),
(9, 20),
(9, 21),
(9, 22),
(9, 23),
(9, 24),
(9, 25),
(9, 26),
(9, 27),
(9, 28),
(9, 29),
(9, 30),
(9, 31),
(9, 32),
(9, 33),
(9, 34),
(10, 19),
(10, 20),
(10, 21),
(10, 22),
(10, 23),
(10, 24),
(10, 25),
(10, 26),
(10, 27),
(10, 28),
(10, 29),
(10, 30),
(10, 31),
(10, 32),
(10, 33),
(10, 34),
(10, 35),
(11, 19),
(11, 20),
(11, 21),
(11, 24),
(11, 28),
(13, 36),
(14, 36),
(14, 37),
(15, 36),
(15, 37),
(15, 38),
(17, 41),
(17, 42),
(17, 43),
(17, 44),
(17, 45),
(17, 46),
(17, 47),
(17, 49),
(17, 50),
(18, 39),
(18, 40),
(18, 41),
(18, 42),
(18, 43),
(18, 44),
(18, 45),
(18, 46),
(18, 47),
(18, 48),
(18, 49),
(18, 50),
(18, 51),
(20, 52),
(21, 52),
(21, 53),
(21, 57),
(22, 52),
(22, 57),
(22, 58),
(22, 59),
(23, 52),
(23, 53),
(23, 54),
(23, 55),
(23, 57),
(23, 58),
(23, 59),
(24, 52),
(24, 53),
(24, 54),
(24, 55),
(24, 56),
(24, 57),
(24, 58),
(24, 59),
(26, 60),
(27, 60),
(27, 61),
(27, 62),
(27, 63),
(29, 64),
(29, 65),
(30, 66),
(31, 64),
(31, 65),
(31, 67),
(32, 64),
(32, 65),
(32, 66),
(32, 67),
(33, 64),
(33, 65),
(33, 66),
(33, 67),
(33, 68),
(33, 69),
(33, 70),
(33, 71),
(34, 64),
(34, 65),
(34, 66),
(34, 67),
(34, 68),
(34, 69),
(34, 70),
(34, 71),
(34, 72),
(34, 73),
(34, 74),
(34, 75),
(35, 64),
(35, 65),
(35, 66),
(35, 67),
(35, 68),
(35, 69),
(35, 70),
(35, 71),
(35, 72),
(35, 73),
(35, 74),
(35, 75),
(35, 76),
(35, 77),
(35, 78),
(35, 79),
(35, 80),
(35, 81),
(37, 82),
(38, 83),
(39, 84),
(39, 85),
(39, 86),
(39, 87),
(39, 88),
(39, 89),
(39, 90),
(39, 91),
(39, 92),
(39, 93),
(39, 94),
(40, 82),
(40, 83),
(40, 84),
(40, 85),
(40, 86),
(40, 87),
(40, 88),
(40, 89),
(40, 90),
(40, 91),
(40, 92),
(40, 93),
(40, 94),
(40, 95),
(40, 96),
(40, 97),
(40, 98),
(40, 99),
(40, 100),
(40, 101),
(40, 102),
(40, 103),
(40, 104),
(40, 105),
(40, 106),
(40, 107),
(42, 109),
(43, 108),
(43, 109),
(44, 2),
(44, 3),
(44, 14);

-- --------------------------------------------------------

--
-- Структура таблицы `b_undo`
--

CREATE TABLE IF NOT EXISTS `b_undo` (
  `ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `MODULE_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `UNDO_TYPE` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `UNDO_HANDLER` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CONTENT` mediumtext COLLATE utf8_unicode_ci,
  `USER_ID` int(11) DEFAULT NULL,
  `TIMESTAMP_X` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `b_undo`
--

INSERT INTO `b_undo` (`ID`, `MODULE_ID`, `UNDO_TYPE`, `UNDO_HANDLER`, `CONTENT`, `USER_ID`, `TIMESTAMP_X`) VALUES
('12ac14f0bcc4d578f382add4fe7850cce', 'fileman', 'new_section', 'CFileman::UndoNewSection', 'a:4:{s:7:"absPath";s:60:"/home/users1/k/kimry/domains/jamilco.3-core.ru/about-company";s:4:"path";s:14:"/about-company";s:4:"site";s:2:"s1";s:4:"menu";a:3:{s:8:"menuFile";s:14:"/.top.menu.php";s:8:"menuName";s:19:"О компании";s:8:"menuPath";s:15:"/about-company/";}}', 1, 1433359673),
('16a5854514a14b398ac007e70c87b3add', 'fileman', 'new_section', 'CFileman::UndoNewSection', 'a:4:{s:7:"absPath";s:53:"/home/users1/k/kimry/domains/jamilco.3-core.ru/brands";s:4:"path";s:7:"/brands";s:4:"site";s:2:"s1";s:4:"menu";a:3:{s:8:"menuFile";s:14:"/.top.menu.php";s:8:"menuName";s:12:"Бренды";s:8:"menuPath";s:8:"/brands/";}}', 1, 1433359707),
('1aa02adeca293033cda1fbe4a0a71d553', 'fileman', 'new_section', 'CFileman::UndoNewSection', 'a:4:{s:7:"absPath";s:53:"/home/users1/k/kimry/domains/jamilco.3-core.ru/buyers";s:4:"path";s:7:"/buyers";s:4:"site";s:2:"s1";s:4:"menu";a:3:{s:8:"menuFile";s:14:"/.top.menu.php";s:8:"menuName";s:22:"Покупателям";s:8:"menuPath";s:8:"/buyers/";}}', 1, 1433359731),
('1e86b5ec956e6d0842b80422d15b6b8f4', 'fileman', 'new_section', 'CFileman::UndoNewSection', 'a:4:{s:7:"absPath";s:51:"/home/users1/k/kimry/domains/jamilco.3-core.ru/news";s:4:"path";s:5:"/news";s:4:"site";s:2:"s1";s:4:"menu";a:3:{s:8:"menuFile";s:14:"/.top.menu.php";s:8:"menuName";s:14:"Новости";s:8:"menuPath";s:6:"/news/";}}', 1, 1433359750),
('129de8477ac1ab089c17a5f4b0886b858', 'fileman', 'new_section', 'CFileman::UndoNewSection', 'a:4:{s:7:"absPath";s:53:"/home/users1/k/kimry/domains/jamilco.3-core.ru/career";s:4:"path";s:7:"/career";s:4:"site";s:2:"s1";s:4:"menu";a:3:{s:8:"menuFile";s:14:"/.top.menu.php";s:8:"menuName";s:14:"Карьера";s:8:"menuPath";s:8:"/career/";}}', 1, 1433359773),
('14177991ef50c8aa34ed9e8d89cfa771f', 'fileman', 'new_section', 'CFileman::UndoNewSection', 'a:4:{s:7:"absPath";s:55:"/home/users1/k/kimry/domains/jamilco.3-core.ru/contacts";s:4:"path";s:9:"/contacts";s:4:"site";s:2:"s1";s:4:"menu";a:3:{s:8:"menuFile";s:14:"/.top.menu.php";s:8:"menuName";s:16:"Контакты";s:8:"menuPath";s:10:"/contacts/";}}', 1, 1433359791),
('105aad332ba2c31e84e630cbbd80256ee', 'fileman', 'new_section', 'CFileman::UndoNewSection', 'a:3:{s:7:"absPath";s:58:"/home/users1/k/kimry/domains/jamilco.3-core.ru/franchising";s:4:"path";s:12:"/franchising";s:4:"site";s:2:"s1";}', 1, 1433359857),
('1e24a566fdf0eaaa602e36f259196989a', 'fileman', 'new_section', 'CFileman::UndoNewSection', 'a:3:{s:7:"absPath";s:56:"/home/users1/k/kimry/domains/jamilco.3-core.ru/wholesale";s:4:"path";s:10:"/wholesale";s:4:"site";s:2:"s1";}', 1, 1433359880),
('1a07ae2bd509d8da442e0857b76b4a61c', 'fileman', 'new_section', 'CFileman::UndoNewSection', 'a:4:{s:7:"absPath";s:62:"/home/users1/k/kimry/domains/jamilco.3-core.ru/wholesale/shops";s:4:"path";s:16:"/wholesale/shops";s:4:"site";s:2:"s1";s:4:"menu";a:3:{s:8:"menuFile";s:17:"/.bottom.menu.php";s:8:"menuName";s:16:"Магазины";s:8:"menuPath";s:17:"/wholesale/shops/";}}', 1, 1433359919),
('1c9759606327666c7e9aa655f1903d6e4', 'fileman', 'edit_component_props', 'CFileman::UndoEditFile', 'a:2:{s:7:"absPath";s:81:"/home/users1/k/kimry/domains/jamilco.3-core.ru/local/templates/jamilco/header.php";s:7:"content";s:19403:"<?if(!defined("B_PROLOG_INCLUDED") || B_PROLOG_INCLUDED!==true)die();?>\n<?\n\n?>\n<!DOCTYPE html>\n<html lang="ru">\n<head>\n	<meta charset="utf-8">\n    <meta http-equiv="X-UA-Compatible" content="IE=edge">\n    <meta name="author" content="">\n    <link rel="icon" href="<?=SITE_TEMPLATE_PATH?>/favicon.ico">\n\n    <title><?$APPLICATION->ShowTitle()?></title>\n\n    <!-- Bootstrap core CSS -->\n	<? $APPLICATION->SetAdditionalCSS(SITE_TEMPLATE_PATH.''/css/bootstrap.min.css''); ?>\n	<? $APPLICATION->SetAdditionalCSS(SITE_TEMPLATE_PATH.''/css/dialog.css''); ?>\n	<? $APPLICATION->SetAdditionalCSS(SITE_TEMPLATE_PATH.''/css/dialog-sandra.css''); ?>\n	<? $APPLICATION->SetAdditionalCSS(SITE_TEMPLATE_PATH.''/owl/owl.carousel.css''); ?>\n	<? $APPLICATION->SetAdditionalCSS(SITE_TEMPLATE_PATH.''/owl/animate.css''); ?>\n	<? $APPLICATION->SetAdditionalCSS(SITE_TEMPLATE_PATH.''/css/style.css''); ?>\n	\n	<? $APPLICATION->AddHeadScript(SITE_TEMPLATE_PATH.''/js/ie-emulation-modes-warning.js''); ?>\n	<? $APPLICATION->AddHeadScript(SITE_TEMPLATE_PATH.''/js/ie10-viewport-bug-workaround.js''); ?>\n    <link href=''http://fonts.googleapis.com/css?family=PT+Serif:400,700,400italic,700italic&subset=latin,cyrillic-ext'' rel=''stylesheet'' type=''text/css''>\n\n    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->\n    <!--[if lt IE 9]>\n    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>\n    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>\n	<![endif]-->\n	\n	<?$APPLICATION->ShowHead();?>\n</head>\n<body>\n<div id="panel"><?$APPLICATION->ShowPanel();?></div>\n	\n<!-- Begin page content -->\n<div class="header-line">\n	<div class="container">\n		<div class="shops pull-left"><a href="/shops/">Магазины</a></div>\n		<div class="phone pull-left">+7 (495) 705 93 38</div>\n		<div class="find pull-right">\n			<form action="search.html" method="get" id="search-form">\n				<a href="javascript:void(0);"></a>\n				<input type="text" placeholder="Найти..." name="q" value=""/>\n			</form>\n			<div class="clearfix"></div>\n		</div>\n		<div class="auth-link pull-right"><a data-dialog="authorization"  href="javascript:void(0);"></a></div>\n		<div class="links l2 pull-right"><a href="/wholesale/">оптовые продажи</a></div>\n		<div class="links l1 pull-right"><a href="/franchising/">франчайзинг</a></div>\n		<div class="clearfix"></div>\n	</div>\n</div>\n	\n<div class="logo">\n    <div class="container text-center"><a href="/"><img src="<?=SITE_TEMPLATE_PATH?>/img/logo.png" alt=""/></a>\n    </div>\n</div>\n\n<?$APPLICATION->IncludeComponent("bitrix:menu", "top", Array(\n		"ROOT_MENU_TYPE" => "top",	// Тип меню для первого уровня\n		"MAX_LEVEL" => "1",	// Уровень вложенности меню\n		"CHILD_MENU_TYPE" => "left",	// Тип меню для остальных уровней\n		"USE_EXT" => "N",	// Подключать файлы с именами вида .тип_меню.menu_ext.php\n		"DELAY" => "N",	// Откладывать выполнение шаблона меню\n		"ALLOW_MULTI_SELECT" => "N",	// Разрешить несколько активных пунктов одновременно\n		"MENU_CACHE_TYPE" => "A",	// Тип кеширования\n		"MENU_CACHE_TIME" => "3600",	// Время кеширования (сек.)\n		"MENU_CACHE_USE_GROUPS" => "Y",	// Учитывать права доступа\n		"MENU_CACHE_GET_VARS" => "",	// Значимые переменные запроса\n	),\n	false\n);?>\n\n<div class="main-menu-wrap">\n    <div class="container">\n        <div class="main-menu">\n            <ul class="clearfix">\n                <li><a href="#">О компании</a></li>\n                <li><a href="#">Бренды</a></li>\n                <li><a href="#">Покупателям</a></li>\n                <li><a href="#">Новости</a></li>\n                <li><a href="#">Карьера</a></li>\n                <li><a href="#">Контакты</a></li>\n            </ul>\n        </div>\n    </div>\n</div>\n\n<? if ($APPLICATION->GetCurPage() == "/"): ?>\n	<div class="slider-main">\n		<div class="slider">\n			<div class="sl-item">\n				<div class="img-wrap">\n					<img src="<?=SITE_TEMPLATE_PATH?>/img/sl1.jpg" alt=""/>\n				</div>\n				<div class="text">\n					<div class="title">title1</div>\n					<div class="preview">preview1</div>\n					<div class="more"><a href="#">Подробнее</a></div>\n				</div>\n			</div>\n			<div class="sl-item">\n				<div class="img-wrap">\n					<img src="<?=SITE_TEMPLATE_PATH?>/img/sl2.jpg" alt=""/>\n				</div>\n				<div class="text">\n					<div class="title">title2</div>\n					<div class="preview">preview2</div>\n					<div class="more"><a href="#">Подробнее</a></div>\n				</div>\n			</div>\n			<div class="sl-item">\n				<div class="img-wrap">\n					<img src="<?=SITE_TEMPLATE_PATH?>/img/sl1.jpg" alt=""/>\n				</div>\n				<div class="text">\n					<div class="title">Совершай покупки в NAF NAF и получай подарки!</div>\n					<div class="preview">При покупке 2-х изделий мы рады подарить вам изящную бижутерию, при покупке трех – яркий лак для ногтей, а при покупке 4-х и более – чехол для смартфона!</div>\n					<div class="more"><a href="#">Подробнее</a></div>\n				</div>\n			</div>\n			<div class="sl-item">\n				<div class="img-wrap">\n					<img src="<?=SITE_TEMPLATE_PATH?>/img/sl2.jpg" alt=""/>\n				</div>\n					<div class="text">\n						<div class="title">title4</div>\n						<div class="preview">preview4</div>\n						<div class="more"><a href="#">Подробнее</a></div>\n					</div>\n			</div>\n			<div class="sl-item">\n				<div class="img-wrap">\n					<img src="<?=SITE_TEMPLATE_PATH?>/img/sl1.jpg" alt=""/>\n				</div>\n					<div class="text">\n						<div class="title">title5</div>\n						<div class="preview">preview5</div>\n						<div class="more"><a href="#">Подробнее</a></div>\n					</div>\n			</div>\n			<div class="sl-item">\n				<div class="img-wrap">\n					<img src="<?=SITE_TEMPLATE_PATH?>/img/sl2.jpg" alt=""/>\n				</div>\n					<div class="text">\n						<div class="title">title6</div>\n						<div class="preview">preview6</div>\n						<div class="more"><a href="#">Подробнее</a></div>\n					</div>\n			</div>\n			<div class="sl-item">\n				<div class="img-wrap">\n					<img src="<?=SITE_TEMPLATE_PATH?>/img/sl1.jpg" alt=""/>\n				</div>\n					<div class="text">\n						<div class="title">title7</div>\n						<div class="preview">preview7</div>\n						<div class="more"><a href="#">Подробнее</a></div>\n					</div>\n			</div>\n		</div>\n		<div class="slider-bottom">\n			<div class="mini-slider-l">\n				<div><a data-num="0" class="sl-mini-btn" href="#1">Распродажа в Timberland1</a></div>\n				<div><a data-num="1" class="sl-mini-btn" href="#2">Черный всегда в моде!2</a></div>\n				<div><a data-num="2" class="sl-mini-btn" href="#3">Коллекция SPORT от Juicy Couture3</a></div>\n				<div><a data-num="3" class="sl-mini-btn" href="#4">Скидки от NAF NAF4</a></div>\n				<div><a data-num="4" class="sl-mini-btn" href="#5">Спецпредоложение в Lee Cooper5</a></div>\n				<div><a data-num="5" class="sl-mini-btn" href="#6">Скидка 20% в New Balance6</a></div>\n				<div><a data-num="6" class="sl-mini-btn" href="#7">Открылись два магазина ALDO!7</a></div>\n			</div>\n			<div class="sl-nav"></div>\n			<div class="mini-slider-r">\n				<div><a data-num="0" class="sl-mini-btn" href="#1">Распродажа в Timberland1</a></div>\n				<div><a data-num="1" class="sl-mini-btn" href="#2">Черный всегда в моде!2</a></div>\n				<div><a data-num="2" class="sl-mini-btn" href="#3">Коллекция SPORT от Juicy Couture3</a></div>\n				<div><a data-num="3" class="sl-mini-btn" href="#4">Скидки от NAF NAF4</a></div>\n				<div><a data-num="4" class="sl-mini-btn" href="#5">Спецпредоложение в Lee Cooper5</a></div>\n				<div><a data-num="5" class="sl-mini-btn" href="#6">Скидка 20% в New Balance6</a></div>\n				<div><a data-num="6" class="sl-mini-btn" href="#7">Открылись два магазина ALDO!7</a></div>\n			</div>\n		</div>\n	</div>\n<? endif ?>\n\n<div class="content-wrap">\n	<? if ($APPLICATION->GetCurPage() == "/"): ?>\n		<div class="container">\n			<h1>О компании</h1>\n			<div class="content">\n				<p>Группа компаний «ДжамильКо» начала свою активную деятельность в сфере розничной торговли с 1993 года.\n				На сегодняшний день «ДжамильКо» — один из российских лидеров в области дистрибуции и маркетинга\n				высококачественной модной одежды и аксессуаров от ведущих мировых производителей.\n				</p>\n			</div>\n			<p class="title">Почему именно мы?</p>\n		</div>\n		<div class="slider-why">\n			<div class="container">\n				<div class="sl-top clearfix">\n					<div class="sw-item">\n						<a class="active" data-slw-num="0" href="#">\n							<div class="sw-img-wrap">\n								<img class="cur" src="<?=SITE_TEMPLATE_PATH?>/img/sw1.png" alt=""/>\n								<img class="hover" src="<?=SITE_TEMPLATE_PATH?>/img/swh1.png" alt=""/>\n							</div>\n							<div class="sw-text">20 лет <br/> опыта</div>\n						</a>\n					</div>\n					<div class="sw-item">\n						<a data-slw-num="1" href="#">\n							<div class="sw-img-wrap">\n								<img class="cur" src="<?=SITE_TEMPLATE_PATH?>/img/sw2.png" alt=""/>\n								<img class="hover" src="<?=SITE_TEMPLATE_PATH?>/img/swh2.png" alt=""/>\n							</div>\n							<div class="sw-text">экслюзивные бренды</div>\n						</a>\n					</div>\n					<div class="sw-item">\n						<a data-slw-num="2" href="#">\n							<div class="sw-img-wrap">\n								<img class="cur" src="<?=SITE_TEMPLATE_PATH?>/img/sw3.png" alt=""/>\n								<img class="hover" src="<?=SITE_TEMPLATE_PATH?>/img/swh3.png" alt=""/>\n							</div>\n							<div class="sw-text">140 магазинов</div>\n						</a>\n					</div>\n					<div class="sw-item">\n						<a data-slw-num="3" href="#">\n							<div class="sw-img-wrap">\n								<img class="cur" src="<?=SITE_TEMPLATE_PATH?>/img/sw4.png" alt=""/>\n								<img class="hover" src="<?=SITE_TEMPLATE_PATH?>/img/swh4.png" alt=""/>\n							</div>\n							<div class="sw-text">награды и премии</div>\n						</a>\n					</div>\n				</div>\n				<div class="sl-num"><span id="slw-cur">1</span> / <span class="sl-all">4</span></div>\n				<div class="sl-bottom">\n					<div class="swb-item">Группа компаний «ДжамильКо» <br/> основана и вышла на российский рынок товаров класса «люкс» в 1993 году</div>\n					<div class="swb-item">Компания работает с такими брендами, как BURBERRY, CHAUMET, De Beers, JAEGER, John Lobb, PAULE KA, Salvatore Ferragamo, SONIA RYKIEL, SONIA by SONIA RYKIEL, Vilebrequin, Wolford и многие другие.</div>\n					<div class="swb-item">3</div>\n					<div class="swb-item">В конце 2012 года компания «ЛВБ» была признана «Дистрибьютором года» в рамках ежегодной профессиональной премии в области модной индустрии PROFashion Awards 2012.</div>\n				</div>\n				<div class="why-more"><a href="#">Узнать больше о нас</a></div>\n			</div>\n		</div>\n		<div class="brands">\n			<div class="container">\n				<p class="h1">Бренды</p>\n				<div class="brands-wrap">\n					<div class="row brand-images">\n						<div class="col-xs-3 p0">\n							<div class="brand-item">\n								<a href="#">\n									<img class="brand-logo" src="<?=SITE_TEMPLATE_PATH?>/img/gray_brands_logos/1.png" alt=""/>\n									<img class="brand-logo-white" src="<?=SITE_TEMPLATE_PATH?>/img/white_brands_logos/1.png" alt=""/>\n									<img class="brand-hover" src="<?=SITE_TEMPLATE_PATH?>/img/brands_hovers/1.png" alt=""/>\n								</a>\n							</div>\n						</div>\n						<div class="col-xs-3 p0">\n							<div class="brand-item">\n								<a href="#">\n									<img class="brand-logo" src="<?=SITE_TEMPLATE_PATH?>/img/gray_brands_logos/2.png" alt=""/>\n									<img class="brand-logo-white" src="<?=SITE_TEMPLATE_PATH?>/img/white_brands_logos/2.png" alt=""/>\n									<img class="brand-hover" src="<?=SITE_TEMPLATE_PATH?>/img/brands_hovers/2.png" alt=""/>\n								</a>\n							</div>\n						</div>\n						<div class="col-xs-3 p0">\n							<div class="brand-item">\n								<a href="#">\n									<img class="brand-logo" src="<?=SITE_TEMPLATE_PATH?>/img/gray_brands_logos/3.png" alt=""/>\n									<img class="brand-logo-white" src="<?=SITE_TEMPLATE_PATH?>/img/white_brands_logos/3.png" alt=""/>\n									<img class="brand-hover" src="<?=SITE_TEMPLATE_PATH?>/img/brands_hovers/3.png" alt=""/>\n								</a>\n							</div>\n						</div>\n						<div class="col-xs-3 p0">\n							<div class="brand-item">\n								<a href="#">\n									<img class="brand-logo" src="<?=SITE_TEMPLATE_PATH?>/img/gray_brands_logos/4.png" alt=""/>\n									<img class="brand-logo-white" src="<?=SITE_TEMPLATE_PATH?>/img/white_brands_logos/4.png" alt=""/>\n									<img class="brand-hover" src="<?=SITE_TEMPLATE_PATH?>/img/brands_hovers/4.png" alt=""/>\n								</a>\n							</div>\n						</div>\n						<div class="col-xs-3 p0">\n							<div class="brand-item">\n								<a href="#">\n									<img class="brand-logo" src="<?=SITE_TEMPLATE_PATH?>/img/gray_brands_logos/5.png" alt=""/>\n									<img class="brand-logo-white" src="<?=SITE_TEMPLATE_PATH?>/img/white_brands_logos/5.png" alt=""/>\n									<img class="brand-hover" src="<?=SITE_TEMPLATE_PATH?>/img/brands_hovers/5.png" alt=""/>\n								</a>\n							</div>\n						</div>\n						<div class="col-xs-3 p0">\n							<div class="brand-item">\n								<a href="#">\n									<img class="brand-logo" src="<?=SITE_TEMPLATE_PATH?>/img/gray_brands_logos/6.png" alt=""/>\n									<img class="brand-logo-white" src="<?=SITE_TEMPLATE_PATH?>/img/white_brands_logos/6.png" alt=""/>\n									<img class="brand-hover" src="<?=SITE_TEMPLATE_PATH?>/img/brands_hovers/6.png" alt=""/>\n								</a>\n							</div>\n						</div>\n						<div class="col-xs-3 p0">\n							<div class="brand-item">\n								<a href="#">\n									<img class="brand-logo" src="<?=SITE_TEMPLATE_PATH?>/img/gray_brands_logos/7.png" alt=""/>\n									<img class="brand-logo-white" src="<?=SITE_TEMPLATE_PATH?>/img/white_brands_logos/7.png" alt=""/>\n									<img class="brand-hover" src="<?=SITE_TEMPLATE_PATH?>/img/brands_hovers/7.png" alt=""/>\n								</a>\n							</div>\n						</div>\n						<div class="col-xs-3 p0">\n							<div class="brand-item">\n								<a href="#">\n									<img class="brand-logo" src="<?=SITE_TEMPLATE_PATH?>/img/gray_brands_logos/8.png" alt=""/>\n									<img class="brand-logo-white" src="<?=SITE_TEMPLATE_PATH?>/img/white_brands_logos/8.png" alt=""/>\n									<img class="brand-hover" src="<?=SITE_TEMPLATE_PATH?>/img/brands_hovers/8.png" alt=""/>\n								</a>\n							</div>\n						</div>\n						<div class="col-xs-3 p0">\n							<div class="brand-item">\n								<a href="#">\n									<img class="brand-logo" src="<?=SITE_TEMPLATE_PATH?>/img/gray_brands_logos/9.png" alt=""/>\n									<img class="brand-logo-white" src="<?=SITE_TEMPLATE_PATH?>/img/white_brands_logos/9.png" alt=""/>\n									<img class="brand-hover" src="<?=SITE_TEMPLATE_PATH?>/img/brands_hovers/9.png" alt=""/>\n								</a>\n							</div>\n						</div>\n						<div class="col-xs-3 p0">\n							<div class="brand-item">\n								<a href="#">\n									<img class="brand-logo" src="<?=SITE_TEMPLATE_PATH?>/img/gray_brands_logos/10.png" alt=""/>\n									<img class="brand-logo-white" src="<?=SITE_TEMPLATE_PATH?>/img/white_brands_logos/10.png" alt=""/>\n									<img class="brand-hover" src="<?=SITE_TEMPLATE_PATH?>/img/brands_hovers/10.png" alt=""/>\n								</a>\n							</div>\n						</div>\n						<div class="col-xs-3 p0">\n							<div class="brand-item">\n								<a href="#">\n									<img class="brand-logo" src="<?=SITE_TEMPLATE_PATH?>/img/gray_brands_logos/11.png" alt=""/>\n									<img class="brand-logo-white" src="<?=SITE_TEMPLATE_PATH?>/img/white_brands_logos/11.png" alt=""/>\n									<img class="brand-hover" src="<?=SITE_TEMPLATE_PATH?>/img/brands_hovers/11.png" alt=""/>\n								</a>\n							</div>\n						</div>\n						<div class="col-xs-3 p0">\n							<div class="brand-item">\n								<a href="#">\n									<img class="brand-logo" src="<?=SITE_TEMPLATE_PATH?>/img/gray_brands_logos/12.png" alt=""/>\n									<img class="brand-logo-white" src="<?=SITE_TEMPLATE_PATH?>/img/white_brands_logos/12.png" alt=""/>\n									<img class="brand-hover" src="<?=SITE_TEMPLATE_PATH?>/img/brands_hovers/12.png" alt=""/>\n								</a>\n							</div>\n						</div>\n					</div>\n				</div>\n				<div class="submit">\n					<a href="#">Все бренды</a>\n				</div>\n			</div>\n		</div>\n		<div class="career">\n			<div class="container">\n				<div class="career-inner">\n					<div class="career-title">Карьера</div>\n					<div class="career-text">ИЩЕМ ЯРКИХ ПРОДАВЦОВ-КОНСУЛЬТАНТОВ</div>\n				   <div class="career-mail">Присылайте свои резюме по адресу: hr@jamilco.ru</div>\n				   <div class="career-phone">Телефон отдела по работе с персоналом: +7 495 745 88 95</div>\n					<div class="more"><a href="#">Подробнее</a></div>\n				</div>\n			</div>\n		</div>\n		<div class="news">\n			<div class="container">\n				<p class="h1">Новости</p>\n				<div class="news-wrap">\n					<div class="news-item-wrap">\n						<div class="news-item">\n							<a href="#">\n								<div class="news-img"><img src="<?=SITE_TEMPLATE_PATH?>/img/n1.jpg" alt=""/></div>\n								<div class="news-text">\n									<div class="news-title">разве СЕЗОН ЮБОК КОНЧИЛСЯ?</div>\n									<div class="news-preview">Пора узнать, какие юбки будут в моде этой осенью!</div>\n								</div>\n							</a>\n						</div>\n					</div>\n					<div class="news-item-wrap">\n						<div class="news-item">\n							<a href="#">\n								<div class="news-img"><img src="<?=SITE_TEMPLATE_PATH?>/img/n2.jpg" alt=""/></div>\n								<div class="news-text">\n									<div class="news-title">ЦВЕТА ОСЕННЕГО СЕЗОНА!</div>\n									<div class="news-preview">Еще не знаете осенние тенденции? Мы подскажем!</div>\n								</div>\n							</a>\n						</div>\n					</div>\n					<div class="news-item-wrap">\n						<div class="news-item">\n							<a href="#">\n								<div class="news-img"><img src="<?=SITE_TEMPLATE_PATH?>/img/n3.jpg" alt=""/></div>\n								<div class="news-text">\n									<div class="news-title">ВСТРЕЧАЕМ ОСЕНЬ 2014 МОДНО!</div>\n									<div class="news-preview">Какие тенденции наблюдаются этой осенью?</div>\n								</div>\n							</a>\n						</div>\n					</div>\n				</div>\n				<div class="submit">\n					<a href="#">Все новости</a>\n				</div>\n			</div>\n		</div>\n	<? else: ?>\n		<div class="container">\n			<h1><?$APPLICATION->ShowTitle(false)?></h1>\n	<? endif ?>";}', 1, 1433360403),
('1fcab9c78b966ebe959b21bc95188a298', 'fileman', 'edit_component_props', 'CFileman::UndoEditFile', 'a:2:{s:7:"absPath";s:81:"/home/users1/k/kimry/domains/jamilco.3-core.ru/local/templates/jamilco/header.php";s:7:"content";s:19408:"<?if(!defined("B_PROLOG_INCLUDED") || B_PROLOG_INCLUDED!==true)die();?>\n<?\n\n?>\n<!DOCTYPE html>\n<html lang="ru">\n<head>\n	<meta charset="utf-8">\n    <meta http-equiv="X-UA-Compatible" content="IE=edge">\n    <meta name="author" content="">\n    <link rel="icon" href="<?=SITE_TEMPLATE_PATH?>/favicon.ico">\n\n    <title><?$APPLICATION->ShowTitle()?></title>\n\n    <!-- Bootstrap core CSS -->\n	<? $APPLICATION->SetAdditionalCSS(SITE_TEMPLATE_PATH.''/css/bootstrap.min.css''); ?>\n	<? $APPLICATION->SetAdditionalCSS(SITE_TEMPLATE_PATH.''/css/dialog.css''); ?>\n	<? $APPLICATION->SetAdditionalCSS(SITE_TEMPLATE_PATH.''/css/dialog-sandra.css''); ?>\n	<? $APPLICATION->SetAdditionalCSS(SITE_TEMPLATE_PATH.''/owl/owl.carousel.css''); ?>\n	<? $APPLICATION->SetAdditionalCSS(SITE_TEMPLATE_PATH.''/owl/animate.css''); ?>\n	<? $APPLICATION->SetAdditionalCSS(SITE_TEMPLATE_PATH.''/css/style.css''); ?>\n	\n	<? $APPLICATION->AddHeadScript(SITE_TEMPLATE_PATH.''/js/ie-emulation-modes-warning.js''); ?>\n	<? $APPLICATION->AddHeadScript(SITE_TEMPLATE_PATH.''/js/ie10-viewport-bug-workaround.js''); ?>\n    <link href=''http://fonts.googleapis.com/css?family=PT+Serif:400,700,400italic,700italic&subset=latin,cyrillic-ext'' rel=''stylesheet'' type=''text/css''>\n\n    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->\n    <!--[if lt IE 9]>\n    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>\n    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>\n	<![endif]-->\n	\n	<?$APPLICATION->ShowHead();?>\n</head>\n<body>\n<div id="panel"><?$APPLICATION->ShowPanel();?></div>\n	\n<!-- Begin page content -->\n<div class="header-line">\n	<div class="container">\n		<div class="shops pull-left"><a href="/shops/">Магазины</a></div>\n		<div class="phone pull-left">+7 (495) 705 93 38</div>\n		<div class="find pull-right">\n			<form action="search.html" method="get" id="search-form">\n				<a href="javascript:void(0);"></a>\n				<input type="text" placeholder="Найти..." name="q" value=""/>\n			</form>\n			<div class="clearfix"></div>\n		</div>\n		<div class="auth-link pull-right"><a data-dialog="authorization"  href="javascript:void(0);"></a></div>\n		<div class="links l2 pull-right"><a href="/wholesale/">оптовые продажи</a></div>\n		<div class="links l1 pull-right"><a href="/franchising/">франчайзинг</a></div>\n		<div class="clearfix"></div>\n	</div>\n</div>\n	\n<div class="logo">\n    <div class="container text-center"><a href="/"><img src="<?=SITE_TEMPLATE_PATH?>/img/logo.png" alt=""/></a>\n    </div>\n</div>\n\n<?$APPLICATION->IncludeComponent("bitrix:menu", ".default", Array(\n		"ROOT_MENU_TYPE" => "top",	// Тип меню для первого уровня\n		"MAX_LEVEL" => "1",	// Уровень вложенности меню\n		"CHILD_MENU_TYPE" => "left",	// Тип меню для остальных уровней\n		"USE_EXT" => "N",	// Подключать файлы с именами вида .тип_меню.menu_ext.php\n		"DELAY" => "N",	// Откладывать выполнение шаблона меню\n		"ALLOW_MULTI_SELECT" => "N",	// Разрешить несколько активных пунктов одновременно\n		"MENU_CACHE_TYPE" => "A",	// Тип кеширования\n		"MENU_CACHE_TIME" => "3600",	// Время кеширования (сек.)\n		"MENU_CACHE_USE_GROUPS" => "Y",	// Учитывать права доступа\n		"MENU_CACHE_GET_VARS" => "",	// Значимые переменные запроса\n	),\n	false\n);?>\n\n<div class="main-menu-wrap">\n    <div class="container">\n        <div class="main-menu">\n            <ul class="clearfix">\n                <li><a href="#">О компании</a></li>\n                <li><a href="#">Бренды</a></li>\n                <li><a href="#">Покупателям</a></li>\n                <li><a href="#">Новости</a></li>\n                <li><a href="#">Карьера</a></li>\n                <li><a href="#">Контакты</a></li>\n            </ul>\n        </div>\n    </div>\n</div>\n\n<? if ($APPLICATION->GetCurPage() == "/"): ?>\n	<div class="slider-main">\n		<div class="slider">\n			<div class="sl-item">\n				<div class="img-wrap">\n					<img src="<?=SITE_TEMPLATE_PATH?>/img/sl1.jpg" alt=""/>\n				</div>\n				<div class="text">\n					<div class="title">title1</div>\n					<div class="preview">preview1</div>\n					<div class="more"><a href="#">Подробнее</a></div>\n				</div>\n			</div>\n			<div class="sl-item">\n				<div class="img-wrap">\n					<img src="<?=SITE_TEMPLATE_PATH?>/img/sl2.jpg" alt=""/>\n				</div>\n				<div class="text">\n					<div class="title">title2</div>\n					<div class="preview">preview2</div>\n					<div class="more"><a href="#">Подробнее</a></div>\n				</div>\n			</div>\n			<div class="sl-item">\n				<div class="img-wrap">\n					<img src="<?=SITE_TEMPLATE_PATH?>/img/sl1.jpg" alt=""/>\n				</div>\n				<div class="text">\n					<div class="title">Совершай покупки в NAF NAF и получай подарки!</div>\n					<div class="preview">При покупке 2-х изделий мы рады подарить вам изящную бижутерию, при покупке трех – яркий лак для ногтей, а при покупке 4-х и более – чехол для смартфона!</div>\n					<div class="more"><a href="#">Подробнее</a></div>\n				</div>\n			</div>\n			<div class="sl-item">\n				<div class="img-wrap">\n					<img src="<?=SITE_TEMPLATE_PATH?>/img/sl2.jpg" alt=""/>\n				</div>\n					<div class="text">\n						<div class="title">title4</div>\n						<div class="preview">preview4</div>\n						<div class="more"><a href="#">Подробнее</a></div>\n					</div>\n			</div>\n			<div class="sl-item">\n				<div class="img-wrap">\n					<img src="<?=SITE_TEMPLATE_PATH?>/img/sl1.jpg" alt=""/>\n				</div>\n					<div class="text">\n						<div class="title">title5</div>\n						<div class="preview">preview5</div>\n						<div class="more"><a href="#">Подробнее</a></div>\n					</div>\n			</div>\n			<div class="sl-item">\n				<div class="img-wrap">\n					<img src="<?=SITE_TEMPLATE_PATH?>/img/sl2.jpg" alt=""/>\n				</div>\n					<div class="text">\n						<div class="title">title6</div>\n						<div class="preview">preview6</div>\n						<div class="more"><a href="#">Подробнее</a></div>\n					</div>\n			</div>\n			<div class="sl-item">\n				<div class="img-wrap">\n					<img src="<?=SITE_TEMPLATE_PATH?>/img/sl1.jpg" alt=""/>\n				</div>\n					<div class="text">\n						<div class="title">title7</div>\n						<div class="preview">preview7</div>\n						<div class="more"><a href="#">Подробнее</a></div>\n					</div>\n			</div>\n		</div>\n		<div class="slider-bottom">\n			<div class="mini-slider-l">\n				<div><a data-num="0" class="sl-mini-btn" href="#1">Распродажа в Timberland1</a></div>\n				<div><a data-num="1" class="sl-mini-btn" href="#2">Черный всегда в моде!2</a></div>\n				<div><a data-num="2" class="sl-mini-btn" href="#3">Коллекция SPORT от Juicy Couture3</a></div>\n				<div><a data-num="3" class="sl-mini-btn" href="#4">Скидки от NAF NAF4</a></div>\n				<div><a data-num="4" class="sl-mini-btn" href="#5">Спецпредоложение в Lee Cooper5</a></div>\n				<div><a data-num="5" class="sl-mini-btn" href="#6">Скидка 20% в New Balance6</a></div>\n				<div><a data-num="6" class="sl-mini-btn" href="#7">Открылись два магазина ALDO!7</a></div>\n			</div>\n			<div class="sl-nav"></div>\n			<div class="mini-slider-r">\n				<div><a data-num="0" class="sl-mini-btn" href="#1">Распродажа в Timberland1</a></div>\n				<div><a data-num="1" class="sl-mini-btn" href="#2">Черный всегда в моде!2</a></div>\n				<div><a data-num="2" class="sl-mini-btn" href="#3">Коллекция SPORT от Juicy Couture3</a></div>\n				<div><a data-num="3" class="sl-mini-btn" href="#4">Скидки от NAF NAF4</a></div>\n				<div><a data-num="4" class="sl-mini-btn" href="#5">Спецпредоложение в Lee Cooper5</a></div>\n				<div><a data-num="5" class="sl-mini-btn" href="#6">Скидка 20% в New Balance6</a></div>\n				<div><a data-num="6" class="sl-mini-btn" href="#7">Открылись два магазина ALDO!7</a></div>\n			</div>\n		</div>\n	</div>\n<? endif ?>\n\n<div class="content-wrap">\n	<? if ($APPLICATION->GetCurPage() == "/"): ?>\n		<div class="container">\n			<h1>О компании</h1>\n			<div class="content">\n				<p>Группа компаний «ДжамильКо» начала свою активную деятельность в сфере розничной торговли с 1993 года.\n				На сегодняшний день «ДжамильКо» — один из российских лидеров в области дистрибуции и маркетинга\n				высококачественной модной одежды и аксессуаров от ведущих мировых производителей.\n				</p>\n			</div>\n			<p class="title">Почему именно мы?</p>\n		</div>\n		<div class="slider-why">\n			<div class="container">\n				<div class="sl-top clearfix">\n					<div class="sw-item">\n						<a class="active" data-slw-num="0" href="#">\n							<div class="sw-img-wrap">\n								<img class="cur" src="<?=SITE_TEMPLATE_PATH?>/img/sw1.png" alt=""/>\n								<img class="hover" src="<?=SITE_TEMPLATE_PATH?>/img/swh1.png" alt=""/>\n							</div>\n							<div class="sw-text">20 лет <br/> опыта</div>\n						</a>\n					</div>\n					<div class="sw-item">\n						<a data-slw-num="1" href="#">\n							<div class="sw-img-wrap">\n								<img class="cur" src="<?=SITE_TEMPLATE_PATH?>/img/sw2.png" alt=""/>\n								<img class="hover" src="<?=SITE_TEMPLATE_PATH?>/img/swh2.png" alt=""/>\n							</div>\n							<div class="sw-text">экслюзивные бренды</div>\n						</a>\n					</div>\n					<div class="sw-item">\n						<a data-slw-num="2" href="#">\n							<div class="sw-img-wrap">\n								<img class="cur" src="<?=SITE_TEMPLATE_PATH?>/img/sw3.png" alt=""/>\n								<img class="hover" src="<?=SITE_TEMPLATE_PATH?>/img/swh3.png" alt=""/>\n							</div>\n							<div class="sw-text">140 магазинов</div>\n						</a>\n					</div>\n					<div class="sw-item">\n						<a data-slw-num="3" href="#">\n							<div class="sw-img-wrap">\n								<img class="cur" src="<?=SITE_TEMPLATE_PATH?>/img/sw4.png" alt=""/>\n								<img class="hover" src="<?=SITE_TEMPLATE_PATH?>/img/swh4.png" alt=""/>\n							</div>\n							<div class="sw-text">награды и премии</div>\n						</a>\n					</div>\n				</div>\n				<div class="sl-num"><span id="slw-cur">1</span> / <span class="sl-all">4</span></div>\n				<div class="sl-bottom">\n					<div class="swb-item">Группа компаний «ДжамильКо» <br/> основана и вышла на российский рынок товаров класса «люкс» в 1993 году</div>\n					<div class="swb-item">Компания работает с такими брендами, как BURBERRY, CHAUMET, De Beers, JAEGER, John Lobb, PAULE KA, Salvatore Ferragamo, SONIA RYKIEL, SONIA by SONIA RYKIEL, Vilebrequin, Wolford и многие другие.</div>\n					<div class="swb-item">3</div>\n					<div class="swb-item">В конце 2012 года компания «ЛВБ» была признана «Дистрибьютором года» в рамках ежегодной профессиональной премии в области модной индустрии PROFashion Awards 2012.</div>\n				</div>\n				<div class="why-more"><a href="#">Узнать больше о нас</a></div>\n			</div>\n		</div>\n		<div class="brands">\n			<div class="container">\n				<p class="h1">Бренды</p>\n				<div class="brands-wrap">\n					<div class="row brand-images">\n						<div class="col-xs-3 p0">\n							<div class="brand-item">\n								<a href="#">\n									<img class="brand-logo" src="<?=SITE_TEMPLATE_PATH?>/img/gray_brands_logos/1.png" alt=""/>\n									<img class="brand-logo-white" src="<?=SITE_TEMPLATE_PATH?>/img/white_brands_logos/1.png" alt=""/>\n									<img class="brand-hover" src="<?=SITE_TEMPLATE_PATH?>/img/brands_hovers/1.png" alt=""/>\n								</a>\n							</div>\n						</div>\n						<div class="col-xs-3 p0">\n							<div class="brand-item">\n								<a href="#">\n									<img class="brand-logo" src="<?=SITE_TEMPLATE_PATH?>/img/gray_brands_logos/2.png" alt=""/>\n									<img class="brand-logo-white" src="<?=SITE_TEMPLATE_PATH?>/img/white_brands_logos/2.png" alt=""/>\n									<img class="brand-hover" src="<?=SITE_TEMPLATE_PATH?>/img/brands_hovers/2.png" alt=""/>\n								</a>\n							</div>\n						</div>\n						<div class="col-xs-3 p0">\n							<div class="brand-item">\n								<a href="#">\n									<img class="brand-logo" src="<?=SITE_TEMPLATE_PATH?>/img/gray_brands_logos/3.png" alt=""/>\n									<img class="brand-logo-white" src="<?=SITE_TEMPLATE_PATH?>/img/white_brands_logos/3.png" alt=""/>\n									<img class="brand-hover" src="<?=SITE_TEMPLATE_PATH?>/img/brands_hovers/3.png" alt=""/>\n								</a>\n							</div>\n						</div>\n						<div class="col-xs-3 p0">\n							<div class="brand-item">\n								<a href="#">\n									<img class="brand-logo" src="<?=SITE_TEMPLATE_PATH?>/img/gray_brands_logos/4.png" alt=""/>\n									<img class="brand-logo-white" src="<?=SITE_TEMPLATE_PATH?>/img/white_brands_logos/4.png" alt=""/>\n									<img class="brand-hover" src="<?=SITE_TEMPLATE_PATH?>/img/brands_hovers/4.png" alt=""/>\n								</a>\n							</div>\n						</div>\n						<div class="col-xs-3 p0">\n							<div class="brand-item">\n								<a href="#">\n									<img class="brand-logo" src="<?=SITE_TEMPLATE_PATH?>/img/gray_brands_logos/5.png" alt=""/>\n									<img class="brand-logo-white" src="<?=SITE_TEMPLATE_PATH?>/img/white_brands_logos/5.png" alt=""/>\n									<img class="brand-hover" src="<?=SITE_TEMPLATE_PATH?>/img/brands_hovers/5.png" alt=""/>\n								</a>\n							</div>\n						</div>\n						<div class="col-xs-3 p0">\n							<div class="brand-item">\n								<a href="#">\n									<img class="brand-logo" src="<?=SITE_TEMPLATE_PATH?>/img/gray_brands_logos/6.png" alt=""/>\n									<img class="brand-logo-white" src="<?=SITE_TEMPLATE_PATH?>/img/white_brands_logos/6.png" alt=""/>\n									<img class="brand-hover" src="<?=SITE_TEMPLATE_PATH?>/img/brands_hovers/6.png" alt=""/>\n								</a>\n							</div>\n						</div>\n						<div class="col-xs-3 p0">\n							<div class="brand-item">\n								<a href="#">\n									<img class="brand-logo" src="<?=SITE_TEMPLATE_PATH?>/img/gray_brands_logos/7.png" alt=""/>\n									<img class="brand-logo-white" src="<?=SITE_TEMPLATE_PATH?>/img/white_brands_logos/7.png" alt=""/>\n									<img class="brand-hover" src="<?=SITE_TEMPLATE_PATH?>/img/brands_hovers/7.png" alt=""/>\n								</a>\n							</div>\n						</div>\n						<div class="col-xs-3 p0">\n							<div class="brand-item">\n								<a href="#">\n									<img class="brand-logo" src="<?=SITE_TEMPLATE_PATH?>/img/gray_brands_logos/8.png" alt=""/>\n									<img class="brand-logo-white" src="<?=SITE_TEMPLATE_PATH?>/img/white_brands_logos/8.png" alt=""/>\n									<img class="brand-hover" src="<?=SITE_TEMPLATE_PATH?>/img/brands_hovers/8.png" alt=""/>\n								</a>\n							</div>\n						</div>\n						<div class="col-xs-3 p0">\n							<div class="brand-item">\n								<a href="#">\n									<img class="brand-logo" src="<?=SITE_TEMPLATE_PATH?>/img/gray_brands_logos/9.png" alt=""/>\n									<img class="brand-logo-white" src="<?=SITE_TEMPLATE_PATH?>/img/white_brands_logos/9.png" alt=""/>\n									<img class="brand-hover" src="<?=SITE_TEMPLATE_PATH?>/img/brands_hovers/9.png" alt=""/>\n								</a>\n							</div>\n						</div>\n						<div class="col-xs-3 p0">\n							<div class="brand-item">\n								<a href="#">\n									<img class="brand-logo" src="<?=SITE_TEMPLATE_PATH?>/img/gray_brands_logos/10.png" alt=""/>\n									<img class="brand-logo-white" src="<?=SITE_TEMPLATE_PATH?>/img/white_brands_logos/10.png" alt=""/>\n									<img class="brand-hover" src="<?=SITE_TEMPLATE_PATH?>/img/brands_hovers/10.png" alt=""/>\n								</a>\n							</div>\n						</div>\n						<div class="col-xs-3 p0">\n							<div class="brand-item">\n								<a href="#">\n									<img class="brand-logo" src="<?=SITE_TEMPLATE_PATH?>/img/gray_brands_logos/11.png" alt=""/>\n									<img class="brand-logo-white" src="<?=SITE_TEMPLATE_PATH?>/img/white_brands_logos/11.png" alt=""/>\n									<img class="brand-hover" src="<?=SITE_TEMPLATE_PATH?>/img/brands_hovers/11.png" alt=""/>\n								</a>\n							</div>\n						</div>\n						<div class="col-xs-3 p0">\n							<div class="brand-item">\n								<a href="#">\n									<img class="brand-logo" src="<?=SITE_TEMPLATE_PATH?>/img/gray_brands_logos/12.png" alt=""/>\n									<img class="brand-logo-white" src="<?=SITE_TEMPLATE_PATH?>/img/white_brands_logos/12.png" alt=""/>\n									<img class="brand-hover" src="<?=SITE_TEMPLATE_PATH?>/img/brands_hovers/12.png" alt=""/>\n								</a>\n							</div>\n						</div>\n					</div>\n				</div>\n				<div class="submit">\n					<a href="#">Все бренды</a>\n				</div>\n			</div>\n		</div>\n		<div class="career">\n			<div class="container">\n				<div class="career-inner">\n					<div class="career-title">Карьера</div>\n					<div class="career-text">ИЩЕМ ЯРКИХ ПРОДАВЦОВ-КОНСУЛЬТАНТОВ</div>\n				   <div class="career-mail">Присылайте свои резюме по адресу: hr@jamilco.ru</div>\n				   <div class="career-phone">Телефон отдела по работе с персоналом: +7 495 745 88 95</div>\n					<div class="more"><a href="#">Подробнее</a></div>\n				</div>\n			</div>\n		</div>\n		<div class="news">\n			<div class="container">\n				<p class="h1">Новости</p>\n				<div class="news-wrap">\n					<div class="news-item-wrap">\n						<div class="news-item">\n							<a href="#">\n								<div class="news-img"><img src="<?=SITE_TEMPLATE_PATH?>/img/n1.jpg" alt=""/></div>\n								<div class="news-text">\n									<div class="news-title">разве СЕЗОН ЮБОК КОНЧИЛСЯ?</div>\n									<div class="news-preview">Пора узнать, какие юбки будут в моде этой осенью!</div>\n								</div>\n							</a>\n						</div>\n					</div>\n					<div class="news-item-wrap">\n						<div class="news-item">\n							<a href="#">\n								<div class="news-img"><img src="<?=SITE_TEMPLATE_PATH?>/img/n2.jpg" alt=""/></div>\n								<div class="news-text">\n									<div class="news-title">ЦВЕТА ОСЕННЕГО СЕЗОНА!</div>\n									<div class="news-preview">Еще не знаете осенние тенденции? Мы подскажем!</div>\n								</div>\n							</a>\n						</div>\n					</div>\n					<div class="news-item-wrap">\n						<div class="news-item">\n							<a href="#">\n								<div class="news-img"><img src="<?=SITE_TEMPLATE_PATH?>/img/n3.jpg" alt=""/></div>\n								<div class="news-text">\n									<div class="news-title">ВСТРЕЧАЕМ ОСЕНЬ 2014 МОДНО!</div>\n									<div class="news-preview">Какие тенденции наблюдаются этой осенью?</div>\n								</div>\n							</a>\n						</div>\n					</div>\n				</div>\n				<div class="submit">\n					<a href="#">Все новости</a>\n				</div>\n			</div>\n		</div>\n	<? else: ?>\n		<div class="container">\n			<h1><?$APPLICATION->ShowTitle(false)?></h1>\n	<? endif ?>";}', 1, 1433360462),
('1d146c6019a2a51202c2477fee887d587', 'fileman', 'edit_file', 'CFileman::UndoEditFile', 'a:2:{s:7:"absPath";s:56:"/home/users1/k/kimry/domains/jamilco.3-core.ru/index.php";s:7:"content";s:1125:"<?\nrequire($_SERVER["DOCUMENT_ROOT"]."/bitrix/header.php");\n$APPLICATION->SetTitle("Jamilco");\n?>\n<?$APPLICATION->IncludeComponent("bitrix:menu", ".default", Array(\n		"ROOT_MENU_TYPE" => "top",	// Тип меню для первого уровня\n		"MAX_LEVEL" => "1",	// Уровень вложенности меню\n		"CHILD_MENU_TYPE" => "left",	// Тип меню для остальных уровней\n		"USE_EXT" => "N",	// Подключать файлы с именами вида .тип_меню.menu_ext.php\n		"DELAY" => "N",	// Откладывать выполнение шаблона меню\n		"ALLOW_MULTI_SELECT" => "N",	// Разрешить несколько активных пунктов одновременно\n		"MENU_CACHE_TYPE" => "A",	// Тип кеширования\n		"MENU_CACHE_TIME" => "3600",	// Время кеширования (сек.)\n		"MENU_CACHE_USE_GROUPS" => "Y",	// Учитывать права доступа\n		"MENU_CACHE_GET_VARS" => "",	// Значимые переменные запроса\n	),\n	false\n);?>\n<?require($_SERVER["DOCUMENT_ROOT"]."/bitrix/footer.php");?>";}', 1, 1433360602),
('1b1bc37cfe4d1a4686bf45790e581a9d1', 'fileman', 'edit_component_props', 'CFileman::UndoEditFile', 'a:2:{s:7:"absPath";s:56:"/home/users1/k/kimry/domains/jamilco.3-core.ru/index.php";s:7:"content";s:509:"<?\nrequire($_SERVER["DOCUMENT_ROOT"]."/bitrix/header.php");\n$APPLICATION->SetTitle("Jamilco");\n?><?$APPLICATION->IncludeComponent(\n	"bitrix:menu",\n	".default",\n	Array(\n		"ROOT_MENU_TYPE" => "top",\n		"MAX_LEVEL" => "1",\n		"CHILD_MENU_TYPE" => "left",\n		"USE_EXT" => "N",\n		"DELAY" => "N",\n		"ALLOW_MULTI_SELECT" => "N",\n		"MENU_CACHE_TYPE" => "A",\n		"MENU_CACHE_TIME" => "3600",\n		"MENU_CACHE_USE_GROUPS" => "Y",\n		"MENU_CACHE_GET_VARS" => ""\n	)\n);?><?require($_SERVER["DOCUMENT_ROOT"]."/bitrix/footer.php");?>";}', 1, 1433360613),
('143fa3e3f11d983e5264dbede71977948', 'fileman', 'edit_file', 'CFileman::UndoEditFile', 'a:2:{s:7:"absPath";s:88:"/home/users1/k/kimry/domains/jamilco.3-core.ru/local/templates/jamilco/include/phone.php";s:7:"content";s:18:"+7 (495) 705 93 38";}', 1, 1433361479),
('1929b487b169e72797f294436290440f5', 'fileman', 'edit_file', 'CFileman::UndoEditFile', 'a:2:{s:7:"absPath";s:56:"/home/users1/k/kimry/domains/jamilco.3-core.ru/index.php";s:7:"content";s:159:"<?\nrequire($_SERVER["DOCUMENT_ROOT"]."/bitrix/header.php");\n$APPLICATION->SetTitle("Jamilco");\n?>\n\n<?require($_SERVER["DOCUMENT_ROOT"]."/bitrix/footer.php");?>";}', 1, 1433362475),
('16fca68a80a312299a369e123bf8c84cd', 'fileman', 'edit_file', 'CFileman::UndoEditFile', 'a:2:{s:7:"absPath";s:56:"/home/users1/k/kimry/domains/jamilco.3-core.ru/index.php";s:7:"content";s:1578:"<?\nrequire($_SERVER["DOCUMENT_ROOT"]."/bitrix/header.php");\n$APPLICATION->SetTitle("Jamilco");\n?><?$APPLICATION->IncludeComponent(\n	"bitrix:news.list",\n	"",\n	Array(\n		"IBLOCK_TYPE" => "content",\n		"IBLOCK_ID" => "3",\n		"NEWS_COUNT" => "20",\n		"SORT_BY1" => "ACTIVE_FROM",\n		"SORT_ORDER1" => "DESC",\n		"SORT_BY2" => "SORT",\n		"SORT_ORDER2" => "ASC",\n		"FILTER_NAME" => "",\n		"FIELD_CODE" => array("","undefined",""),\n		"PROPERTY_CODE" => array("","undefined",""),\n		"CHECK_DATES" => "Y",\n		"DETAIL_URL" => "",\n		"AJAX_MODE" => "N",\n		"AJAX_OPTION_JUMP" => "N",\n		"AJAX_OPTION_STYLE" => "Y",\n		"AJAX_OPTION_HISTORY" => "N",\n		"CACHE_TYPE" => "A",\n		"CACHE_TIME" => "36000000",\n		"CACHE_FILTER" => "N",\n		"CACHE_GROUPS" => "Y",\n		"PREVIEW_TRUNCATE_LEN" => "",\n		"ACTIVE_DATE_FORMAT" => "d.m.Y",\n		"SET_TITLE" => "Y",\n		"SET_BROWSER_TITLE" => "Y",\n		"SET_META_KEYWORDS" => "Y",\n		"SET_META_DESCRIPTION" => "Y",\n		"SET_STATUS_404" => "N",\n		"INCLUDE_IBLOCK_INTO_CHAIN" => "Y",\n		"ADD_SECTIONS_CHAIN" => "Y",\n		"HIDE_LINK_WHEN_NO_DETAIL" => "N",\n		"PARENT_SECTION" => "",\n		"PARENT_SECTION_CODE" => "",\n		"INCLUDE_SUBSECTIONS" => "Y",\n		"DISPLAY_DATE" => "Y",\n		"DISPLAY_NAME" => "Y",\n		"DISPLAY_PICTURE" => "Y",\n		"DISPLAY_PREVIEW_TEXT" => "Y",\n		"PAGER_TEMPLATE" => ".default",\n		"DISPLAY_TOP_PAGER" => "N",\n		"DISPLAY_BOTTOM_PAGER" => "Y",\n		"PAGER_TITLE" => "Новости",\n		"PAGER_SHOW_ALWAYS" => "N",\n		"PAGER_DESC_NUMBERING" => "N",\n		"PAGER_DESC_NUMBERING_CACHE_TIME" => "36000",\n		"PAGER_SHOW_ALL" => "N"\n	)\n);?><?require($_SERVER["DOCUMENT_ROOT"]."/bitrix/footer.php");?>";}', 1, 1433362564),
('1dbe7c4a70d910e92c08a5640f07a3ad0', 'fileman', 'edit_file', 'CFileman::UndoEditFile', 'a:2:{s:7:"absPath";s:56:"/home/users1/k/kimry/domains/jamilco.3-core.ru/index.php";s:7:"content";s:1578:"<?\nrequire($_SERVER["DOCUMENT_ROOT"]."/bitrix/header.php");\n$APPLICATION->SetTitle("Jamilco");\n?><?$APPLICATION->IncludeComponent(\n	"bitrix:news.list",\n	"",\n	Array(\n		"IBLOCK_TYPE" => "content",\n		"IBLOCK_ID" => "3",\n		"NEWS_COUNT" => "20",\n		"SORT_BY1" => "ACTIVE_FROM",\n		"SORT_ORDER1" => "DESC",\n		"SORT_BY2" => "SORT",\n		"SORT_ORDER2" => "ASC",\n		"FILTER_NAME" => "",\n		"FIELD_CODE" => array("","undefined",""),\n		"PROPERTY_CODE" => array("","undefined",""),\n		"CHECK_DATES" => "Y",\n		"DETAIL_URL" => "",\n		"AJAX_MODE" => "N",\n		"AJAX_OPTION_JUMP" => "N",\n		"AJAX_OPTION_STYLE" => "Y",\n		"AJAX_OPTION_HISTORY" => "N",\n		"CACHE_TYPE" => "A",\n		"CACHE_TIME" => "36000000",\n		"CACHE_FILTER" => "N",\n		"CACHE_GROUPS" => "Y",\n		"PREVIEW_TRUNCATE_LEN" => "",\n		"ACTIVE_DATE_FORMAT" => "d.m.Y",\n		"SET_TITLE" => "Y",\n		"SET_BROWSER_TITLE" => "Y",\n		"SET_META_KEYWORDS" => "Y",\n		"SET_META_DESCRIPTION" => "Y",\n		"SET_STATUS_404" => "N",\n		"INCLUDE_IBLOCK_INTO_CHAIN" => "Y",\n		"ADD_SECTIONS_CHAIN" => "Y",\n		"HIDE_LINK_WHEN_NO_DETAIL" => "N",\n		"PARENT_SECTION" => "",\n		"PARENT_SECTION_CODE" => "",\n		"INCLUDE_SUBSECTIONS" => "Y",\n		"DISPLAY_DATE" => "Y",\n		"DISPLAY_NAME" => "Y",\n		"DISPLAY_PICTURE" => "Y",\n		"DISPLAY_PREVIEW_TEXT" => "Y",\n		"PAGER_TEMPLATE" => ".default",\n		"DISPLAY_TOP_PAGER" => "N",\n		"DISPLAY_BOTTOM_PAGER" => "Y",\n		"PAGER_TITLE" => "Новости",\n		"PAGER_SHOW_ALWAYS" => "N",\n		"PAGER_DESC_NUMBERING" => "N",\n		"PAGER_DESC_NUMBERING_CACHE_TIME" => "36000",\n		"PAGER_SHOW_ALL" => "N"\n	)\n);?><?require($_SERVER["DOCUMENT_ROOT"]."/bitrix/footer.php");?>";}', 1, 1433362658);
INSERT INTO `b_undo` (`ID`, `MODULE_ID`, `UNDO_TYPE`, `UNDO_HANDLER`, `CONTENT`, `USER_ID`, `TIMESTAMP_X`) VALUES
('1c19b4fba820c9da5753e52633ed6ddbe', 'fileman', 'edit_component_props', 'CFileman::UndoEditFile', 'a:2:{s:7:"absPath";s:70:"/home/users1/k/kimry/domains/jamilco.3-core.ru/about-company/index.php";s:7:"content";s:4483:"<?\nrequire($_SERVER["DOCUMENT_ROOT"]."/bitrix/header.php");\n$APPLICATION->SetTitle("О компании");\n?><?$APPLICATION->IncludeComponent("bitrix:news.list", "brands", Array(\n	"IBLOCK_TYPE" => "content",	// Тип информационного блока (используется только для проверки)\n		"IBLOCK_ID" => "4",	// Код информационного блока\n		"NEWS_COUNT" => "20",	// Количество новостей на странице\n		"SORT_BY1" => "ACTIVE_FROM",	// Поле для первой сортировки новостей\n		"SORT_ORDER1" => "DESC",	// Направление для первой сортировки новостей\n		"SORT_BY2" => "SORT",	// Поле для второй сортировки новостей\n		"SORT_ORDER2" => "ASC",	// Направление для второй сортировки новостей\n		"FILTER_NAME" => "",	// Фильтр\n		"FIELD_CODE" => array(	// Поля\n			0 => "",\n			1 => "",\n			2 => "",\n			3 => "",\n		),\n		"PROPERTY_CODE" => array(	// Свойства\n			0 => "",\n			1 => "LOGO",\n			2 => "LOGO_HOVER",\n			3 => "LOGO_PICTURE",\n		),\n		"CHECK_DATES" => "Y",	// Показывать только активные на данный момент элементы\n		"DETAIL_URL" => "",	// URL страницы детального просмотра (по умолчанию - из настроек инфоблока)\n		"AJAX_MODE" => "N",	// Включить режим AJAX\n		"AJAX_OPTION_JUMP" => "N",	// Включить прокрутку к началу компонента\n		"AJAX_OPTION_STYLE" => "Y",	// Включить подгрузку стилей\n		"AJAX_OPTION_HISTORY" => "N",	// Включить эмуляцию навигации браузера\n		"CACHE_TYPE" => "A",	// Тип кеширования\n		"CACHE_TIME" => "36000000",	// Время кеширования (сек.)\n		"CACHE_FILTER" => "N",	// Кешировать при установленном фильтре\n		"CACHE_GROUPS" => "Y",	// Учитывать права доступа\n		"PREVIEW_TRUNCATE_LEN" => "",	// Максимальная длина анонса для вывода (только для типа текст)\n		"ACTIVE_DATE_FORMAT" => "d.m.Y",	// Формат показа даты\n		"SET_TITLE" => "N",	// Устанавливать заголовок страницы\n		"SET_BROWSER_TITLE" => "N",	// Устанавливать заголовок окна браузера\n		"SET_META_KEYWORDS" => "N",	// Устанавливать ключевые слова страницы\n		"SET_META_DESCRIPTION" => "N",	// Устанавливать описание страницы\n		"SET_STATUS_404" => "N",	// Устанавливать статус 404, если не найдены элемент или раздел\n		"INCLUDE_IBLOCK_INTO_CHAIN" => "N",	// Включать инфоблок в цепочку навигации\n		"ADD_SECTIONS_CHAIN" => "N",	// Включать раздел в цепочку навигации\n		"HIDE_LINK_WHEN_NO_DETAIL" => "N",	// Скрывать ссылку, если нет детального описания\n		"PARENT_SECTION" => "",	// ID раздела\n		"PARENT_SECTION_CODE" => "",	// Код раздела\n		"INCLUDE_SUBSECTIONS" => "N",	// Показывать элементы подразделов раздела\n		"DISPLAY_DATE" => "N",	// Выводить дату элемента\n		"DISPLAY_NAME" => "Y",	// Выводить название элемента\n		"DISPLAY_PICTURE" => "Y",	// Выводить изображение для анонса\n		"DISPLAY_PREVIEW_TEXT" => "Y",	// Выводить текст анонса\n		"PAGER_TEMPLATE" => ".default",	// Шаблон постраничной навигации\n		"DISPLAY_TOP_PAGER" => "N",	// Выводить над списком\n		"DISPLAY_BOTTOM_PAGER" => "N",	// Выводить под списком\n		"PAGER_TITLE" => "Новости",	// Название категорий\n		"PAGER_SHOW_ALWAYS" => "N",	// Выводить всегда\n		"PAGER_DESC_NUMBERING" => "N",	// Использовать обратную навигацию\n		"PAGER_DESC_NUMBERING_CACHE_TIME" => "36000",	// Время кеширования страниц для обратной навигации\n		"PAGER_SHOW_ALL" => "N",	// Показывать ссылку "Все"\n	),\n	false\n);?><?require($_SERVER["DOCUMENT_ROOT"]."/bitrix/footer.php");?>";}', 1, 1433365973),
('14c8d05f3e45c282e864af11f09944566', 'fileman', 'edit_component_props', 'CFileman::UndoEditFile', 'a:2:{s:7:"absPath";s:63:"/home/users1/k/kimry/domains/jamilco.3-core.ru/brands/index.php";s:7:"content";s:1743:"<?\nrequire($_SERVER["DOCUMENT_ROOT"]."/bitrix/header.php");\n$APPLICATION->SetTitle("Бренды");\n?>\n<?$APPLICATION->IncludeComponent(\n	"bitrix:news.list", \n	"brands", \n	array(\n		"IBLOCK_TYPE" => "content",\n		"IBLOCK_ID" => "4",\n		"NEWS_COUNT" => "20",\n		"SORT_BY1" => "ACTIVE_FROM",\n		"SORT_ORDER1" => "DESC",\n		"SORT_BY2" => "SORT",\n		"SORT_ORDER2" => "ASC",\n		"FILTER_NAME" => "",\n		"FIELD_CODE" => array(\n			0 => "",\n			1 => "",\n		),\n		"PROPERTY_CODE" => array(\n			0 => "",\n			1 => "LOGO",\n			2 => "LOGO_HOVER",\n			3 => "LOGO_PICTURE",\n			4 => "",\n		),\n		"CHECK_DATES" => "Y",\n		"DETAIL_URL" => "",\n		"AJAX_MODE" => "N",\n		"AJAX_OPTION_JUMP" => "N",\n		"AJAX_OPTION_STYLE" => "Y",\n		"AJAX_OPTION_HISTORY" => "N",\n		"CACHE_TYPE" => "A",\n		"CACHE_TIME" => "36000000",\n		"CACHE_FILTER" => "N",\n		"CACHE_GROUPS" => "Y",\n		"PREVIEW_TRUNCATE_LEN" => "",\n		"ACTIVE_DATE_FORMAT" => "d.m.Y",\n		"SET_TITLE" => "N",\n		"SET_BROWSER_TITLE" => "N",\n		"SET_META_KEYWORDS" => "N",\n		"SET_META_DESCRIPTION" => "N",\n		"SET_STATUS_404" => "N",\n		"INCLUDE_IBLOCK_INTO_CHAIN" => "N",\n		"ADD_SECTIONS_CHAIN" => "N",\n		"HIDE_LINK_WHEN_NO_DETAIL" => "N",\n		"PARENT_SECTION" => "",\n		"PARENT_SECTION_CODE" => "",\n		"INCLUDE_SUBSECTIONS" => "N",\n		"DISPLAY_DATE" => "N",\n		"DISPLAY_NAME" => "Y",\n		"DISPLAY_PICTURE" => "Y",\n		"DISPLAY_PREVIEW_TEXT" => "Y",\n		"PAGER_TEMPLATE" => ".default",\n		"DISPLAY_TOP_PAGER" => "N",\n		"DISPLAY_BOTTOM_PAGER" => "N",\n		"PAGER_TITLE" => "Новости",\n		"PAGER_SHOW_ALWAYS" => "N",\n		"PAGER_DESC_NUMBERING" => "N",\n		"PAGER_DESC_NUMBERING_CACHE_TIME" => "36000",\n		"PAGER_SHOW_ALL" => "N",\n		"DISPLAY_TITLE" => "N",\n		"AJAX_OPTION_ADDITIONAL" => ""\n	),\n	false\n);?>\n<?require($_SERVER["DOCUMENT_ROOT"]."/bitrix/footer.php");?>";}', 1, 1433366093),
('1605c03ba898047a773d6b63f26eef937', 'fileman', 'new_file', 'CFileman::UndoNewFile', 'a:4:{s:7:"absPath";s:64:"/home/users1/k/kimry/domains/jamilco.3-core.ru/brands/detail.php";s:4:"path";s:18:"/brands/detail.php";s:4:"site";s:2:"s1";s:6:"public";s:1:"Y";}', 1, 1433366313),
('19156d1dd0b5ec9c0505e98aa32047ebc', 'fileman', 'edit_component_props', 'CFileman::UndoEditFile', 'a:2:{s:7:"absPath";s:70:"/home/users1/k/kimry/domains/jamilco.3-core.ru/about-company/index.php";s:7:"content";s:4391:"<?\nrequire($_SERVER["DOCUMENT_ROOT"]."/bitrix/header.php");\n$APPLICATION->SetTitle("О компании");\n?><?$APPLICATION->IncludeComponent("bitrix:news.list", "news", Array(\n	"IBLOCK_TYPE" => "news",	// Тип информационного блока (используется только для проверки)\n		"IBLOCK_ID" => "1",	// Код информационного блока\n		"NEWS_COUNT" => "20",	// Количество новостей на странице\n		"SORT_BY1" => "ACTIVE_FROM",	// Поле для первой сортировки новостей\n		"SORT_ORDER1" => "DESC",	// Направление для первой сортировки новостей\n		"SORT_BY2" => "SORT",	// Поле для второй сортировки новостей\n		"SORT_ORDER2" => "ASC",	// Направление для второй сортировки новостей\n		"FILTER_NAME" => "",	// Фильтр\n		"FIELD_CODE" => array(	// Поля\n			0 => "",\n			1 => "",\n		),\n		"PROPERTY_CODE" => array(	// Свойства\n			0 => "",\n			1 => "",\n			2 => "",\n			3 => "",\n			4 => "",\n		),\n		"CHECK_DATES" => "Y",	// Показывать только активные на данный момент элементы\n		"DETAIL_URL" => "",	// URL страницы детального просмотра (по умолчанию - из настроек инфоблока)\n		"AJAX_MODE" => "N",	// Включить режим AJAX\n		"AJAX_OPTION_JUMP" => "N",	// Включить прокрутку к началу компонента\n		"AJAX_OPTION_STYLE" => "Y",	// Включить подгрузку стилей\n		"AJAX_OPTION_HISTORY" => "N",	// Включить эмуляцию навигации браузера\n		"CACHE_TYPE" => "A",	// Тип кеширования\n		"CACHE_TIME" => "36000000",	// Время кеширования (сек.)\n		"CACHE_FILTER" => "N",	// Кешировать при установленном фильтре\n		"CACHE_GROUPS" => "Y",	// Учитывать права доступа\n		"PREVIEW_TRUNCATE_LEN" => "",	// Максимальная длина анонса для вывода (только для типа текст)\n		"ACTIVE_DATE_FORMAT" => "d.m.Y",	// Формат показа даты\n		"SET_TITLE" => "N",	// Устанавливать заголовок страницы\n		"SET_BROWSER_TITLE" => "N",	// Устанавливать заголовок окна браузера\n		"SET_META_KEYWORDS" => "N",	// Устанавливать ключевые слова страницы\n		"SET_META_DESCRIPTION" => "N",	// Устанавливать описание страницы\n		"SET_STATUS_404" => "N",	// Устанавливать статус 404, если не найдены элемент или раздел\n		"INCLUDE_IBLOCK_INTO_CHAIN" => "N",	// Включать инфоблок в цепочку навигации\n		"ADD_SECTIONS_CHAIN" => "N",	// Включать раздел в цепочку навигации\n		"HIDE_LINK_WHEN_NO_DETAIL" => "N",	// Скрывать ссылку, если нет детального описания\n		"PARENT_SECTION" => "",	// ID раздела\n		"PARENT_SECTION_CODE" => "",	// Код раздела\n		"INCLUDE_SUBSECTIONS" => "N",	// Показывать элементы подразделов раздела\n		"DISPLAY_DATE" => "N",\n		"DISPLAY_NAME" => "Y",\n		"DISPLAY_PICTURE" => "Y",\n		"DISPLAY_PREVIEW_TEXT" => "Y",\n		"PAGER_TEMPLATE" => ".default",	// Шаблон постраничной навигации\n		"DISPLAY_TOP_PAGER" => "N",	// Выводить над списком\n		"DISPLAY_BOTTOM_PAGER" => "N",	// Выводить под списком\n		"PAGER_TITLE" => "Новости",	// Название категорий\n		"PAGER_SHOW_ALWAYS" => "N",	// Выводить всегда\n		"PAGER_DESC_NUMBERING" => "N",	// Использовать обратную навигацию\n		"PAGER_DESC_NUMBERING_CACHE_TIME" => "36000",	// Время кеширования страниц для обратной навигации\n		"PAGER_SHOW_ALL" => "N",	// Показывать ссылку "Все"\n		"DISPLAY_TITLE" => "Y",	// Выводить заголовок\n		"AJAX_OPTION_ADDITIONAL" => "",	// Дополнительный идентификатор\n	),\n	false\n);?><?require($_SERVER["DOCUMENT_ROOT"]."/bitrix/footer.php");?>";}', 1, 1433367847),
('1500e7c0c434a3ecd98e1eb5c81d79ea6', 'fileman', 'edit_component_props', 'CFileman::UndoEditFile', 'a:2:{s:7:"absPath";s:70:"/home/users1/k/kimry/domains/jamilco.3-core.ru/about-company/index.php";s:7:"content";s:1695:"<?\nrequire($_SERVER["DOCUMENT_ROOT"]."/bitrix/header.php");\n$APPLICATION->SetTitle("О компании");\n?><?$APPLICATION->IncludeComponent(\n	"bitrix:news.list", \n	"news", \n	array(\n		"IBLOCK_TYPE" => "news",\n		"IBLOCK_ID" => "1",\n		"NEWS_COUNT" => "20",\n		"SORT_BY1" => "ACTIVE_FROM",\n		"SORT_ORDER1" => "DESC",\n		"SORT_BY2" => "SORT",\n		"SORT_ORDER2" => "ASC",\n		"FILTER_NAME" => "",\n		"FIELD_CODE" => array(\n			0 => "DETAIL_PICTURE",\n			1 => "",\n		),\n		"PROPERTY_CODE" => array(\n			0 => "",\n			1 => "",\n		),\n		"CHECK_DATES" => "Y",\n		"DETAIL_URL" => "",\n		"AJAX_MODE" => "N",\n		"AJAX_OPTION_JUMP" => "N",\n		"AJAX_OPTION_STYLE" => "Y",\n		"AJAX_OPTION_HISTORY" => "N",\n		"CACHE_TYPE" => "A",\n		"CACHE_TIME" => "36000000",\n		"CACHE_FILTER" => "N",\n		"CACHE_GROUPS" => "Y",\n		"PREVIEW_TRUNCATE_LEN" => "",\n		"ACTIVE_DATE_FORMAT" => "d.m.Y",\n		"SET_TITLE" => "N",\n		"SET_BROWSER_TITLE" => "N",\n		"SET_META_KEYWORDS" => "N",\n		"SET_META_DESCRIPTION" => "N",\n		"SET_STATUS_404" => "N",\n		"INCLUDE_IBLOCK_INTO_CHAIN" => "N",\n		"ADD_SECTIONS_CHAIN" => "N",\n		"HIDE_LINK_WHEN_NO_DETAIL" => "N",\n		"PARENT_SECTION" => "",\n		"PARENT_SECTION_CODE" => "",\n		"INCLUDE_SUBSECTIONS" => "N",\n		"DISPLAY_DATE" => "N",\n		"DISPLAY_NAME" => "Y",\n		"DISPLAY_PICTURE" => "Y",\n		"DISPLAY_PREVIEW_TEXT" => "Y",\n		"PAGER_TEMPLATE" => ".default",\n		"DISPLAY_TOP_PAGER" => "N",\n		"DISPLAY_BOTTOM_PAGER" => "N",\n		"PAGER_TITLE" => "Новости",\n		"PAGER_SHOW_ALWAYS" => "N",\n		"PAGER_DESC_NUMBERING" => "N",\n		"PAGER_DESC_NUMBERING_CACHE_TIME" => "36000",\n		"PAGER_SHOW_ALL" => "N",\n		"DISPLAY_TITLE" => "Y",\n		"AJAX_OPTION_ADDITIONAL" => ""\n	),\n	false\n);?><?require($_SERVER["DOCUMENT_ROOT"]."/bitrix/footer.php");?>";}', 1, 1433367977),
('162eeaf5155094bc9f7fc965314a37f45', 'fileman', 'edit_component_props', 'CFileman::UndoEditFile', 'a:2:{s:7:"absPath";s:61:"/home/users1/k/kimry/domains/jamilco.3-core.ru/news/index.php";s:7:"content";s:1692:"<?\nrequire($_SERVER["DOCUMENT_ROOT"]."/bitrix/header.php");\n$APPLICATION->SetTitle("Новости");\n?>\n<?$APPLICATION->IncludeComponent(\n	"bitrix:news.list", \n	"news", \n	array(\n		"IBLOCK_TYPE" => "news",\n		"IBLOCK_ID" => "1",\n		"NEWS_COUNT" => "20",\n		"SORT_BY1" => "ACTIVE_FROM",\n		"SORT_ORDER1" => "DESC",\n		"SORT_BY2" => "SORT",\n		"SORT_ORDER2" => "ASC",\n		"FILTER_NAME" => "",\n		"FIELD_CODE" => array(\n			0 => "DETAIL_PICTURE",\n			1 => "",\n		),\n		"PROPERTY_CODE" => array(\n			0 => "",\n			1 => "",\n		),\n		"CHECK_DATES" => "Y",\n		"DETAIL_URL" => "",\n		"AJAX_MODE" => "N",\n		"AJAX_OPTION_JUMP" => "N",\n		"AJAX_OPTION_STYLE" => "Y",\n		"AJAX_OPTION_HISTORY" => "N",\n		"CACHE_TYPE" => "A",\n		"CACHE_TIME" => "36000000",\n		"CACHE_FILTER" => "N",\n		"CACHE_GROUPS" => "Y",\n		"PREVIEW_TRUNCATE_LEN" => "",\n		"ACTIVE_DATE_FORMAT" => "d.m.Y",\n		"SET_TITLE" => "N",\n		"SET_BROWSER_TITLE" => "N",\n		"SET_META_KEYWORDS" => "N",\n		"SET_META_DESCRIPTION" => "N",\n		"SET_STATUS_404" => "N",\n		"INCLUDE_IBLOCK_INTO_CHAIN" => "N",\n		"ADD_SECTIONS_CHAIN" => "N",\n		"HIDE_LINK_WHEN_NO_DETAIL" => "N",\n		"PARENT_SECTION" => "",\n		"PARENT_SECTION_CODE" => "",\n		"INCLUDE_SUBSECTIONS" => "N",\n		"DISPLAY_DATE" => "N",\n		"DISPLAY_NAME" => "Y",\n		"DISPLAY_PICTURE" => "Y",\n		"DISPLAY_PREVIEW_TEXT" => "Y",\n		"PAGER_TEMPLATE" => ".default",\n		"DISPLAY_TOP_PAGER" => "N",\n		"DISPLAY_BOTTOM_PAGER" => "N",\n		"PAGER_TITLE" => "Новости",\n		"PAGER_SHOW_ALWAYS" => "N",\n		"PAGER_DESC_NUMBERING" => "N",\n		"PAGER_DESC_NUMBERING_CACHE_TIME" => "36000",\n		"PAGER_SHOW_ALL" => "Y",\n		"DISPLAY_TITLE" => "Y",\n		"AJAX_OPTION_ADDITIONAL" => ""\n	),\n	false\n);?>\n<?require($_SERVER["DOCUMENT_ROOT"]."/bitrix/footer.php");?>";}', 1, 1433368065),
('1c6abfaed37e0525abd54f1ca2f5eca1d', 'fileman', 'new_file', 'CFileman::UndoNewFile', 'a:4:{s:7:"absPath";s:62:"/home/users1/k/kimry/domains/jamilco.3-core.ru/news/detail.php";s:4:"path";s:16:"/news/detail.php";s:4:"site";s:2:"s1";s:6:"public";s:1:"Y";}', 1, 1433368123),
('18661d30781d56b74af0481c9a90cb355', 'fileman', 'edit_file', 'CFileman::UndoEditFile', 'a:2:{s:7:"absPath";s:62:"/home/users1/k/kimry/domains/jamilco.3-core.ru/news/detail.php";s:7:"content";s:194:"<?\nrequire($_SERVER["DOCUMENT_ROOT"]."/bitrix/header.php");\n$APPLICATION->SetTitle("Новость детально");\n?>Text here....<?require($_SERVER["DOCUMENT_ROOT"]."/bitrix/footer.php");?>";}', 1, 1433368164),
('1153e4e893cecc1d35555ee8f78a3edef', 'fileman', 'edit_file', 'CFileman::UndoEditFile', 'a:2:{s:7:"absPath";s:70:"/home/users1/k/kimry/domains/jamilco.3-core.ru/about-company/index.php";s:7:"content";s:169:"<?\nrequire($_SERVER["DOCUMENT_ROOT"]."/bitrix/header.php");\n$APPLICATION->SetTitle("О компании");\n?><?require($_SERVER["DOCUMENT_ROOT"]."/bitrix/footer.php");?>";}', 1, 1433368908),
('13603ee8e7bfe8feec31f51c0c9b3e7bc', 'fileman', 'edit_component_props', 'CFileman::UndoEditFile', 'a:2:{s:7:"absPath";s:70:"/home/users1/k/kimry/domains/jamilco.3-core.ru/about-company/index.php";s:7:"content";s:250:"<?\nrequire($_SERVER["DOCUMENT_ROOT"]."/bitrix/header.php");\n$APPLICATION->SetTitle("О компании");\n?><?$APPLICATION->IncludeComponent(\n	"bitrix:form.result.new",\n	"",\n	Array(\n	)\n);?><?require($_SERVER["DOCUMENT_ROOT"]."/bitrix/footer.php");?>";}', 1, 1433368981),
('143be4df438dffc3531d266ef5ac32493', 'fileman', 'edit_file', 'CFileman::UndoEditFile', 'a:2:{s:7:"absPath";s:70:"/home/users1/k/kimry/domains/jamilco.3-core.ru/about-company/index.php";s:7:"content";s:714:"<?\nrequire($_SERVER["DOCUMENT_ROOT"]."/bitrix/header.php");\n$APPLICATION->SetTitle("О компании");\n?><?$APPLICATION->IncludeComponent(\n	"bitrix:form.result.new", \n	".default", \n	array(\n		"WEB_FORM_ID" => "1",\n		"IGNORE_CUSTOM_TEMPLATE" => "N",\n		"USE_EXTENDED_ERRORS" => "N",\n		"SEF_MODE" => "N",\n		"SEF_FOLDER" => "/about-company/",\n		"CACHE_TYPE" => "A",\n		"CACHE_TIME" => "3600",\n		"LIST_URL" => "result_list.php",\n		"EDIT_URL" => "result_edit.php",\n		"SUCCESS_URL" => "",\n		"CHAIN_ITEM_TEXT" => "",\n		"CHAIN_ITEM_LINK" => "",\n		"VARIABLE_ALIASES" => array(\n			"WEB_FORM_ID" => "WEB_FORM_ID",\n			"RESULT_ID" => "RESULT_ID",\n		)\n	),\n	false\n);?><?require($_SERVER["DOCUMENT_ROOT"]."/bitrix/footer.php");?>";}', 1, 1433440758),
('10a80491c4342c0e22fbbfef991dbbcdf', 'fileman', 'edit_file', 'CFileman::UndoEditFile', 'a:2:{s:7:"absPath";s:70:"/home/users1/k/kimry/domains/jamilco.3-core.ru/about-company/index.php";s:7:"content";s:169:"<?\nrequire($_SERVER["DOCUMENT_ROOT"]."/bitrix/header.php");\n$APPLICATION->SetTitle("О компании");\n?><?require($_SERVER["DOCUMENT_ROOT"]."/bitrix/footer.php");?>";}', 1, 1433444395),
('1ae75a63cc2ad6207db77b40d24e6c14f', 'fileman', 'edit_component_props', 'CFileman::UndoEditFile', 'a:2:{s:7:"absPath";s:70:"/home/users1/k/kimry/domains/jamilco.3-core.ru/about-company/index.php";s:7:"content";s:632:"<?\nrequire($_SERVER["DOCUMENT_ROOT"]."/bitrix/header.php");\n$APPLICATION->SetTitle("О компании");\n?><?$APPLICATION->IncludeComponent(\n	"bitrix:form.result.new",\n	"",\n	Array(\n		"WEB_FORM_ID" => $_REQUEST[WEB_FORM_ID],\n		"IGNORE_CUSTOM_TEMPLATE" => "Y",\n		"USE_EXTENDED_ERRORS" => "Y",\n		"SEF_MODE" => "N",\n		"VARIABLE_ALIASES" => Array("WEB_FORM_ID"=>"WEB_FORM_ID","RESULT_ID"=>"RESULT_ID"),\n		"CACHE_TYPE" => "A",\n		"CACHE_TIME" => "3600",\n		"LIST_URL" => "",\n		"EDIT_URL" => "",\n		"SUCCESS_URL" => "",\n		"CHAIN_ITEM_TEXT" => "",\n		"CHAIN_ITEM_LINK" => ""\n	)\n);?><?require($_SERVER["DOCUMENT_ROOT"]."/bitrix/footer.php");?>";}', 1, 1433444405),
('1d6c8bf8bb8fe1923faa99bd9eb611087', 'fileman', 'edit_file', 'CFileman::UndoEditFile', 'a:2:{s:7:"absPath";s:70:"/home/users1/k/kimry/domains/jamilco.3-core.ru/about-company/index.php";s:7:"content";s:182:"<?\nrequire($_SERVER["DOCUMENT_ROOT"]."/bitrix/header.php");\n$APPLICATION->SetTitle("О компании");\n?>Text here....<?require($_SERVER["DOCUMENT_ROOT"]."/bitrix/footer.php");?>";}', 1, 1433364767),
('1de0d3a926be1e9f15c11f54b658472f4', 'fileman', 'edit_component_props', 'CFileman::UndoEditFile', 'a:2:{s:7:"absPath";s:70:"/home/users1/k/kimry/domains/jamilco.3-core.ru/about-company/index.php";s:7:"content";s:1748:"<?\nrequire($_SERVER["DOCUMENT_ROOT"]."/bitrix/header.php");\n$APPLICATION->SetTitle("О компании");\n?><?$APPLICATION->IncludeComponent(\n	"bitrix:news.list", \n	"brands", \n	array(\n		"IBLOCK_TYPE" => "content",\n		"IBLOCK_ID" => "4",\n		"NEWS_COUNT" => "20",\n		"SORT_BY1" => "ACTIVE_FROM",\n		"SORT_ORDER1" => "DESC",\n		"SORT_BY2" => "SORT",\n		"SORT_ORDER2" => "ASC",\n		"FILTER_NAME" => "",\n		"FIELD_CODE" => array(\n			0 => "",\n			1 => "",\n		),\n		"PROPERTY_CODE" => array(\n			0 => "",\n			1 => "LOGO",\n			2 => "LOGO_HOVER",\n			3 => "LOGO_PICTURE",\n			4 => "",\n		),\n		"CHECK_DATES" => "Y",\n		"DETAIL_URL" => "",\n		"AJAX_MODE" => "N",\n		"AJAX_OPTION_JUMP" => "N",\n		"AJAX_OPTION_STYLE" => "Y",\n		"AJAX_OPTION_HISTORY" => "N",\n		"CACHE_TYPE" => "A",\n		"CACHE_TIME" => "36000000",\n		"CACHE_FILTER" => "N",\n		"CACHE_GROUPS" => "Y",\n		"PREVIEW_TRUNCATE_LEN" => "",\n		"ACTIVE_DATE_FORMAT" => "d.m.Y",\n		"SET_TITLE" => "N",\n		"SET_BROWSER_TITLE" => "N",\n		"SET_META_KEYWORDS" => "N",\n		"SET_META_DESCRIPTION" => "N",\n		"SET_STATUS_404" => "N",\n		"INCLUDE_IBLOCK_INTO_CHAIN" => "N",\n		"ADD_SECTIONS_CHAIN" => "N",\n		"HIDE_LINK_WHEN_NO_DETAIL" => "N",\n		"PARENT_SECTION" => "",\n		"PARENT_SECTION_CODE" => "",\n		"INCLUDE_SUBSECTIONS" => "N",\n		"DISPLAY_DATE" => "N",\n		"DISPLAY_NAME" => "Y",\n		"DISPLAY_PICTURE" => "Y",\n		"DISPLAY_PREVIEW_TEXT" => "Y",\n		"PAGER_TEMPLATE" => ".default",\n		"DISPLAY_TOP_PAGER" => "N",\n		"DISPLAY_BOTTOM_PAGER" => "N",\n		"PAGER_TITLE" => "Новости",\n		"PAGER_SHOW_ALWAYS" => "N",\n		"PAGER_DESC_NUMBERING" => "N",\n		"PAGER_DESC_NUMBERING_CACHE_TIME" => "36000",\n		"PAGER_SHOW_ALL" => "N",\n		"DISPLAY_TITLE" => "Y",\n		"AJAX_OPTION_ADDITIONAL" => ""\n	),\n	false\n);?><?require($_SERVER["DOCUMENT_ROOT"]."/bitrix/footer.php");?>";}', 1, 1433367444);

-- --------------------------------------------------------

--
-- Структура таблицы `b_user`
--

CREATE TABLE IF NOT EXISTS `b_user` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `LOGIN` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `PASSWORD` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `CHECKWORD` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `NAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LAST_NAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `EMAIL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LAST_LOGIN` datetime DEFAULT NULL,
  `DATE_REGISTER` datetime NOT NULL,
  `LID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_PROFESSION` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_WWW` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_ICQ` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_GENDER` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_BIRTHDATE` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_PHOTO` int(18) DEFAULT NULL,
  `PERSONAL_PHONE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_FAX` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_MOBILE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_PAGER` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_STREET` text COLLATE utf8_unicode_ci,
  `PERSONAL_MAILBOX` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_CITY` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_STATE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_ZIP` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_COUNTRY` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_NOTES` text COLLATE utf8_unicode_ci,
  `WORK_COMPANY` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WORK_DEPARTMENT` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WORK_POSITION` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WORK_WWW` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WORK_PHONE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WORK_FAX` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WORK_PAGER` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WORK_STREET` text COLLATE utf8_unicode_ci,
  `WORK_MAILBOX` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WORK_CITY` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WORK_STATE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WORK_ZIP` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WORK_COUNTRY` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WORK_PROFILE` text COLLATE utf8_unicode_ci,
  `WORK_LOGO` int(18) DEFAULT NULL,
  `WORK_NOTES` text COLLATE utf8_unicode_ci,
  `ADMIN_NOTES` text COLLATE utf8_unicode_ci,
  `STORED_HASH` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `XML_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_BIRTHDAY` date DEFAULT NULL,
  `EXTERNAL_AUTH_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CHECKWORD_TIME` datetime DEFAULT NULL,
  `SECOND_NAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CONFIRM_CODE` varchar(8) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LOGIN_ATTEMPTS` int(18) DEFAULT NULL,
  `LAST_ACTIVITY_DATE` datetime DEFAULT NULL,
  `AUTO_TIME_ZONE` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TIME_ZONE` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TIME_ZONE_OFFSET` int(18) DEFAULT NULL,
  `TITLE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ix_login` (`LOGIN`,`EXTERNAL_AUTH_ID`),
  KEY `ix_b_user_email` (`EMAIL`),
  KEY `ix_b_user_activity_date` (`LAST_ACTIVITY_DATE`),
  KEY `IX_B_USER_XML_ID` (`XML_ID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Дамп данных таблицы `b_user`
--

INSERT INTO `b_user` (`ID`, `TIMESTAMP_X`, `LOGIN`, `PASSWORD`, `CHECKWORD`, `ACTIVE`, `NAME`, `LAST_NAME`, `EMAIL`, `LAST_LOGIN`, `DATE_REGISTER`, `LID`, `PERSONAL_PROFESSION`, `PERSONAL_WWW`, `PERSONAL_ICQ`, `PERSONAL_GENDER`, `PERSONAL_BIRTHDATE`, `PERSONAL_PHOTO`, `PERSONAL_PHONE`, `PERSONAL_FAX`, `PERSONAL_MOBILE`, `PERSONAL_PAGER`, `PERSONAL_STREET`, `PERSONAL_MAILBOX`, `PERSONAL_CITY`, `PERSONAL_STATE`, `PERSONAL_ZIP`, `PERSONAL_COUNTRY`, `PERSONAL_NOTES`, `WORK_COMPANY`, `WORK_DEPARTMENT`, `WORK_POSITION`, `WORK_WWW`, `WORK_PHONE`, `WORK_FAX`, `WORK_PAGER`, `WORK_STREET`, `WORK_MAILBOX`, `WORK_CITY`, `WORK_STATE`, `WORK_ZIP`, `WORK_COUNTRY`, `WORK_PROFILE`, `WORK_LOGO`, `WORK_NOTES`, `ADMIN_NOTES`, `STORED_HASH`, `XML_ID`, `PERSONAL_BIRTHDAY`, `EXTERNAL_AUTH_ID`, `CHECKWORD_TIME`, `SECOND_NAME`, `CONFIRM_CODE`, `LOGIN_ATTEMPTS`, `LAST_ACTIVITY_DATE`, `AUTO_TIME_ZONE`, `TIME_ZONE`, `TIME_ZONE_OFFSET`, `TITLE`) VALUES
(1, '2015-06-04 18:26:55', '111-222', '5IFOdbcH036296e4601aa2f4ad34ca4b07ce9584', 'TsqMekjA9bfed3cd032b50989858859f2d737e15', 'Y', 'Администратор', '', 'diy9@mail.ru', '2015-06-04 22:45:58', '2015-06-03 21:59:24', 's1', '', '', '', '', NULL, NULL, '', '', '', '', '', '', '', '', '', '0', '', '', '', '', '', '', '', '', '', '', '', '', '', '0', '', NULL, '', '', NULL, '', NULL, NULL, '2015-06-04 21:26:55', '', NULL, 0, NULL, '', NULL, NULL, '');

-- --------------------------------------------------------

--
-- Структура таблицы `b_user_access`
--

CREATE TABLE IF NOT EXISTS `b_user_access` (
  `USER_ID` int(11) DEFAULT NULL,
  `PROVIDER_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ACCESS_CODE` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `ix_ua_user_provider` (`USER_ID`,`PROVIDER_ID`),
  KEY `ix_ua_user_access` (`USER_ID`,`ACCESS_CODE`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `b_user_access`
--

INSERT INTO `b_user_access` (`USER_ID`, `PROVIDER_ID`, `ACCESS_CODE`) VALUES
(0, 'group', 'G2'),
(1, 'group', 'G2'),
(1, 'group', 'G4'),
(1, 'group', 'G3'),
(1, 'group', 'G1'),
(1, 'user', 'U1');

-- --------------------------------------------------------

--
-- Структура таблицы `b_user_access_check`
--

CREATE TABLE IF NOT EXISTS `b_user_access_check` (
  `USER_ID` int(11) DEFAULT NULL,
  `PROVIDER_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `ix_uac_user_provider` (`USER_ID`,`PROVIDER_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `b_user_access_check`
--

INSERT INTO `b_user_access_check` (`USER_ID`, `PROVIDER_ID`) VALUES
(1, 'group'),
(1, 'user');

-- --------------------------------------------------------

--
-- Структура таблицы `b_user_counter`
--

CREATE TABLE IF NOT EXISTS `b_user_counter` (
  `USER_ID` int(18) NOT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL DEFAULT '**',
  `CODE` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `CNT` int(18) NOT NULL DEFAULT '0',
  `LAST_DATE` datetime DEFAULT NULL,
  `TAG` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PARAMS` text COLLATE utf8_unicode_ci,
  `SENT` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`USER_ID`,`SITE_ID`,`CODE`),
  KEY `ix_buc_tag` (`TAG`),
  KEY `ix_buc_sent` (`SENT`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_user_digest`
--

CREATE TABLE IF NOT EXISTS `b_user_digest` (
  `USER_ID` int(11) NOT NULL,
  `DIGEST_HA1` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`USER_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_user_field`
--

CREATE TABLE IF NOT EXISTS `b_user_field` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ENTITY_ID` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FIELD_NAME` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `USER_TYPE_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `XML_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SORT` int(11) DEFAULT NULL,
  `MULTIPLE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `MANDATORY` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `SHOW_FILTER` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `SHOW_IN_LIST` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `EDIT_IN_LIST` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `IS_SEARCHABLE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `SETTINGS` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_user_type_entity` (`ENTITY_ID`,`FIELD_NAME`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- Дамп данных таблицы `b_user_field`
--

INSERT INTO `b_user_field` (`ID`, `ENTITY_ID`, `FIELD_NAME`, `USER_TYPE_ID`, `XML_ID`, `SORT`, `MULTIPLE`, `MANDATORY`, `SHOW_FILTER`, `SHOW_IN_LIST`, `EDIT_IN_LIST`, `IS_SEARCHABLE`, `SETTINGS`) VALUES
(1, 'BLOG_POST', 'UF_BLOG_POST_DOC', 'file', 'UF_BLOG_POST_DOC', 100, 'Y', 'N', 'N', 'N', 'Y', 'Y', 'a:0:{}'),
(2, 'BLOG_COMMENT', 'UF_BLOG_COMMENT_DOC', 'file', 'UF_BLOG_COMMENT_DOC', 100, 'Y', 'N', 'N', 'N', 'Y', 'Y', 'a:0:{}'),
(3, 'BLOG_POST', 'UF_GRATITUDE', 'integer', 'UF_GRATITUDE', 100, 'N', 'N', 'N', 'N', 'Y', 'N', 'a:0:{}');

-- --------------------------------------------------------

--
-- Структура таблицы `b_user_field_confirm`
--

CREATE TABLE IF NOT EXISTS `b_user_field_confirm` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(18) NOT NULL,
  `DATE_CHANGE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `FIELD` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `FIELD_VALUE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `CONFIRM_CODE` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_b_user_field_confirm1` (`USER_ID`,`CONFIRM_CODE`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `b_user_field_enum`
--

CREATE TABLE IF NOT EXISTS `b_user_field_enum` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_FIELD_ID` int(11) DEFAULT NULL,
  `VALUE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `DEF` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `SORT` int(11) NOT NULL DEFAULT '500',
  `XML_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_user_field_enum` (`USER_FIELD_ID`,`XML_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `b_user_field_lang`
--

CREATE TABLE IF NOT EXISTS `b_user_field_lang` (
  `USER_FIELD_ID` int(11) NOT NULL DEFAULT '0',
  `LANGUAGE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `EDIT_FORM_LABEL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LIST_COLUMN_LABEL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LIST_FILTER_LABEL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ERROR_MESSAGE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `HELP_MESSAGE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`USER_FIELD_ID`,`LANGUAGE_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_user_group`
--

CREATE TABLE IF NOT EXISTS `b_user_group` (
  `USER_ID` int(18) NOT NULL,
  `GROUP_ID` int(18) NOT NULL,
  `DATE_ACTIVE_FROM` datetime DEFAULT NULL,
  `DATE_ACTIVE_TO` datetime DEFAULT NULL,
  UNIQUE KEY `ix_user_group` (`USER_ID`,`GROUP_ID`),
  KEY `ix_user_group_group` (`GROUP_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `b_user_group`
--

INSERT INTO `b_user_group` (`USER_ID`, `GROUP_ID`, `DATE_ACTIVE_FROM`, `DATE_ACTIVE_TO`) VALUES
(1, 4, NULL, NULL),
(1, 3, NULL, NULL),
(1, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `b_user_hit_auth`
--

CREATE TABLE IF NOT EXISTS `b_user_hit_auth` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(18) NOT NULL,
  `HASH` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `URL` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TIMESTAMP_X` datetime NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_USER_HIT_AUTH_1` (`HASH`),
  KEY `IX_USER_HIT_AUTH_2` (`USER_ID`),
  KEY `IX_USER_HIT_AUTH_3` (`TIMESTAMP_X`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `b_user_option`
--

CREATE TABLE IF NOT EXISTS `b_user_option` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(11) DEFAULT NULL,
  `CATEGORY` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `VALUE` text COLLATE utf8_unicode_ci,
  `COMMON` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  PRIMARY KEY (`ID`),
  KEY `ix_user_option_user` (`USER_ID`,`CATEGORY`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=8 ;

--
-- Дамп данных таблицы `b_user_option`
--

INSERT INTO `b_user_option` (`ID`, `USER_ID`, `CATEGORY`, `NAME`, `VALUE`, `COMMON`) VALUES
(1, NULL, 'intranet', '~gadgets_admin_index', 'a:1:{i:0;a:1:{s:7:"GADGETS";a:7:{s:20:"ADMIN_INFO@333333333";a:3:{s:6:"COLUMN";i:0;s:3:"ROW";i:0;s:4:"HIDE";s:1:"N";}s:19:"HTML_AREA@444444444";a:5:{s:6:"COLUMN";i:0;s:3:"ROW";i:1;s:4:"HIDE";s:1:"N";s:8:"USERDATA";a:1:{s:7:"content";s:797:"<table class="bx-gadgets-info-site-table" cellspacing="0"><tr>	<td class="bx-gadget-gray">Создатель сайта:</td>	<td>Группа компаний &laquo;1С-Битрикс&raquo;.</td>	<td class="bx-gadgets-info-site-logo" rowspan="5"><img src="/bitrix/components/bitrix/desktop/templates/admin/images/site_logo.png"></td></tr><tr>	<td class="bx-gadget-gray">Адрес сайта:</td>	<td><a href="http://www.1c-bitrix.ru">www.1c-bitrix.ru</a></td></tr><tr>	<td class="bx-gadget-gray">Сайт сдан:</td>	<td>12 декабря 2010 г.</td></tr><tr>	<td class="bx-gadget-gray">Ответственное лицо:</td>	<td>Иван Иванов</td></tr><tr>	<td class="bx-gadget-gray">E-mail:</td>	<td><a href="mailto:info@1c-bitrix.ru">info@1c-bitrix.ru</a></td></tr></table>";}s:8:"SETTINGS";a:1:{s:9:"TITLE_STD";s:34:"Информация о сайте";}}s:25:"ADMIN_CHECKLIST@777888999";a:3:{s:6:"COLUMN";i:0;s:3:"ROW";i:2;s:4:"HIDE";s:1:"N";}s:19:"RSSREADER@777777777";a:4:{s:6:"COLUMN";i:1;s:3:"ROW";i:3;s:4:"HIDE";s:1:"N";s:8:"SETTINGS";a:3:{s:9:"TITLE_STD";s:33:"Новости 1С-Битрикс";s:3:"CNT";i:10;s:7:"RSS_URL";s:45:"https://www.1c-bitrix.ru/about/life/news/rss/";}}s:24:"ADMIN_SECURITY@555555555";a:3:{s:6:"COLUMN";i:1;s:3:"ROW";i:0;s:4:"HIDE";s:1:"N";}s:23:"ADMIN_PERFMON@666666666";a:3:{s:6:"COLUMN";i:1;s:3:"ROW";i:1;s:4:"HIDE";s:1:"N";}s:23:"ADMIN_MARKETPALCE@22549";a:3:{s:6:"COLUMN";i:1;s:3:"ROW";i:2;s:4:"HIDE";s:1:"N";}}}}', 'Y'),
(2, NULL, 'main.interface', 'global', 'a:1:{s:5:"theme";s:4:"blue";}', 'Y'),
(3, 1, 'admin_panel', 'settings', 'a:1:{s:4:"edit";s:3:"off";}', 'N'),
(4, 1, 'hot_keys', 'user_defined', 'b:1;', 'N'),
(5, 1, 'favorite', 'favorite_menu', 'a:1:{s:5:"stick";s:1:"N";}', 'N'),
(6, 1, 'admin_menu', 'pos', 'a:1:{s:8:"sections";s:153:"menu_util,menu_system,menu_site,menu_module_settings,menu_iblock,menu_iblock_/content,iblock_admin,urlrewrite,menu_webforms,menu_users,menu_webforms_list";}', 'N'),
(7, 1, 'html_editor', 'user_settings_', 'a:1:{s:13:"taskbar_shown";s:1:"1";}', 'N');

-- --------------------------------------------------------

--
-- Структура таблицы `b_user_stored_auth`
--

CREATE TABLE IF NOT EXISTS `b_user_stored_auth` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(18) NOT NULL,
  `DATE_REG` datetime NOT NULL,
  `LAST_AUTH` datetime NOT NULL,
  `STORED_HASH` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `TEMP_HASH` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `IP_ADDR` int(10) unsigned NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `ux_user_hash` (`USER_ID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- Структура таблицы `b_utm_blog_comment`
--

CREATE TABLE IF NOT EXISTS `b_utm_blog_comment` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `VALUE_ID` int(11) NOT NULL,
  `FIELD_ID` int(11) NOT NULL,
  `VALUE` text COLLATE utf8_unicode_ci,
  `VALUE_INT` int(11) DEFAULT NULL,
  `VALUE_DOUBLE` float DEFAULT NULL,
  `VALUE_DATE` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_utm_BLOG_COMMENT_1` (`FIELD_ID`),
  KEY `ix_utm_BLOG_COMMENT_2` (`VALUE_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `b_utm_blog_post`
--

CREATE TABLE IF NOT EXISTS `b_utm_blog_post` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `VALUE_ID` int(11) NOT NULL,
  `FIELD_ID` int(11) NOT NULL,
  `VALUE` text COLLATE utf8_unicode_ci,
  `VALUE_INT` int(11) DEFAULT NULL,
  `VALUE_DOUBLE` float DEFAULT NULL,
  `VALUE_DATE` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_utm_BLOG_POST_1` (`FIELD_ID`),
  KEY `ix_utm_BLOG_POST_2` (`VALUE_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `b_uts_blog_comment`
--

CREATE TABLE IF NOT EXISTS `b_uts_blog_comment` (
  `VALUE_ID` int(11) NOT NULL,
  `UF_BLOG_COMMENT_DOC` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`VALUE_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_uts_blog_post`
--

CREATE TABLE IF NOT EXISTS `b_uts_blog_post` (
  `VALUE_ID` int(11) NOT NULL,
  `UF_BLOG_POST_DOC` text COLLATE utf8_unicode_ci,
  `UF_GRATITUDE` int(18) DEFAULT NULL,
  PRIMARY KEY (`VALUE_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_vote`
--

CREATE TABLE IF NOT EXISTS `b_vote` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `CHANNEL_ID` int(18) NOT NULL DEFAULT '0',
  `C_SORT` int(18) DEFAULT '100',
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `NOTIFY` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `AUTHOR_ID` int(18) DEFAULT NULL,
  `TIMESTAMP_X` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `DATE_START` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `DATE_END` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `URL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `COUNTER` int(11) NOT NULL DEFAULT '0',
  `TITLE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DESCRIPTION` text COLLATE utf8_unicode_ci,
  `DESCRIPTION_TYPE` varchar(4) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'html',
  `IMAGE_ID` int(18) DEFAULT NULL,
  `EVENT1` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `EVENT2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `EVENT3` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `UNIQUE_TYPE` int(18) NOT NULL DEFAULT '2',
  `KEEP_IP_SEC` int(18) DEFAULT NULL,
  `DELAY` int(18) DEFAULT NULL,
  `DELAY_TYPE` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TEMPLATE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `RESULT_TEMPLATE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_CHANNEL_ID` (`CHANNEL_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `b_vote_answer`
--

CREATE TABLE IF NOT EXISTS `b_vote_answer` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `TIMESTAMP_X` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `QUESTION_ID` int(18) NOT NULL DEFAULT '0',
  `C_SORT` int(18) DEFAULT '100',
  `MESSAGE` text COLLATE utf8_unicode_ci,
  `MESSAGE_TYPE` varchar(4) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'html',
  `COUNTER` int(18) NOT NULL DEFAULT '0',
  `FIELD_TYPE` int(5) NOT NULL DEFAULT '0',
  `FIELD_WIDTH` int(18) DEFAULT NULL,
  `FIELD_HEIGHT` int(18) DEFAULT NULL,
  `FIELD_PARAM` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `COLOR` varchar(7) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_QUESTION_ID` (`QUESTION_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `b_vote_channel`
--

CREATE TABLE IF NOT EXISTS `b_vote_channel` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `SYMBOLIC_NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `C_SORT` int(18) DEFAULT '100',
  `FIRST_SITE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `HIDDEN` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `TIMESTAMP_X` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `TITLE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `VOTE_SINGLE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `USE_CAPTCHA` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `b_vote_channel_2_group`
--

CREATE TABLE IF NOT EXISTS `b_vote_channel_2_group` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `CHANNEL_ID` int(18) NOT NULL DEFAULT '0',
  `GROUP_ID` int(18) NOT NULL DEFAULT '0',
  `PERMISSION` int(18) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `IX_VOTE_CHANNEL_ID_GROUP_ID` (`CHANNEL_ID`,`GROUP_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `b_vote_channel_2_site`
--

CREATE TABLE IF NOT EXISTS `b_vote_channel_2_site` (
  `CHANNEL_ID` int(18) NOT NULL DEFAULT '0',
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`CHANNEL_ID`,`SITE_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_vote_event`
--

CREATE TABLE IF NOT EXISTS `b_vote_event` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `VOTE_ID` int(18) NOT NULL DEFAULT '0',
  `VOTE_USER_ID` int(18) NOT NULL DEFAULT '0',
  `DATE_VOTE` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `STAT_SESSION_ID` int(18) DEFAULT NULL,
  `IP` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `VALID` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  PRIMARY KEY (`ID`),
  KEY `IX_USER_ID` (`VOTE_USER_ID`),
  KEY `IX_B_VOTE_EVENT_2` (`VOTE_ID`,`IP`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `b_vote_event_answer`
--

CREATE TABLE IF NOT EXISTS `b_vote_event_answer` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `EVENT_QUESTION_ID` int(18) NOT NULL DEFAULT '0',
  `ANSWER_ID` int(18) NOT NULL DEFAULT '0',
  `MESSAGE` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`),
  KEY `IX_EVENT_QUESTION_ID` (`EVENT_QUESTION_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `b_vote_event_question`
--

CREATE TABLE IF NOT EXISTS `b_vote_event_question` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `EVENT_ID` int(18) NOT NULL DEFAULT '0',
  `QUESTION_ID` int(18) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `IX_EVENT_ID` (`EVENT_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `b_vote_question`
--

CREATE TABLE IF NOT EXISTS `b_vote_question` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `TIMESTAMP_X` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `VOTE_ID` int(18) NOT NULL DEFAULT '0',
  `C_SORT` int(18) DEFAULT '100',
  `COUNTER` int(11) NOT NULL DEFAULT '0',
  `QUESTION` text COLLATE utf8_unicode_ci NOT NULL,
  `QUESTION_TYPE` varchar(4) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'html',
  `IMAGE_ID` int(18) DEFAULT NULL,
  `DIAGRAM` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `REQUIRED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `DIAGRAM_TYPE` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'histogram',
  `TEMPLATE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TEMPLATE_NEW` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_VOTE_ID` (`VOTE_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `b_vote_user`
--

CREATE TABLE IF NOT EXISTS `b_vote_user` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `STAT_GUEST_ID` int(18) DEFAULT NULL,
  `AUTH_USER_ID` int(18) DEFAULT NULL,
  `COUNTER` int(18) NOT NULL DEFAULT '0',
  `DATE_FIRST` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `DATE_LAST` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `LAST_IP` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `b_xml_tree`
--

CREATE TABLE IF NOT EXISTS `b_xml_tree` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `PARENT_ID` int(11) DEFAULT NULL,
  `LEFT_MARGIN` int(11) DEFAULT NULL,
  `RIGHT_MARGIN` int(11) DEFAULT NULL,
  `DEPTH_LEVEL` int(11) DEFAULT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `VALUE` longtext COLLATE utf8_unicode_ci,
  `ATTRIBUTES` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`),
  KEY `ix_b_xml_tree_parent` (`PARENT_ID`),
  KEY `ix_b_xml_tree_left` (`LEFT_MARGIN`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=164 ;

--
-- Дамп данных таблицы `b_xml_tree`
--

INSERT INTO `b_xml_tree` (`ID`, `PARENT_ID`, `LEFT_MARGIN`, `RIGHT_MARGIN`, `DEPTH_LEVEL`, `NAME`, `VALUE`, `ATTRIBUTES`) VALUES
(1, 0, 1, 320, 0, 'КоммерческаяИнформация', NULL, 'a:2:{s:22:"ВерсияСхемы";s:5:"2.021";s:32:"ДатаФормирования";s:19:"2010-06-22T12:53:42";}'),
(2, 1, 2, 67, 1, 'Классификатор', NULL, NULL),
(3, 2, 3, 4, 2, 'Ид', '2', NULL),
(4, 2, 5, 6, 2, 'Наименование', 'Вакансии', NULL),
(5, 2, 7, 64, 2, 'Свойства', NULL, NULL),
(6, 5, 8, 15, 3, 'Свойство', NULL, NULL),
(7, 6, 9, 10, 4, 'Ид', 'CML2_ACTIVE', NULL),
(8, 6, 11, 12, 4, 'Наименование', 'БитриксАктивность', NULL),
(9, 6, 13, 14, 4, 'Множественное', 'false', NULL),
(10, 5, 16, 23, 3, 'Свойство', NULL, NULL),
(11, 10, 17, 18, 4, 'Ид', 'CML2_CODE', NULL),
(12, 10, 19, 20, 4, 'Наименование', 'Символьный код', NULL),
(13, 10, 21, 22, 4, 'Множественное', 'false', NULL),
(14, 5, 24, 31, 3, 'Свойство', NULL, NULL),
(15, 14, 25, 26, 4, 'Ид', 'CML2_SORT', NULL),
(16, 14, 27, 28, 4, 'Наименование', 'Сортировка', NULL),
(17, 14, 29, 30, 4, 'Множественное', 'false', NULL),
(18, 5, 32, 39, 3, 'Свойство', NULL, NULL),
(19, 18, 33, 34, 4, 'Ид', 'CML2_ACTIVE_FROM', NULL),
(20, 18, 35, 36, 4, 'Наименование', 'Начало активности', NULL),
(21, 18, 37, 38, 4, 'Множественное', 'false', NULL),
(22, 5, 40, 47, 3, 'Свойство', NULL, NULL),
(23, 22, 41, 42, 4, 'Ид', 'CML2_ACTIVE_TO', NULL),
(24, 22, 43, 44, 4, 'Наименование', 'Окончание активности', NULL),
(25, 22, 45, 46, 4, 'Множественное', 'false', NULL),
(26, 5, 48, 55, 3, 'Свойство', NULL, NULL),
(27, 26, 49, 50, 4, 'Ид', 'CML2_PREVIEW_TEXT', NULL),
(28, 26, 51, 52, 4, 'Наименование', 'Анонс', NULL),
(29, 26, 53, 54, 4, 'Множественное', 'false', NULL),
(30, 5, 56, 63, 3, 'Свойство', NULL, NULL),
(31, 30, 57, 58, 4, 'Ид', 'CML2_PREVIEW_PICTURE', NULL),
(32, 30, 59, 60, 4, 'Наименование', 'Картинка анонса', NULL),
(33, 30, 61, 62, 4, 'Множественное', 'false', NULL),
(34, 2, 65, 66, 2, 'Группы', NULL, NULL),
(35, 1, 68, 319, 1, 'Каталог', NULL, NULL),
(36, 35, 69, 70, 2, 'Ид', 'corp_vacancies', NULL),
(37, 35, 71, 72, 2, 'ИдКлассификатора', '2', NULL),
(38, 35, 73, 74, 2, 'Наименование', 'Вакансии', NULL),
(39, 35, 75, 76, 2, 'БитриксКод', 'corp_vacancies', NULL),
(40, 35, 77, 78, 2, 'БитриксСортировка', '500', NULL),
(41, 35, 79, 80, 2, 'БитриксURLСписок', '#SITE_DIR#/about/vacancies.php', NULL),
(42, 35, 81, 82, 2, 'БитриксURLДеталь', '#SITE_DIR#/about/vacancies.php##ID#', NULL),
(43, 35, 83, 84, 2, 'БитриксURLРаздел', NULL, NULL),
(44, 35, 85, 86, 2, 'БитриксКартинка', NULL, NULL),
(45, 35, 87, 88, 2, 'БитриксИндексироватьЭлементы', 'true', NULL),
(46, 35, 89, 90, 2, 'БитриксИндексироватьРазделы', 'false', NULL),
(47, 35, 91, 92, 2, 'БитриксДокументооборот', 'false', NULL),
(48, 35, 93, 154, 2, 'БитриксПодписи', NULL, NULL),
(49, 48, 94, 99, 3, 'БитриксПодпись', NULL, NULL),
(50, 49, 95, 96, 4, 'Ид', 'ELEMENT_NAME', NULL),
(51, 49, 97, 98, 4, 'Значение', 'Вакансия', NULL),
(52, 48, 100, 105, 3, 'БитриксПодпись', NULL, NULL),
(53, 52, 101, 102, 4, 'Ид', 'ELEMENTS_NAME', NULL),
(54, 52, 103, 104, 4, 'Значение', 'Вакансии', NULL),
(55, 48, 106, 111, 3, 'БитриксПодпись', NULL, NULL),
(56, 55, 107, 108, 4, 'Ид', 'ELEMENT_ADD', NULL),
(57, 55, 109, 110, 4, 'Значение', 'Добавить вакансию', NULL),
(58, 48, 112, 117, 3, 'БитриксПодпись', NULL, NULL),
(59, 58, 113, 114, 4, 'Ид', 'ELEMENT_EDIT', NULL),
(60, 58, 115, 116, 4, 'Значение', 'Изменить вакансию', NULL),
(61, 48, 118, 123, 3, 'БитриксПодпись', NULL, NULL),
(62, 61, 119, 120, 4, 'Ид', 'ELEMENT_DELETE', NULL),
(63, 61, 121, 122, 4, 'Значение', 'Удалить вакансию', NULL),
(64, 48, 124, 129, 3, 'БитриксПодпись', NULL, NULL),
(65, 64, 125, 126, 4, 'Ид', 'SECTION_NAME', NULL),
(66, 64, 127, 128, 4, 'Значение', 'Раздел', NULL),
(67, 48, 130, 135, 3, 'БитриксПодпись', NULL, NULL),
(68, 67, 131, 132, 4, 'Ид', 'SECTIONS_NAME', NULL),
(69, 67, 133, 134, 4, 'Значение', 'Разделы', NULL),
(70, 48, 136, 141, 3, 'БитриксПодпись', NULL, NULL),
(71, 70, 137, 138, 4, 'Ид', 'SECTION_ADD', NULL),
(72, 70, 139, 140, 4, 'Значение', 'Добавить раздел', NULL),
(73, 48, 142, 147, 3, 'БитриксПодпись', NULL, NULL),
(74, 73, 143, 144, 4, 'Ид', 'SECTION_EDIT', NULL),
(75, 73, 145, 146, 4, 'Значение', 'Изменить раздел', NULL),
(76, 48, 148, 153, 3, 'БитриксПодпись', NULL, NULL),
(77, 76, 149, 150, 4, 'Ид', 'SECTION_DELETE', NULL),
(78, 76, 151, 152, 4, 'Значение', 'Удалить раздел', NULL),
(79, 35, 155, 318, 2, 'Товары', NULL, NULL),
(80, 79, 156, 209, 3, 'Товар', NULL, NULL),
(81, 80, 157, 158, 4, 'Ид', '2', NULL),
(82, 80, 159, 160, 4, 'Наименование', 'Главный специалист Отдела анализа кредитных проектов региональной сети', NULL),
(83, 80, 161, 162, 4, 'БитриксТеги', NULL, NULL),
(84, 80, 163, 164, 4, 'Описание', '<b>Требования</b> 						 						 \n<p>Высшее экономическое/финансовое образование, опыт в банках топ-100 не менее 3-х лет в кредитном отделе (анализ заемщиков), желателен опыт работы с кредитными заявками филиалов, знание технологий АФХД предприятий, навыки написания экспертного заключения, знание законодательства (в т.ч. Положение ЦБ № 254-П).</p>\n 						 						<b>Обязанности</b> 						 \n<p>Анализ кредитных проектов филиалов Банка, подготовка предложений по структурированию кредитных проектов, оценка полноты и качества формируемых филиалами заключений, выявление стоп-факторов, доработка заявок филиалов в соответствии со стандартами Банка, подготовка заключения (рекомендаций) на КК по заявкам филиалов в части оценки финансово-экономического состояния заемщика, защита проектов на КК Банка, консультирование и методологическая помощь филиалам Банка в части корпоративного кредитования.</p>\n 						 						<b>Условия</b> 						 \n<p> Место работы: М.Парк Культуры. Графики работы: пятидневная рабочая неделя, с 9:00 до 18:00, пт. до 16:45. Зарплата: 50000 руб. оклад + премии, полный соц. пакет,оформление согласно ТК РФ</p>\n ', NULL),
(85, 80, 165, 208, 4, 'ЗначенияСвойств', NULL, NULL),
(86, 85, 166, 171, 5, 'ЗначенияСвойства', NULL, NULL),
(87, 86, 167, 168, 6, 'Ид', 'CML2_ACTIVE', NULL),
(88, 86, 169, 170, 6, 'Значение', 'true', NULL),
(89, 85, 172, 177, 5, 'ЗначенияСвойства', NULL, NULL),
(90, 89, 173, 174, 6, 'Ид', 'CML2_CODE', NULL),
(91, 89, 175, 176, 6, 'Значение', NULL, NULL),
(92, 85, 178, 183, 5, 'ЗначенияСвойства', NULL, NULL),
(93, 92, 179, 180, 6, 'Ид', 'CML2_SORT', NULL),
(94, 92, 181, 182, 6, 'Значение', '200', NULL),
(95, 85, 184, 189, 5, 'ЗначенияСвойства', NULL, NULL),
(96, 95, 185, 186, 6, 'Ид', 'CML2_ACTIVE_FROM', NULL),
(97, 95, 187, 188, 6, 'Значение', '2010-05-01 00:00:00', NULL),
(98, 85, 190, 195, 5, 'ЗначенияСвойства', NULL, NULL),
(99, 98, 191, 192, 6, 'Ид', 'CML2_ACTIVE_TO', NULL),
(100, 98, 193, 194, 6, 'Значение', NULL, NULL),
(101, 85, 196, 201, 5, 'ЗначенияСвойства', NULL, NULL),
(102, 101, 197, 198, 6, 'Ид', 'CML2_PREVIEW_TEXT', NULL),
(103, 101, 199, 200, 6, 'Значение', NULL, NULL),
(104, 85, 202, 207, 5, 'ЗначенияСвойства', NULL, NULL),
(105, 104, 203, 204, 6, 'Ид', 'CML2_PREVIEW_PICTURE', NULL),
(106, 104, 205, 206, 6, 'Значение', NULL, NULL),
(107, 79, 210, 263, 3, 'Товар', NULL, NULL),
(108, 107, 211, 212, 4, 'Ид', '3', NULL),
(109, 107, 213, 214, 4, 'Наименование', 'Специалист по продажам розничных банковских продуктов', NULL),
(110, 107, 215, 216, 4, 'БитриксТеги', NULL, NULL),
(111, 107, 217, 218, 4, 'Описание', '<b>Требования</b> 						 						 \n<p>Высшее экономического образования ‚ опыт работы в сфере продаж банковских продуктов‚ опытный пользователь ПК‚ этика делового общения‚ ответственность‚ инициативность‚ активность.</p>\n 						 						<b>Обязанности</b> 						 \n<p>Продажа розничных банковских продуктов, оформление документов.</p>\n 						 						<b>Условия</b> 						 \n<p>Трудоустройство по ТК РФ‚ полный соц. пакет. График работы: пятидневная рабочая неделя. Зарплата: 20000 руб. оклад + премии</p>\n ', NULL),
(112, 107, 219, 262, 4, 'ЗначенияСвойств', NULL, NULL),
(113, 112, 220, 225, 5, 'ЗначенияСвойства', NULL, NULL),
(114, 113, 221, 222, 6, 'Ид', 'CML2_ACTIVE', NULL),
(115, 113, 223, 224, 6, 'Значение', 'true', NULL),
(116, 112, 226, 231, 5, 'ЗначенияСвойства', NULL, NULL),
(117, 116, 227, 228, 6, 'Ид', 'CML2_CODE', NULL),
(118, 116, 229, 230, 6, 'Значение', NULL, NULL),
(119, 112, 232, 237, 5, 'ЗначенияСвойства', NULL, NULL),
(120, 119, 233, 234, 6, 'Ид', 'CML2_SORT', NULL),
(121, 119, 235, 236, 6, 'Значение', '300', NULL),
(122, 112, 238, 243, 5, 'ЗначенияСвойства', NULL, NULL),
(123, 122, 239, 240, 6, 'Ид', 'CML2_ACTIVE_FROM', NULL),
(124, 122, 241, 242, 6, 'Значение', '2010-05-01 00:00:00', NULL),
(125, 112, 244, 249, 5, 'ЗначенияСвойства', NULL, NULL),
(126, 125, 245, 246, 6, 'Ид', 'CML2_ACTIVE_TO', NULL),
(127, 125, 247, 248, 6, 'Значение', NULL, NULL),
(128, 112, 250, 255, 5, 'ЗначенияСвойства', NULL, NULL),
(129, 128, 251, 252, 6, 'Ид', 'CML2_PREVIEW_TEXT', NULL),
(130, 128, 253, 254, 6, 'Значение', NULL, NULL),
(131, 112, 256, 261, 5, 'ЗначенияСвойства', NULL, NULL),
(132, 131, 257, 258, 6, 'Ид', 'CML2_PREVIEW_PICTURE', NULL),
(133, 131, 259, 260, 6, 'Значение', NULL, NULL),
(134, 79, 264, 317, 3, 'Товар', NULL, NULL),
(135, 134, 265, 266, 4, 'Ид', '4', NULL),
(136, 134, 267, 268, 4, 'Наименование', 'Специалист Отдела андеррайтинга', NULL),
(137, 134, 269, 270, 4, 'БитриксТеги', NULL, NULL),
(138, 134, 271, 272, 4, 'Описание', '<b>Требования</b> 						 						 \n<p>Высшее профессиональное образование, опыт работы от 2 лет в отделе по работе с физическими и юридическими лицами Банков, связанных с анализом платёжеспособности и кредитоспособности физических и юридических лиц.</p>\n 						 						<b>Обязанности</b> 						 \n<p>Проверка соответствия документов, предоставленных клиентами Банка, анализ информации о риске</p>\n 						 						<b>Условия</b> 						 \n<p>Трудоустройство по ТК РФ‚ полный соц. пакет. График работы: пятидневная рабочая неделя. Зарплата: оклад 25000 руб.</p>\n ', NULL),
(139, 134, 273, 316, 4, 'ЗначенияСвойств', NULL, NULL),
(140, 139, 274, 279, 5, 'ЗначенияСвойства', NULL, NULL),
(141, 140, 275, 276, 6, 'Ид', 'CML2_ACTIVE', NULL),
(142, 140, 277, 278, 6, 'Значение', 'true', NULL),
(143, 139, 280, 285, 5, 'ЗначенияСвойства', NULL, NULL),
(144, 143, 281, 282, 6, 'Ид', 'CML2_CODE', NULL),
(145, 143, 283, 284, 6, 'Значение', NULL, NULL),
(146, 139, 286, 291, 5, 'ЗначенияСвойства', NULL, NULL),
(147, 146, 287, 288, 6, 'Ид', 'CML2_SORT', NULL),
(148, 146, 289, 290, 6, 'Значение', '400', NULL),
(149, 139, 292, 297, 5, 'ЗначенияСвойства', NULL, NULL),
(150, 149, 293, 294, 6, 'Ид', 'CML2_ACTIVE_FROM', NULL),
(151, 149, 295, 296, 6, 'Значение', '2010-05-01 00:00:00', NULL),
(152, 139, 298, 303, 5, 'ЗначенияСвойства', NULL, NULL),
(153, 152, 299, 300, 6, 'Ид', 'CML2_ACTIVE_TO', NULL),
(154, 152, 301, 302, 6, 'Значение', NULL, NULL),
(155, 139, 304, 309, 5, 'ЗначенияСвойства', NULL, NULL),
(156, 155, 305, 306, 6, 'Ид', 'CML2_PREVIEW_TEXT', NULL),
(157, 155, 307, 308, 6, 'Значение', NULL, NULL),
(158, 139, 310, 315, 5, 'ЗначенияСвойства', NULL, NULL),
(159, 158, 311, 312, 6, 'Ид', 'CML2_PREVIEW_PICTURE', NULL),
(160, 158, 313, 314, 6, 'Значение', NULL, NULL),
(161, 0, 4, 0, 0, '', NULL, NULL),
(162, 0, 5, 0, 0, '', NULL, NULL),
(163, 0, 6, 0, 0, '', NULL, NULL);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
