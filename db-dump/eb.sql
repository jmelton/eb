-- phpMyAdmin SQL Dump
-- version 3.2.4
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jun 21, 2010 at 02:23 PM
-- Server version: 5.1.41
-- PHP Version: 5.3.1

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `eb`
--

-- --------------------------------------------------------

--
-- Table structure for table `exp_actions`
--

CREATE TABLE IF NOT EXISTS `exp_actions` (
  `action_id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `class` varchar(50) NOT NULL,
  `method` varchar(50) NOT NULL,
  PRIMARY KEY (`action_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=20 ;

--
-- Dumping data for table `exp_actions`
--

INSERT INTO `exp_actions` (`action_id`, `class`, `method`) VALUES
(1, 'Comment', 'insert_new_comment'),
(2, 'Comment_CP', 'delete_comment_notification'),
(3, 'Mailinglist', 'insert_new_email'),
(4, 'Mailinglist', 'authorize_email'),
(5, 'Mailinglist', 'unsubscribe'),
(6, 'Member', 'registration_form'),
(7, 'Member', 'register_member'),
(8, 'Member', 'activate_member'),
(9, 'Member', 'member_login'),
(10, 'Member', 'member_logout'),
(11, 'Member', 'retrieve_password'),
(12, 'Member', 'reset_password'),
(13, 'Member', 'send_member_email'),
(14, 'Member', 'update_un_pw'),
(15, 'Member', 'member_search'),
(16, 'Member', 'member_delete'),
(17, 'Trackback_CP', 'receive_trackback'),
(18, 'Weblog', 'insert_new_entry'),
(19, 'Search', 'do_search');

-- --------------------------------------------------------

--
-- Table structure for table `exp_captcha`
--

CREATE TABLE IF NOT EXISTS `exp_captcha` (
  `captcha_id` bigint(13) unsigned NOT NULL AUTO_INCREMENT,
  `date` int(10) unsigned NOT NULL,
  `ip_address` varchar(16) NOT NULL DEFAULT '0',
  `word` varchar(20) NOT NULL,
  PRIMARY KEY (`captcha_id`),
  KEY `word` (`word`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `exp_captcha`
--


-- --------------------------------------------------------

--
-- Table structure for table `exp_categories`
--

CREATE TABLE IF NOT EXISTS `exp_categories` (
  `cat_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `group_id` int(6) unsigned NOT NULL,
  `parent_id` int(4) unsigned NOT NULL,
  `cat_name` varchar(100) NOT NULL,
  `cat_url_title` varchar(75) NOT NULL,
  `cat_description` text NOT NULL,
  `cat_image` varchar(120) NOT NULL,
  `cat_order` int(4) unsigned NOT NULL,
  PRIMARY KEY (`cat_id`),
  KEY `group_id` (`group_id`),
  KEY `cat_name` (`cat_name`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `exp_categories`
--

INSERT INTO `exp_categories` (`cat_id`, `site_id`, `group_id`, `parent_id`, `cat_name`, `cat_url_title`, `cat_description`, `cat_image`, `cat_order`) VALUES
(1, 1, 1, 0, 'Blogging', 'Blogging', '', '', 1),
(2, 1, 1, 0, 'News', 'News', '', '', 2),
(3, 1, 1, 0, 'Personal', 'Personal', '', '', 3);

-- --------------------------------------------------------

--
-- Table structure for table `exp_category_fields`
--

CREATE TABLE IF NOT EXISTS `exp_category_fields` (
  `field_id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `group_id` int(4) unsigned NOT NULL,
  `field_name` varchar(32) NOT NULL DEFAULT '',
  `field_label` varchar(50) NOT NULL DEFAULT '',
  `field_type` varchar(12) NOT NULL DEFAULT 'text',
  `field_list_items` text NOT NULL,
  `field_maxl` smallint(3) NOT NULL DEFAULT '128',
  `field_ta_rows` tinyint(2) NOT NULL DEFAULT '8',
  `field_default_fmt` varchar(40) NOT NULL DEFAULT 'none',
  `field_show_fmt` char(1) NOT NULL DEFAULT 'y',
  `field_text_direction` char(3) NOT NULL DEFAULT 'ltr',
  `field_required` char(1) NOT NULL DEFAULT 'n',
  `field_order` int(3) unsigned NOT NULL,
  PRIMARY KEY (`field_id`),
  KEY `site_id` (`site_id`),
  KEY `group_id` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `exp_category_fields`
--


-- --------------------------------------------------------

--
-- Table structure for table `exp_category_field_data`
--

CREATE TABLE IF NOT EXISTS `exp_category_field_data` (
  `cat_id` int(4) unsigned NOT NULL,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `group_id` int(4) unsigned NOT NULL,
  PRIMARY KEY (`cat_id`),
  KEY `site_id` (`site_id`),
  KEY `group_id` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `exp_category_field_data`
--

INSERT INTO `exp_category_field_data` (`cat_id`, `site_id`, `group_id`) VALUES
(1, 1, 1),
(2, 1, 1),
(3, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `exp_category_groups`
--

CREATE TABLE IF NOT EXISTS `exp_category_groups` (
  `group_id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `group_name` varchar(50) NOT NULL,
  `sort_order` char(1) NOT NULL DEFAULT 'a',
  `field_html_formatting` char(4) NOT NULL DEFAULT 'all',
  `can_edit_categories` text NOT NULL,
  `can_delete_categories` text NOT NULL,
  `is_user_blog` char(1) NOT NULL DEFAULT 'n',
  PRIMARY KEY (`group_id`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `exp_category_groups`
--

INSERT INTO `exp_category_groups` (`group_id`, `site_id`, `group_name`, `sort_order`, `field_html_formatting`, `can_edit_categories`, `can_delete_categories`, `is_user_blog`) VALUES
(1, 1, 'Default Category Group', 'a', 'all', '', '', 'n');

-- --------------------------------------------------------

--
-- Table structure for table `exp_category_posts`
--

CREATE TABLE IF NOT EXISTS `exp_category_posts` (
  `entry_id` int(10) unsigned NOT NULL,
  `cat_id` int(10) unsigned NOT NULL,
  KEY `entry_id` (`entry_id`),
  KEY `cat_id` (`cat_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `exp_category_posts`
--


-- --------------------------------------------------------

--
-- Table structure for table `exp_comments`
--

CREATE TABLE IF NOT EXISTS `exp_comments` (
  `comment_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `entry_id` int(10) unsigned NOT NULL DEFAULT '0',
  `weblog_id` int(4) unsigned NOT NULL,
  `author_id` int(10) unsigned NOT NULL DEFAULT '0',
  `status` char(1) NOT NULL DEFAULT 'o',
  `name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `url` varchar(75) NOT NULL,
  `location` varchar(50) NOT NULL,
  `ip_address` varchar(16) NOT NULL,
  `comment_date` int(10) NOT NULL,
  `edit_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `comment` text NOT NULL,
  `notify` char(1) NOT NULL DEFAULT 'n',
  PRIMARY KEY (`comment_id`),
  KEY `entry_id` (`entry_id`),
  KEY `weblog_id` (`weblog_id`),
  KEY `author_id` (`author_id`),
  KEY `status` (`status`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `exp_comments`
--


-- --------------------------------------------------------

--
-- Table structure for table `exp_cp_log`
--

CREATE TABLE IF NOT EXISTS `exp_cp_log` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `member_id` int(10) unsigned NOT NULL,
  `username` varchar(32) NOT NULL,
  `ip_address` varchar(16) NOT NULL DEFAULT '0',
  `act_date` int(10) NOT NULL,
  `action` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=25 ;

--
-- Dumping data for table `exp_cp_log`
--

INSERT INTO `exp_cp_log` (`id`, `site_id`, `member_id`, `username`, `ip_address`, `act_date`, `action`) VALUES
(1, 1, 1, 'ebadmin', '127.0.0.1', 1275426892, 'Logged in'),
(2, 1, 1, 'ebadmin', '127.0.0.1', 1275428001, 'Logged in'),
(3, 1, 1, 'ebadmin', '127.0.0.1', 1275428597, 'Logged in'),
(4, 1, 1, 'ebadmin', '127.0.0.1', 1275510478, 'Logged in'),
(5, 1, 1, 'ebadmin', '127.0.0.1', 1275514223, 'Section Created:&nbsp;&nbsp;Cooking for Kids Recipe'),
(6, 1, 1, 'ebadmin', '127.0.0.1', 1275522304, 'Field Group Created:&nbsp;&nbsp;CC4Kids'),
(7, 1, 1, 'ebadmin', '127.0.0.1', 1275525496, 'Logged in'),
(8, 1, 1, 'ebadmin', '127.0.0.1', 1276026935, 'Logged in'),
(9, 1, 1, 'ebadmin', '127.0.0.1', 1276037477, 'Member profile created:&nbsp;&nbsp;testuser'),
(10, 1, 1, 'ebadmin', '127.0.0.1', 1276716618, 'Logged in'),
(11, 1, 1, 'ebadmin', '127.0.0.1', 1276741135, 'Logged in'),
(12, 1, 1, 'ebadmin', '127.0.0.1', 1276810482, 'Logged in'),
(13, 1, 1, 'ebadmin', '127.0.0.1', 1276810578, 'Section Created:&nbsp;&nbsp;Recipe'),
(14, 1, 1, 'ebadmin', '127.0.0.1', 1276810609, 'Field Group Created:&nbsp;&nbsp;Recipes'),
(15, 1, 1, 'ebadmin', '127.0.0.1', 1276811044, 'Section Deleted:&nbsp;&nbsp;Default Site Weblog'),
(16, 1, 1, 'ebadmin', '127.0.0.1', 1276901684, 'Logged in'),
(17, 1, 1, 'ebadmin', '127.0.0.1', 1277069011, 'Logged in'),
(18, 1, 1, 'ebadmin', '127.0.0.1', 1277071897, 'Section Created:&nbsp;&nbsp;Super Easy Breezy Helpful Tip'),
(19, 1, 1, 'ebadmin', '127.0.0.1', 1277072506, 'Field Group Created:&nbsp;&nbsp;Super Easy Breezy Helpful Tips'),
(20, 1, 1, 'ebadmin', '127.0.0.1', 1277145939, 'Logged in'),
(21, 1, 1, 'ebadmin', '127.0.0.1', 1277149769, 'Logged in'),
(22, 1, 1, 'ebadmin', '127.0.0.1', 1277153561, 'Logged in'),
(23, 1, 1, 'ebadmin', '127.0.0.1', 1277157335, 'Logged in'),
(24, 1, 1, 'ebadmin', '127.0.0.1', 1277158032, 'Logged in');

-- --------------------------------------------------------

--
-- Table structure for table `exp_email_cache`
--

CREATE TABLE IF NOT EXISTS `exp_email_cache` (
  `cache_id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `cache_date` int(10) unsigned NOT NULL DEFAULT '0',
  `total_sent` int(6) unsigned NOT NULL,
  `from_name` varchar(70) NOT NULL,
  `from_email` varchar(70) NOT NULL,
  `recipient` text NOT NULL,
  `cc` text NOT NULL,
  `bcc` text NOT NULL,
  `recipient_array` mediumtext NOT NULL,
  `subject` varchar(120) NOT NULL,
  `message` mediumtext NOT NULL,
  `plaintext_alt` mediumtext NOT NULL,
  `mailinglist` char(1) NOT NULL DEFAULT 'n',
  `mailtype` varchar(6) NOT NULL,
  `text_fmt` varchar(40) NOT NULL,
  `wordwrap` char(1) NOT NULL DEFAULT 'y',
  `priority` char(1) NOT NULL DEFAULT '3',
  PRIMARY KEY (`cache_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `exp_email_cache`
--


-- --------------------------------------------------------

--
-- Table structure for table `exp_email_cache_mg`
--

CREATE TABLE IF NOT EXISTS `exp_email_cache_mg` (
  `cache_id` int(6) unsigned NOT NULL,
  `group_id` smallint(4) NOT NULL,
  KEY `cache_id` (`cache_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `exp_email_cache_mg`
--


-- --------------------------------------------------------

--
-- Table structure for table `exp_email_cache_ml`
--

CREATE TABLE IF NOT EXISTS `exp_email_cache_ml` (
  `cache_id` int(6) unsigned NOT NULL,
  `list_id` smallint(4) NOT NULL,
  KEY `cache_id` (`cache_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `exp_email_cache_ml`
--


-- --------------------------------------------------------

--
-- Table structure for table `exp_email_console_cache`
--

CREATE TABLE IF NOT EXISTS `exp_email_console_cache` (
  `cache_id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `cache_date` int(10) unsigned NOT NULL DEFAULT '0',
  `member_id` int(10) unsigned NOT NULL,
  `member_name` varchar(50) NOT NULL,
  `ip_address` varchar(16) NOT NULL DEFAULT '0',
  `recipient` varchar(70) NOT NULL,
  `recipient_name` varchar(50) NOT NULL,
  `subject` varchar(120) NOT NULL,
  `message` mediumtext NOT NULL,
  PRIMARY KEY (`cache_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `exp_email_console_cache`
--


-- --------------------------------------------------------

--
-- Table structure for table `exp_email_tracker`
--

CREATE TABLE IF NOT EXISTS `exp_email_tracker` (
  `email_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `email_date` int(10) unsigned NOT NULL DEFAULT '0',
  `sender_ip` varchar(16) NOT NULL,
  `sender_email` varchar(75) NOT NULL,
  `sender_username` varchar(50) NOT NULL,
  `number_recipients` int(4) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`email_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `exp_email_tracker`
--


-- --------------------------------------------------------

--
-- Table structure for table `exp_entry_ping_status`
--

CREATE TABLE IF NOT EXISTS `exp_entry_ping_status` (
  `entry_id` int(10) unsigned NOT NULL,
  `ping_id` int(10) unsigned NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `exp_entry_ping_status`
--


-- --------------------------------------------------------

--
-- Table structure for table `exp_entry_versioning`
--

CREATE TABLE IF NOT EXISTS `exp_entry_versioning` (
  `version_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(10) unsigned NOT NULL,
  `weblog_id` int(4) unsigned NOT NULL,
  `author_id` int(10) unsigned NOT NULL,
  `version_date` int(10) NOT NULL,
  `version_data` mediumtext NOT NULL,
  PRIMARY KEY (`version_id`),
  KEY `entry_id` (`entry_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `exp_entry_versioning`
--


-- --------------------------------------------------------

--
-- Table structure for table `exp_extensions`
--

CREATE TABLE IF NOT EXISTS `exp_extensions` (
  `extension_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `class` varchar(50) NOT NULL DEFAULT '',
  `method` varchar(50) NOT NULL DEFAULT '',
  `hook` varchar(50) NOT NULL DEFAULT '',
  `settings` text NOT NULL,
  `priority` int(2) NOT NULL DEFAULT '10',
  `version` varchar(10) NOT NULL DEFAULT '',
  `enabled` char(1) NOT NULL DEFAULT 'y',
  PRIMARY KEY (`extension_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=37 ;

--
-- Dumping data for table `exp_extensions`
--

INSERT INTO `exp_extensions` (`extension_id`, `class`, `method`, `hook`, `settings`, `priority`, `version`, `enabled`) VALUES
(1, 'Cp_jquery', 'add_js', 'show_full_control_panel_end', 'a:2:{s:10:"jquery_src";s:63:"http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js";s:13:"jquery_ui_src";s:68:"http://ajax.googleapis.com/ajax/libs/jqueryui/1.7.1/jquery-ui.min.js";}', 1, '1.1.1', 'y'),
(2, 'Fieldframe', 'sessions_start', 'sessions_start', 'a:3:{s:14:"fieldtypes_url";s:48:"http://localhost/eb/admin/extensions/fieldtypes/";s:15:"fieldtypes_path";s:51:"c:/xampplite/htdocs/eb/admin/extensions/fieldtypes/";s:17:"check_for_updates";s:1:"n";}', 1, '1.4.2', 'y'),
(3, 'Fieldframe', 'publish_admin_edit_field_type_pulldown', 'publish_admin_edit_field_type_pulldown', 'a:3:{s:14:"fieldtypes_url";s:48:"http://localhost/eb/admin/extensions/fieldtypes/";s:15:"fieldtypes_path";s:51:"c:/xampplite/htdocs/eb/admin/extensions/fieldtypes/";s:17:"check_for_updates";s:1:"n";}', 10, '1.4.2', 'y'),
(4, 'Fieldframe', 'publish_admin_edit_field_type_cellone', 'publish_admin_edit_field_type_cellone', 'a:3:{s:14:"fieldtypes_url";s:48:"http://localhost/eb/admin/extensions/fieldtypes/";s:15:"fieldtypes_path";s:51:"c:/xampplite/htdocs/eb/admin/extensions/fieldtypes/";s:17:"check_for_updates";s:1:"n";}', 10, '1.4.2', 'y'),
(5, 'Fieldframe', 'publish_admin_edit_field_type_celltwo', 'publish_admin_edit_field_type_celltwo', 'a:3:{s:14:"fieldtypes_url";s:48:"http://localhost/eb/admin/extensions/fieldtypes/";s:15:"fieldtypes_path";s:51:"c:/xampplite/htdocs/eb/admin/extensions/fieldtypes/";s:17:"check_for_updates";s:1:"n";}', 10, '1.4.2', 'y'),
(6, 'Fieldframe', 'publish_admin_edit_field_extra_row', 'publish_admin_edit_field_extra_row', 'a:3:{s:14:"fieldtypes_url";s:48:"http://localhost/eb/admin/extensions/fieldtypes/";s:15:"fieldtypes_path";s:51:"c:/xampplite/htdocs/eb/admin/extensions/fieldtypes/";s:17:"check_for_updates";s:1:"n";}', 10, '1.4.2', 'y'),
(7, 'Fieldframe', 'publish_admin_edit_field_format', 'publish_admin_edit_field_format', 'a:3:{s:14:"fieldtypes_url";s:48:"http://localhost/eb/admin/extensions/fieldtypes/";s:15:"fieldtypes_path";s:51:"c:/xampplite/htdocs/eb/admin/extensions/fieldtypes/";s:17:"check_for_updates";s:1:"n";}', 10, '1.4.2', 'y'),
(8, 'Fieldframe', 'publish_admin_edit_field_js', 'publish_admin_edit_field_js', 'a:3:{s:14:"fieldtypes_url";s:48:"http://localhost/eb/admin/extensions/fieldtypes/";s:15:"fieldtypes_path";s:51:"c:/xampplite/htdocs/eb/admin/extensions/fieldtypes/";s:17:"check_for_updates";s:1:"n";}', 10, '1.4.2', 'y'),
(9, 'Fieldframe', 'show_full_control_panel_start', 'show_full_control_panel_start', 'a:3:{s:14:"fieldtypes_url";s:48:"http://localhost/eb/admin/extensions/fieldtypes/";s:15:"fieldtypes_path";s:51:"c:/xampplite/htdocs/eb/admin/extensions/fieldtypes/";s:17:"check_for_updates";s:1:"n";}', 10, '1.4.2', 'y'),
(10, 'Fieldframe', 'show_full_control_panel_end', 'show_full_control_panel_end', 'a:3:{s:14:"fieldtypes_url";s:48:"http://localhost/eb/admin/extensions/fieldtypes/";s:15:"fieldtypes_path";s:51:"c:/xampplite/htdocs/eb/admin/extensions/fieldtypes/";s:17:"check_for_updates";s:1:"n";}', 10, '1.4.2', 'y'),
(11, 'Fieldframe', 'publish_form_field_unique', 'publish_form_field_unique', 'a:3:{s:14:"fieldtypes_url";s:48:"http://localhost/eb/admin/extensions/fieldtypes/";s:15:"fieldtypes_path";s:51:"c:/xampplite/htdocs/eb/admin/extensions/fieldtypes/";s:17:"check_for_updates";s:1:"n";}', 10, '1.4.2', 'y'),
(12, 'Fieldframe', 'submit_new_entry_start', 'submit_new_entry_start', 'a:3:{s:14:"fieldtypes_url";s:48:"http://localhost/eb/admin/extensions/fieldtypes/";s:15:"fieldtypes_path";s:51:"c:/xampplite/htdocs/eb/admin/extensions/fieldtypes/";s:17:"check_for_updates";s:1:"n";}', 10, '1.4.2', 'y'),
(13, 'Fieldframe', 'submit_new_entry_end', 'submit_new_entry_end', 'a:3:{s:14:"fieldtypes_url";s:48:"http://localhost/eb/admin/extensions/fieldtypes/";s:15:"fieldtypes_path";s:51:"c:/xampplite/htdocs/eb/admin/extensions/fieldtypes/";s:17:"check_for_updates";s:1:"n";}', 10, '1.4.2', 'y'),
(14, 'Fieldframe', 'publish_form_start', 'publish_form_start', 'a:3:{s:14:"fieldtypes_url";s:48:"http://localhost/eb/admin/extensions/fieldtypes/";s:15:"fieldtypes_path";s:51:"c:/xampplite/htdocs/eb/admin/extensions/fieldtypes/";s:17:"check_for_updates";s:1:"n";}', 10, '1.4.2', 'y'),
(15, 'Fieldframe', 'weblog_standalone_form_start', 'weblog_standalone_form_start', 'a:3:{s:14:"fieldtypes_url";s:48:"http://localhost/eb/admin/extensions/fieldtypes/";s:15:"fieldtypes_path";s:51:"c:/xampplite/htdocs/eb/admin/extensions/fieldtypes/";s:17:"check_for_updates";s:1:"n";}', 10, '1.4.2', 'y'),
(16, 'Fieldframe', 'weblog_standalone_form_end', 'weblog_standalone_form_end', 'a:3:{s:14:"fieldtypes_url";s:48:"http://localhost/eb/admin/extensions/fieldtypes/";s:15:"fieldtypes_path";s:51:"c:/xampplite/htdocs/eb/admin/extensions/fieldtypes/";s:17:"check_for_updates";s:1:"n";}', 10, '1.4.2', 'y'),
(17, 'Fieldframe', 'weblog_entries_tagdata', 'weblog_entries_tagdata', 'a:3:{s:14:"fieldtypes_url";s:48:"http://localhost/eb/admin/extensions/fieldtypes/";s:15:"fieldtypes_path";s:51:"c:/xampplite/htdocs/eb/admin/extensions/fieldtypes/";s:17:"check_for_updates";s:1:"n";}', 1, '1.4.2', 'y'),
(18, 'Fieldframe', 'lg_addon_update_register_source', 'lg_addon_update_register_source', 'a:3:{s:14:"fieldtypes_url";s:48:"http://localhost/eb/admin/extensions/fieldtypes/";s:15:"fieldtypes_path";s:51:"c:/xampplite/htdocs/eb/admin/extensions/fieldtypes/";s:17:"check_for_updates";s:1:"n";}', 10, '1.4.2', 'y'),
(19, 'Fieldframe', 'lg_addon_update_register_addon', 'lg_addon_update_register_addon', 'a:3:{s:14:"fieldtypes_url";s:48:"http://localhost/eb/admin/extensions/fieldtypes/";s:15:"fieldtypes_path";s:51:"c:/xampplite/htdocs/eb/admin/extensions/fieldtypes/";s:17:"check_for_updates";s:1:"n";}', 10, '1.4.2', 'y'),
(20, 'Fieldframe', 'forward_hook:weblog_standalone_insert_entry:10', 'weblog_standalone_insert_entry', 'a:3:{s:14:"fieldtypes_url";s:48:"http://localhost/eb/admin/extensions/fieldtypes/";s:15:"fieldtypes_path";s:51:"c:/xampplite/htdocs/eb/admin/extensions/fieldtypes/";s:17:"check_for_updates";s:1:"n";}', 10, '1.4.2', 'y'),
(21, 'Lg_data_matrix_ext', 'publish_form_start', 'publish_form_start', 'a:1:{i:1;a:4:{s:6:"enable";s:1:"y";s:17:"check_for_updates";s:1:"y";s:11:"show_donate";s:1:"y";s:11:"show_promos";s:1:"y";}}', 10, '1.1.1', 'y'),
(22, 'Lg_data_matrix_ext', 'publish_admin_edit_field_js', 'publish_admin_edit_field_js', 'a:1:{i:1;a:4:{s:6:"enable";s:1:"y";s:17:"check_for_updates";s:1:"y";s:11:"show_donate";s:1:"y";s:11:"show_promos";s:1:"y";}}', 10, '1.1.1', 'y'),
(23, 'Lg_data_matrix_ext', 'publish_form_field_unique', 'publish_form_field_unique', 'a:1:{i:1;a:4:{s:6:"enable";s:1:"y";s:17:"check_for_updates";s:1:"y";s:11:"show_donate";s:1:"y";s:11:"show_promos";s:1:"y";}}', 10, '1.1.1', 'y'),
(24, 'Lg_data_matrix_ext', 'submit_new_entry_start', 'submit_new_entry_start', 'a:1:{i:1;a:4:{s:6:"enable";s:1:"y";s:17:"check_for_updates";s:1:"y";s:11:"show_donate";s:1:"y";s:11:"show_promos";s:1:"y";}}', 10, '1.1.1', 'y'),
(25, 'Lg_data_matrix_ext', 'show_full_control_panel_end', 'show_full_control_panel_end', 'a:1:{i:1;a:4:{s:6:"enable";s:1:"y";s:17:"check_for_updates";s:1:"y";s:11:"show_donate";s:1:"y";s:11:"show_promos";s:1:"y";}}', 10, '1.1.1', 'y'),
(26, 'Lg_data_matrix_ext', 'publish_admin_edit_field_type_pulldown', 'publish_admin_edit_field_type_pulldown', 'a:1:{i:1;a:4:{s:6:"enable";s:1:"y";s:17:"check_for_updates";s:1:"y";s:11:"show_donate";s:1:"y";s:11:"show_promos";s:1:"y";}}', 10, '1.1.1', 'y'),
(27, 'Lg_data_matrix_ext', 'publish_admin_edit_field_type_celltwo', 'publish_admin_edit_field_type_celltwo', 'a:1:{i:1;a:4:{s:6:"enable";s:1:"y";s:17:"check_for_updates";s:1:"y";s:11:"show_donate";s:1:"y";s:11:"show_promos";s:1:"y";}}', 10, '1.1.1', 'y'),
(28, 'Lg_data_matrix_ext', 'weblog_entries_tagdata_end', 'weblog_entries_tagdata_end', 'a:1:{i:1;a:4:{s:6:"enable";s:1:"y";s:17:"check_for_updates";s:1:"y";s:11:"show_donate";s:1:"y";s:11:"show_promos";s:1:"y";}}', 10, '1.1.1', 'y'),
(36, 'multi_relationship', 'modify_template', 'weblog_entries_tagdata', '', 10, '1.0.6', 'y'),
(29, 'Lg_data_matrix_ext', 'lg_addon_update_register_source', 'lg_addon_update_register_source', 'a:1:{i:1;a:4:{s:6:"enable";s:1:"y";s:17:"check_for_updates";s:1:"y";s:11:"show_donate";s:1:"y";s:11:"show_promos";s:1:"y";}}', 10, '1.1.1', 'y'),
(33, 'multi_relationship', 'publish', 'publish_form_field_unique', '', 10, '1.0.6', 'y'),
(34, 'multi_relationship', 'modify_post', 'submit_new_entry_start', '', 10, '1.0.6', 'y'),
(35, 'multi_relationship', 'submit_relation', 'submit_new_entry_end', '', 10, '1.0.6', 'y'),
(30, 'Lg_data_matrix_ext', 'lg_addon_update_register_addon', 'lg_addon_update_register_addon', 'a:1:{i:1;a:4:{s:6:"enable";s:1:"y";s:17:"check_for_updates";s:1:"y";s:11:"show_donate";s:1:"y";s:11:"show_promos";s:1:"y";}}', 10, '1.1.1', 'y'),
(31, 'multi_relationship', 'edit_field_groups', 'show_full_control_panel_end', '', 10, '1.0.6', 'y'),
(32, 'multi_relationship', 'edit_custom_field', 'publish_admin_edit_field_extra_row', '', 10, '1.0.6', 'y');

-- --------------------------------------------------------

--
-- Table structure for table `exp_ff_fieldtypes`
--

CREATE TABLE IF NOT EXISTS `exp_ff_fieldtypes` (
  `fieldtype_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `class` varchar(50) NOT NULL DEFAULT '',
  `version` varchar(10) NOT NULL DEFAULT '',
  `settings` text NOT NULL,
  `enabled` char(1) NOT NULL DEFAULT 'n',
  PRIMARY KEY (`fieldtype_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `exp_ff_fieldtypes`
--

INSERT INTO `exp_ff_fieldtypes` (`fieldtype_id`, `class`, `version`, `settings`, `enabled`) VALUES
(1, 'ff_checkbox', '1.4.2', 'a:0:{}', 'y'),
(2, 'ff_checkbox_group', '1.4.2', 'a:0:{}', 'y'),
(3, 'ff_multiselect', '1.4.2', 'a:0:{}', 'y'),
(4, 'ff_radio_group', '1.4.2', 'a:0:{}', 'y'),
(5, 'ff_select', '1.4.2', 'a:0:{}', 'y'),
(6, 'ngen_file_field', '1.0.1', 'a:1:{s:15:"quality_setting";s:1:"n";}', 'y'),
(7, 'ff_matrix', '1.3.5', 'a:0:{}', 'y');

-- --------------------------------------------------------

--
-- Table structure for table `exp_ff_fieldtype_hooks`
--

CREATE TABLE IF NOT EXISTS `exp_ff_fieldtype_hooks` (
  `hook_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `class` varchar(50) NOT NULL DEFAULT '',
  `hook` varchar(50) NOT NULL DEFAULT '',
  `method` varchar(50) NOT NULL DEFAULT '',
  `priority` int(2) NOT NULL DEFAULT '10',
  PRIMARY KEY (`hook_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `exp_ff_fieldtype_hooks`
--

INSERT INTO `exp_ff_fieldtype_hooks` (`hook_id`, `class`, `hook`, `method`, `priority`) VALUES
(1, 'ngen_file_field', 'show_full_control_panel_end', 'show_full_control_panel_end', 10),
(2, 'ngen_file_field', 'weblog_standalone_insert_entry', 'weblog_standalone_insert_entry', 10);

-- --------------------------------------------------------

--
-- Table structure for table `exp_field_formatting`
--

CREATE TABLE IF NOT EXISTS `exp_field_formatting` (
  `field_id` int(10) unsigned NOT NULL,
  `field_fmt` varchar(40) NOT NULL,
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `exp_field_formatting`
--

INSERT INTO `exp_field_formatting` (`field_id`, `field_fmt`) VALUES
(1, 'none'),
(1, 'br'),
(1, 'xhtml'),
(2, 'none'),
(2, 'br'),
(2, 'xhtml'),
(3, 'none'),
(3, 'br'),
(3, 'xhtml'),
(4, 'none'),
(4, 'br'),
(4, 'xhtml'),
(5, 'none'),
(5, 'br'),
(5, 'xhtml'),
(6, 'none'),
(6, 'br'),
(6, 'xhtml'),
(7, 'none'),
(7, 'br'),
(7, 'xhtml'),
(8, 'none'),
(8, 'br'),
(8, 'xhtml'),
(9, 'none'),
(9, 'br'),
(9, 'xhtml'),
(10, 'none'),
(10, 'br'),
(10, 'xhtml'),
(11, 'none'),
(11, 'br'),
(11, 'xhtml'),
(12, 'none'),
(12, 'br'),
(12, 'xhtml'),
(13, 'none'),
(13, 'br'),
(13, 'xhtml'),
(14, 'none'),
(14, 'br'),
(14, 'xhtml'),
(15, 'none'),
(15, 'br'),
(15, 'xhtml'),
(16, 'none'),
(16, 'br'),
(16, 'xhtml'),
(17, 'none'),
(17, 'br'),
(17, 'xhtml'),
(18, 'none'),
(18, 'br'),
(18, 'xhtml'),
(19, 'none'),
(19, 'br'),
(19, 'xhtml'),
(20, 'none'),
(20, 'br'),
(20, 'xhtml'),
(21, 'none'),
(21, 'br'),
(21, 'xhtml'),
(22, 'none'),
(22, 'br'),
(22, 'xhtml'),
(23, 'none'),
(23, 'br'),
(23, 'xhtml'),
(24, 'none'),
(24, 'br'),
(24, 'xhtml');

-- --------------------------------------------------------

--
-- Table structure for table `exp_field_groups`
--

CREATE TABLE IF NOT EXISTS `exp_field_groups` (
  `group_id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `group_name` varchar(50) NOT NULL,
  PRIMARY KEY (`group_id`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `exp_field_groups`
--

INSERT INTO `exp_field_groups` (`group_id`, `site_id`, `group_name`) VALUES
(1, 1, 'Default Field Group'),
(2, 1, 'Recipe - CC4Kids'),
(3, 1, 'Recipes'),
(4, 1, 'Super Easy Breezy Helpful Tips');

-- --------------------------------------------------------

--
-- Table structure for table `exp_global_variables`
--

CREATE TABLE IF NOT EXISTS `exp_global_variables` (
  `variable_id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `variable_name` varchar(50) NOT NULL,
  `variable_data` text NOT NULL,
  `user_blog_id` int(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`variable_id`),
  KEY `variable_name` (`variable_name`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `exp_global_variables`
--


-- --------------------------------------------------------

--
-- Table structure for table `exp_html_buttons`
--

CREATE TABLE IF NOT EXISTS `exp_html_buttons` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `member_id` int(10) NOT NULL DEFAULT '0',
  `tag_name` varchar(32) NOT NULL,
  `tag_open` varchar(120) NOT NULL,
  `tag_close` varchar(120) NOT NULL,
  `accesskey` varchar(32) NOT NULL,
  `tag_order` int(3) unsigned NOT NULL,
  `tag_row` char(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `exp_html_buttons`
--

INSERT INTO `exp_html_buttons` (`id`, `site_id`, `member_id`, `tag_name`, `tag_open`, `tag_close`, `accesskey`, `tag_order`, `tag_row`) VALUES
(1, 1, 0, '<b>', '<b>', '</b>', 'b', 1, '1'),
(2, 1, 0, '<bq>', '<blockquote>', '</blockquote>', 'q', 2, '1'),
(3, 1, 0, '<del>', '<del>', '</del>', 'd', 3, '1'),
(4, 1, 0, '<i>', '<i>', '</i>', 'i', 4, '1');

-- --------------------------------------------------------

--
-- Table structure for table `exp_mailing_list`
--

CREATE TABLE IF NOT EXISTS `exp_mailing_list` (
  `user_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `list_id` int(7) unsigned NOT NULL DEFAULT '0',
  `ip_address` varchar(16) NOT NULL,
  `authcode` varchar(10) NOT NULL,
  `email` varchar(50) NOT NULL,
  KEY `list_id` (`list_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `exp_mailing_list`
--


-- --------------------------------------------------------

--
-- Table structure for table `exp_mailing_lists`
--

CREATE TABLE IF NOT EXISTS `exp_mailing_lists` (
  `list_id` int(7) unsigned NOT NULL AUTO_INCREMENT,
  `list_name` varchar(40) NOT NULL,
  `list_title` varchar(100) NOT NULL,
  `list_template` text NOT NULL,
  PRIMARY KEY (`list_id`),
  KEY `list_name` (`list_name`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `exp_mailing_lists`
--

INSERT INTO `exp_mailing_lists` (`list_id`, `list_name`, `list_title`, `list_template`) VALUES
(1, 'default', 'Default Mailing List', '{message_text}\n\nTo remove your email from this mailing list, click here:\n{if html_email}<a href="{unsubscribe_url}">{unsubscribe_url}</a>{/if}\n{if plain_email}{unsubscribe_url}{/if}');

-- --------------------------------------------------------

--
-- Table structure for table `exp_mailing_list_queue`
--

CREATE TABLE IF NOT EXISTS `exp_mailing_list_queue` (
  `email` varchar(50) NOT NULL,
  `list_id` int(7) unsigned NOT NULL DEFAULT '0',
  `authcode` varchar(10) NOT NULL,
  `date` int(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `exp_mailing_list_queue`
--


-- --------------------------------------------------------

--
-- Table structure for table `exp_members`
--

CREATE TABLE IF NOT EXISTS `exp_members` (
  `member_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `group_id` smallint(4) NOT NULL DEFAULT '0',
  `weblog_id` int(6) unsigned NOT NULL DEFAULT '0',
  `tmpl_group_id` int(6) unsigned NOT NULL DEFAULT '0',
  `upload_id` int(6) unsigned NOT NULL DEFAULT '0',
  `username` varchar(50) NOT NULL,
  `screen_name` varchar(50) NOT NULL,
  `password` varchar(40) NOT NULL,
  `unique_id` varchar(40) NOT NULL,
  `authcode` varchar(10) NOT NULL,
  `email` varchar(50) NOT NULL,
  `url` varchar(75) NOT NULL,
  `location` varchar(50) NOT NULL,
  `occupation` varchar(80) NOT NULL,
  `interests` varchar(120) NOT NULL,
  `bday_d` int(2) NOT NULL,
  `bday_m` int(2) NOT NULL,
  `bday_y` int(4) NOT NULL,
  `aol_im` varchar(50) NOT NULL,
  `yahoo_im` varchar(50) NOT NULL,
  `msn_im` varchar(50) NOT NULL,
  `icq` varchar(50) NOT NULL,
  `bio` text NOT NULL,
  `signature` text NOT NULL,
  `avatar_filename` varchar(120) NOT NULL,
  `avatar_width` int(4) unsigned NOT NULL,
  `avatar_height` int(4) unsigned NOT NULL,
  `photo_filename` varchar(120) NOT NULL,
  `photo_width` int(4) unsigned NOT NULL,
  `photo_height` int(4) unsigned NOT NULL,
  `sig_img_filename` varchar(120) NOT NULL,
  `sig_img_width` int(4) unsigned NOT NULL,
  `sig_img_height` int(4) unsigned NOT NULL,
  `ignore_list` text NOT NULL,
  `private_messages` int(4) unsigned NOT NULL DEFAULT '0',
  `accept_messages` char(1) NOT NULL DEFAULT 'y',
  `last_view_bulletins` int(10) NOT NULL DEFAULT '0',
  `last_bulletin_date` int(10) NOT NULL DEFAULT '0',
  `ip_address` varchar(16) NOT NULL DEFAULT '0',
  `join_date` int(10) unsigned NOT NULL DEFAULT '0',
  `last_visit` int(10) unsigned NOT NULL DEFAULT '0',
  `last_activity` int(10) unsigned NOT NULL DEFAULT '0',
  `total_entries` smallint(5) unsigned NOT NULL DEFAULT '0',
  `total_comments` smallint(5) unsigned NOT NULL DEFAULT '0',
  `total_forum_topics` mediumint(8) NOT NULL DEFAULT '0',
  `total_forum_posts` mediumint(8) NOT NULL DEFAULT '0',
  `last_entry_date` int(10) unsigned NOT NULL DEFAULT '0',
  `last_comment_date` int(10) unsigned NOT NULL DEFAULT '0',
  `last_forum_post_date` int(10) unsigned NOT NULL DEFAULT '0',
  `last_email_date` int(10) unsigned NOT NULL DEFAULT '0',
  `in_authorlist` char(1) NOT NULL DEFAULT 'n',
  `accept_admin_email` char(1) NOT NULL DEFAULT 'y',
  `accept_user_email` char(1) NOT NULL DEFAULT 'y',
  `notify_by_default` char(1) NOT NULL DEFAULT 'y',
  `notify_of_pm` char(1) NOT NULL DEFAULT 'y',
  `display_avatars` char(1) NOT NULL DEFAULT 'y',
  `display_signatures` char(1) NOT NULL DEFAULT 'y',
  `smart_notifications` char(1) NOT NULL DEFAULT 'y',
  `language` varchar(50) NOT NULL,
  `timezone` varchar(8) NOT NULL,
  `daylight_savings` char(1) NOT NULL DEFAULT 'n',
  `localization_is_site_default` char(1) NOT NULL DEFAULT 'n',
  `time_format` char(2) NOT NULL DEFAULT 'us',
  `cp_theme` varchar(32) NOT NULL,
  `profile_theme` varchar(32) NOT NULL,
  `forum_theme` varchar(32) NOT NULL,
  `tracker` text NOT NULL,
  `template_size` varchar(2) NOT NULL DEFAULT '28',
  `notepad` text NOT NULL,
  `notepad_size` varchar(2) NOT NULL DEFAULT '18',
  `quick_links` text NOT NULL,
  `quick_tabs` text NOT NULL,
  `pmember_id` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`member_id`),
  KEY `group_id` (`group_id`),
  KEY `unique_id` (`unique_id`),
  KEY `password` (`password`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `exp_members`
--

INSERT INTO `exp_members` (`member_id`, `group_id`, `weblog_id`, `tmpl_group_id`, `upload_id`, `username`, `screen_name`, `password`, `unique_id`, `authcode`, `email`, `url`, `location`, `occupation`, `interests`, `bday_d`, `bday_m`, `bday_y`, `aol_im`, `yahoo_im`, `msn_im`, `icq`, `bio`, `signature`, `avatar_filename`, `avatar_width`, `avatar_height`, `photo_filename`, `photo_width`, `photo_height`, `sig_img_filename`, `sig_img_width`, `sig_img_height`, `ignore_list`, `private_messages`, `accept_messages`, `last_view_bulletins`, `last_bulletin_date`, `ip_address`, `join_date`, `last_visit`, `last_activity`, `total_entries`, `total_comments`, `total_forum_topics`, `total_forum_posts`, `last_entry_date`, `last_comment_date`, `last_forum_post_date`, `last_email_date`, `in_authorlist`, `accept_admin_email`, `accept_user_email`, `notify_by_default`, `notify_of_pm`, `display_avatars`, `display_signatures`, `smart_notifications`, `language`, `timezone`, `daylight_savings`, `localization_is_site_default`, `time_format`, `cp_theme`, `profile_theme`, `forum_theme`, `tracker`, `template_size`, `notepad`, `notepad_size`, `quick_links`, `quick_tabs`, `pmember_id`) VALUES
(1, 1, 0, 0, 0, 'ebadmin', 'admin', 'd033e22ae348aeb5660fc2140aec35850c4da997', '9604bc3cb8c23ea2228b36f761a01002c9c76e8e', '', 'justin.melton@gmail.com', '', '', '', '', 0, 0, 0, '', '', '', '', '', '', '', 0, 0, '', 0, 0, '', 0, 0, '', 0, 'y', 0, 0, '127.0.0.1', 1275426869, 1277149567, 1277158033, 4, 0, 0, 0, 1277073226, 0, 0, 0, 'n', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'english', 'UM5', 'n', 'n', 'us', '', '', '', '', '28', '', '18', 'My Site|http://localhost/eb/index.php|1', '', 0),
(2, 5, 0, 0, 0, 'testuser', 'testuser', 'd033e22ae348aeb5660fc2140aec35850c4da997', '0439782cf9092b7a38c632a81d3ca1a137fdc9f8', '', 'testuser1999@mailinator.com', '', '', '', '', 0, 0, 0, '', '', '', '', '', '', '', 0, 0, '', 0, 0, '', 0, 0, '', 0, 'y', 0, 0, '127.0.0.1', 1276037477, 1276038178, 1277157993, 0, 0, 0, 0, 0, 0, 0, 0, 'n', 'y', 'y', 'y', 'y', 'y', 'y', 'y', '', '', 'n', 'n', 'us', '', '', '', '', '28', '', '18', '', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `exp_member_bulletin_board`
--

CREATE TABLE IF NOT EXISTS `exp_member_bulletin_board` (
  `bulletin_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sender_id` int(10) unsigned NOT NULL,
  `bulletin_group` int(8) unsigned NOT NULL,
  `bulletin_date` int(10) unsigned NOT NULL,
  `hash` varchar(10) NOT NULL DEFAULT '',
  `bulletin_expires` int(10) unsigned NOT NULL DEFAULT '0',
  `bulletin_message` text NOT NULL,
  PRIMARY KEY (`bulletin_id`),
  KEY `sender_id` (`sender_id`),
  KEY `hash` (`hash`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `exp_member_bulletin_board`
--


-- --------------------------------------------------------

--
-- Table structure for table `exp_member_data`
--

CREATE TABLE IF NOT EXISTS `exp_member_data` (
  `member_id` int(10) unsigned NOT NULL,
  KEY `member_id` (`member_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `exp_member_data`
--

INSERT INTO `exp_member_data` (`member_id`) VALUES
(1),
(2);

-- --------------------------------------------------------

--
-- Table structure for table `exp_member_fields`
--

CREATE TABLE IF NOT EXISTS `exp_member_fields` (
  `m_field_id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `m_field_name` varchar(32) NOT NULL,
  `m_field_label` varchar(50) NOT NULL,
  `m_field_description` text NOT NULL,
  `m_field_type` varchar(12) NOT NULL DEFAULT 'text',
  `m_field_list_items` text NOT NULL,
  `m_field_ta_rows` tinyint(2) DEFAULT '8',
  `m_field_maxl` smallint(3) NOT NULL,
  `m_field_width` varchar(6) NOT NULL,
  `m_field_search` char(1) NOT NULL DEFAULT 'y',
  `m_field_required` char(1) NOT NULL DEFAULT 'n',
  `m_field_public` char(1) NOT NULL DEFAULT 'y',
  `m_field_reg` char(1) NOT NULL DEFAULT 'n',
  `m_field_fmt` char(5) NOT NULL DEFAULT 'none',
  `m_field_order` int(3) unsigned NOT NULL,
  PRIMARY KEY (`m_field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `exp_member_fields`
--


-- --------------------------------------------------------

--
-- Table structure for table `exp_member_groups`
--

CREATE TABLE IF NOT EXISTS `exp_member_groups` (
  `group_id` smallint(4) unsigned NOT NULL,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `group_title` varchar(100) NOT NULL,
  `group_description` text NOT NULL,
  `is_locked` char(1) NOT NULL DEFAULT 'y',
  `can_view_offline_system` char(1) NOT NULL DEFAULT 'n',
  `can_view_online_system` char(1) NOT NULL DEFAULT 'y',
  `can_access_cp` char(1) NOT NULL DEFAULT 'y',
  `can_access_publish` char(1) NOT NULL DEFAULT 'n',
  `can_access_edit` char(1) NOT NULL DEFAULT 'n',
  `can_access_design` char(1) NOT NULL DEFAULT 'n',
  `can_access_comm` char(1) NOT NULL DEFAULT 'n',
  `can_access_modules` char(1) NOT NULL DEFAULT 'n',
  `can_access_admin` char(1) NOT NULL DEFAULT 'n',
  `can_admin_weblogs` char(1) NOT NULL DEFAULT 'n',
  `can_admin_members` char(1) NOT NULL DEFAULT 'n',
  `can_delete_members` char(1) NOT NULL DEFAULT 'n',
  `can_admin_mbr_groups` char(1) NOT NULL DEFAULT 'n',
  `can_admin_mbr_templates` char(1) NOT NULL DEFAULT 'n',
  `can_ban_users` char(1) NOT NULL DEFAULT 'n',
  `can_admin_utilities` char(1) NOT NULL DEFAULT 'n',
  `can_admin_preferences` char(1) NOT NULL DEFAULT 'n',
  `can_admin_modules` char(1) NOT NULL DEFAULT 'n',
  `can_admin_templates` char(1) NOT NULL DEFAULT 'n',
  `can_edit_categories` char(1) NOT NULL DEFAULT 'n',
  `can_delete_categories` char(1) NOT NULL DEFAULT 'n',
  `can_view_other_entries` char(1) NOT NULL DEFAULT 'n',
  `can_edit_other_entries` char(1) NOT NULL DEFAULT 'n',
  `can_assign_post_authors` char(1) NOT NULL DEFAULT 'n',
  `can_delete_self_entries` char(1) NOT NULL DEFAULT 'n',
  `can_delete_all_entries` char(1) NOT NULL DEFAULT 'n',
  `can_view_other_comments` char(1) NOT NULL DEFAULT 'n',
  `can_edit_own_comments` char(1) NOT NULL DEFAULT 'n',
  `can_delete_own_comments` char(1) NOT NULL DEFAULT 'n',
  `can_edit_all_comments` char(1) NOT NULL DEFAULT 'n',
  `can_delete_all_comments` char(1) NOT NULL DEFAULT 'n',
  `can_moderate_comments` char(1) NOT NULL DEFAULT 'n',
  `can_send_email` char(1) NOT NULL DEFAULT 'n',
  `can_send_cached_email` char(1) NOT NULL DEFAULT 'n',
  `can_email_member_groups` char(1) NOT NULL DEFAULT 'n',
  `can_email_mailinglist` char(1) NOT NULL DEFAULT 'n',
  `can_email_from_profile` char(1) NOT NULL DEFAULT 'n',
  `can_view_profiles` char(1) NOT NULL DEFAULT 'n',
  `can_delete_self` char(1) NOT NULL DEFAULT 'n',
  `mbr_delete_notify_emails` varchar(255) NOT NULL,
  `can_post_comments` char(1) NOT NULL DEFAULT 'n',
  `exclude_from_moderation` char(1) NOT NULL DEFAULT 'n',
  `can_search` char(1) NOT NULL DEFAULT 'n',
  `search_flood_control` mediumint(5) unsigned NOT NULL,
  `can_send_private_messages` char(1) NOT NULL DEFAULT 'n',
  `prv_msg_send_limit` smallint(5) unsigned NOT NULL DEFAULT '20',
  `prv_msg_storage_limit` smallint(5) unsigned NOT NULL DEFAULT '60',
  `can_attach_in_private_messages` char(1) NOT NULL DEFAULT 'n',
  `can_send_bulletins` char(1) NOT NULL DEFAULT 'n',
  `include_in_authorlist` char(1) NOT NULL DEFAULT 'n',
  `include_in_memberlist` char(1) NOT NULL DEFAULT 'y',
  `include_in_mailinglists` char(1) NOT NULL DEFAULT 'y',
  KEY `group_id` (`group_id`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `exp_member_groups`
--

INSERT INTO `exp_member_groups` (`group_id`, `site_id`, `group_title`, `group_description`, `is_locked`, `can_view_offline_system`, `can_view_online_system`, `can_access_cp`, `can_access_publish`, `can_access_edit`, `can_access_design`, `can_access_comm`, `can_access_modules`, `can_access_admin`, `can_admin_weblogs`, `can_admin_members`, `can_delete_members`, `can_admin_mbr_groups`, `can_admin_mbr_templates`, `can_ban_users`, `can_admin_utilities`, `can_admin_preferences`, `can_admin_modules`, `can_admin_templates`, `can_edit_categories`, `can_delete_categories`, `can_view_other_entries`, `can_edit_other_entries`, `can_assign_post_authors`, `can_delete_self_entries`, `can_delete_all_entries`, `can_view_other_comments`, `can_edit_own_comments`, `can_delete_own_comments`, `can_edit_all_comments`, `can_delete_all_comments`, `can_moderate_comments`, `can_send_email`, `can_send_cached_email`, `can_email_member_groups`, `can_email_mailinglist`, `can_email_from_profile`, `can_view_profiles`, `can_delete_self`, `mbr_delete_notify_emails`, `can_post_comments`, `exclude_from_moderation`, `can_search`, `search_flood_control`, `can_send_private_messages`, `prv_msg_send_limit`, `prv_msg_storage_limit`, `can_attach_in_private_messages`, `can_send_bulletins`, `include_in_authorlist`, `include_in_memberlist`, `include_in_mailinglists`) VALUES
(1, 1, 'Super Admins', '', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', '', 'y', 'y', 'y', 0, 'y', 20, 60, 'y', 'y', 'y', 'y', 'y'),
(2, 1, 'Banned', '', 'y', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', '', 'n', 'n', 'n', 60, 'n', 20, 60, 'n', 'n', 'n', 'n', 'n'),
(3, 1, 'Guests', '', 'y', 'n', 'y', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'y', 'n', '', 'y', 'n', 'y', 15, 'n', 20, 60, 'n', 'n', 'n', 'n', 'n'),
(4, 1, 'Pending', '', 'y', 'n', 'y', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'y', 'n', '', 'y', 'n', 'y', 15, 'n', 20, 60, 'n', 'n', 'n', 'n', 'n'),
(5, 1, 'Members', '', 'y', 'n', 'y', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'y', 'y', 'n', '', 'y', 'n', 'y', 10, 'y', 20, 60, 'y', 'n', 'n', 'y', 'y');

-- --------------------------------------------------------

--
-- Table structure for table `exp_member_homepage`
--

CREATE TABLE IF NOT EXISTS `exp_member_homepage` (
  `member_id` int(10) unsigned NOT NULL,
  `recent_entries` char(1) NOT NULL DEFAULT 'l',
  `recent_entries_order` int(3) unsigned NOT NULL DEFAULT '0',
  `recent_comments` char(1) NOT NULL DEFAULT 'l',
  `recent_comments_order` int(3) unsigned NOT NULL DEFAULT '0',
  `recent_members` char(1) NOT NULL DEFAULT 'n',
  `recent_members_order` int(3) unsigned NOT NULL DEFAULT '0',
  `site_statistics` char(1) NOT NULL DEFAULT 'r',
  `site_statistics_order` int(3) unsigned NOT NULL DEFAULT '0',
  `member_search_form` char(1) NOT NULL DEFAULT 'n',
  `member_search_form_order` int(3) unsigned NOT NULL DEFAULT '0',
  `notepad` char(1) NOT NULL DEFAULT 'r',
  `notepad_order` int(3) unsigned NOT NULL DEFAULT '0',
  `bulletin_board` char(1) NOT NULL DEFAULT 'r',
  `bulletin_board_order` int(3) unsigned NOT NULL DEFAULT '0',
  `pmachine_news_feed` char(1) NOT NULL DEFAULT 'n',
  `pmachine_news_feed_order` int(3) unsigned NOT NULL DEFAULT '0',
  KEY `member_id` (`member_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `exp_member_homepage`
--

INSERT INTO `exp_member_homepage` (`member_id`, `recent_entries`, `recent_entries_order`, `recent_comments`, `recent_comments_order`, `recent_members`, `recent_members_order`, `site_statistics`, `site_statistics_order`, `member_search_form`, `member_search_form_order`, `notepad`, `notepad_order`, `bulletin_board`, `bulletin_board_order`, `pmachine_news_feed`, `pmachine_news_feed_order`) VALUES
(1, 'l', 1, 'l', 2, 'n', 0, 'r', 1, 'n', 0, 'r', 2, 'r', 0, 'l', 0),
(2, 'l', 0, 'l', 0, 'n', 0, 'r', 0, 'n', 0, 'r', 0, 'r', 0, 'n', 0);

-- --------------------------------------------------------

--
-- Table structure for table `exp_member_search`
--

CREATE TABLE IF NOT EXISTS `exp_member_search` (
  `search_id` varchar(32) NOT NULL,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `search_date` int(10) unsigned NOT NULL,
  `keywords` varchar(200) NOT NULL,
  `fields` varchar(200) NOT NULL,
  `member_id` int(10) unsigned NOT NULL,
  `ip_address` varchar(16) NOT NULL,
  `total_results` int(8) unsigned NOT NULL,
  `query` text NOT NULL,
  PRIMARY KEY (`search_id`),
  KEY `member_id` (`member_id`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `exp_member_search`
--


-- --------------------------------------------------------

--
-- Table structure for table `exp_message_attachments`
--

CREATE TABLE IF NOT EXISTS `exp_message_attachments` (
  `attachment_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sender_id` int(10) unsigned NOT NULL DEFAULT '0',
  `message_id` int(10) unsigned NOT NULL DEFAULT '0',
  `attachment_name` varchar(50) NOT NULL DEFAULT '',
  `attachment_hash` varchar(40) NOT NULL DEFAULT '',
  `attachment_extension` varchar(20) NOT NULL DEFAULT '',
  `attachment_location` varchar(125) NOT NULL DEFAULT '',
  `attachment_date` int(10) unsigned NOT NULL DEFAULT '0',
  `attachment_size` int(10) unsigned NOT NULL DEFAULT '0',
  `is_temp` char(1) NOT NULL DEFAULT 'y',
  PRIMARY KEY (`attachment_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `exp_message_attachments`
--


-- --------------------------------------------------------

--
-- Table structure for table `exp_message_copies`
--

CREATE TABLE IF NOT EXISTS `exp_message_copies` (
  `copy_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `message_id` int(10) unsigned NOT NULL DEFAULT '0',
  `sender_id` int(10) unsigned NOT NULL DEFAULT '0',
  `recipient_id` int(10) unsigned NOT NULL DEFAULT '0',
  `message_received` char(1) NOT NULL DEFAULT 'n',
  `message_read` char(1) NOT NULL DEFAULT 'n',
  `message_time_read` int(10) unsigned NOT NULL DEFAULT '0',
  `attachment_downloaded` char(1) NOT NULL DEFAULT 'n',
  `message_folder` int(10) unsigned NOT NULL DEFAULT '1',
  `message_authcode` varchar(10) NOT NULL DEFAULT '',
  `message_deleted` char(1) NOT NULL DEFAULT 'n',
  `message_status` varchar(10) NOT NULL DEFAULT '',
  PRIMARY KEY (`copy_id`),
  KEY `message_id` (`message_id`),
  KEY `recipient_id` (`recipient_id`),
  KEY `sender_id` (`sender_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `exp_message_copies`
--


-- --------------------------------------------------------

--
-- Table structure for table `exp_message_data`
--

CREATE TABLE IF NOT EXISTS `exp_message_data` (
  `message_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sender_id` int(10) unsigned NOT NULL DEFAULT '0',
  `message_date` int(10) unsigned NOT NULL DEFAULT '0',
  `message_subject` varchar(255) NOT NULL DEFAULT '',
  `message_body` text NOT NULL,
  `message_tracking` char(1) NOT NULL DEFAULT 'y',
  `message_attachments` char(1) NOT NULL DEFAULT 'n',
  `message_recipients` varchar(200) NOT NULL DEFAULT '',
  `message_cc` varchar(200) NOT NULL DEFAULT '',
  `message_hide_cc` char(1) NOT NULL DEFAULT 'n',
  `message_sent_copy` char(1) NOT NULL DEFAULT 'n',
  `total_recipients` int(5) unsigned NOT NULL DEFAULT '0',
  `message_status` varchar(25) NOT NULL DEFAULT '',
  PRIMARY KEY (`message_id`),
  KEY `sender_id` (`sender_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `exp_message_data`
--


-- --------------------------------------------------------

--
-- Table structure for table `exp_message_folders`
--

CREATE TABLE IF NOT EXISTS `exp_message_folders` (
  `member_id` int(10) unsigned NOT NULL DEFAULT '0',
  `folder1_name` varchar(50) NOT NULL DEFAULT 'InBox',
  `folder2_name` varchar(50) NOT NULL DEFAULT 'Sent',
  `folder3_name` varchar(50) NOT NULL DEFAULT '',
  `folder4_name` varchar(50) NOT NULL DEFAULT '',
  `folder5_name` varchar(50) NOT NULL DEFAULT '',
  `folder6_name` varchar(50) NOT NULL DEFAULT '',
  `folder7_name` varchar(50) NOT NULL DEFAULT '',
  `folder8_name` varchar(50) NOT NULL DEFAULT '',
  `folder9_name` varchar(50) NOT NULL DEFAULT '',
  `folder10_name` varchar(50) NOT NULL DEFAULT '',
  KEY `member_id` (`member_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `exp_message_folders`
--

INSERT INTO `exp_message_folders` (`member_id`, `folder1_name`, `folder2_name`, `folder3_name`, `folder4_name`, `folder5_name`, `folder6_name`, `folder7_name`, `folder8_name`, `folder9_name`, `folder10_name`) VALUES
(1, 'InBox', 'Sent', '', '', '', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `exp_message_listed`
--

CREATE TABLE IF NOT EXISTS `exp_message_listed` (
  `listed_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `member_id` int(10) unsigned NOT NULL DEFAULT '0',
  `listed_member` int(10) unsigned NOT NULL DEFAULT '0',
  `listed_description` varchar(100) NOT NULL DEFAULT '',
  `listed_type` varchar(10) NOT NULL DEFAULT 'blocked',
  PRIMARY KEY (`listed_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `exp_message_listed`
--


-- --------------------------------------------------------

--
-- Table structure for table `exp_modules`
--

CREATE TABLE IF NOT EXISTS `exp_modules` (
  `module_id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `module_name` varchar(50) NOT NULL,
  `module_version` varchar(12) NOT NULL,
  `has_cp_backend` char(1) NOT NULL DEFAULT 'n',
  PRIMARY KEY (`module_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=12 ;

--
-- Dumping data for table `exp_modules`
--

INSERT INTO `exp_modules` (`module_id`, `module_name`, `module_version`, `has_cp_backend`) VALUES
(1, 'Comment', '1.2', 'n'),
(2, 'Emoticon', '1.0', 'n'),
(3, 'Mailinglist', '2.0', 'y'),
(4, 'Member', '1.3', 'n'),
(5, 'Query', '1.0', 'n'),
(6, 'Referrer', '1.3', 'y'),
(7, 'Rss', '1.0', 'n'),
(8, 'Stats', '1.0', 'n'),
(9, 'Trackback', '1.1', 'n'),
(10, 'Weblog', '1.2', 'n'),
(11, 'Search', '1.2', 'n');

-- --------------------------------------------------------

--
-- Table structure for table `exp_module_member_groups`
--

CREATE TABLE IF NOT EXISTS `exp_module_member_groups` (
  `group_id` smallint(4) unsigned NOT NULL,
  `module_id` mediumint(5) unsigned NOT NULL,
  KEY `group_id` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `exp_module_member_groups`
--


-- --------------------------------------------------------

--
-- Table structure for table `exp_online_users`
--

CREATE TABLE IF NOT EXISTS `exp_online_users` (
  `weblog_id` int(6) unsigned NOT NULL DEFAULT '0',
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `member_id` int(10) NOT NULL DEFAULT '0',
  `in_forum` char(1) NOT NULL DEFAULT 'n',
  `name` varchar(50) NOT NULL DEFAULT '0',
  `ip_address` varchar(16) NOT NULL DEFAULT '0',
  `date` int(10) unsigned NOT NULL DEFAULT '0',
  `anon` char(1) NOT NULL,
  KEY `date` (`date`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `exp_online_users`
--

INSERT INTO `exp_online_users` (`weblog_id`, `site_id`, `member_id`, `in_forum`, `name`, `ip_address`, `date`, `anon`) VALUES
(0, 1, 2, 'n', 'testuser', '127.0.0.1', 1277158026, 'y'),
(0, 1, 1, 'n', 'admin', '127.0.0.1', 1277158250, 'y');

-- --------------------------------------------------------

--
-- Table structure for table `exp_password_lockout`
--

CREATE TABLE IF NOT EXISTS `exp_password_lockout` (
  `login_date` int(10) unsigned NOT NULL,
  `ip_address` varchar(16) NOT NULL DEFAULT '0',
  `user_agent` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  KEY `login_date` (`login_date`),
  KEY `ip_address` (`ip_address`),
  KEY `user_agent` (`user_agent`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `exp_password_lockout`
--

INSERT INTO `exp_password_lockout` (`login_date`, `ip_address`, `user_agent`, `username`) VALUES
(1277143856, '127.0.0.1', 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US) Ap', ''),
(1277143852, '127.0.0.1', 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US) Ap', ''),
(1277142939, '127.0.0.1', 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US) Ap', '');

-- --------------------------------------------------------

--
-- Table structure for table `exp_ping_servers`
--

CREATE TABLE IF NOT EXISTS `exp_ping_servers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `member_id` int(10) NOT NULL DEFAULT '0',
  `server_name` varchar(32) NOT NULL,
  `server_url` varchar(150) NOT NULL,
  `port` varchar(4) NOT NULL DEFAULT '80',
  `ping_protocol` varchar(12) NOT NULL DEFAULT 'xmlrpc',
  `is_default` char(1) NOT NULL DEFAULT 'y',
  `server_order` int(3) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `exp_ping_servers`
--


-- --------------------------------------------------------

--
-- Table structure for table `exp_referrers`
--

CREATE TABLE IF NOT EXISTS `exp_referrers` (
  `ref_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `ref_from` varchar(120) NOT NULL,
  `ref_to` varchar(120) NOT NULL,
  `ref_ip` varchar(16) NOT NULL DEFAULT '0',
  `ref_date` int(10) unsigned NOT NULL DEFAULT '0',
  `ref_agent` varchar(100) NOT NULL,
  `user_blog` varchar(40) NOT NULL,
  PRIMARY KEY (`ref_id`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `exp_referrers`
--


-- --------------------------------------------------------

--
-- Table structure for table `exp_relationships`
--

CREATE TABLE IF NOT EXISTS `exp_relationships` (
  `rel_id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `rel_parent_id` int(10) NOT NULL DEFAULT '0',
  `rel_child_id` int(10) NOT NULL DEFAULT '0',
  `rel_type` varchar(12) NOT NULL,
  `rel_data` mediumtext NOT NULL,
  `reverse_rel_data` mediumtext NOT NULL,
  PRIMARY KEY (`rel_id`),
  KEY `rel_parent_id` (`rel_parent_id`),
  KEY `rel_child_id` (`rel_child_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `exp_relationships`
--

INSERT INTO `exp_relationships` (`rel_id`, `rel_parent_id`, `rel_child_id`, `rel_type`, `rel_data`, `reverse_rel_data`) VALUES
(1, 3, 5, 'blog', 'a:3:{s:5:"query";O:8:"DB_Cache":5:{s:6:"result";a:1:{i:0;a:118:{s:8:"entry_id";s:1:"5";s:9:"weblog_id";s:1:"4";s:14:"forum_topic_id";s:1:"0";s:9:"author_id";s:1:"1";s:10:"ip_address";s:9:"127.0.0.1";s:5:"title";s:10:"boiled egg";s:9:"url_title";s:10:"boiled_egg";s:6:"status";s:4:"open";s:11:"dst_enabled";s:1:"n";s:14:"view_count_one";s:1:"0";s:14:"view_count_two";s:1:"0";s:16:"view_count_three";s:1:"0";s:15:"view_count_four";s:1:"0";s:14:"allow_comments";s:1:"y";s:23:"comment_expiration_date";s:1:"0";s:16:"allow_trackbacks";s:1:"n";s:6:"sticky";s:1:"n";s:10:"entry_date";s:10:"1277073225";s:4:"year";s:4:"2010";s:5:"month";s:2:"06";s:3:"day";s:2:"20";s:9:"edit_date";s:14:"20100620143346";s:15:"expiration_date";s:1:"0";s:19:"recent_comment_date";s:1:"0";s:13:"comment_total";s:1:"0";s:15:"trackback_total";s:1:"0";s:15:"sent_trackbacks";s:0:"";s:21:"recent_trackback_date";s:1:"0";s:13:"entry_site_id";s:1:"1";s:10:"blog_title";s:29:"Super Easy Breezy Helpful Tip";s:9:"blog_name";s:6:"eb_tip";s:8:"blog_url";s:20:"http://localhost/eb/";s:11:"comment_url";s:0:"";s:13:"tb_return_url";s:0:"";s:16:"comment_moderate";s:1:"n";s:22:"weblog_html_formatting";s:3:"all";s:21:"weblog_allow_img_urls";s:1:"y";s:21:"weblog_auto_link_urls";s:1:"y";s:17:"enable_trackbacks";s:1:"n";s:15:"trackback_field";s:1:"0";s:21:"trackback_use_captcha";s:1:"n";s:24:"trackback_system_enabled";s:1:"n";s:8:"username";s:7:"ebadmin";s:5:"email";s:23:"justin.melton@gmail.com";s:3:"url";s:0:"";s:11:"screen_name";s:5:"admin";s:8:"location";s:0:"";s:10:"occupation";s:0:"";s:9:"interests";s:0:"";s:6:"aol_im";s:0:"";s:8:"yahoo_im";s:0:"";s:6:"msn_im";s:0:"";s:3:"icq";s:0:"";s:9:"signature";s:0:"";s:16:"sig_img_filename";s:0:"";s:13:"sig_img_width";s:1:"0";s:14:"sig_img_height";s:1:"0";s:15:"avatar_filename";s:0:"";s:12:"avatar_width";s:1:"0";s:13:"avatar_height";s:1:"0";s:14:"photo_filename";s:0:"";s:11:"photo_width";s:1:"0";s:12:"photo_height";s:1:"0";s:8:"group_id";s:1:"1";s:9:"member_id";s:1:"1";s:6:"bday_d";s:1:"0";s:6:"bday_m";s:1:"0";s:6:"bday_y";s:1:"0";s:3:"bio";s:0:"";s:7:"site_id";s:1:"1";s:10:"field_id_1";s:0:"";s:10:"field_ft_1";s:5:"xhtml";s:10:"field_id_2";s:4:"test";s:10:"field_ft_2";s:5:"xhtml";s:10:"field_id_3";s:0:"";s:10:"field_ft_3";s:5:"xhtml";s:10:"field_id_4";s:0:"";s:10:"field_ft_4";N;s:10:"field_id_5";s:0:"";s:10:"field_ft_5";N;s:10:"field_id_6";s:0:"";s:10:"field_ft_6";N;s:10:"field_id_7";s:0:"";s:10:"field_ft_7";N;s:10:"field_id_8";s:0:"";s:10:"field_ft_8";N;s:10:"field_id_9";s:0:"";s:10:"field_ft_9";N;s:11:"field_id_10";s:0:"";s:11:"field_ft_10";N;s:11:"field_id_11";s:0:"";s:11:"field_ft_11";N;s:11:"field_id_12";s:0:"";s:11:"field_ft_12";N;s:11:"field_id_13";s:0:"";s:11:"field_ft_13";N;s:11:"field_id_14";s:0:"";s:11:"field_ft_14";N;s:11:"field_id_15";s:0:"";s:11:"field_ft_15";N;s:11:"field_id_16";s:0:"";s:11:"field_ft_16";N;s:11:"field_id_17";s:0:"";s:11:"field_ft_17";N;s:11:"field_id_18";s:0:"";s:11:"field_ft_18";N;s:11:"field_id_19";s:0:"";s:11:"field_ft_19";N;s:11:"field_id_20";s:0:"";s:11:"field_ft_20";N;s:11:"field_id_21";s:0:"";s:11:"field_ft_21";N;s:11:"field_id_22";s:0:"";s:11:"field_ft_22";N;s:11:"field_id_23";s:0:"";s:11:"field_ft_23";N;s:11:"field_id_24";s:0:"";s:11:"field_ft_24";N;}}s:3:"row";a:118:{s:8:"entry_id";s:1:"5";s:9:"weblog_id";s:1:"4";s:14:"forum_topic_id";s:1:"0";s:9:"author_id";s:1:"1";s:10:"ip_address";s:9:"127.0.0.1";s:5:"title";s:10:"boiled egg";s:9:"url_title";s:10:"boiled_egg";s:6:"status";s:4:"open";s:11:"dst_enabled";s:1:"n";s:14:"view_count_one";s:1:"0";s:14:"view_count_two";s:1:"0";s:16:"view_count_three";s:1:"0";s:15:"view_count_four";s:1:"0";s:14:"allow_comments";s:1:"y";s:23:"comment_expiration_date";s:1:"0";s:16:"allow_trackbacks";s:1:"n";s:6:"sticky";s:1:"n";s:10:"entry_date";s:10:"1277073225";s:4:"year";s:4:"2010";s:5:"month";s:2:"06";s:3:"day";s:2:"20";s:9:"edit_date";s:14:"20100620143346";s:15:"expiration_date";s:1:"0";s:19:"recent_comment_date";s:1:"0";s:13:"comment_total";s:1:"0";s:15:"trackback_total";s:1:"0";s:15:"sent_trackbacks";s:0:"";s:21:"recent_trackback_date";s:1:"0";s:13:"entry_site_id";s:1:"1";s:10:"blog_title";s:29:"Super Easy Breezy Helpful Tip";s:9:"blog_name";s:6:"eb_tip";s:8:"blog_url";s:20:"http://localhost/eb/";s:11:"comment_url";s:0:"";s:13:"tb_return_url";s:0:"";s:16:"comment_moderate";s:1:"n";s:22:"weblog_html_formatting";s:3:"all";s:21:"weblog_allow_img_urls";s:1:"y";s:21:"weblog_auto_link_urls";s:1:"y";s:17:"enable_trackbacks";s:1:"n";s:15:"trackback_field";s:1:"0";s:21:"trackback_use_captcha";s:1:"n";s:24:"trackback_system_enabled";s:1:"n";s:8:"username";s:7:"ebadmin";s:5:"email";s:23:"justin.melton@gmail.com";s:3:"url";s:0:"";s:11:"screen_name";s:5:"admin";s:8:"location";s:0:"";s:10:"occupation";s:0:"";s:9:"interests";s:0:"";s:6:"aol_im";s:0:"";s:8:"yahoo_im";s:0:"";s:6:"msn_im";s:0:"";s:3:"icq";s:0:"";s:9:"signature";s:0:"";s:16:"sig_img_filename";s:0:"";s:13:"sig_img_width";s:1:"0";s:14:"sig_img_height";s:1:"0";s:15:"avatar_filename";s:0:"";s:12:"avatar_width";s:1:"0";s:13:"avatar_height";s:1:"0";s:14:"photo_filename";s:0:"";s:11:"photo_width";s:1:"0";s:12:"photo_height";s:1:"0";s:8:"group_id";s:1:"1";s:9:"member_id";s:1:"1";s:6:"bday_d";s:1:"0";s:6:"bday_m";s:1:"0";s:6:"bday_y";s:1:"0";s:3:"bio";s:0:"";s:7:"site_id";s:1:"1";s:10:"field_id_1";s:0:"";s:10:"field_ft_1";s:5:"xhtml";s:10:"field_id_2";s:4:"test";s:10:"field_ft_2";s:5:"xhtml";s:10:"field_id_3";s:0:"";s:10:"field_ft_3";s:5:"xhtml";s:10:"field_id_4";s:0:"";s:10:"field_ft_4";N;s:10:"field_id_5";s:0:"";s:10:"field_ft_5";N;s:10:"field_id_6";s:0:"";s:10:"field_ft_6";N;s:10:"field_id_7";s:0:"";s:10:"field_ft_7";N;s:10:"field_id_8";s:0:"";s:10:"field_ft_8";N;s:10:"field_id_9";s:0:"";s:10:"field_ft_9";N;s:11:"field_id_10";s:0:"";s:11:"field_ft_10";N;s:11:"field_id_11";s:0:"";s:11:"field_ft_11";N;s:11:"field_id_12";s:0:"";s:11:"field_ft_12";N;s:11:"field_id_13";s:0:"";s:11:"field_ft_13";N;s:11:"field_id_14";s:0:"";s:11:"field_ft_14";N;s:11:"field_id_15";s:0:"";s:11:"field_ft_15";N;s:11:"field_id_16";s:0:"";s:11:"field_ft_16";N;s:11:"field_id_17";s:0:"";s:11:"field_ft_17";N;s:11:"field_id_18";s:0:"";s:11:"field_ft_18";N;s:11:"field_id_19";s:0:"";s:11:"field_ft_19";N;s:11:"field_id_20";s:0:"";s:11:"field_ft_20";N;s:11:"field_id_21";s:0:"";s:11:"field_ft_21";N;s:11:"field_id_22";s:0:"";s:11:"field_ft_22";N;s:11:"field_id_23";s:0:"";s:11:"field_ft_23";N;s:11:"field_id_24";s:0:"";s:11:"field_ft_24";N;}s:8:"num_rows";i:1;s:7:"q_count";i:45;s:6:"fields";a:0:{}}s:10:"cats_fixed";s:1:"1";s:10:"categories";a:0:{}}', ''),
(2, 3, 4, 'blog', 'a:3:{s:5:"query";O:8:"DB_Cache":5:{s:6:"result";a:1:{i:0;a:118:{s:8:"entry_id";s:1:"4";s:9:"weblog_id";s:1:"4";s:14:"forum_topic_id";s:1:"0";s:9:"author_id";s:1:"1";s:10:"ip_address";s:9:"127.0.0.1";s:5:"title";s:9:"easy rice";s:9:"url_title";s:9:"easy_rice";s:6:"status";s:4:"open";s:11:"dst_enabled";s:1:"n";s:14:"view_count_one";s:1:"0";s:14:"view_count_two";s:1:"0";s:16:"view_count_three";s:1:"0";s:15:"view_count_four";s:1:"0";s:14:"allow_comments";s:1:"y";s:23:"comment_expiration_date";s:1:"0";s:16:"allow_trackbacks";s:1:"n";s:6:"sticky";s:1:"n";s:10:"entry_date";s:10:"1277072741";s:4:"year";s:4:"2010";s:5:"month";s:2:"06";s:3:"day";s:2:"20";s:9:"edit_date";s:14:"20100620142543";s:15:"expiration_date";s:1:"0";s:19:"recent_comment_date";s:1:"0";s:13:"comment_total";s:1:"0";s:15:"trackback_total";s:1:"0";s:15:"sent_trackbacks";s:0:"";s:21:"recent_trackback_date";s:1:"0";s:13:"entry_site_id";s:1:"1";s:10:"blog_title";s:29:"Super Easy Breezy Helpful Tip";s:9:"blog_name";s:6:"eb_tip";s:8:"blog_url";s:20:"http://localhost/eb/";s:11:"comment_url";s:0:"";s:13:"tb_return_url";s:0:"";s:16:"comment_moderate";s:1:"n";s:22:"weblog_html_formatting";s:3:"all";s:21:"weblog_allow_img_urls";s:1:"y";s:21:"weblog_auto_link_urls";s:1:"y";s:17:"enable_trackbacks";s:1:"n";s:15:"trackback_field";s:1:"0";s:21:"trackback_use_captcha";s:1:"n";s:24:"trackback_system_enabled";s:1:"n";s:8:"username";s:7:"ebadmin";s:5:"email";s:23:"justin.melton@gmail.com";s:3:"url";s:0:"";s:11:"screen_name";s:5:"admin";s:8:"location";s:0:"";s:10:"occupation";s:0:"";s:9:"interests";s:0:"";s:6:"aol_im";s:0:"";s:8:"yahoo_im";s:0:"";s:6:"msn_im";s:0:"";s:3:"icq";s:0:"";s:9:"signature";s:0:"";s:16:"sig_img_filename";s:0:"";s:13:"sig_img_width";s:1:"0";s:14:"sig_img_height";s:1:"0";s:15:"avatar_filename";s:0:"";s:12:"avatar_width";s:1:"0";s:13:"avatar_height";s:1:"0";s:14:"photo_filename";s:0:"";s:11:"photo_width";s:1:"0";s:12:"photo_height";s:1:"0";s:8:"group_id";s:1:"1";s:9:"member_id";s:1:"1";s:6:"bday_d";s:1:"0";s:6:"bday_m";s:1:"0";s:6:"bday_y";s:1:"0";s:3:"bio";s:0:"";s:7:"site_id";s:1:"1";s:10:"field_id_1";s:0:"";s:10:"field_ft_1";s:5:"xhtml";s:10:"field_id_2";s:35:"the best way to get easy rice is...";s:10:"field_ft_2";s:5:"xhtml";s:10:"field_id_3";s:0:"";s:10:"field_ft_3";s:5:"xhtml";s:10:"field_id_4";s:0:"";s:10:"field_ft_4";N;s:10:"field_id_5";s:0:"";s:10:"field_ft_5";N;s:10:"field_id_6";s:0:"";s:10:"field_ft_6";N;s:10:"field_id_7";s:0:"";s:10:"field_ft_7";N;s:10:"field_id_8";s:0:"";s:10:"field_ft_8";N;s:10:"field_id_9";s:0:"";s:10:"field_ft_9";N;s:11:"field_id_10";s:0:"";s:11:"field_ft_10";N;s:11:"field_id_11";s:0:"";s:11:"field_ft_11";N;s:11:"field_id_12";s:0:"";s:11:"field_ft_12";N;s:11:"field_id_13";s:0:"";s:11:"field_ft_13";N;s:11:"field_id_14";s:0:"";s:11:"field_ft_14";N;s:11:"field_id_15";s:0:"";s:11:"field_ft_15";N;s:11:"field_id_16";s:0:"";s:11:"field_ft_16";N;s:11:"field_id_17";s:0:"";s:11:"field_ft_17";N;s:11:"field_id_18";s:0:"";s:11:"field_ft_18";N;s:11:"field_id_19";s:0:"";s:11:"field_ft_19";N;s:11:"field_id_20";s:0:"";s:11:"field_ft_20";N;s:11:"field_id_21";s:0:"";s:11:"field_ft_21";N;s:11:"field_id_22";s:0:"";s:11:"field_ft_22";N;s:11:"field_id_23";s:0:"";s:11:"field_ft_23";N;s:11:"field_id_24";s:1:"0";s:11:"field_ft_24";N;}}s:3:"row";a:118:{s:8:"entry_id";s:1:"4";s:9:"weblog_id";s:1:"4";s:14:"forum_topic_id";s:1:"0";s:9:"author_id";s:1:"1";s:10:"ip_address";s:9:"127.0.0.1";s:5:"title";s:9:"easy rice";s:9:"url_title";s:9:"easy_rice";s:6:"status";s:4:"open";s:11:"dst_enabled";s:1:"n";s:14:"view_count_one";s:1:"0";s:14:"view_count_two";s:1:"0";s:16:"view_count_three";s:1:"0";s:15:"view_count_four";s:1:"0";s:14:"allow_comments";s:1:"y";s:23:"comment_expiration_date";s:1:"0";s:16:"allow_trackbacks";s:1:"n";s:6:"sticky";s:1:"n";s:10:"entry_date";s:10:"1277072741";s:4:"year";s:4:"2010";s:5:"month";s:2:"06";s:3:"day";s:2:"20";s:9:"edit_date";s:14:"20100620142543";s:15:"expiration_date";s:1:"0";s:19:"recent_comment_date";s:1:"0";s:13:"comment_total";s:1:"0";s:15:"trackback_total";s:1:"0";s:15:"sent_trackbacks";s:0:"";s:21:"recent_trackback_date";s:1:"0";s:13:"entry_site_id";s:1:"1";s:10:"blog_title";s:29:"Super Easy Breezy Helpful Tip";s:9:"blog_name";s:6:"eb_tip";s:8:"blog_url";s:20:"http://localhost/eb/";s:11:"comment_url";s:0:"";s:13:"tb_return_url";s:0:"";s:16:"comment_moderate";s:1:"n";s:22:"weblog_html_formatting";s:3:"all";s:21:"weblog_allow_img_urls";s:1:"y";s:21:"weblog_auto_link_urls";s:1:"y";s:17:"enable_trackbacks";s:1:"n";s:15:"trackback_field";s:1:"0";s:21:"trackback_use_captcha";s:1:"n";s:24:"trackback_system_enabled";s:1:"n";s:8:"username";s:7:"ebadmin";s:5:"email";s:23:"justin.melton@gmail.com";s:3:"url";s:0:"";s:11:"screen_name";s:5:"admin";s:8:"location";s:0:"";s:10:"occupation";s:0:"";s:9:"interests";s:0:"";s:6:"aol_im";s:0:"";s:8:"yahoo_im";s:0:"";s:6:"msn_im";s:0:"";s:3:"icq";s:0:"";s:9:"signature";s:0:"";s:16:"sig_img_filename";s:0:"";s:13:"sig_img_width";s:1:"0";s:14:"sig_img_height";s:1:"0";s:15:"avatar_filename";s:0:"";s:12:"avatar_width";s:1:"0";s:13:"avatar_height";s:1:"0";s:14:"photo_filename";s:0:"";s:11:"photo_width";s:1:"0";s:12:"photo_height";s:1:"0";s:8:"group_id";s:1:"1";s:9:"member_id";s:1:"1";s:6:"bday_d";s:1:"0";s:6:"bday_m";s:1:"0";s:6:"bday_y";s:1:"0";s:3:"bio";s:0:"";s:7:"site_id";s:1:"1";s:10:"field_id_1";s:0:"";s:10:"field_ft_1";s:5:"xhtml";s:10:"field_id_2";s:35:"the best way to get easy rice is...";s:10:"field_ft_2";s:5:"xhtml";s:10:"field_id_3";s:0:"";s:10:"field_ft_3";s:5:"xhtml";s:10:"field_id_4";s:0:"";s:10:"field_ft_4";N;s:10:"field_id_5";s:0:"";s:10:"field_ft_5";N;s:10:"field_id_6";s:0:"";s:10:"field_ft_6";N;s:10:"field_id_7";s:0:"";s:10:"field_ft_7";N;s:10:"field_id_8";s:0:"";s:10:"field_ft_8";N;s:10:"field_id_9";s:0:"";s:10:"field_ft_9";N;s:11:"field_id_10";s:0:"";s:11:"field_ft_10";N;s:11:"field_id_11";s:0:"";s:11:"field_ft_11";N;s:11:"field_id_12";s:0:"";s:11:"field_ft_12";N;s:11:"field_id_13";s:0:"";s:11:"field_ft_13";N;s:11:"field_id_14";s:0:"";s:11:"field_ft_14";N;s:11:"field_id_15";s:0:"";s:11:"field_ft_15";N;s:11:"field_id_16";s:0:"";s:11:"field_ft_16";N;s:11:"field_id_17";s:0:"";s:11:"field_ft_17";N;s:11:"field_id_18";s:0:"";s:11:"field_ft_18";N;s:11:"field_id_19";s:0:"";s:11:"field_ft_19";N;s:11:"field_id_20";s:0:"";s:11:"field_ft_20";N;s:11:"field_id_21";s:0:"";s:11:"field_ft_21";N;s:11:"field_id_22";s:0:"";s:11:"field_ft_22";N;s:11:"field_id_23";s:0:"";s:11:"field_ft_23";N;s:11:"field_id_24";s:1:"0";s:11:"field_ft_24";N;}s:8:"num_rows";i:1;s:7:"q_count";i:50;s:6:"fields";a:0:{}}s:10:"cats_fixed";s:1:"1";s:10:"categories";a:0:{}}', '');

-- --------------------------------------------------------

--
-- Table structure for table `exp_reset_password`
--

CREATE TABLE IF NOT EXISTS `exp_reset_password` (
  `member_id` int(10) unsigned NOT NULL,
  `resetcode` varchar(12) NOT NULL,
  `date` int(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `exp_reset_password`
--


-- --------------------------------------------------------

--
-- Table structure for table `exp_revision_tracker`
--

CREATE TABLE IF NOT EXISTS `exp_revision_tracker` (
  `tracker_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `item_id` int(10) unsigned NOT NULL,
  `item_table` varchar(20) NOT NULL,
  `item_field` varchar(20) NOT NULL,
  `item_date` int(10) NOT NULL,
  `item_author_id` int(10) unsigned NOT NULL,
  `item_data` mediumtext NOT NULL,
  PRIMARY KEY (`tracker_id`),
  KEY `item_id` (`item_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `exp_revision_tracker`
--


-- --------------------------------------------------------

--
-- Table structure for table `exp_search`
--

CREATE TABLE IF NOT EXISTS `exp_search` (
  `search_id` varchar(32) NOT NULL,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `search_date` int(10) NOT NULL,
  `keywords` varchar(60) NOT NULL,
  `member_id` int(10) unsigned NOT NULL,
  `ip_address` varchar(16) NOT NULL,
  `total_results` int(6) NOT NULL,
  `per_page` smallint(3) unsigned NOT NULL,
  `query` mediumtext,
  `custom_fields` mediumtext,
  `result_page` varchar(70) NOT NULL,
  PRIMARY KEY (`search_id`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `exp_search`
--


-- --------------------------------------------------------

--
-- Table structure for table `exp_search_log`
--

CREATE TABLE IF NOT EXISTS `exp_search_log` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `member_id` int(10) unsigned NOT NULL,
  `screen_name` varchar(50) NOT NULL,
  `ip_address` varchar(16) NOT NULL DEFAULT '0',
  `search_date` int(10) NOT NULL,
  `search_type` varchar(32) NOT NULL,
  `search_terms` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `exp_search_log`
--


-- --------------------------------------------------------

--
-- Table structure for table `exp_security_hashes`
--

CREATE TABLE IF NOT EXISTS `exp_security_hashes` (
  `date` int(10) unsigned NOT NULL,
  `ip_address` varchar(16) NOT NULL DEFAULT '0',
  `hash` varchar(40) NOT NULL,
  KEY `hash` (`hash`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `exp_security_hashes`
--

INSERT INTO `exp_security_hashes` (`date`, `ip_address`, `hash`) VALUES
(1277143846, '127.0.0.1', '9ba578d79d62dee6e3a8c4fa5872b301caadcd1d'),
(1277143641, '127.0.0.1', 'd1dbbc1dd403be2ed5fb35ec86f1ba746f97bb57'),
(1277143641, '127.0.0.1', '2333ce54c20f1f13d168086b09134ecc46e31fb8'),
(1277143641, '127.0.0.1', 'c1ab30f3bd98bf506dbaa6f5ea087d704e4deab7'),
(1277143638, '127.0.0.1', '1d41b4c9247dc71e36937af011828a5b65f99df7'),
(1277143638, '127.0.0.1', '192df9f678e69a6dff9cd2c43b33bf2d6ef2cc96'),
(1277143638, '127.0.0.1', '7c30c6e171330054617172832823f6fbe404fc67'),
(1277143635, '127.0.0.1', '7f877e6e9ffd8db76c44a2c70c90f240031f3d5d'),
(1277143633, '127.0.0.1', '56e7db67fd7bee6cd4a34dfe064b8f73684bd261'),
(1277143631, '127.0.0.1', 'aa3d02489bc595ec5ff9f7da968c26fb6dc80ea2'),
(1277143593, '127.0.0.1', 'a1d13ef6e43f3716e8fe105596e941c3d995d534'),
(1277143446, '127.0.0.1', 'e1b6e61b0b74e3ee463acd3807897dd86a57d018'),
(1277143422, '127.0.0.1', '6f7142ba4025ea139b8d3b75f3db5e9abdeb01fc'),
(1277143345, '127.0.0.1', 'e4800703e24d64f66a2cd020a1eaaabcc61431d1'),
(1277143341, '127.0.0.1', 'fb3763d069309405254029c94a9321828fdee794'),
(1277143231, '127.0.0.1', 'dbc38f62a7eecee6339c1b983b52fd41a00a67b3'),
(1277143106, '127.0.0.1', 'b9c588c19c5545cd215759ce4f7daaaf919efbd2'),
(1277143060, '127.0.0.1', '21db91aef24f448458a2be01f32a8b3fa57772e9'),
(1277143051, '127.0.0.1', '7bad9b56620a9cbde7759e809ab82fb2d0b73d0a'),
(1277143039, '127.0.0.1', '26221b647c626ba80eabc40a677caa152290bf60'),
(1277142936, '127.0.0.1', 'b8751c1fa3442d5eb4da531108f0be7841798933'),
(1277142934, '127.0.0.1', '6e44f6af828970f80535a38590c46e0ac1514131'),
(1277142930, '127.0.0.1', '1d31720776d50f4f85138c2aaa86912d68b7368a'),
(1277142909, '127.0.0.1', '1547fbeca9eee0b8617523369b8c2a423e910788'),
(1277142880, '127.0.0.1', '5468fd39b693819b399b21210e8a137707b21f99'),
(1277142714, '127.0.0.1', 'c748898e35c6dd420232edefa4665051295ed979'),
(1277142705, '127.0.0.1', '0d4b0c22267a352b7ba02379955b2cdf38156153'),
(1277142675, '127.0.0.1', '076212b5bc4b159d840a2abd298475e1763b3412'),
(1277142633, '127.0.0.1', '3e0b842ab61f5a1fda6fb1a99c2ce45ddc20f899'),
(1277142633, '127.0.0.1', 'e55af0bc8bbad8fe70d7e68e41581941c9fdcd8e'),
(1277142626, '127.0.0.1', 'c20476bfbbe241d83d818ef3b54fc307813894af'),
(1277142606, '127.0.0.1', '2142e5dbe6d53802149f2f6b484d85cba7286d8b'),
(1277142599, '127.0.0.1', '4cb936ad1699beb1f4ba006eb2d4c6813bcfb084'),
(1277142589, '127.0.0.1', 'e2745499cdc49cdb17f896f06792bb1370a29846'),
(1277142583, '127.0.0.1', 'ab2717823341b50ef04398070dcc73b0f8f4737e'),
(1277142581, '127.0.0.1', 'a6740c667a6a86a1297f67309e739ce85c6e6dfc'),
(1277142578, '127.0.0.1', '5086ec741c22c8ea143016c9b563a09558fef87a'),
(1277142569, '127.0.0.1', '825c185e780d4de0e913ccd9b4a683fd68af96ce'),
(1277142539, '127.0.0.1', 'dd4765388fb5aeefc5c763942dbfc90802f6414a'),
(1277142539, '127.0.0.1', 'ce4f6adc929ca94dc8b4a03edabb6c62e8936c2c'),
(1277142532, '127.0.0.1', 'b990c44226e41203cd3b96a1e870f814a0cc27d9'),
(1277142532, '127.0.0.1', '776f7e1e5aba3c83db2e3c843855ffbbf9f874d5'),
(1277142527, '127.0.0.1', '9e63f9455447402d8c0d7110dd301a4d606034f4'),
(1277142523, '127.0.0.1', 'a8f38bb53a267c58fc28d3ae440a52bd5431cbb3'),
(1277142514, '127.0.0.1', 'f73f0651b6e4b3aa08672f27313a78c7a1fa73eb'),
(1277142447, '127.0.0.1', '6d55c126e6d9cfd7a585424813a51f68e9619cb2'),
(1277142311, '127.0.0.1', '44a6bec73ad2ba3cb5770e718b9a15fbb9a03b17'),
(1277142272, '127.0.0.1', '77ec0154e0363de3d2047395ea0a9a3046c10748'),
(1277142272, '127.0.0.1', 'eee51a5030150de51509c99c398bae0628b92108'),
(1277142272, '127.0.0.1', 'eb290b1baa57c32d7919fa7ac8a98a172672e0e4'),
(1277142271, '127.0.0.1', '800d9a2e33723434a477036e8f72b6d52ce72792'),
(1277142271, '127.0.0.1', '8d2b08ac99bca678d3b89e03d59734e8639f0177'),
(1277142271, '127.0.0.1', '1581be361b161c970ca12cd7567d8d8dc3fc835d'),
(1277142268, '127.0.0.1', '8dce51c3c04dbde2dea570f00996c5eca118d496'),
(1277142268, '127.0.0.1', 'e59070713d2604715a6ce8c4f5f1a7f2c430262f'),
(1277142268, '127.0.0.1', 'a33a72101bc134c432becc545dce3466516ddaeb'),
(1277142258, '127.0.0.1', '8424fef51e1484029d68540193155629196f6da3'),
(1277142254, '127.0.0.1', '6a42baaade448e472ba7c846d44925460ca42b71'),
(1277140762, '127.0.0.1', '0ce14a78afbd721602cbfe6e8770a3bdf7e0870a'),
(1277140720, '127.0.0.1', 'e6b4b788f853c1739b0a4c4cb8425fe5acc4a811'),
(1277139774, '127.0.0.1', '725d3b007e5a692c1113f5e3c829c912afffb8c2'),
(1277139774, '127.0.0.1', 'e617493e2614fa7e74d6dbd00da6e6ff167f83e1'),
(1277139774, '127.0.0.1', '27b981fd6aad8c232370ce0a36ecb9f37454856e'),
(1277139772, '127.0.0.1', 'cf97e63ec62fd6ae1a5a49c5961e99829088bc7b'),
(1277139772, '127.0.0.1', '735dd6cb99cd454b696c0962920a29c9597f9357'),
(1277139772, '127.0.0.1', 'c008ab54bb102d0bca168d65494b09c6caf13100'),
(1277139771, '127.0.0.1', 'c02cb7decc90757d1888ec33cf3ada76de9055a4'),
(1277139765, '127.0.0.1', 'e666c0ed2a856b9a21edce4587bc5b38bf269092'),
(1277139760, '127.0.0.1', 'e3f05e859e7a683f45a379f245af4773910f0d71'),
(1277139353, '127.0.0.1', '4211b721430d3b620a9aae5a671bbdfe03835d62'),
(1277139330, '127.0.0.1', '9fc9446a3030a9011080990512d75880f9460e62'),
(1277139209, '127.0.0.1', '0acde825ce5160139573b31c0efc1b732b3dac9d'),
(1277139209, '127.0.0.1', '706eaa9d85409d5f349d6adf133f656f699d23cb'),
(1277139209, '127.0.0.1', 'ea0994744c6da144d575bb251950026767a8ec80'),
(1277139206, '127.0.0.1', '56cc7e3348431c1c92dfc31b6798861142af8581'),
(1277139206, '127.0.0.1', 'be14051d8b3bcedc4131ec82abe27e09827031ab'),
(1277139206, '127.0.0.1', '851496ed1429b5144d2c343960cdf0807ba0e3dc'),
(1277139204, '127.0.0.1', '41c0cbfe7e31be8f9cacb9ec680b455e14a58952'),
(1277139183, '127.0.0.1', 'a475df45f88b8fcf55b91343b1bda2b24e685071'),
(1277139166, '127.0.0.1', '780d8794ad2f644516bcab85fcb17289b1d7f125'),
(1277139162, '127.0.0.1', 'd207283211a95cc74e3b7c222d406a81c9039286'),
(1277139160, '127.0.0.1', '1c81471340546728b846fabf5a40039551c83b0d'),
(1277139058, '127.0.0.1', '7870caf0fea60a386f05fa929971151ec77d4991'),
(1277139022, '127.0.0.1', '8777a5aef9ba4480a9055eb9f42a6bc5cd887d2d'),
(1277138980, '127.0.0.1', '1e70bfe751dd63dee3718820c62cf88398620712'),
(1277138929, '127.0.0.1', '0364d1e0909023ec0896449cd44e6bda2b214a1e'),
(1277138898, '127.0.0.1', 'b43b72c557738c944283ebf06f1b79c8bc808b58'),
(1277138871, '127.0.0.1', 'c35101d68aaf311391a521b1c64f2a8c2e153f2d'),
(1277138860, '127.0.0.1', 'bcf244eef49ffd357faf0f1427ddd9de25b123d9'),
(1277138798, '127.0.0.1', 'd6772f3c43f7615143a3871ee6e6bc9db52953ad'),
(1277138775, '127.0.0.1', '6f9ab3cc77edbed125bb552447f4f054fb542e35'),
(1277138685, '127.0.0.1', '1c62ef123cdc18fbf8bd688341e6fb94856c267c'),
(1277135504, '127.0.0.1', '81e143e1339d50babf62c6e2180300c65c98ea7f'),
(1277135374, '127.0.0.1', '1128e8eebf2789152ddd8c3959a0205e4269306b'),
(1277135367, '127.0.0.1', 'cfa87d84719d5c8d9b53add1367eaa7aac6c5ded'),
(1277135358, '127.0.0.1', '644750b726665378c8ff460a16935990145d277b'),
(1277135276, '127.0.0.1', '1d5bd236cf0faf80fd630c448bb4c0d3e3e0c3ae'),
(1277135276, '127.0.0.1', '2f720be334184cec25562e50a3da714c9c3af31c'),
(1277135276, '127.0.0.1', 'f73875842d4babfb8ff5e19f3c865506c184114b'),
(1277135275, '127.0.0.1', '6a183cf15415dcd1abc1e206ed796a1a8d233c48'),
(1277135268, '127.0.0.1', '29232df06f571b314765327827c4a95f3933e8fe'),
(1277135179, '127.0.0.1', '95098bd8dd2a5a4dc9dd9705d4f262af42f34fbe'),
(1277135179, '127.0.0.1', '6fd6c2b5300b01426e0f18badb99841d033c0df4'),
(1277135179, '127.0.0.1', '97dfb486aa27a84555daedbe356ac5509987e61f'),
(1277135173, '127.0.0.1', '7825387888938708e93571f73faf3e17ade6459b'),
(1277135173, '127.0.0.1', '999cd9a6cd5f423b9ff0c1f9902d130cbe5167da'),
(1277135173, '127.0.0.1', '5229dfaf67763a31338cdb0c2495a928f3887e1f'),
(1277135171, '127.0.0.1', '3fbe1cb5a80c45c82ad09e9dce27121b57ebfdfa'),
(1277135124, '127.0.0.1', '4b18673c3cd563ae1608f19683a9503af3f20e1e'),
(1277135075, '127.0.0.1', '370b420272b320e3a76430cc81f7f4d30c54c017'),
(1277135055, '127.0.0.1', '63e3f33fd2f555b00d1b2dc8ae9a41bd2ed8502f'),
(1277135051, '127.0.0.1', 'af0cc3c00f572c39bc3f56ea218e11da2fd368a7'),
(1277135045, '127.0.0.1', '7fae4d0a23f41bdfabd1ba0f6de1688c892d43a7'),
(1277134899, '127.0.0.1', 'b46f5c0fb89225752c044ac31e68fca320f0d211'),
(1277134899, '127.0.0.1', 'c9e9a835bf3c50886ae53a0099c2d27de7c9dd60'),
(1277134899, '127.0.0.1', '9ff7c2bdc164f03c51570795a6fad6ea0622ea9c'),
(1277134897, '127.0.0.1', '45da94347d38d0b8a6097ddfdabc7cf15874fa40'),
(1277134897, '127.0.0.1', 'a5f4a2777aea7eddc1862b6547ea6e0615199aa0'),
(1277134897, '127.0.0.1', 'e1e5f0e17adc54ee300f49e9075a3bd66a670e06'),
(1277134854, '127.0.0.1', '39a8197d0902712a5a1be4f506083c6a99ed7cb9'),
(1277134114, '127.0.0.1', 'd0fe87141649bf9d3d8a868d746561781cbf7065'),
(1277134114, '127.0.0.1', '5e628f88fd78ce85806a7e3f7be77a69ab1edb5f'),
(1277134114, '127.0.0.1', '09e4a560ecc21b8f81158e51babfd45126b1cd74'),
(1277134107, '127.0.0.1', '5dedf468d7604768a25b079aa7ae7e8723b06c44'),
(1277134101, '127.0.0.1', '28dfa6bc296a43df96b6cbce835b742dbebe6ba4'),
(1277134101, '127.0.0.1', '6b52867b8e03749f7842012f423313e04fb9cf6e'),
(1277134101, '127.0.0.1', '982a4d80050c8fa52cafd8519b72263db3bea1b2'),
(1277134099, '127.0.0.1', '9f7263b001063c31706bbdb76349439efde2783d'),
(1277134099, '127.0.0.1', 'bac5e434d29e6d918e13353fa9a7adf9f7ab1727'),
(1277134099, '127.0.0.1', 'f6ea50ed347245a7b6161be5b500014c725367b0'),
(1277134097, '127.0.0.1', '9381f96ecf7edc41e43ccfc0991995b131f816a8'),
(1277134050, '127.0.0.1', '03cafccc72a9a8f24a1d9bb2747b065e2ba90194'),
(1277134050, '127.0.0.1', 'd14a7ea67b79ad24d037c78ba4f48ffbdd842cf5'),
(1277134050, '127.0.0.1', 'f0df5c0a0981d7d230feaa593f958d597de3bdc5'),
(1277134041, '127.0.0.1', '47bffda50564b5429965c2caf58030d0c417a60e'),
(1277134041, '127.0.0.1', '052100ef8945c40cf0a1fc3ea59861cdc4d31228'),
(1277134041, '127.0.0.1', '628002fbccc278d6010f3f32ba29afa5a0ec9fc1'),
(1277134040, '127.0.0.1', '4714878e3db5b90e07493a3b62925bdadf76d921'),
(1277134030, '127.0.0.1', 'ca441dc6051104c0bdb7162e014557d79bfc18e3'),
(1277134011, '127.0.0.1', '4c35651e9e739759f88dcd97ab44d4d9ba5ed065'),
(1277134007, '127.0.0.1', '7c858c6a59f674198ba3115958ca647765ccabb0'),
(1277134007, '127.0.0.1', '7fd509927362281dcaa6a6de1c7b0e4465734fa3'),
(1277134007, '127.0.0.1', 'db61c93e5a6b1d8689c880a1113d733cc1115d16'),
(1277134002, '127.0.0.1', 'eec2701244084eb679801a733dabd749780e0159'),
(1277133983, '127.0.0.1', '039c96cba4d5ab1ce9b0ea248921f36be155f3ba'),
(1277133982, '127.0.0.1', 'd7ff6ee8ba0fe2b2f382401bb099bc39181fb13d'),
(1277133979, '127.0.0.1', '27354c28d30b2ab65ab48b75f39442bc9846665a'),
(1277133974, '127.0.0.1', 'c6f7db0a9f917a26bbb043d37ef352df9f05ada8'),
(1277133513, '127.0.0.1', '7a9347af706083f0189b5d39384dffce0a4d4b01'),
(1277132760, '127.0.0.1', '869d16b8371bef57a8cca96968db6750137347be'),
(1277132728, '127.0.0.1', 'dea36e6a4285c7825fe46699441a159efaf4850b'),
(1277132698, '127.0.0.1', '463e334b8be97e78bcc3d173abbea629d8388fe7'),
(1277132610, '127.0.0.1', 'fb0ecb348a3a13a1d3af00413bdf74b5b1db25c1'),
(1277132581, '127.0.0.1', 'b2f60ae6a8525689ebdf437073d7734e4923b58f'),
(1277132577, '127.0.0.1', '80710ba21292fb926d717381b96e49fb1643dc80'),
(1277132575, '127.0.0.1', 'a7f50060a31c6b8428caf37839af58dea67faf26'),
(1277131676, '127.0.0.1', '4876f3ea54b4967ed59ce1aac26cfd83188163de'),
(1277131665, '127.0.0.1', '9abf413fc809f591afe6e942c05a3c306feeab2a'),
(1277131665, '127.0.0.1', 'bc190a7e646122984ccb20bfe1f127db83aa47b0'),
(1277131665, '127.0.0.1', '5db21b18c4ee28b3c38021fc2fb845fba644168f'),
(1277131557, '127.0.0.1', '09da585ec34910ab1d32ccaeae23ee9494450d5d'),
(1277131557, '127.0.0.1', '23d31df1ae5ecba575591899da547d20530f495a'),
(1277131557, '127.0.0.1', '29f93c7c99c63a18d73cf2a6ffbdcf62ce676178'),
(1277131551, '127.0.0.1', '4df220088122363436316650e14dc29b9b169938'),
(1277142266, '127.0.0.1', '3ed0eb5347c5900dd784aa8ca83c9ae6a8e181da'),
(1277130145, '127.0.0.1', 'c678c258b0c84d77c6f7bc9bd919b1868b6f4d33'),
(1277131396, '127.0.0.1', '42a2475bfb58e6c0ea65fd1030a12c1bef61b9e2'),
(1277131409, '127.0.0.1', 'dbf6615a518ab7a0cb22ddad12c72e6f8650cf62'),
(1277131527, '127.0.0.1', '452fb2c7ffe2570abee3aa07f88344762c4a298d'),
(1277131534, '127.0.0.1', '0f2f2c7bb7e15fbb6cc946879d50aaf7a988c0b6'),
(1277131537, '127.0.0.1', 'ea1c8d452fffdb10167e0a50140a11c17eac3203'),
(1277131540, '127.0.0.1', '811efcc1bf1e4e72f1e2872ace9fce1bcdac7e4b'),
(1277131543, '127.0.0.1', 'dd12d9fcb4f70a9db4258b63006bb347383377d1'),
(1277131546, '127.0.0.1', '176132da3acd58f52391ef89ee3745b7352e8415');

-- --------------------------------------------------------

--
-- Table structure for table `exp_sessions`
--

CREATE TABLE IF NOT EXISTS `exp_sessions` (
  `session_id` varchar(40) NOT NULL DEFAULT '0',
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `member_id` int(10) NOT NULL DEFAULT '0',
  `admin_sess` tinyint(1) NOT NULL DEFAULT '0',
  `ip_address` varchar(16) NOT NULL DEFAULT '0',
  `user_agent` varchar(50) NOT NULL,
  `last_activity` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`session_id`),
  KEY `member_id` (`member_id`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `exp_sessions`
--

INSERT INTO `exp_sessions` (`session_id`, `site_id`, `member_id`, `admin_sess`, `ip_address`, `user_agent`, `last_activity`) VALUES
('7e821c8e62d1a5e7f55cb71ae9dcbdebf86ffed9', 1, 1, 1, '127.0.0.1', 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US) Ap', 1277158256),
('46e066ccd19d26b37d559fe8ce73d4f053e7ef3d', 1, 2, 0, '127.0.0.1', 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US) Ap', 1277158032),
('2f339e7254dc4a53a01be7c2eefd916b1946a174', 1, 1, 1, '127.0.0.1', 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US) Ap', 1277157122),
('8ebe7abaab8e847a77862d5598b5006a47886a77', 1, 2, 0, '127.0.0.1', 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US) Ap', 1277157161);

-- --------------------------------------------------------

--
-- Table structure for table `exp_sites`
--

CREATE TABLE IF NOT EXISTS `exp_sites` (
  `site_id` int(5) unsigned NOT NULL AUTO_INCREMENT,
  `site_label` varchar(100) NOT NULL DEFAULT '',
  `site_name` varchar(50) NOT NULL DEFAULT '',
  `site_description` text NOT NULL,
  `site_system_preferences` text NOT NULL,
  `site_mailinglist_preferences` text NOT NULL,
  `site_member_preferences` text NOT NULL,
  `site_template_preferences` text NOT NULL,
  `site_weblog_preferences` text NOT NULL,
  PRIMARY KEY (`site_id`),
  KEY `site_name` (`site_name`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `exp_sites`
--

INSERT INTO `exp_sites` (`site_id`, `site_label`, `site_name`, `site_description`, `site_system_preferences`, `site_mailinglist_preferences`, `site_member_preferences`, `site_template_preferences`, `site_weblog_preferences`) VALUES
(1, 'Easy Breezy', 'default_site', '', 'a:98:{s:15:"encryption_type";s:4:"sha1";s:10:"site_index";s:0:"";s:9:"site_name";s:11:"Easy Breezy";s:8:"site_url";s:20:"http://localhost/eb/";s:16:"theme_folder_url";s:27:"http://localhost/eb/themes/";s:15:"webmaster_email";s:0:"";s:14:"webmaster_name";s:0:"";s:19:"weblog_nomenclature";s:7:"section";s:10:"max_caches";s:3:"150";s:11:"captcha_url";s:36:"http://localhost/eb/images/captchas/";s:12:"captcha_path";s:35:"C:/xampp/htdocs/eb/images/captchas/";s:12:"captcha_font";s:1:"y";s:12:"captcha_rand";s:1:"y";s:23:"captcha_require_members";s:1:"n";s:17:"enable_db_caching";s:1:"y";s:18:"enable_sql_caching";s:1:"n";s:18:"force_query_string";s:1:"n";s:12:"show_queries";s:1:"n";s:18:"template_debugging";s:1:"n";s:15:"include_seconds";s:1:"n";s:13:"cookie_domain";s:0:"";s:11:"cookie_path";s:0:"";s:17:"user_session_type";s:1:"c";s:18:"admin_session_type";s:2:"cs";s:21:"allow_username_change";s:1:"y";s:18:"allow_multi_logins";s:1:"y";s:16:"password_lockout";s:1:"y";s:25:"password_lockout_interval";s:1:"1";s:20:"require_ip_for_login";s:1:"y";s:22:"require_ip_for_posting";s:1:"y";s:18:"allow_multi_emails";s:1:"n";s:24:"require_secure_passwords";s:1:"n";s:19:"allow_dictionary_pw";s:1:"y";s:23:"name_of_dictionary_file";s:0:"";s:17:"xss_clean_uploads";s:1:"y";s:15:"redirect_method";s:8:"redirect";s:9:"deft_lang";s:7:"english";s:8:"xml_lang";s:2:"en";s:7:"charset";s:5:"utf-8";s:12:"send_headers";s:1:"y";s:11:"gzip_output";s:1:"n";s:13:"log_referrers";s:1:"y";s:13:"max_referrers";s:3:"500";s:11:"time_format";s:2:"us";s:15:"server_timezone";s:3:"UM5";s:13:"server_offset";s:0:"";s:16:"daylight_savings";s:1:"n";s:21:"default_site_timezone";s:3:"UM5";s:16:"default_site_dst";s:1:"n";s:15:"honor_entry_dst";s:1:"y";s:13:"mail_protocol";s:4:"mail";s:11:"smtp_server";s:0:"";s:13:"smtp_username";s:0:"";s:13:"smtp_password";s:0:"";s:11:"email_debug";s:1:"n";s:13:"email_charset";s:5:"utf-8";s:15:"email_batchmode";s:1:"n";s:16:"email_batch_size";s:0:"";s:11:"mail_format";s:5:"plain";s:9:"word_wrap";s:1:"y";s:22:"email_console_timelock";s:1:"5";s:22:"log_email_console_msgs";s:1:"y";s:8:"cp_theme";s:7:"default";s:21:"email_module_captchas";s:1:"n";s:16:"log_search_terms";s:1:"y";s:12:"secure_forms";s:1:"y";s:19:"deny_duplicate_data";s:1:"y";s:24:"redirect_submitted_links";s:1:"n";s:16:"enable_censoring";s:1:"n";s:14:"censored_words";s:0:"";s:18:"censor_replacement";s:0:"";s:10:"banned_ips";s:0:"";s:13:"banned_emails";s:0:"";s:16:"banned_usernames";s:0:"";s:19:"banned_screen_names";s:0:"";s:10:"ban_action";s:8:"restrict";s:11:"ban_message";s:34:"This site is currently unavailable";s:15:"ban_destination";s:21:"http://www.yahoo.com/";s:16:"enable_emoticons";s:1:"y";s:13:"emoticon_path";s:35:"http://localhost/eb/images/smileys/";s:19:"recount_batch_total";s:4:"1000";s:13:"remap_pm_urls";s:1:"n";s:13:"remap_pm_dest";s:0:"";s:17:"new_version_check";s:1:"y";s:20:"publish_tab_behavior";s:5:"hover";s:18:"sites_tab_behavior";s:5:"hover";s:17:"enable_throttling";s:1:"n";s:17:"banish_masked_ips";s:1:"y";s:14:"max_page_loads";s:2:"10";s:13:"time_interval";s:1:"8";s:12:"lockout_time";s:2:"30";s:15:"banishment_type";s:7:"message";s:14:"banishment_url";s:0:"";s:18:"banishment_message";s:50:"You have exceeded the allowed page load frequency.";s:17:"enable_search_log";s:1:"y";s:19:"max_logged_searches";s:3:"500";s:17:"theme_folder_path";s:30:"C:/xampplite/htdocs/eb/themes/";s:10:"is_site_on";s:1:"y";}', 'a:3:{s:19:"mailinglist_enabled";s:1:"y";s:18:"mailinglist_notify";s:1:"n";s:25:"mailinglist_notify_emails";s:0:"";}', 'a:44:{s:10:"un_min_len";s:1:"4";s:10:"pw_min_len";s:1:"5";s:25:"allow_member_registration";s:1:"y";s:25:"allow_member_localization";s:1:"y";s:18:"req_mbr_activation";s:5:"email";s:23:"new_member_notification";s:1:"n";s:23:"mbr_notification_emails";s:0:"";s:24:"require_terms_of_service";s:1:"y";s:22:"use_membership_captcha";s:1:"n";s:20:"default_member_group";s:1:"5";s:15:"profile_trigger";s:6:"member";s:12:"member_theme";s:7:"default";s:14:"enable_avatars";s:1:"y";s:20:"allow_avatar_uploads";s:1:"n";s:10:"avatar_url";s:35:"http://localhost/eb/images/avatars/";s:11:"avatar_path";s:34:"C:/xampp/htdocs/eb/images/avatars/";s:16:"avatar_max_width";s:3:"100";s:17:"avatar_max_height";s:3:"100";s:13:"avatar_max_kb";s:2:"50";s:13:"enable_photos";s:1:"n";s:9:"photo_url";s:41:"http://localhost/eb/images/member_photos/";s:10:"photo_path";s:40:"C:/xampp/htdocs/eb/images/member_photos/";s:15:"photo_max_width";s:3:"100";s:16:"photo_max_height";s:3:"100";s:12:"photo_max_kb";s:2:"50";s:16:"allow_signatures";s:1:"y";s:13:"sig_maxlength";s:3:"500";s:21:"sig_allow_img_hotlink";s:1:"n";s:20:"sig_allow_img_upload";s:1:"n";s:11:"sig_img_url";s:49:"http://localhost/eb/images/signature_attachments/";s:12:"sig_img_path";s:48:"C:/xampp/htdocs/eb/images/signature_attachments/";s:17:"sig_img_max_width";s:3:"480";s:18:"sig_img_max_height";s:2:"80";s:14:"sig_img_max_kb";s:2:"30";s:19:"prv_msg_upload_path";s:41:"C:/xampp/htdocs/eb/images/pm_attachments/";s:23:"prv_msg_max_attachments";s:1:"3";s:22:"prv_msg_attach_maxsize";s:3:"250";s:20:"prv_msg_attach_total";s:3:"100";s:19:"prv_msg_html_format";s:4:"safe";s:18:"prv_msg_auto_links";s:1:"y";s:17:"prv_msg_max_chars";s:4:"6000";s:19:"memberlist_order_by";s:11:"total_posts";s:21:"memberlist_sort_order";s:4:"desc";s:20:"memberlist_row_limit";s:2:"20";}', 'a:6:{s:11:"strict_urls";s:1:"n";s:8:"site_404";s:0:"";s:19:"save_tmpl_revisions";s:1:"n";s:18:"max_tmpl_revisions";s:1:"5";s:15:"save_tmpl_files";s:1:"y";s:18:"tmpl_file_basepath";s:39:"C:/xampplite/htdocs/eb/admin/templates/";}', 'a:10:{s:21:"enable_image_resizing";s:1:"y";s:21:"image_resize_protocol";s:3:"gd2";s:18:"image_library_path";s:0:"";s:16:"thumbnail_prefix";s:5:"thumb";s:14:"word_separator";s:10:"underscore";s:17:"use_category_name";s:1:"n";s:22:"reserved_category_word";s:8:"category";s:23:"auto_convert_high_ascii";s:1:"n";s:22:"new_posts_clear_caches";s:1:"y";s:23:"auto_assign_cat_parents";s:1:"y";}');

-- --------------------------------------------------------

--
-- Table structure for table `exp_specialty_templates`
--

CREATE TABLE IF NOT EXISTS `exp_specialty_templates` (
  `template_id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `enable_template` char(1) NOT NULL DEFAULT 'y',
  `template_name` varchar(50) NOT NULL,
  `data_title` varchar(80) NOT NULL,
  `template_data` text NOT NULL,
  PRIMARY KEY (`template_id`),
  KEY `template_name` (`template_name`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=19 ;

--
-- Dumping data for table `exp_specialty_templates`
--

INSERT INTO `exp_specialty_templates` (`template_id`, `site_id`, `enable_template`, `template_name`, `data_title`, `template_data`) VALUES
(1, 1, 'y', 'offline_template', '', '<html>\n<head>\n\n<title>System Offline</title>\n\n<style type="text/css">\n\nbody { \nbackground-color:	#ffffff; \nmargin:				50px; \nfont-family:		Verdana, Arial, Tahoma, Trebuchet MS, Sans-serif;\nfont-size:			11px;\ncolor:				#000;\nbackground-color:	#fff;\n}\n\na {\nfont-family:		Verdana, Arial, Tahoma, Trebuchet MS, Sans-serif;\nfont-weight:		bold;\nletter-spacing:		.09em;\ntext-decoration:	none;\ncolor:              #330099;\nbackground-color:   transparent;\n}\n  \na:visited {\ncolor:				#330099;\nbackground-color:	transparent;\n}\n\na:hover {\ncolor:				#000;\ntext-decoration:    underline;\nbackground-color:	transparent;\n}\n\n#content  {\nborder:				#999999 1px solid;\npadding:			22px 25px 14px 25px;\n}\n\nh1 {\nfont-family:		Verdana, Arial, Tahoma, Trebuchet MS, Sans-serif;\nfont-weight:		bold;\nfont-size:			14px;\ncolor:				#000;\nmargin-top: 		0;\nmargin-bottom:		14px;\n}\n\np {\nfont-family:		Verdana, Arial, Tahoma, Trebuchet MS, Sans-serif;\nfont-size: 			12px;\nfont-weight: 		normal;\nmargin-top: 		12px;\nmargin-bottom: 		14px;\ncolor: 				#000;\n}\n</style>\n\n</head>\n\n<body>\n\n<div id="content">\n\n<h1>System Offline</h1>\n\n<p>This site is currently offline</p>\n\n</div>\n\n</body>\n\n</html>'),
(2, 1, 'y', 'message_template', '', '<html>\n<head>\n\n<title>{title}</title>\n\n<meta http-equiv=''content-type'' content=''text/html; charset={charset}'' />\n\n{meta_refresh}\n\n<style type="text/css">\n\nbody { \nbackground-color:	#ffffff; \nmargin:				50px; \nfont-family:		Verdana, Arial, Tahoma, Trebuchet MS, Sans-serif;\nfont-size:			11px;\ncolor:				#000;\nbackground-color:	#fff;\n}\n\na {\nfont-family:		Verdana, Arial, Tahoma, Trebuchet MS, Sans-serif;\nletter-spacing:		.09em;\ntext-decoration:	none;\ncolor:              #330099;\nbackground-color:   transparent;\n}\n  \na:visited {\ncolor:				#330099;\nbackground-color:	transparent;\n}\n\na:active {\ncolor:				#ccc;\nbackground-color:	transparent;\n}\n\na:hover {\ncolor:				#000;\ntext-decoration:    underline;\nbackground-color:	transparent;\n}\n\n#content  {\nborder:				#000 1px solid;\nbackground-color: 	#DEDFE3;\npadding:			22px 25px 14px 25px;\n}\n\nh1 {\nfont-family:		Verdana, Arial, Tahoma, Trebuchet MS, Sans-serif;\nfont-weight:		bold;\nfont-size:			14px;\ncolor:				#000;\nmargin-top: 		0;\nmargin-bottom:		14px;\n}\n\np {\nfont-family:		Verdana, Arial, Tahoma, Trebuchet MS, Sans-serif;\nfont-size: 			12px;\nfont-weight: 		normal;\nmargin-top: 		12px;\nmargin-bottom: 		14px;\ncolor: 				#000;\n}\n\nul {\nmargin-bottom: 		16px;\n}\n\nli {\nlist-style:			square;\nfont-family:		Verdana, Arial, Tahoma, Trebuchet MS, Sans-serif;\nfont-size: 			12px;\nfont-weight: 		normal;\nmargin-top: 		8px;\nmargin-bottom: 		8px;\ncolor: 				#000;\n}\n\n</style>\n\n</head>\n\n<body>\n\n<div id="content">\n\n<h1>{heading}</h1>\n\n{content}\n\n<p>{link}</p>\n\n</div>\n\n</body>\n\n</html>'),
(3, 1, 'y', 'admin_notify_reg', 'Notification of new member registration', 'The following person has submitted a new member registration: {name}\n\nAt: {site_name}\n\nYour control panel URL: {control_panel_url}'),
(4, 1, 'y', 'admin_notify_entry', 'A new weblog entry has been posted', 'A new entry has been posted in the following weblog:\n{weblog_name}\n\nThe title of the entry is:\n{entry_title}\n\nPosted by: {name}\nEmail: {email}\n\nTo read the entry please visit: \n{entry_url}\n'),
(5, 1, 'y', 'admin_notify_mailinglist', 'Someone has subscribed to your mailing list', 'A new mailing list subscription has been accepted.\n\nEmail Address: {email}\nMailing List: {mailing_list}'),
(6, 1, 'y', 'admin_notify_comment', 'You have just received a comment', 'You have just received a comment for the following weblog:\n{weblog_name}\n\nThe title of the entry is:\n{entry_title}\n\nLocated at: \n{comment_url}\n\nPosted by: {name}\nEmail: {email}\nURL: {url}\nLocation: {location}\n\n{comment}'),
(7, 1, 'y', 'admin_notify_gallery_comment', 'You have just received a comment', 'You have just received a comment for the following photo gallery:\n{gallery_name}\n\nThe title of the entry is:\n{entry_title}\n\nLocated at: \n{comment_url}\n\n{comment}'),
(8, 1, 'y', 'admin_notify_trackback', 'You have just received a trackback', 'You have just received a trackback for the following entry:\n{entry_title}\n\nLocated at: \n{comment_url}\n\nThe trackback was sent from the following weblog:\n{sending_weblog_name}\n\nEntry Title:\n{sending_entry_title}\n\nWeblog URL:\n{sending_weblog_url}'),
(9, 1, 'y', 'mbr_activation_instructions', 'Enclosed is your activation code', 'Thank you for your new member registration.\n\nTo activate your new account, please visit the following URL:\n\n{unwrap}{activation_url}{/unwrap}\n\nThank You!\n\n{site_name}\n\n{site_url}'),
(10, 1, 'y', 'forgot_password_instructions', 'Login information', '{name},\n\nTo reset your password, please go to the following page:\n\n{reset_url}\n\nYour password will be automatically reset, and a new password will be emailed to you.\n\nIf you do not wish to reset your password, ignore this message. It will expire in 24 hours.\n\n{site_name}\n{site_url}'),
(11, 1, 'y', 'reset_password_notification', 'New Login Information', '{name},\n\nHere is your new login information:\n\nUsername: {username}\nPassword: {password}\n\n{site_name}\n{site_url}'),
(12, 1, 'y', 'validated_member_notify', 'Your membership account has been activated', '{name},\n\nYour membership account has been activated and is ready for use.\n\nThank You!\n\n{site_name}\n{site_url}'),
(13, 1, 'y', 'decline_member_validation', 'Your membership account has been declined', '{name},\n\nWe''re sorry but our staff has decided not to validate your membership.\n\n{site_name}\n{site_url}'),
(14, 1, 'y', 'mailinglist_activation_instructions', 'Email Confirmation', 'Thank you for joining the "{mailing_list}" mailing list!\n\nPlease click the link below to confirm your email.\n\nIf you do not want to be added to our list, ignore this email.\n\n{unwrap}{activation_url}{/unwrap}\n\nThank You!\n\n{site_name}'),
(15, 1, 'y', 'comment_notification', 'Someone just responded to your comment', 'Someone just responded to the entry you subscribed to at:\n{weblog_name}\n\nThe title of the entry is:\n{entry_title}\n\nYou can see the comment at the following URL:\n{comment_url}\n\n{comment}\n\nTo stop receiving notifications for this comment, click here:\n{notification_removal_url}'),
(16, 1, 'y', 'gallery_comment_notification', 'Someone just responded to your comment', 'Someone just responded to the photo entry you subscribed to at:\n{gallery_name}\n\nYou can see the comment at the following URL:\n{comment_url}\n\n{comment}\n\nTo stop receiving notifications for this comment, click here:\n{notification_removal_url}'),
(17, 1, 'y', 'private_message_notification', 'Someone has sent you a Private Message', '\n{recipient_name},\n\n{sender_name} has just sent you a Private Message titled ''{message_subject}''.\n\nYou can see the Private Message by logging in and viewing your InBox at:\n{site_url}\n\nTo stop receiving notifications of Private Messages, turn the option off in your Email Settings.'),
(18, 1, 'y', 'pm_inbox_full', 'Your private message mailbox is full', '{recipient_name},\n\n{sender_name} has just attempted to send you a Private Message,\nbut your InBox is full, exceeding the maximum of {pm_storage_limit}.\n\nPlease log in and remove unwanted messages from your InBox at:\n{site_url}');

-- --------------------------------------------------------

--
-- Table structure for table `exp_stats`
--

CREATE TABLE IF NOT EXISTS `exp_stats` (
  `weblog_id` int(6) unsigned NOT NULL DEFAULT '0',
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `total_members` mediumint(7) NOT NULL DEFAULT '0',
  `recent_member_id` int(10) NOT NULL DEFAULT '0',
  `recent_member` varchar(50) NOT NULL,
  `total_entries` mediumint(8) NOT NULL DEFAULT '0',
  `total_forum_topics` mediumint(8) NOT NULL DEFAULT '0',
  `total_forum_posts` mediumint(8) NOT NULL DEFAULT '0',
  `total_comments` mediumint(8) NOT NULL DEFAULT '0',
  `total_trackbacks` mediumint(8) NOT NULL DEFAULT '0',
  `last_entry_date` int(10) unsigned NOT NULL DEFAULT '0',
  `last_forum_post_date` int(10) unsigned NOT NULL DEFAULT '0',
  `last_comment_date` int(10) unsigned NOT NULL DEFAULT '0',
  `last_trackback_date` int(10) unsigned NOT NULL DEFAULT '0',
  `last_visitor_date` int(10) unsigned NOT NULL DEFAULT '0',
  `most_visitors` mediumint(7) NOT NULL DEFAULT '0',
  `most_visitor_date` int(10) unsigned NOT NULL DEFAULT '0',
  `last_cache_clear` int(10) unsigned NOT NULL DEFAULT '0',
  KEY `weblog_id` (`weblog_id`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `exp_stats`
--

INSERT INTO `exp_stats` (`weblog_id`, `site_id`, `total_members`, `recent_member_id`, `recent_member`, `total_entries`, `total_forum_topics`, `total_forum_posts`, `total_comments`, `total_trackbacks`, `last_entry_date`, `last_forum_post_date`, `last_comment_date`, `last_trackback_date`, `last_visitor_date`, `most_visitors`, `most_visitor_date`, `last_cache_clear`) VALUES
(0, 1, 2, 2, 'testuser', 4, 0, 0, 0, 0, 1277073225, 0, 0, 0, 1277158250, 16, 1276902472, 1277319585);

-- --------------------------------------------------------

--
-- Table structure for table `exp_statuses`
--

CREATE TABLE IF NOT EXISTS `exp_statuses` (
  `status_id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `group_id` int(4) unsigned NOT NULL,
  `status` varchar(50) NOT NULL,
  `status_order` int(3) unsigned NOT NULL,
  `highlight` varchar(30) NOT NULL,
  PRIMARY KEY (`status_id`),
  KEY `group_id` (`group_id`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `exp_statuses`
--

INSERT INTO `exp_statuses` (`status_id`, `site_id`, `group_id`, `status`, `status_order`, `highlight`) VALUES
(1, 1, 1, 'open', 1, '009933'),
(2, 1, 1, 'closed', 2, '990000');

-- --------------------------------------------------------

--
-- Table structure for table `exp_status_groups`
--

CREATE TABLE IF NOT EXISTS `exp_status_groups` (
  `group_id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `group_name` varchar(50) NOT NULL,
  PRIMARY KEY (`group_id`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `exp_status_groups`
--

INSERT INTO `exp_status_groups` (`group_id`, `site_id`, `group_name`) VALUES
(1, 1, 'Default Status Group');

-- --------------------------------------------------------

--
-- Table structure for table `exp_status_no_access`
--

CREATE TABLE IF NOT EXISTS `exp_status_no_access` (
  `status_id` int(6) unsigned NOT NULL,
  `member_group` smallint(4) unsigned NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `exp_status_no_access`
--


-- --------------------------------------------------------

--
-- Table structure for table `exp_templates`
--

CREATE TABLE IF NOT EXISTS `exp_templates` (
  `template_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `group_id` int(6) unsigned NOT NULL,
  `template_name` varchar(50) NOT NULL,
  `save_template_file` char(1) NOT NULL DEFAULT 'n',
  `template_type` varchar(16) NOT NULL DEFAULT 'webpage',
  `template_data` mediumtext NOT NULL,
  `template_notes` text NOT NULL,
  `edit_date` int(10) NOT NULL DEFAULT '0',
  `last_author_id` int(10) unsigned NOT NULL,
  `cache` char(1) NOT NULL DEFAULT 'n',
  `refresh` int(6) unsigned NOT NULL,
  `no_auth_bounce` varchar(50) NOT NULL,
  `enable_http_auth` char(1) NOT NULL DEFAULT 'n',
  `allow_php` char(1) NOT NULL DEFAULT 'n',
  `php_parse_location` char(1) NOT NULL DEFAULT 'o',
  `hits` int(10) unsigned NOT NULL,
  PRIMARY KEY (`template_id`),
  KEY `group_id` (`group_id`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=42 ;

--
-- Dumping data for table `exp_templates`
--

INSERT INTO `exp_templates` (`template_id`, `site_id`, `group_id`, `template_name`, `save_template_file`, `template_type`, `template_data`, `template_notes`, `edit_date`, `last_author_id`, `cache`, `refresh`, `no_auth_bounce`, `enable_http_auth`, `allow_php`, `php_parse_location`, `hits`) VALUES
(1, 1, 1, 'index', 'y', 'webpage', '{embed="includes/header"}\n<div id="index_top">\n        {embed="includes/email-signup" message="sign up for  newletters & savings by entering your email address" margin="45"}\n        <img src="{path=''images/site''}eb_lady.png" class="index_lady" />\n</div>\n<div id="index_bottom">\n	<div id="index_left">\n    	<a href="{path=''cc4kids''}"><img src="{path=''images/site''}index_cc4kids.png" /></a>\n        <br />\n       	<img src="{path=''images/site''}index_products.png" />\n    </div>\n    <div id="index_center">\n    	<img src="{path=''images/site''}index_howitworks.png" />\n        <div id="index_searchbox">\n        	<img src="{path=''images/site''}index_planner.png" /><br />\n           	<input type="text" id="search_terms" name="search_terms" value="Search for recipes" />\n            <input type="submit" id="submit_search" name="submit_search" value="" />\n        </div>\n    </div>\n    <div id="index_right">\n    	<div id="index_loginbox">\n        	{exp:member:login_form return="site/index"}\n        	<input type="text" id="username" name="username" value="Username" /><br />\n            <input type="text" id="password" name="password" value="Password" /><br />\n            <input type="button" id="signup" name="signup" value="" />\n            <input type="submit" id="submit_login" name="submit_login" value="" />\n            {/exp:member:login_form}\n        </div>\n    	<img src="{path=''images/site''}index_share.png" />\n    </div>\n</div>\n\n{embed="includes/footer"}', '', 1276741226, 1, 'n', 0, '', 'n', 'n', 'o', 288),
(19, 1, 6, 'index', 'n', 'webpage', '', '', 1275427851, 0, 'n', 0, '', 'n', 'n', 'o', 0),
(20, 1, 3, 'main', 'y', 'css', '', '', 1275428021, 1, 'n', 0, '', 'n', 'n', 'o', 0),
(21, 1, 7, 'index', 'n', 'webpage', '', '', 1275428460, 0, 'n', 0, '', 'n', 'n', 'o', 0),
(22, 1, 7, 'header', 'y', 'webpage', '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">\n<html xmlns="http://www.w3.org/1999/xhtml">\n<head>\n<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />\n<title>Easy Breezy Dinners</title>\n<link rel="stylesheet" type="text/css" media="all" href="{stylesheet=styles/main}" />\n{if segment_1 == "cc4kids"}<link rel="stylesheet" type="text/css" media="all" href="{stylesheet=styles/cc4kids}" />{/if}\n\n</head>\n<body>\n<div id="page_wrapper">\n', '', 1276032067, 1, 'n', 0, '', 'n', 'n', 'o', 0),
(23, 1, 7, 'footer', 'y', 'webpage', '</body>\n</html>\n', '', 1275428508, 1, 'n', 0, '', 'n', 'n', 'o', 0),
(24, 1, 7, 'email-signup', 'y', 'webpage', '    <div id="index_emailbox">\n    	<span>sign up for  newletters & savings by entering your email address</span>\n        <input type="text" id="email_address" name="email_address" value="" />\n        <input type="submit" id="submit_email" name="submit_email" value="" />\n    </div>', '', 1275512355, 1, 'n', 0, '', 'n', 'n', 'o', 0),
(25, 1, 8, 'index', 'y', 'webpage', '{embed="includes/header"}\n\n<div id="cc4kids_top">\n	{embed="includes/email-signup" message="Parents sign up for notifications by entering your email address" margin="5"}\n</div>\n<div id="cckids_middle">\n	<img src="{path=''images/site''}ad_728x90.png" class="ad_space" /><br />\n    <img src="{path=''images/site''}cc4kids_rotw_bar.png" />\n    <div id="cc4kids_main">\n        {exp:weblog:entries weblog="eb_cc4kids" limit="1"} \n            <img src="{cc4k_char_image}" id="cc4kids_cal" />\n            <div id="cc4kids_rotw">\n                <a href="{path=''cc4kids/printable''}{url_title}" target="_blank">\n                <img src="{path=''images/site''}cc4kids_printrecipe.png" align="right" /></a>\n                <a href="{path=''cc4kids/more-recipes''}">\n                <img src="{path=''images/site''}cc4kids_morerecipes.png" align="right" /></a>\n                <br />\n                <br />\n                <br />\n                <img src="{cc4k_main_image}" align="left" /><br />\n                <p>{cc4k_recipe_summary}</p>\n            </div>\n        {/exp:weblog:entries} \n    </div>\n    <div id="cc4kids_middle_ads">\n        <img src="{path=''images/site''}ad_125x125.png" class="ad_space" /><br />\n        <img src="{path=''images/site''}ad_125x125.png" class="ad_space" /><br />\n    </div>\n</div>\n<div style="clear: both"></div>\n{exp:weblog:entries weblog="eb_cc4kids" limit="1"} \n<div id="cc4kids_items">\n    <p>First get everything ready to go! You will need the everything you see in the pictures below:</p>\n    <div id="cc4kids_ingredients">\n        <p>Ingredients for one serving</p>\n        {cc4k_ingredients}\n        <div class="cc4kids_ingredient"><img src="{ingredient_img}" /><br />\n        	<span>{ingredient_details}</span>\n        </div>\n        {/cc4k_ingredients}\n</div>\n    <div id="cc4kids_tools">\n        <p>Cooking Tools that you wil need for this recipe</p>\n        {cc4k_tools}\n        <div class="cc4kids_tool"><img src="{tool_img}" /><br />\n        	<span>{tool_name}</span>\n        </div>\n        {/cc4k_tools}        \n    </div>\n</div>\n{/exp:weblog:entries} \n<div id="cc4kids_bottom">\n	<div id="cc4kids_safetytips">\n    	<p class="bold">Before You Start...<br />read these really important safety tips!</p>\n        <p>	1. Never cook without asking your Mom or Dad first!<br />\n        	<br />\n			2. Never turn on the stove or oven without adult supervision. <br />\n            <br />\n			3. Never use knives, blenders, mixers or any other dangerous kitchen tools by yourself.  You must have help from your Mom or Dad <br />\n            <br />\n			4. Meats and other foods can have harmful germs. An adult should always help you when cooking.<br /></p>\n         <p class="bold">Smart Kids r Safe Kids </p>\n    </div>\n    <div id="cc4kids_directions">\n		{exp:weblog:entries weblog="eb_cc4kids" limit="1"} \n    		<p class="header">Directions</p>\n            <p class="note">Make certain that an adult is helping you with this recipe.</p>\n            <div class="body">{cc4k_recipe_directions}</div>\n            <br />\n            <div>\n                <a href="{path=''cc4kids/printable''}{url_title}" target="_blank">\n                <img src="{path=''images/site''}cc4kids_printrecipe.png" align="right" /></a>\n                <a href="{path=''cc4kids/more-recipes''}">\n                <img src="{path=''images/site''}cc4kids_morerecipes.png" align="right" /></a>\n                <br />\n            </div>\n		{/exp:weblog:entries} \n    </div>\n    <div id="cck4ids_bottom_ad">\n	    <img src="{path=''images/site''}ad_170x600.png" /><br />\n        <br />\n    </div>\n	<div style="clear: both"></div>\n	<div id="cc4kids_bottom_bar"></div>\n</div>\n\n{embed="includes/footer"}', '', 1276741240, 1, 'n', 0, '', 'n', 'n', 'o', 316),
(26, 1, 8, 'more-recipes', 'y', 'webpage', '{embed="includes/header"}\n\n<div id="cc4kids_top">\n	{embed="includes/email-signup" message="Parents sign up for notifications by entering your email address" margin="5"}\n</div>\n<div id="cckids_middle">\n	<img src="{path=''images/site''}ad_728x90.png" class="ad_space" /><br />\n    <img src="{path=''images/site''}cc4kids_rotw_bar.png" />\n    <div id="cc4kids_main">\n        {exp:weblog:entries weblog="eb_cc4kids" limit="1"} \n            <img src="{cc4k_char_image}" id="cc4kids_cal" />\n            \n            <div id="cc4kids_rotw">\n                <img src="{path=''images/site''}cc4kids_printrecipe.png" align="right" />\n                <img src="{path=''images/site''}cc4kids_morerecipes.png" align="right" /><br />\n                <br />\n                <br />\n                <img src="{cc4k_main_image}" align="left" /><br />\n                <p>{cc4k_recipe_summary}</p>\n            </div>\n        {/exp:weblog:entries} \n    </div>\n    <div id="cc4kids_middle_ads">\n        <img src="{path=''images/site''}ad_125x125.png" class="ad_space" /><br />\n        <img src="{path=''images/site''}ad_125x125.png" class="ad_space" /><br />\n    </div>\n</div>\n<div style="clear: both"></div>\n{exp:weblog:entries weblog="eb_cc4kids" limit="1"} \n<div id="cc4kids_items">\n    <p>First get everything ready to go! You will need the everything you see in the pictures below:</p>\n    <div id="cc4kids_ingredients">\n        <p>Ingredients for one serving</p>\n        {cc4k_ingredients}\n        <div class="cc4kids_ingredient"><img src="{ingredient_img}" /><br />\n        	<span>{ingredient_details}</span>\n        </div>\n        {/cc4k_ingredients}\n</div>\n    <div id="cc4kids_tools">\n        <p>Cooking Tools that you wil need for this recipe</p>\n        {cc4k_tools}\n        <div class="cc4kids_tool"><img src="{tool_img}" /><br />\n        	<span>{tool_name}</span>\n        </div>\n        {/cc4k_tools}        \n    </div>\n</div>\n{/exp:weblog:entries} \n<div id="cc4kids_bottom">\n	<div id="cc4kids_safetytips">\n    	<p class="bold">Before You Start...<br />read these really important safety tips!</p>\n        <p>	1. Never cook without asking your Mom or Dad first!<br />\n        	<br />\n			2. Never turn on the stove or oven without adult supervision. <br />\n            <br />\n			3. Never use knives, blenders, mixers or any other dangerous kitchen tools by yourself.  You must have help from your Mom or Dad <br />\n            <br />\n			4. Meats and other foods can have harmful germs. An adult should always help you when cooking.<br /></p>\n         <p class="bold">Smart Kids r Safe Kids </p>\n    </div>\n    <div id="cc4kids_directions">\n		{exp:weblog:entries weblog="eb_cc4kids" limit="1"} \n    		<p class="header">Directions</p>\n            <p class="note">Make certain that an adult is helping you with this recipe.</p>\n            <div class="body">{cc4k_recipe_directions}</div>\n            <br />\n            <div>\n            	<img src="{path=''images/site''}cc4kids_printrecipe.png" align="right" />\n                <img src="{path=''images/site''}cc4kids_morerecipes.png" align="right" /><br />\n            </div>\n		{/exp:weblog:entries} \n    </div>\n    <div id="cck4ids_bottom_ad">\n	    <img src="{path=''images/site''}ad_170x600.png" /><br />\n        <br />\n    </div>\n	<div style="clear: both"></div>\n	<div id="cc4kids_bottom_bar"></div>\n</div>\n\n\n{embed="includes/footer"}', '', 1276027001, 1, 'n', 0, '', 'n', 'n', 'o', 100),
(27, 1, 8, 'printable', 'y', 'webpage', '{embed="includes/header"}\n\n\n<div style="clear: both"></div>\n\n{embed="includes/footer"}', '', 1276031533, 1, 'n', 0, '', 'n', 'n', 'o', 195),
(28, 1, 7, 'footer-print', 'y', 'webpage', '<div style="clear: both"></div>\n</div>\n</body>\n</html>\n', '', 1276031869, 1, 'n', 0, '', 'n', 'n', 'o', 0),
(29, 1, 3, 'cc4kids', 'y', 'css', '\n/* ============================== CC4Kids Page ============================== */ \n\n#cc4kids_top{\n	background: url(''images/site/cc4kids_bkgd.png'')top left no-repeat;\n    margin: 20px 0 0 0;\n    width: 760px;\n    height: 81px;\n}\n\n#cc4kids_middle{ width: 760px; }\n\n#cc4kids_main{ float: left; }\n\n#cc4kids_middle_ads{ float: left;  padding: 10px 20px; }\n\n#cc4kids_cal{ float: left; margin: 10px 5px; }\n\n#cc4kids_rotw{ \n	float: left; \n    margin: 10px 0px;\n    padding: 0 20px; \n    width: 320px; \n    border-right: 6px solid #b44b9c;\n}\n#cc4kids_rotw p{ \n    float: left;\n    padding: 5px 0;\n    margin: 0;\n	text-align:left; \n    font: italic 13px arial;\n    font-weight: bold; \n    color: #b44b9c;\n    width: 300px;\n}\n\n#cc4kids_items p{ font: bold 15px arial;  color: #b44b9c; }\n\n#cc4kids_ingredients{\n	width: 760px;\n    height: 200px;\n    background-color: #b44b9c;\n    color: #FFF;\n    font: normal 11px arial;   \n    text-align: center;\n}\n#cc4kids_ingredients p{ \n	text-align: left; \n    padding: 8px 10px;\n    margin: 0; \n    font: bold 12px arial; \n	color: #FFF;\n}\n\n#cc4kids_tools{\n	width: 760px;\n    height: 220px;\n    color: #FFF;\n    background-color: #FFF;\n    font: normal 11px arial;   \n    overflow: hidden; \n}\n#cc4kids_tools p{\n	text-align: left; \n    padding: 6px 10px;\n    margin: 10px 0;  \n    font: bold 12px arial; \n    background-color: #5580ce;\n    color: #FFF;\n}\n\n#cc4kids_safetytips{\n    background: url(''images/site/cc4kids_safetytips.png'')top left no-repeat;	\n    width: 150px;\n    height: 410px;\n    float: left;\n    padding: 5px 0;   \n}\n#cc4kids_safetytips p{\n    text-align: left; \n    font: bold 11px arial;\n    line-height: 14px;\n    padding: 2px 10px; \n    margin: 4px 0; \n    width: 130px; \n}\n#cc4kids_safetytips p.bold{	color: #cf31bb;  font: bold 12px arial; }\n\n\n#cc4kids_safetytips2{\n    background: url(''images/site/cc4kids_safetytips2.png'')top left no-repeat;	\n    width: 195px;\n    height: 325px;\n    margin-top: 340px;\n    padding: 5px 0;   \n}\n#cc4kids_safetytips2 p{\n    text-align: left; \n    font: bold 11px arial;\n    line-height: 14px;\n    padding: 2px 10px; \n    margin: 2px 0; \n    width: 180px; \n    color: #5580ce;\n}\n#cc4kids_safetytips2 p.top{	color: #5580ce;  font: bold 12px arial; text-align: center; }\n#cc4kids_safetytips2 p.btm{	color: #cf31bb;  font: bold 12px arial; text-align: center; }\n\n#cc4kids_directions{ \n	float: left; \n    width: 360px; \n    min-height: 600px;\n    padding: 0 20px;\n    border-right: 6px solid #b44b9c;\n}\n#cc4kids_directions p{\n    font: bold 12px arial; \n    padding: 2px 6px;\n    margin: 0; \n    text-align: left; \n}\n#cc4kids_directions p.header{ background-color: #fade53;  color: #000; }\n#cc4kids_directions p.note{ margin: 8px 0; }\n#cc4kids_directions div.body p{ font: normal 12px arial; padding: 10px 0 0 0; line-height: 16px; }\n}\n\n#cc4kids_bottom_ad{ float: left; text-align: center; padding: 0 30px; }\n\n#cc4kids_bottom_bar{ width: 760px; height: 5px; background-color: #fade53; }\n\n#cckids_more_left{\n	width: 210px;\n    float: left; \n    display: inline;\n}\n\n.cc4kids_ingredient{\n	background-color: #cbdb2a;\n    color: #000;\n    height: 150px;\n    width: 116px;\n    padding: 4px;\n    margin: 0 14px;\n    font: normal 11px arial;\n    float: left;\n}\n.cc4kids_ingredient img{\n	background-color: #FFF;\n    width: 112px;\n    height: 112px;\n    margin-bottom: 6px;\n}\n.cc4kids_ingredient span{\n	font: bold 11px arial;\n}\n\n.cc4kids_tool{\n	background-color: #5580ce;\n    color: #000;\n    height: 150px;\n    width: 116px;\n    padding: 4px;\n    margin: 0 14px;\n    font: normal 11px arial;\n    float: left;\n}\n.cc4kids_tool img{\n	background-color: #FFF;\n    width: 112px;\n    height: 112px;\n    margin-bottom: 6px;\n}\n.cc4kids_tool span{\n	font: bold 11px arial;\n    color: #FFF;\n}\n.cc4kds_week_of{\n    color: #cf31bb;\n    background-color: #f7c6f3;\n    font: bold 12px arial; \n    text-align: left; \n    padding: 4px 10px; \n    margin-bottom: 10px;\n}\n\n/* ============================== CC4Kids Printable Page ============================== */ \n\n#cc4kids_print_top{}\n\n#cc4kids_print_middle{}\n\n#cc4kids_print_bottom{}\n', '', 1276032017, 1, 'n', 0, '', 'n', 'n', 'o', 0),
(30, 1, 9, 'index', 'y', 'webpage', '{embed="includes/header"}\n<div id="share_top">\n        {embed="includes/email-signup" message="sign up for  newletters & savings by entering your email address" margin="45"}\n        <img src="{path=''images/site''}eb_lady.png" class="other_lady" />\n</div>\n<div id="share_bars">\n	<div id="share_top_bar" class="top_bar_aqua"></div>\n    <div id="share_txt_bar" class="txt_bar_green">Share a Recipe</div>\n</div>\n<div id="form_col">\n    <div id="share_info1">\n        <p>Do you have a favorite recipe that will make a great Easy Breezy Dinner? We are excited to know what it is.</p>\n        <table class="form_table">\n          <tr>\n            <td><label>Name</label></td>\n            <td><input type="text" class="long_text green_brdr" /></td>\n          </tr>\n          <tr>\n            <td><label>Email Address</label></td>\n            <td><input type="text" class="long_text green_brdr" /></td>\n          </tr>\n        </table>\n    </div>\n    <div style="clear: both"></div>\n    <div id="share_info2">\n        <h1 class="info_header top_bar_aqua">Recipe Ingredients</h1>\n        <br />\n        <table class="form_table">\n          <tr>\n            <td><label class="lbl_header">Quantity</label></td>\n            <td><label class="lbl_header">Unit</label></td>\n            <td><label class="lbl_header">Ingredient</label></td>\n            <td><label class="lbl_header">Preperation</label></td>\n          </tr>\n          <tr>\n            <td><input type="text" class="txt_qnt green_brdr" /></td>\n            <td><input type="text" class="txt_unt green_brdr" /></td>\n            <td><input type="text" class="txt_ing green_brdr" /></td>\n            <td><input type="text" class="txt_pre green_brdr" /></td>\n          </tr>\n          <tr>\n            <td><input type="text" class="txt_qnt green_brdr" /></td>\n            <td><input type="text" class="txt_unt green_brdr" /></td>\n            <td><input type="text" class="txt_ing green_brdr" /></td>\n            <td><input type="text" class="txt_pre green_brdr" /></td>        \n          </tr>\n          <tr>\n            <td><input type="text" class="txt_qnt green_brdr" /></td>\n            <td><input type="text" class="txt_unt green_brdr" /></td>\n            <td><input type="text" class="txt_ing green_brdr" /></td>\n            <td><input type="text" class="txt_pre green_brdr" /></td>        \n          </tr>\n          <tr>\n            <td><input type="text" class="txt_qnt green_brdr" /></td>\n            <td><input type="text" class="txt_unt green_brdr" /></td>\n            <td><input type="text" class="txt_ing green_brdr" /></td>\n            <td><input type="text" class="txt_pre green_brdr" /></td>        \n          </tr>\n          <tr>\n            <td><input type="text" class="txt_qnt green_brdr" /></td>\n            <td><input type="text" class="txt_unt green_brdr" /></td>\n            <td><input type="text" class="txt_ing green_brdr" /></td>\n            <td><input type="text" class="txt_pre green_brdr" /></td>        \n          </tr>                        \n        </table>\n        <br />\n    </div>\n    <div style="clear: both"></div>\n    <div id="share_info2">\n        <h1 class="info_header top_bar_aqua">Recipe Instructions</h1>\n        <br />\n        <table class="form_table">\n          <tr>\n            <td colspan="2"><label class="lbl_header">Directions for the evening before cooking</label></td>\n          </tr>    \n          <tr>\n            <td colspan="2"><textarea class="txt_ins green_brdr"></textarea></td>\n          </tr>\n          <tr><td>&nbsp;</td></tr>\n          <tr>\n            <td colspan="2"><label class="lbl_header">Directions for the day of cooking</label></td>\n          </tr>    \n          <tr>\n            <td colspan="2"><textarea class="txt_ins green_brdr"></textarea></td>\n          </tr>\n          <tr><td>&nbsp;</td></tr>\n          <tr><td>&nbsp;</td></tr>            \n          <tr>\n            <td><label>How many does this recipe serve?</label></td>\n            <td><select type="select" class="green_brdr" />\n                    <option value="1">serves 1</option>\n                    <option value="2">serves 2</option>\n                    <option value="3">serves 3</option>\n                    <option value="4">serves 4</option>\n                    <option value="5">serves 5</option>\n                    <option value="6">serves 6</option>\n                    <option value="7">serves 7</option>\n                    <option value="8">serves 8</option>\n                    <option value="9">serves 9</option>\n                    <option value="10">serves 10</option>\n                    <option value="11">serves 11</option>\n                    <option value="11">serves 12</option>\n                </select></td>\n          </tr>\n          <tr>\n            <td><label>How long does this recipe take to prepare?</label></td>\n            <td><select type="select" class="green_brdr" />\n                    <option value="5">5 minutes</option>\n                    <option value="10">10 minutes</option>\n                    <option value="15">15 minutes</option>\n                    <option value="20">20 minutes</option>\n                    <option value="25">25 minutes</option>\n                    <option value="30">30 minutes</option>\n                    <option value="45">45 minutes</option>\n                    <option value="60">60 minutes</option>\n                </select></td>\n          </tr>\n          <tr>\n            <td><label>How long does this recipe take to cook?</label></td>\n            <td><select type="select" class="green_brdr" />\n                    <option value="5">5 minutes</option>\n                    <option value="10">10 minutes</option>\n                    <option value="15">15 minutes</option>\n                    <option value="20">20 minutes</option>\n                    <option value="25">25 minutes</option>\n                    <option value="30">30 minutes</option>\n                    <option value="45">45 minutes</option>\n                    <option value="60">60 minutes</option>\n                    <option value="75">1 hour 15 minutes</option>\n                    <option value="90">1 hour 30 minutes</option>\n                    <option value="105">1 hour 45 minutes</option>\n                    <option value="120">2 hours</option>                \n                    <option value="180">3 hours</option>                \n                    <option value="240">4 hours</option>                                                \n                    <option value="300">5 hours</option>                \n                </select></td>\n          </tr>  \n          </table>\n        <br />          \n    </div>\n</div>\n<div id="ads_col">\n	<img src="{path=''images/site''}ad_125x125.png" class="ad_space" /><br />\n    <br />\n	<img src="{path=''images/site''}ad_160x600.png" class="ad_space" /><br />\n    \n</div>\n{embed="includes/footer"}', '', 1277075012, 1, 'n', 0, '', 'n', 'n', 'o', 204),
(31, 1, 10, 'index', 'y', 'webpage', '', '', 1277074840, 1, 'n', 0, '', 'n', 'n', 'o', 46),
(35, 1, 10, 'share-a-tool', 'y', 'webpage', '{embed="includes/header"}\n<div id="share_top">\n        {embed="includes/email-signup" message="sign up for  newletters & savings by entering your email address" margin="45"}\n        <img src="{path=''images/site''}eb_lady.png" class="other_lady" />\n</div>\n<div id="share_bars">\n	<div id="share_top_bar" class="top_bar_aqua"></div>\n    <div id="share_txt_bar" class="txt_bar_green">Share a Recipe</div>\n</div>\n<div id="form_col">\n    <div id="share_info1">\n        <p>Do you have a favorite recipe that will make a great Easy Breezy Dinner? We are excited to know what it is.</p>\n        <table class="form_table">\n          <tr>\n            <td><label>Name</label></td>\n            <td><input type="text" class="long_text green_brdr" /></td>\n          </tr>\n          <tr>\n            <td><label>Email Address</label></td>\n            <td><input type="text" class="long_text green_brdr" /></td>\n          </tr>\n        </table>\n    </div>\n    <div style="clear: both"></div>\n    <div id="share_info2">\n        <h1 class="info_header top_bar_aqua">Recipe Ingredients</h1>\n        <br />\n        <table class="form_table">\n          <tr>\n            <td><label class="lbl_header">Quantity</label></td>\n            <td><label class="lbl_header">Unit</label></td>\n            <td><label class="lbl_header">Ingredient</label></td>\n            <td><label class="lbl_header">Preperation</label></td>\n          </tr>\n          <tr>\n            <td><input type="text" class="txt_qnt green_brdr" /></td>\n            <td><input type="text" class="txt_unt green_brdr" /></td>\n            <td><input type="text" class="txt_ing green_brdr" /></td>\n            <td><input type="text" class="txt_pre green_brdr" /></td>\n          </tr>\n          <tr>\n            <td><input type="text" class="txt_qnt green_brdr" /></td>\n            <td><input type="text" class="txt_unt green_brdr" /></td>\n            <td><input type="text" class="txt_ing green_brdr" /></td>\n            <td><input type="text" class="txt_pre green_brdr" /></td>        \n          </tr>\n          <tr>\n            <td><input type="text" class="txt_qnt green_brdr" /></td>\n            <td><input type="text" class="txt_unt green_brdr" /></td>\n            <td><input type="text" class="txt_ing green_brdr" /></td>\n            <td><input type="text" class="txt_pre green_brdr" /></td>        \n          </tr>\n          <tr>\n            <td><input type="text" class="txt_qnt green_brdr" /></td>\n            <td><input type="text" class="txt_unt green_brdr" /></td>\n            <td><input type="text" class="txt_ing green_brdr" /></td>\n            <td><input type="text" class="txt_pre green_brdr" /></td>        \n          </tr>\n          <tr>\n            <td><input type="text" class="txt_qnt green_brdr" /></td>\n            <td><input type="text" class="txt_unt green_brdr" /></td>\n            <td><input type="text" class="txt_ing green_brdr" /></td>\n            <td><input type="text" class="txt_pre green_brdr" /></td>        \n          </tr>                        \n        </table>\n        <br />\n    </div>\n    <div style="clear: both"></div>\n    <div id="share_info2">\n        <h1 class="info_header top_bar_aqua">Recipe Instructions</h1>\n        <br />\n        <table class="form_table">\n          <tr>\n            <td colspan="2"><label class="lbl_header">Directions for the evening before cooking</label></td>\n          </tr>    \n          <tr>\n            <td colspan="2"><textarea class="txt_ins green_brdr"></textarea></td>\n          </tr>\n          <tr><td>&nbsp;</td></tr>\n          <tr>\n            <td colspan="2"><label class="lbl_header">Directions for the day of cooking</label></td>\n          </tr>    \n          <tr>\n            <td colspan="2"><textarea class="txt_ins green_brdr"></textarea></td>\n          </tr>\n          <tr><td>&nbsp;</td></tr>\n          <tr><td>&nbsp;</td></tr>            \n          <tr>\n            <td><label>How many does this recipe serve?</label></td>\n            <td><select type="select" class="green_brdr" />\n                    <option value="1">serves 1</option>\n                    <option value="2">serves 2</option>\n                    <option value="3">serves 3</option>\n                    <option value="4">serves 4</option>\n                    <option value="5">serves 5</option>\n                    <option value="6">serves 6</option>\n                    <option value="7">serves 7</option>\n                    <option value="8">serves 8</option>\n                    <option value="9">serves 9</option>\n                    <option value="10">serves 10</option>\n                    <option value="11">serves 11</option>\n                    <option value="11">serves 12</option>\n                </select></td>\n          </tr>\n          <tr>\n            <td><label>How long does this recipe take to prepare?</label></td>\n            <td><select type="select" class="green_brdr" />\n                    <option value="5">5 minutes</option>\n                    <option value="10">10 minutes</option>\n                    <option value="15">15 minutes</option>\n                    <option value="20">20 minutes</option>\n                    <option value="25">25 minutes</option>\n                    <option value="30">30 minutes</option>\n                    <option value="45">45 minutes</option>\n                    <option value="60">60 minutes</option>\n                </select></td>\n          </tr>\n          <tr>\n            <td><label>How long does this recipe take to cook?</label></td>\n            <td><select type="select" class="green_brdr" />\n                    <option value="5">5 minutes</option>\n                    <option value="10">10 minutes</option>\n                    <option value="15">15 minutes</option>\n                    <option value="20">20 minutes</option>\n                    <option value="25">25 minutes</option>\n                    <option value="30">30 minutes</option>\n                    <option value="45">45 minutes</option>\n                    <option value="60">60 minutes</option>\n                    <option value="75">1 hour 15 minutes</option>\n                    <option value="90">1 hour 30 minutes</option>\n                    <option value="105">1 hour 45 minutes</option>\n                    <option value="120">2 hours</option>                \n                    <option value="180">3 hours</option>                \n                    <option value="240">4 hours</option>                                                \n                    <option value="300">5 hours</option>                \n                </select></td>\n          </tr>  \n          </table>\n        <br />          \n    </div>\n</div>\n<div id="ads_col">\n	<img src="{path=''images/site''}ad_125x125.png" class="ad_space" /><br />\n    <br />\n	<img src="{path=''images/site''}ad_160x600.png" class="ad_space" /><br />\n    \n</div>\n{embed="includes/footer"}', '', 1277075115, 1, 'n', 0, '', 'n', 'n', 'o', 3),
(33, 1, 9, 'share-a-recipe', 'y', 'webpage', '(if logged_in}\n    {embed="includes/header"}\n    <div id="other_top">\n            {embed="includes/email-signup" message="sign up for  newletters & savings by entering your email address" margin="45"}\n            <img src="{path=''images/site''}eb_lady.png" class="other_lady" />\n    </div>\n    <div id="share_bars">\n        <div id="share_top_bar" class="top_bar_aqua"></div>\n        <div id="share_txt_bar" class="txt_bar_green">Share a Recipe</div>\n    </div>\n    <div id="form_col">\n        <div id="share_info1">\n            <p>Do you have a favorite recipe that will make a great Easy Breezy Dinner? We are excited to know what it is.</p>\n            <table class="form_table">\n              <tr>\n                <td><label>Name</label></td>\n                <td><input type="text" class="long_text green_brdr" /></td>\n              </tr>\n              <tr>\n                <td><label>Email Address</label></td>\n                <td><input type="text" class="long_text green_brdr" /></td>\n              </tr>\n            </table>\n        </div>\n        <div style="clear: both"></div>\n        <div id="share_info2">\n            <h1 class="info_header top_bar_aqua">Recipe Ingredients</h1>\n            <br />\n            <table class="form_table">\n              <tr>\n                <td><label class="lbl_header">Quantity</label></td>\n                <td><label class="lbl_header">Unit</label></td>\n                <td><label class="lbl_header">Ingredient</label></td>\n                <td><label class="lbl_header">Preperation</label></td>\n              </tr>\n              <tr>\n                <td><input type="text" class="txt_qnt green_brdr" /></td>\n                <td><input type="text" class="txt_unt green_brdr" /></td>\n                <td><input type="text" class="txt_ing green_brdr" /></td>\n                <td><input type="text" class="txt_pre green_brdr" /></td>\n              </tr>\n              <tr>\n                <td><input type="text" class="txt_qnt green_brdr" /></td>\n                <td><input type="text" class="txt_unt green_brdr" /></td>\n                <td><input type="text" class="txt_ing green_brdr" /></td>\n                <td><input type="text" class="txt_pre green_brdr" /></td>        \n              </tr>\n              <tr>\n                <td><input type="text" class="txt_qnt green_brdr" /></td>\n                <td><input type="text" class="txt_unt green_brdr" /></td>\n                <td><input type="text" class="txt_ing green_brdr" /></td>\n                <td><input type="text" class="txt_pre green_brdr" /></td>        \n              </tr>\n              <tr>\n                <td><input type="text" class="txt_qnt green_brdr" /></td>\n                <td><input type="text" class="txt_unt green_brdr" /></td>\n                <td><input type="text" class="txt_ing green_brdr" /></td>\n                <td><input type="text" class="txt_pre green_brdr" /></td>        \n              </tr>\n              <tr>\n                <td><input type="text" class="txt_qnt green_brdr" /></td>\n                <td><input type="text" class="txt_unt green_brdr" /></td>\n                <td><input type="text" class="txt_ing green_brdr" /></td>\n                <td><input type="text" class="txt_pre green_brdr" /></td>        \n              </tr>                        \n            </table>\n            <br />\n        </div>\n        <div style="clear: both"></div>\n        <div id="share_info2">\n            <h1 class="info_header top_bar_aqua">Recipe Instructions</h1>\n            <br />\n            <table class="form_table">\n              <tr>\n                <td colspan="2"><label class="lbl_header">Directions for the evening before cooking</label></td>\n              </tr>    \n              <tr>\n                <td colspan="2"><textarea class="txt_ins green_brdr"></textarea></td>\n              </tr>\n              <tr><td>&nbsp;</td></tr>\n              <tr>\n                <td colspan="2"><label class="lbl_header">Directions for the day of cooking</label></td>\n              </tr>    \n              <tr>\n                <td colspan="2"><textarea class="txt_ins green_brdr"></textarea></td>\n              </tr>\n              <tr><td>&nbsp;</td></tr>\n              <tr><td>&nbsp;</td></tr>            \n              <tr>\n                <td><label>How many does this recipe serve?</label></td>\n                <td><select type="select" class="green_brdr" />\n                        <option value="1">serves 1</option>\n                        <option value="2">serves 2</option>\n                        <option value="3">serves 3</option>\n                        <option value="4">serves 4</option>\n                        <option value="5">serves 5</option>\n                        <option value="6">serves 6</option>\n                        <option value="7">serves 7</option>\n                        <option value="8">serves 8</option>\n                        <option value="9">serves 9</option>\n                        <option value="10">serves 10</option>\n                        <option value="11">serves 11</option>\n                        <option value="11">serves 12</option>\n                    </select></td>\n              </tr>\n              <tr>\n                <td><label>How long does this recipe take to prepare?</label></td>\n                <td><select type="select" class="green_brdr" />\n                        <option value="5">5 minutes</option>\n                        <option value="10">10 minutes</option>\n                        <option value="15">15 minutes</option>\n                        <option value="20">20 minutes</option>\n                        <option value="25">25 minutes</option>\n                        <option value="30">30 minutes</option>\n                        <option value="45">45 minutes</option>\n                        <option value="60">60 minutes</option>\n                    </select></td>\n              </tr>\n              <tr>\n                <td><label>How long does this recipe take to cook?</label></td>\n                <td><select type="select" class="green_brdr" />\n                        <option value="5">5 minutes</option>\n                        <option value="10">10 minutes</option>\n                        <option value="15">15 minutes</option>\n                        <option value="20">20 minutes</option>\n                        <option value="25">25 minutes</option>\n                        <option value="30">30 minutes</option>\n                        <option value="45">45 minutes</option>\n                        <option value="60">60 minutes</option>\n                        <option value="75">1 hour 15 minutes</option>\n                        <option value="90">1 hour 30 minutes</option>\n                        <option value="105">1 hour 45 minutes</option>\n                        <option value="120">2 hours</option>                \n                        <option value="180">3 hours</option>                \n                        <option value="240">4 hours</option>                                                \n                        <option value="300">5 hours</option>                \n                    </select></td>\n              </tr>  \n              </table>\n            <br />          \n        </div>\n    </div>\n    <div id="ads_col">\n        <img src="{path=''images/site''}ad_125x125.png" class="ad_space" /><br />\n        <br />\n        <img src="{path=''images/site''}ad_160x600.png" class="ad_space" /><br />\n        \n    </div>\n    {embed="includes/footer"}\n{/if}\n{if logged_out}\n	<meta http-equiv="refresh" content="0;url={path=''members/login''}">\n{/if}', '', 1277158040, 1, 'n', 0, '', 'n', 'n', 'o', 7),
(36, 1, 10, 'submit-a-tool-for-kids', 'y', 'webpage', '{embed="includes/header"}\n<div id="share_top">\n        {embed="includes/email-signup" message="sign up for  newletters & savings by entering your email address" margin="45"}\n        <img src="{path=''images/site''}eb_lady.png" class="other_lady" />\n</div>\n<div id="share_bars">\n	<div id="share_top_bar" class="top_bar_pink"></div>\n    <div id="share_txt_bar" class="txt_bar_yellow">Share a Great Cooking Tool</div>\n</div>\n<div id="form_col">\n    <div id="share_info1">\n        <p>Do you know of a cooking tool that makes your life easy breezier? Weâ€™d would love to hear about it!</p>\n        <table class="form_table">\n          <tr>\n            <td><label>Name</label></td>\n            <td><input type="text" class="long_text pink_brdr" /></td>\n          </tr>\n          <tr>\n            <td><label>Email Address</label></td>\n            <td><input type="text" class="long_text pink_brdr" /></td>\n          </tr>\n        </table>\n    </div>\n    <div style="clear: both"></div>\n    <div id="share_info2">\n        <h1 class="info_header top_bar_pink">Please tell us anything you can to help ups identify your Great Cooking Tool suggestion.</h1>\n        <br />\n        <table class="form_table">\n          <tr>\n            <td><label>Name of the Cooking Tool</label></td>\n            <td><input type="text" class="med_text pink_brdr" /></td>\n          </tr>\n          <tr>\n            <td><label>Where can you buy this tool?</label></td>\n            <td><input type="text" class="med_text pink_brdr" /></td>\n          </tr>\n          <tr>\n            <td><label>How much does it cost?</label></td>\n            <td><input type="text" class="med_text pink_brdr" /></td>\n          </tr>                          \n          <tr><td>&nbsp;</td></tr>        \n          <tr>\n            <td colspan="2"><label class="lbl_header">How do you use the tool?</label></td>\n          </tr>    \n          <tr>\n            <td colspan="2"><textarea class="txt_ins pink_brdr"></textarea></td>\n          </tr>\n          <tr><td>&nbsp;</td></tr>\n          <tr>\n            <td colspan="2"><label class="lbl_header">Please let us know any other information about the cooking tool</label></td>\n          </tr>    \n          <tr>\n            <td colspan="2"><textarea class="txt_ins pink_brdr"></textarea></td>\n          </tr>         \n        </table>\n        <br />\n    </div>\n    <div style="clear: both"></div>\n</div>\n<div id="ads_col">\n	<img src="{path=''images/site''}ad_125x125.png" class="ad_space" /><br />\n    <br />\n	<img src="{path=''images/site''}ad_125x125.png" class="ad_space" /><br />\n    <br />\n	<img src="{path=''images/site''}ad_125x125.png" class="ad_space" /><br />\n    <br />   \n</div>\n{embed="includes/footer"}', '', 1277075450, 1, 'n', 0, '', 'n', 'n', 'o', 7),
(37, 1, 11, 'index', 'y', 'webpage', '{embed="includes/header"}\n<div id="other_top">\n        {embed="includes/email-signup" message="sign up for  newletters & savings by entering your email address" margin="45"}\n        <img src="{path=''images/site''}eb_lady.png" class="other_lady" />\n</div>\n{embed="includes/footer"}', '', 1277149579, 1, 'n', 0, '', 'n', 'y', 'i', 161),
(38, 1, 11, 'sign-up', 'y', 'webpage', '<?php if ($_POST[''email_address'']){$new_email = $_POST[''email_address''];} ?>\n{embed="includes/header"}\n<div id="other_top">\n        {embed="includes/email-signup" message="sign up for  newletters & savings by entering your email address" margin="45"}\n        <img src="{path=''images/site''}eb_lady.png" class="other_lady" />\n</div>\n<div id="member_bars">\n	<div id="member_top_bar" class="top_bar_darkred"></div>\n    <div id="member_txt_bar" class="txt_bar_pink">Sign-Up for Email and Saving Preference</div>\n</div>\n<div id="register_form">\n	<form>\n        <table>\n			<tr>\n            	<td colspan="3"><p>Please verify your email address then click the "go" button to subscribe.</p></td>\n            </tr>\n        	<tr>\n           	  <td width="276"><label>Email Address</label></td>\n            	<td width="175"><input type="text" id="register_email" name=""  class="register_text" value="<?php echo $new_email; ?>" /></td>\n              <td width="451"><input type="submit" /></td>\n          </tr>\n			<tr><td>&nbsp;</td></tr>\n			<tr>\n            	<td colspan="3"><p>If you would like to create an accont with us to save your menus and preferences for later, please enter a password and click the "go" button to register.</p></td>\n            </tr>              \n        	<tr>\n            	<td><label>Password</label></td>\n            	<td><input type="password" id="register_password" class="register_text" name="" /></td>\n                <td><input type="submit" /></td>\n            </tr>\n        </table>\n    </form>\n</div>\n{embed="includes/footer"}', '', 1277148501, 1, 'n', 0, '', 'n', 'y', 'i', 6),
(39, 1, 11, 'my-profile', 'y', 'webpage', '', '', 1277153609, 1, 'n', 0, '', 'n', 'n', 'o', 57),
(40, 1, 3, 'members', 'y', 'css', '', '', 1277154174, 1, 'n', 0, '', 'n', 'n', 'o', 0),
(41, 1, 11, 'login', 'y', 'webpage', '{embed="includes/header"}\n<div id="other_top">\n    {embed="includes/email-signup" message="sign up for  newletters & savings by entering your email address" margin="45"}\n    <img src="{path=''images/site''}eb_lady.png" class="other_lady" />\n    <a href="{path=''members''}"><img src="{path=''images/site''}eb_login.png" class="other_login" /></a>\n</div>\n<div id="member_bars">\n	<div id="member_top_bar" class="top_bar_darkred"></div>\n    <div id="member_txt_bar" class="txt_bar_pink">Login</div>\n</div>\n<div id="login_wrapper">\n	<p>Please login or register in order to submit recipes or cooking tools. All we need is your email address. Thank you!</p>\n	<div id="login_form">\n    	<div class="box_header">Registered Users</div>\n    	<div id="login_box">\n        	<table>\n            	<tr>\n                	<td><label>Email Address</label></td>\n                    <td><input type="text" class="login_text" /></td>\n                </tr>\n           		<tr>\n                	<td><label>Password</label></td>\n                    <td><input type="password" class="login_text" /></td>\n                </tr>                \n                <tr>\n                	<td colspan="2" align="right"><input type="submit" /></td>\n                </tr>\n        	</table>\n        </div>\n	</div>\n    <div id="signup_form">\n    	<div class="box_header">New to Easy Breezy?</div>  \n    	<div id="signup_box">\n        	<table>\n            	<tr>\n                	<td><label>Email Address</label></td>\n                    <td><input type="text" class="login_text" /></td>\n                </tr>\n           		<tr>\n                	<td><label>Password</label></td>\n                    <td><input type="password" class="login_text" /></td>\n                </tr>                \n                <tr>\n                	<td colspan="2" align="right"><input type="submit" /></td>\n                </tr>\n        	</table>        \n        </div>\n    </div>\n</div>\n{embed="includes/footer"}', '', 1277156672, 1, 'n', 0, '', 'n', 'n', 'o', 8),
(16, 1, 3, 'index', 'n', 'webpage', '', '', 1275427815, 0, 'n', 0, '', 'n', 'n', 'o', 0);

-- --------------------------------------------------------

--
-- Table structure for table `exp_template_groups`
--

CREATE TABLE IF NOT EXISTS `exp_template_groups` (
  `group_id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `group_name` varchar(50) NOT NULL,
  `group_order` int(3) unsigned NOT NULL,
  `is_site_default` char(1) NOT NULL DEFAULT 'n',
  `is_user_blog` char(1) NOT NULL DEFAULT 'n',
  PRIMARY KEY (`group_id`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=12 ;

--
-- Dumping data for table `exp_template_groups`
--

INSERT INTO `exp_template_groups` (`group_id`, `site_id`, `group_name`, `group_order`, `is_site_default`, `is_user_blog`) VALUES
(1, 1, 'site', 1, 'y', 'n'),
(3, 1, 'styles', 2, 'n', 'n'),
(6, 1, 'scripts', 3, 'n', 'n'),
(7, 1, 'includes', 4, 'n', 'n'),
(8, 1, 'cc4kids', 5, 'n', 'n'),
(9, 1, 'recipes', 6, 'n', 'n'),
(10, 1, 'tools', 7, 'n', 'n'),
(11, 1, 'members', 8, 'n', 'n');

-- --------------------------------------------------------

--
-- Table structure for table `exp_template_member_groups`
--

CREATE TABLE IF NOT EXISTS `exp_template_member_groups` (
  `group_id` smallint(4) unsigned NOT NULL,
  `template_group_id` mediumint(5) unsigned NOT NULL,
  KEY `group_id` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `exp_template_member_groups`
--


-- --------------------------------------------------------

--
-- Table structure for table `exp_template_no_access`
--

CREATE TABLE IF NOT EXISTS `exp_template_no_access` (
  `template_id` int(6) unsigned NOT NULL,
  `member_group` smallint(4) unsigned NOT NULL,
  KEY `template_id` (`template_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `exp_template_no_access`
--


-- --------------------------------------------------------

--
-- Table structure for table `exp_throttle`
--

CREATE TABLE IF NOT EXISTS `exp_throttle` (
  `ip_address` varchar(16) NOT NULL DEFAULT '0',
  `last_activity` int(10) unsigned NOT NULL DEFAULT '0',
  `hits` int(10) unsigned NOT NULL,
  `locked_out` char(1) NOT NULL DEFAULT 'n',
  KEY `ip_address` (`ip_address`),
  KEY `last_activity` (`last_activity`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `exp_throttle`
--


-- --------------------------------------------------------

--
-- Table structure for table `exp_trackbacks`
--

CREATE TABLE IF NOT EXISTS `exp_trackbacks` (
  `trackback_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `entry_id` int(10) unsigned NOT NULL DEFAULT '0',
  `weblog_id` int(4) unsigned NOT NULL,
  `title` varchar(100) NOT NULL,
  `content` text NOT NULL,
  `weblog_name` varchar(100) NOT NULL,
  `trackback_url` varchar(200) NOT NULL,
  `trackback_date` int(10) NOT NULL,
  `trackback_ip` varchar(16) NOT NULL,
  PRIMARY KEY (`trackback_id`),
  KEY `entry_id` (`entry_id`),
  KEY `weblog_id` (`weblog_id`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `exp_trackbacks`
--


-- --------------------------------------------------------

--
-- Table structure for table `exp_upload_no_access`
--

CREATE TABLE IF NOT EXISTS `exp_upload_no_access` (
  `upload_id` int(6) unsigned NOT NULL,
  `upload_loc` varchar(3) NOT NULL,
  `member_group` smallint(4) unsigned NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `exp_upload_no_access`
--

INSERT INTO `exp_upload_no_access` (`upload_id`, `upload_loc`, `member_group`) VALUES
(2, 'cp', 5);

-- --------------------------------------------------------

--
-- Table structure for table `exp_upload_prefs`
--

CREATE TABLE IF NOT EXISTS `exp_upload_prefs` (
  `id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `is_user_blog` char(1) NOT NULL DEFAULT 'n',
  `name` varchar(50) NOT NULL,
  `server_path` varchar(100) NOT NULL,
  `url` varchar(100) NOT NULL,
  `allowed_types` varchar(3) NOT NULL DEFAULT 'img',
  `max_size` varchar(16) NOT NULL,
  `max_height` varchar(6) NOT NULL,
  `max_width` varchar(6) NOT NULL,
  `properties` varchar(120) NOT NULL,
  `pre_format` varchar(120) NOT NULL,
  `post_format` varchar(120) NOT NULL,
  `file_properties` varchar(120) NOT NULL,
  `file_pre_format` varchar(120) NOT NULL,
  `file_post_format` varchar(120) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `exp_upload_prefs`
--

INSERT INTO `exp_upload_prefs` (`id`, `site_id`, `is_user_blog`, `name`, `server_path`, `url`, `allowed_types`, `max_size`, `max_height`, `max_width`, `properties`, `pre_format`, `post_format`, `file_properties`, `file_pre_format`, `file_post_format`) VALUES
(1, 1, 'n', 'Main Upload Directory', 'C:/xampp/htdocs/eb/images/uploads/', 'http://localhost/eb/images/uploads/', 'all', '', '', '', 'style="border: 0;" alt="image"', '', '', '', '', ''),
(2, 1, 'n', 'CC4Kids Images', 'C:/xampplite/htdocs/eb/images/site/cc4kids/', 'http://localhost/eb/images/site/cc4kids/', 'img', '', '', '', '', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `exp_weblogs`
--

CREATE TABLE IF NOT EXISTS `exp_weblogs` (
  `weblog_id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `is_user_blog` char(1) NOT NULL DEFAULT 'n',
  `blog_name` varchar(40) NOT NULL,
  `blog_title` varchar(100) NOT NULL,
  `blog_url` varchar(100) NOT NULL,
  `blog_description` varchar(225) NOT NULL,
  `blog_lang` varchar(12) NOT NULL,
  `blog_encoding` varchar(12) NOT NULL,
  `total_entries` mediumint(8) NOT NULL DEFAULT '0',
  `total_comments` mediumint(8) NOT NULL DEFAULT '0',
  `total_trackbacks` mediumint(8) NOT NULL DEFAULT '0',
  `last_entry_date` int(10) unsigned NOT NULL DEFAULT '0',
  `last_comment_date` int(10) unsigned NOT NULL DEFAULT '0',
  `last_trackback_date` int(10) unsigned NOT NULL DEFAULT '0',
  `cat_group` varchar(255) NOT NULL,
  `status_group` int(4) unsigned NOT NULL,
  `deft_status` varchar(50) NOT NULL DEFAULT 'open',
  `field_group` int(4) unsigned NOT NULL,
  `search_excerpt` int(4) unsigned NOT NULL,
  `enable_trackbacks` char(1) NOT NULL DEFAULT 'n',
  `trackback_use_url_title` char(1) NOT NULL DEFAULT 'n',
  `trackback_max_hits` int(2) unsigned NOT NULL DEFAULT '5',
  `trackback_field` int(4) unsigned NOT NULL,
  `deft_category` varchar(60) NOT NULL,
  `deft_comments` char(1) NOT NULL DEFAULT 'y',
  `deft_trackbacks` char(1) NOT NULL DEFAULT 'y',
  `weblog_require_membership` char(1) NOT NULL DEFAULT 'y',
  `weblog_max_chars` int(5) unsigned NOT NULL,
  `weblog_html_formatting` char(4) NOT NULL DEFAULT 'all',
  `weblog_allow_img_urls` char(1) NOT NULL DEFAULT 'y',
  `weblog_auto_link_urls` char(1) NOT NULL DEFAULT 'y',
  `weblog_notify` char(1) NOT NULL DEFAULT 'n',
  `weblog_notify_emails` varchar(255) NOT NULL,
  `comment_url` varchar(80) NOT NULL,
  `comment_system_enabled` char(1) NOT NULL DEFAULT 'y',
  `comment_require_membership` char(1) NOT NULL DEFAULT 'n',
  `comment_use_captcha` char(1) NOT NULL DEFAULT 'n',
  `comment_moderate` char(1) NOT NULL DEFAULT 'n',
  `comment_max_chars` int(5) unsigned NOT NULL,
  `comment_timelock` int(5) unsigned NOT NULL DEFAULT '0',
  `comment_require_email` char(1) NOT NULL DEFAULT 'y',
  `comment_text_formatting` char(5) NOT NULL DEFAULT 'xhtml',
  `comment_html_formatting` char(4) NOT NULL DEFAULT 'safe',
  `comment_allow_img_urls` char(1) NOT NULL DEFAULT 'n',
  `comment_auto_link_urls` char(1) NOT NULL DEFAULT 'y',
  `comment_notify` char(1) NOT NULL DEFAULT 'n',
  `comment_notify_authors` char(1) NOT NULL DEFAULT 'n',
  `comment_notify_emails` varchar(255) NOT NULL,
  `comment_expiration` int(4) unsigned NOT NULL DEFAULT '0',
  `search_results_url` varchar(80) NOT NULL,
  `tb_return_url` varchar(80) NOT NULL,
  `ping_return_url` varchar(80) NOT NULL,
  `show_url_title` char(1) NOT NULL DEFAULT 'y',
  `trackback_system_enabled` char(1) NOT NULL DEFAULT 'n',
  `show_trackback_field` char(1) NOT NULL DEFAULT 'y',
  `trackback_use_captcha` char(1) NOT NULL DEFAULT 'n',
  `show_ping_cluster` char(1) NOT NULL DEFAULT 'y',
  `show_options_cluster` char(1) NOT NULL DEFAULT 'y',
  `show_button_cluster` char(1) NOT NULL DEFAULT 'y',
  `show_forum_cluster` char(1) NOT NULL DEFAULT 'y',
  `show_pages_cluster` char(1) NOT NULL DEFAULT 'y',
  `show_show_all_cluster` char(1) NOT NULL DEFAULT 'y',
  `show_author_menu` char(1) NOT NULL DEFAULT 'y',
  `show_status_menu` char(1) NOT NULL DEFAULT 'y',
  `show_categories_menu` char(1) NOT NULL DEFAULT 'y',
  `show_date_menu` char(1) NOT NULL DEFAULT 'y',
  `rss_url` varchar(80) NOT NULL,
  `enable_versioning` char(1) NOT NULL DEFAULT 'n',
  `enable_qucksave_versioning` char(1) NOT NULL DEFAULT 'n',
  `max_revisions` smallint(4) unsigned NOT NULL DEFAULT '10',
  `default_entry_title` varchar(100) NOT NULL,
  `url_title_prefix` varchar(80) NOT NULL,
  `live_look_template` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`weblog_id`),
  KEY `cat_group` (`cat_group`),
  KEY `status_group` (`status_group`),
  KEY `field_group` (`field_group`),
  KEY `is_user_blog` (`is_user_blog`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `exp_weblogs`
--

INSERT INTO `exp_weblogs` (`weblog_id`, `site_id`, `is_user_blog`, `blog_name`, `blog_title`, `blog_url`, `blog_description`, `blog_lang`, `blog_encoding`, `total_entries`, `total_comments`, `total_trackbacks`, `last_entry_date`, `last_comment_date`, `last_trackback_date`, `cat_group`, `status_group`, `deft_status`, `field_group`, `search_excerpt`, `enable_trackbacks`, `trackback_use_url_title`, `trackback_max_hits`, `trackback_field`, `deft_category`, `deft_comments`, `deft_trackbacks`, `weblog_require_membership`, `weblog_max_chars`, `weblog_html_formatting`, `weblog_allow_img_urls`, `weblog_auto_link_urls`, `weblog_notify`, `weblog_notify_emails`, `comment_url`, `comment_system_enabled`, `comment_require_membership`, `comment_use_captcha`, `comment_moderate`, `comment_max_chars`, `comment_timelock`, `comment_require_email`, `comment_text_formatting`, `comment_html_formatting`, `comment_allow_img_urls`, `comment_auto_link_urls`, `comment_notify`, `comment_notify_authors`, `comment_notify_emails`, `comment_expiration`, `search_results_url`, `tb_return_url`, `ping_return_url`, `show_url_title`, `trackback_system_enabled`, `show_trackback_field`, `trackback_use_captcha`, `show_ping_cluster`, `show_options_cluster`, `show_button_cluster`, `show_forum_cluster`, `show_pages_cluster`, `show_show_all_cluster`, `show_author_menu`, `show_status_menu`, `show_categories_menu`, `show_date_menu`, `rss_url`, `enable_versioning`, `enable_qucksave_versioning`, `max_revisions`, `default_entry_title`, `url_title_prefix`, `live_look_template`) VALUES
(4, 1, 'n', 'eb_tip', 'Super Easy Breezy Helpful Tip', 'http://localhost/eb/', '', 'en', 'utf-8', 2, 0, 0, 1277073225, 0, 0, '1', 1, 'open', 1, 0, 'n', 'n', 5, 0, '', 'y', 'y', 'y', 0, 'all', 'y', 'y', 'n', '', '', 'y', 'n', 'n', 'n', 0, 0, 'y', 'xhtml', 'safe', 'n', 'y', 'n', 'n', '', 0, '', '', '', 'y', 'n', 'y', 'n', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', '', 'n', 'n', 10, '', '', 0),
(2, 1, 'n', 'eb_cc4kids', 'Recipe - Cooking for Kids ', 'http://localhost/eb/', '', 'en', 'utf-8', 1, 0, 0, 1275515277, 0, 0, '', 0, 'open', 2, 2, 'n', 'n', 5, 4, '', 'y', 'y', 'y', 0, 'all', 'y', 'y', 'n', '', '', 'y', 'n', 'n', 'n', 0, 0, 'y', 'xhtml', 'safe', 'n', 'y', 'n', 'n', '', 0, '', '', '', 'y', 'n', 'y', 'n', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', '', 'n', 'n', 10, '', '', 0),
(3, 1, 'n', 'eb_recipe', 'Recipe', 'http://localhost/eb/', '', 'en', 'utf-8', 1, 0, 0, 1276811086, 0, 0, '', 0, 'open', 3, 0, 'n', 'n', 5, 12, '', 'y', 'y', 'y', 0, 'all', 'n', 'n', 'n', '', '', 'n', 'n', 'n', 'n', 0, 0, 'y', 'xhtml', 'safe', 'n', 'y', 'n', 'n', '', 0, '', '', '', 'y', 'n', 'y', 'n', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', '', 'n', 'n', 10, '', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `exp_weblog_data`
--

CREATE TABLE IF NOT EXISTS `exp_weblog_data` (
  `entry_id` int(10) unsigned NOT NULL,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `weblog_id` int(4) unsigned NOT NULL,
  `field_id_1` text NOT NULL,
  `field_ft_1` tinytext,
  `field_id_2` text NOT NULL,
  `field_ft_2` tinytext,
  `field_id_3` text NOT NULL,
  `field_ft_3` tinytext,
  `field_id_4` text NOT NULL,
  `field_ft_4` tinytext,
  `field_id_5` text NOT NULL,
  `field_ft_5` tinytext,
  `field_id_6` text NOT NULL,
  `field_ft_6` tinytext,
  `field_id_7` text NOT NULL,
  `field_ft_7` tinytext,
  `field_id_8` text NOT NULL,
  `field_ft_8` tinytext,
  `field_id_9` text NOT NULL,
  `field_ft_9` tinytext,
  `field_id_10` text NOT NULL,
  `field_ft_10` tinytext,
  `field_id_11` text NOT NULL,
  `field_ft_11` tinytext,
  `field_id_12` text NOT NULL,
  `field_ft_12` tinytext,
  `field_id_13` text NOT NULL,
  `field_ft_13` tinytext,
  `field_id_14` text NOT NULL,
  `field_ft_14` tinytext,
  `field_id_15` text NOT NULL,
  `field_ft_15` tinytext,
  `field_id_16` text NOT NULL,
  `field_ft_16` tinytext,
  `field_id_17` text NOT NULL,
  `field_ft_17` tinytext,
  `field_id_18` text NOT NULL,
  `field_ft_18` tinytext,
  `field_id_19` text NOT NULL,
  `field_ft_19` tinytext,
  `field_id_20` text NOT NULL,
  `field_ft_20` tinytext,
  `field_id_21` text NOT NULL,
  `field_ft_21` tinytext,
  `field_id_22` text NOT NULL,
  `field_ft_22` tinytext,
  `field_id_23` text NOT NULL,
  `field_ft_23` tinytext,
  `field_id_24` text NOT NULL,
  `field_ft_24` tinytext,
  KEY `entry_id` (`entry_id`),
  KEY `weblog_id` (`weblog_id`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `exp_weblog_data`
--

INSERT INTO `exp_weblog_data` (`entry_id`, `site_id`, `weblog_id`, `field_id_1`, `field_ft_1`, `field_id_2`, `field_ft_2`, `field_id_3`, `field_ft_3`, `field_id_4`, `field_ft_4`, `field_id_5`, `field_ft_5`, `field_id_6`, `field_ft_6`, `field_id_7`, `field_ft_7`, `field_id_8`, `field_ft_8`, `field_id_9`, `field_ft_9`, `field_id_10`, `field_ft_10`, `field_id_11`, `field_ft_11`, `field_id_12`, `field_ft_12`, `field_id_13`, `field_ft_13`, `field_id_14`, `field_ft_14`, `field_id_15`, `field_ft_15`, `field_id_16`, `field_ft_16`, `field_id_17`, `field_ft_17`, `field_id_18`, `field_ft_18`, `field_id_19`, `field_ft_19`, `field_id_20`, `field_ft_20`, `field_id_21`, `field_ft_21`, `field_id_22`, `field_ft_22`, `field_id_23`, `field_ft_23`, `field_id_24`, `field_ft_24`) VALUES
(2, 1, 2, 'Make this fresh blueberry topping with real fresh blueberries the next time you have a waffle. Itâ€™s terrifically yummy!', 'xhtml', '1. Count out 25 blueberries\n\n2. Put the blueberries in a strainer and rinse them.\n\n3. Next, put the blueberries into a microwave safe bowl and heat them for 30 seconds. (Ask an adult to remove them because they are hot!)\n\n4. Add the sugar, syrup and butter to the bowl of blueberries and mix with a fork.\n\n5. Microwave for 20 seconds.\n\n6. Squish the blueberries with the fork.\n\n7. Heat the waffle in the toaster\n\n8. Put the waffle on a plate and pour the blueberry mixture on it. \n\n9. Enjoy!\n\n', 'xhtml', '', 'xhtml', 'eb_cal.png', 'none', 'cc4kids_rotw.png', 'none', 'Make this fresh blueberry topping with real fresh blueberries the next time you have a waffle. Itâ€™s terrifically yummy!', 'none', '1. Count out 25 blueberries\n\n2. Put the blueberries in a strainer and rinse them.\n\n3. Next, put the blueberries into a microwave safe bowl and heat them for 30 seconds. (Ask an adult to remove them because they are hot!)\n\n4. Add the sugar, syrup and butter to the bowl of blueberries and mix with a fork.\n\n5. Microwave for 20 seconds.\n\n6. Squish the blueberries with the fork.\n\n7. Heat the waffle in the toaster\n\n8. Put the waffle on a plate and pour the blueberry mixture on it.\n\n9. Enjoy!', 'xhtml', 'a:5:{i:0;a:2:{i:1;s:14:"25 blueberries";i:2;s:18:"25_blueberries.png";}i:1;a:2:{i:1;s:12:"1 tbsp sugar";i:2;s:16:"1_tbsp_sugar.png";}i:2;a:2:{i:1;s:31:"2 tbsp pancake and waffle syrup";i:2;s:16:"2_tbsp_syrup.png";}i:3;a:2:{i:1;s:15:"1/4 tbsp butter";i:2;s:19:"1-4_tbsp_butter.png";}i:4;a:2:{i:1;s:16:"2 frozen waffles";i:2;s:13:"2_waffles.png";}}', 'none', 'a:5:{i:0;a:2:{i:1;s:19:"microwave safe bowl";i:2;s:18:"microwave_bowl.png";}i:1;a:2:{i:1;s:8:"strainer";i:2;s:12:"strainer.png";}i:2;a:2:{i:1;s:16:"measuring spoons";i:2;s:20:"measuring_spoons.png";}i:3;a:2:{i:1;s:4:"fork";i:2;s:8:"fork.png";}i:4;a:2:{i:1;s:5:"knife";i:2;s:9:"knife.png";}}', 'none', 'July 12-18', 'none', 'cc4k_print_title_1.png', 'none', '', 'none', '', 'none', '', 'xhtml', '', 'none', '', 'none', '', 'none', '', 'xhtml', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '0', NULL),
(3, 1, 3, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', 'none', '', 'none', '', 'xhtml', '', 'none', '', 'none', '', 'none', '', 'xhtml', '', 'none', '5', 'none', '', 'none', '', 'none', 'Appetizer', 'none', '1\r2', NULL),
(4, 1, 4, '', 'xhtml', 'the best way to get easy rice is...', 'xhtml', '', 'xhtml', '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '0', NULL),
(5, 1, 4, '', 'xhtml', 'test', 'xhtml', '', 'xhtml', '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `exp_weblog_fields`
--

CREATE TABLE IF NOT EXISTS `exp_weblog_fields` (
  `field_id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `group_id` int(4) unsigned NOT NULL,
  `field_name` varchar(32) NOT NULL,
  `field_label` varchar(50) NOT NULL,
  `field_instructions` text NOT NULL,
  `field_type` varchar(12) NOT NULL DEFAULT 'text',
  `field_list_items` text NOT NULL,
  `field_pre_populate` char(1) NOT NULL DEFAULT 'n',
  `field_pre_blog_id` int(6) unsigned NOT NULL,
  `field_pre_field_id` int(6) unsigned NOT NULL,
  `field_related_to` varchar(12) NOT NULL DEFAULT 'blog',
  `field_related_id` int(6) unsigned NOT NULL,
  `field_related_orderby` varchar(12) NOT NULL DEFAULT 'date',
  `field_related_sort` varchar(4) NOT NULL DEFAULT 'desc',
  `field_related_max` smallint(4) NOT NULL,
  `field_ta_rows` tinyint(2) DEFAULT '8',
  `field_maxl` smallint(3) NOT NULL,
  `field_required` char(1) NOT NULL DEFAULT 'n',
  `field_text_direction` char(3) NOT NULL DEFAULT 'ltr',
  `field_search` char(1) NOT NULL DEFAULT 'n',
  `field_is_hidden` char(1) NOT NULL DEFAULT 'n',
  `field_fmt` varchar(40) NOT NULL DEFAULT 'xhtml',
  `field_show_fmt` char(1) NOT NULL DEFAULT 'y',
  `field_order` int(3) unsigned NOT NULL,
  `ff_settings` text NOT NULL,
  `lg_field_conf` text NOT NULL,
  PRIMARY KEY (`field_id`),
  KEY `group_id` (`group_id`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=25 ;

--
-- Dumping data for table `exp_weblog_fields`
--

INSERT INTO `exp_weblog_fields` (`field_id`, `site_id`, `group_id`, `field_name`, `field_label`, `field_instructions`, `field_type`, `field_list_items`, `field_pre_populate`, `field_pre_blog_id`, `field_pre_field_id`, `field_related_to`, `field_related_id`, `field_related_orderby`, `field_related_sort`, `field_related_max`, `field_ta_rows`, `field_maxl`, `field_required`, `field_text_direction`, `field_search`, `field_is_hidden`, `field_fmt`, `field_show_fmt`, `field_order`, `ff_settings`, `lg_field_conf`) VALUES
(1, 1, 1, 'summary', 'Summary', '', 'textarea', '', 'n', 0, 0, 'blog', 0, 'date', 'desc', 0, 6, 0, 'n', 'ltr', 'n', 'y', 'xhtml', 'y', 1, '', ''),
(2, 1, 1, 'body', 'Body', '', 'textarea', '', 'n', 0, 0, 'blog', 0, 'date', 'desc', 0, 10, 0, 'n', 'ltr', 'y', 'n', 'xhtml', 'y', 2, '', ''),
(3, 1, 1, 'extended', 'Extended text', '', 'textarea', '', 'n', 0, 0, 'blog', 0, 'date', 'desc', 0, 12, 0, 'n', 'ltr', 'n', 'y', 'xhtml', 'y', 3, '', ''),
(4, 1, 2, 'cc4k_char_image', 'Character Image', '', 'ftype_id_6', '', 'n', 0, 0, 'blog', 2, 'title', 'desc', 0, 6, 128, 'n', 'ltr', 'n', 'n', 'none', 'n', 3, 'a:1:{s:7:"options";s:1:"2";}', ''),
(5, 1, 2, 'cc4k_main_image', 'Main Recipe Image', '', 'ftype_id_6', '', 'n', 0, 0, 'blog', 2, 'title', 'desc', 0, 6, 128, 'n', 'ltr', 'n', 'n', 'none', 'n', 4, 'a:1:{s:7:"options";s:1:"2";}', ''),
(6, 1, 2, 'cc4k_recipe_summary', 'Recipe Summary', '', 'textarea', '', 'n', 0, 0, 'blog', 2, 'title', 'desc', 0, 6, 128, 'n', 'ltr', 'n', 'n', 'none', 'n', 6, '', ''),
(7, 1, 2, 'cc4k_recipe_directions', 'Recipe Directions', '', 'textarea', '', 'n', 0, 0, 'blog', 2, 'title', 'desc', 0, 12, 128, 'n', 'ltr', 'n', 'n', 'none', 'y', 7, '', ''),
(8, 1, 2, 'cc4k_ingredients', 'Recipe Ingredients', '', 'ftype_id_7', '', 'n', 0, 0, 'blog', 2, 'title', 'desc', 0, 6, 128, 'n', 'ltr', 'n', 'n', 'none', 'n', 8, 'a:2:{s:8:"max_rows";s:0:"";s:4:"cols";a:2:{i:1;a:4:{s:4:"name";s:18:"ingredient_details";s:5:"label";s:18:"Ingredient Details";s:4:"type";s:14:"ff_matrix_text";s:8:"settings";a:2:{s:4:"maxl";s:3:"128";s:4:"size";s:0:"";}}i:2;a:4:{s:4:"name";s:14:"ingredient_img";s:5:"label";s:16:"Ingredient Image";s:4:"type";s:15:"ngen_file_field";s:8:"settings";a:1:{s:7:"options";s:1:"2";}}}}', ''),
(9, 1, 2, 'cc4k_tools', 'Recipe Tools', '', 'ftype_id_7', '', 'n', 0, 0, 'blog', 2, 'title', 'desc', 0, 6, 128, 'n', 'ltr', 'n', 'n', 'none', 'n', 9, 'a:2:{s:8:"max_rows";s:0:"";s:4:"cols";a:2:{i:1;a:4:{s:4:"name";s:9:"tool_name";s:5:"label";s:9:"Tool Name";s:4:"type";s:14:"ff_matrix_text";s:8:"settings";a:2:{s:4:"maxl";s:3:"128";s:4:"size";s:0:"";}}i:2;a:4:{s:4:"name";s:8:"tool_img";s:5:"label";s:10:"Tool Image";s:4:"type";s:15:"ngen_file_field";s:8:"settings";a:1:{s:7:"options";s:1:"2";}}}}', ''),
(10, 1, 2, 'cc4k_week_of', 'Week Of ', '', 'text', '', 'n', 0, 0, 'blog', 2, 'title', 'desc', 0, 6, 128, 'n', 'ltr', 'n', 'n', 'none', 'y', 2, '', ''),
(11, 1, 2, 'cc4k_title_image', 'Title Image', 'For the printable version of the recipe ', 'ftype_id_6', '', 'n', 0, 0, 'blog', 2, 'title', 'desc', 0, 6, 128, 'n', 'ltr', 'n', 'n', 'none', 'n', 5, 'a:1:{s:7:"options";s:1:"2";}', ''),
(12, 1, 3, 'recipe_sub_email', 'Submitter''s Email Address', '', 'text', '', 'n', 0, 0, 'blog', 2, 'title', 'desc', 0, 6, 128, 'n', 'ltr', 'n', 'n', 'none', 'n', 12, '', ''),
(13, 1, 3, 'recipe_ingredients', 'Recipe Ingredients', '', 'ftype_id_7', '', 'n', 0, 0, 'blog', 2, 'title', 'desc', 0, 6, 128, 'n', 'ltr', 'n', 'n', 'none', 'n', 14, 'a:2:{s:8:"max_rows";s:0:"";s:4:"cols";a:5:{i:1;a:4:{s:4:"name";s:8:"ingr_qty";s:5:"label";s:8:"Quantity";s:4:"type";s:9:"ff_select";s:8:"settings";a:1:{s:7:"options";a:19:{s:3:".25";s:3:"1/4";s:3:".33";s:3:"1/3";s:2:".5";s:3:"1/2";s:3:".75";s:3:"3/4";i:1;s:1:"1";s:4:"1.25";s:5:"1 1/4";s:4:"1.33";s:5:"1 1/3";s:3:"1.5";s:5:"1 1/2";s:4:"1.75";s:5:"1 3/4";i:2;s:1:"2";i:3;s:1:"3";i:4;s:1:"4";i:5;s:1:"5";i:6;s:1:"6";i:7;s:1:"7";i:8;s:1:"8";i:9;s:1:"9";i:10;s:2:"10";s:0:"";s:0:"";}}}i:2;a:4:{s:4:"name";s:9:"ingr_unit";s:5:"label";s:4:"Unit";s:4:"type";s:9:"ff_select";s:8:"settings";a:1:{s:7:"options";a:15:{s:3:"can";s:3:"can";s:6:"cloves";s:6:"cloves";s:3:"cup";s:3:"cup";s:4:"cups";s:4:"cups";s:5:"heads";s:5:"heads";s:4:"inch";s:4:"inch";s:5:"large";s:5:"large";s:2:"lb";s:2:"lb";s:2:"oz";s:2:"oz";s:5:"pinch";s:5:"pinch";s:3:"pkg";s:3:"pkg";s:6:"sheets";s:6:"sheets";s:4:"tbsp";s:4:"tbsp";s:3:"tsp";s:3:"tsp";s:0:"";s:0:"";}}}i:3;a:4:{s:4:"name";s:9:"ingr_item";s:5:"label";s:11:"Ingredient ";s:4:"type";s:14:"ff_matrix_text";s:8:"settings";a:2:{s:4:"maxl";s:3:"128";s:4:"size";s:0:"";}}i:4;a:4:{s:4:"name";s:9:"ingr_prep";s:5:"label";s:11:"Preparation";s:4:"type";s:9:"ff_select";s:8:"settings";a:1:{s:7:"options";a:12:{s:7:"chopped";s:7:"chopped";s:5:"diced";s:5:"diced";s:6:"minced";s:6:"minced";s:6:"grated";s:6:"grated";s:3:"cut";s:3:"cut";s:17:"cooked and minced";s:17:"cooked and minced";s:7:"scolded";s:7:"scolded";s:6:"melted";s:6:"melted";s:8:"shredded";s:8:"shredded";s:12:"stiff-beaten";s:12:"stiff-beaten";s:6:"beaten";s:6:"beaten";s:0:"";s:0:"";}}}i:5;a:4:{s:4:"name";s:9:"ingr_type";s:5:"label";s:16:"Grocery Category";s:4:"type";s:9:"ff_select";s:8:"settings";a:1:{s:7:"options";a:12:{s:6:"Baking";s:6:"Baking";s:12:"Fresh Spices";s:12:"Fresh Spices";s:11:"Meat & Fish";s:11:"Meat & Fish";s:10:"Snack Food";s:10:"Snack Food";s:9:"Can Goods";s:9:"Can Goods";s:9:"Dry Goods";s:9:"Dry Goods";s:32:"Sauces, Dressings and Condiments";s:32:"Sauces, Dressings and Condiments";s:12:"Frozen Foods";s:12:"Frozen Foods";s:5:"Dairy";s:5:"Dairy";s:6:"Breads";s:6:"Breads";s:13:"Miscellaneous";s:13:"Miscellaneous";s:0:"";s:0:"";}}}}}', 'short_name = ing_quantity\ntitle = Quantity\ntype = text\n\nshort_name = ing_units\ntitle = Units\ntype = text\n\nshort_name = ing_details\ntitle = Ingredient Details\ntype = text\n\n'),
(14, 1, 3, 'recipe_instructions_dayof', 'Recipe Instructions for the Day of Cooking', '', 'textarea', '', 'n', 0, 0, 'blog', 2, 'title', 'desc', 0, 6, 128, 'n', 'ltr', 'n', 'n', 'xhtml', 'n', 16, '', ''),
(15, 1, 3, 'recipe_servings_min', 'Minimum Servings', '', 'ftype_id_5', '', 'n', 0, 0, 'blog', 2, 'title', 'desc', 0, 6, 20, 'n', 'ltr', 'n', 'n', 'none', 'n', 19, 'a:1:{s:7:"options";a:9:{i:1;s:1:"1";i:2;s:1:"2";i:3;s:1:"3";i:4;s:1:"4";i:5;s:1:"5";i:6;s:1:"6";i:7;s:1:"7";i:8;s:1:"8";s:0:"";s:0:"";}}', ''),
(16, 1, 3, 'recipe_cook_time', 'Cooking Time (in minutes)', '', 'ftype_id_5', '', 'n', 0, 0, 'blog', 2, 'title', 'desc', 0, 6, 20, 'n', 'ltr', 'n', 'n', 'none', 'n', 21, 'a:1:{s:7:"options";a:16:{i:5;s:1:"5";i:10;s:2:"10";i:15;s:2:"15";i:20;s:2:"20";i:25;s:2:"25";i:30;s:2:"30";i:45;s:2:"45";i:60;s:2:"60";i:75;s:17:"1 hour 15 minutes";i:90;s:17:"1 hour 30 minutes";i:105;s:17:"1 hour 45 minutes";i:120;s:7:"2 hours";i:180;s:7:"3 hours";i:240;s:7:"4 hours";i:300;s:7:"5 hours";s:0:"";s:0:"";}}', ''),
(17, 1, 3, 'recipe_sub_name', 'Submitter''s Name', '', 'text', '', 'n', 0, 0, 'blog', 2, 'title', 'desc', 0, 6, 128, 'n', 'ltr', 'n', 'n', 'none', 'y', 11, '', ''),
(18, 1, 3, 'recipe_instructions_before', 'Recipe Instructions for the Evening Before Cooking', '', 'textarea', '', 'n', 0, 0, 'blog', 2, 'title', 'desc', 0, 6, 128, 'n', 'ltr', 'n', 'n', 'xhtml', 'n', 15, '', ''),
(19, 1, 3, 'recipe_servings_max', 'Maximum Servings', '', 'ftype_id_5', '', 'n', 0, 0, 'blog', 2, 'title', 'desc', 0, 6, 128, 'n', 'ltr', 'n', 'n', 'none', 'n', 20, 'a:1:{s:7:"options";a:13:{i:1;s:1:"1";i:2;s:1:"2";i:3;s:1:"3";i:4;s:1:"4";i:5;s:1:"5";i:6;s:1:"6";i:7;s:1:"7";i:8;s:1:"8";i:9;s:1:"9";i:10;s:2:"10";i:11;s:2:"11";i:12;s:2:"12";s:0:"";s:0:"";}}', ''),
(20, 1, 3, 'recipe_prep_time', 'Prep Time (in minutes)', '', 'ftype_id_5', '', 'n', 0, 0, 'blog', 2, 'title', 'desc', 0, 6, 128, 'n', 'ltr', 'n', 'n', 'none', 'n', 20, 'a:1:{s:7:"options";a:8:{i:5;s:1:"5";i:10;s:2:"10";i:15;s:2:"15";i:20;s:2:"20";i:25;s:2:"25";i:30;s:2:"30";i:45;s:2:"45";i:60;s:2:"60";}}', ''),
(21, 1, 3, 'recipe_dinner_prefs', 'Dinner Preferences', '', 'ftype_id_7', '', 'n', 0, 0, 'blog', 2, 'title', 'desc', 0, 6, 128, 'n', 'ltr', 'n', 'n', 'none', 'n', 21, 'a:2:{s:8:"max_rows";s:0:"";s:4:"cols";a:3:{i:1;a:4:{s:4:"name";s:6:"pref_1";s:5:"label";s:15:"Meat Preference";s:4:"type";s:11:"ff_checkbox";s:8:"settings";a:1:{s:5:"label";s:20:"Recipe contains meat";}}i:2;a:4:{s:4:"name";s:6:"pref_2";s:5:"label";s:15:"Fish Preference";s:4:"type";s:11:"ff_checkbox";s:8:"settings";a:1:{s:5:"label";s:20:"Recipe contains fish";}}i:3;a:4:{s:4:"name";s:6:"pref_3";s:5:"label";s:18:"Low Cal Preference";s:4:"type";s:11:"ff_checkbox";s:8:"settings";a:1:{s:5:"label";s:27:"Recipe is low cal / low fat";}}}}', ''),
(22, 1, 3, 'recipe_fav_types', 'Favorite Types Filtering ', '', 'ftype_id_7', '', 'n', 0, 0, 'blog', 2, 'title', 'desc', 0, 6, 128, 'n', 'ltr', 'n', 'n', 'none', 'n', 22, 'a:2:{s:8:"max_rows";s:0:"";s:4:"cols";a:4:{i:1;a:4:{s:4:"name";s:5:"opt_1";s:5:"label";s:15:"Budget Friendly";s:4:"type";s:11:"ff_checkbox";s:8:"settings";a:1:{s:5:"label";s:0:"";}}i:2;a:4:{s:4:"name";s:5:"opt_2";s:5:"label";s:16:"Health Conscious";s:4:"type";s:11:"ff_checkbox";s:8:"settings";a:1:{s:5:"label";s:0:"";}}i:3;a:4:{s:4:"name";s:5:"opt_3";s:5:"label";s:13:"Comfort Foods";s:4:"type";s:11:"ff_checkbox";s:8:"settings";a:1:{s:5:"label";s:0:"";}}i:4;a:4:{s:4:"name";s:5:"opt_4";s:5:"label";s:15:"Hint of Gourmet";s:4:"type";s:11:"ff_checkbox";s:8:"settings";a:1:{s:5:"label";s:0:"";}}}}', ''),
(23, 1, 3, 'recipe_course', 'Meal Course', '', 'ftype_id_5', '', 'n', 0, 0, 'blog', 2, 'title', 'desc', 0, 6, 128, 'n', 'ltr', 'n', 'n', 'none', 'n', 13, 'a:1:{s:7:"options";a:6:{s:9:"Appetizer";s:9:"Appetizer";s:7:"Dessert";s:7:"Dessert";s:5:"Drink";s:5:"Drink";s:11:"Main course";s:11:"Main course";s:5:"Salad";s:5:"Salad";s:9:"Side dish";s:9:"Side dish";}}', ''),
(24, 1, 3, 'recipe_tips', 'Helpful Tips', '', 'mrel', '', 'n', 0, 0, 'blog', 4, 'title', 'asc', 0, 6, 128, 'n', 'ltr', 'n', 'n', 'xhtml', 'y', 24, '', '');

-- --------------------------------------------------------

--
-- Table structure for table `exp_weblog_member_groups`
--

CREATE TABLE IF NOT EXISTS `exp_weblog_member_groups` (
  `group_id` smallint(4) unsigned NOT NULL,
  `weblog_id` int(6) unsigned NOT NULL,
  KEY `group_id` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `exp_weblog_member_groups`
--


-- --------------------------------------------------------

--
-- Table structure for table `exp_weblog_titles`
--

CREATE TABLE IF NOT EXISTS `exp_weblog_titles` (
  `entry_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `weblog_id` int(4) unsigned NOT NULL,
  `author_id` int(10) unsigned NOT NULL DEFAULT '0',
  `pentry_id` int(10) NOT NULL DEFAULT '0',
  `forum_topic_id` int(10) unsigned NOT NULL,
  `ip_address` varchar(16) NOT NULL,
  `title` varchar(100) NOT NULL,
  `url_title` varchar(75) NOT NULL,
  `status` varchar(50) NOT NULL,
  `versioning_enabled` char(1) NOT NULL DEFAULT 'n',
  `view_count_one` int(10) unsigned NOT NULL DEFAULT '0',
  `view_count_two` int(10) unsigned NOT NULL DEFAULT '0',
  `view_count_three` int(10) unsigned NOT NULL DEFAULT '0',
  `view_count_four` int(10) unsigned NOT NULL DEFAULT '0',
  `allow_comments` varchar(1) NOT NULL DEFAULT 'y',
  `allow_trackbacks` varchar(1) NOT NULL DEFAULT 'n',
  `sticky` varchar(1) NOT NULL DEFAULT 'n',
  `entry_date` int(10) NOT NULL,
  `dst_enabled` varchar(1) NOT NULL DEFAULT 'n',
  `year` char(4) NOT NULL,
  `month` char(2) NOT NULL,
  `day` char(3) NOT NULL,
  `expiration_date` int(10) NOT NULL DEFAULT '0',
  `comment_expiration_date` int(10) NOT NULL DEFAULT '0',
  `edit_date` bigint(14) DEFAULT NULL,
  `recent_comment_date` int(10) NOT NULL,
  `comment_total` int(4) unsigned NOT NULL DEFAULT '0',
  `trackback_total` int(4) unsigned NOT NULL DEFAULT '0',
  `sent_trackbacks` text NOT NULL,
  `recent_trackback_date` int(10) NOT NULL,
  PRIMARY KEY (`entry_id`),
  KEY `weblog_id` (`weblog_id`),
  KEY `author_id` (`author_id`),
  KEY `url_title` (`url_title`),
  KEY `status` (`status`),
  KEY `entry_date` (`entry_date`),
  KEY `expiration_date` (`expiration_date`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `exp_weblog_titles`
--

INSERT INTO `exp_weblog_titles` (`entry_id`, `site_id`, `weblog_id`, `author_id`, `pentry_id`, `forum_topic_id`, `ip_address`, `title`, `url_title`, `status`, `versioning_enabled`, `view_count_one`, `view_count_two`, `view_count_three`, `view_count_four`, `allow_comments`, `allow_trackbacks`, `sticky`, `entry_date`, `dst_enabled`, `year`, `month`, `day`, `expiration_date`, `comment_expiration_date`, `edit_date`, `recent_comment_date`, `comment_total`, `trackback_total`, `sent_trackbacks`, `recent_trackback_date`) VALUES
(3, 1, 3, 1, 0, 0, '127.0.0.1', 'test', 'test', 'open', 'y', 0, 0, 0, 0, 'n', 'n', 'n', 1276811086, 'n', '2010', '06', '17', 0, 0, 20100620143448, 0, 0, 0, '', 0),
(4, 1, 4, 1, 0, 0, '127.0.0.1', 'easy rice', 'easy_rice', 'open', 'y', 0, 0, 0, 0, 'y', 'n', 'n', 1277072741, 'n', '2010', '06', '20', 0, 0, 20100620142543, 0, 0, 0, '', 0),
(2, 1, 2, 1, 0, 0, '127.0.0.1', 'Purple Yums', 'purple_yums', 'open', 'y', 0, 0, 0, 0, 'y', 'n', 'n', 1275515277, 'n', '2010', '06', '02', 0, 0, 20100608133658, 0, 0, 0, '', 0),
(5, 1, 4, 1, 0, 0, '127.0.0.1', 'boiled egg', 'boiled_egg', 'open', 'y', 0, 0, 0, 0, 'y', 'n', 'n', 1277073225, 'n', '2010', '06', '20', 0, 0, 20100620143346, 0, 0, 0, '', 0);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
