# 项目背景

“教师辅助办公系统”是为了方便教师对学校的课表、周报进行统一管理，为教师所需填写的信息和使用状态提供一个可视化可操作的平台，使得教师们的工作变得简单方便，节省时间，效率更高。

# 项目介绍

- 名称：教师辅助办公系统
- 定位：各个教师
- 特点：对学校的课表、周报进行统一管理，节省时间，效率更高。
- 功能：通用功能（登录、修改密码、完善个人信息），课表管理（填写、导出课表），周报管理（填写、查看），学期设置（设置学期从哪周开始），用户管理（增删改查，禁用，重置密码）  

# 快速入门
该系统适用于windows7以上系统，兼容主流浏览器，因为该系统还未部署到云服务器，所以暂时不能通过外网访问，通过编译器运行后在浏览器输入网址：127.0.0.1:8089/login进入登录界面。

# 目录说明
    |-- lib 	 //本项目所需要的第三方库
    |   |-- commons-beanutils.jar
    |   |-- commons-collections-3.0.jar
    |   |-- commons-lang-2.1.jar
    |   |-- commons-logging.jar
    |   |-- ezmorph-1.0.2.jar
    |   |-- json-lib-1.1-jdk13.jar
    |   |-- mail-1.5.0-b01.jar
    |   -- xom-1.0d10.jar
    |-- pom.xml 	//Maven项目中的文件，便于管理项目
    |-- src     	//源码文件
    |   |-- main
    |   |   |-- java
    |   |   |   -- com
    |   |   |       -- iflysse
    |   |   |           |-- Application.java //SpringBoot启动器
    |   |   |           |-- bean             //各对象属性及方法
    |   |   |           |   |-- ClassInfo.java		//课程信息类
    |   |   |           |   |-- ClassTime.java		//上课时间类
    |   |   |           |   |-- Course.java			//课程类
    |   |   |           |   |-- Email.java			//邮箱类
    |   |   |           |   |-- Subject.java		//学科类
    |   |   |           |   |-- TermSet.java		//学期类
    |   |   |           |   |-- TermSetQO.java
    |   |   |           |   |-- User.java			//用户类
    |   |   |           |   |-- UserQO.java			
    |   |   |           |   |-- Weekly.java			//周报类
    |   |   |           |   -- WeeklyQO.java
    |   |   |           |-- config         	//拦截器及其配置
    |   |   |           |   |-- AdminInterceptor.java	//管理员拦截器
    |   |   |           |   |-- LoginInterceptor.java	//登录拦截器
    |   |   |           |   |-- MangerInterceptor.java	//主任拦截器
    |   |   |           |   -- WebMvcConfig.java		//拦截器配置
    |   |   |           |-- controller		//MVC的controller
    |   |   |           |   |-- CourseController.java	//课程控制器
    |   |   |           |   |-- EmailController.java	//邮箱控制器
    |   |   |           |   |-- LoginController.java	//登录控制器
    |   |   |           |   |-- TermsetController.java	//学期控制器
    |   |   |           |   |-- UserController.java		//用户控制器
    |   |   |           |   -- WeeklyController.java	//周报控制器
    |   |   |           |-- dao				//Dao的实现类
    |   |   |           |   |-- CourseDao.java			//课程访问接口
    |   |   |           |   |-- EmailDao.java			//邮箱访问接口
    |   |   |           |   |-- TermSetDao.java			//学期访问接口
    |   |   |           |   |-- TermSetDao.xml			
    |   |   |           |   |-- UserDao.java			//用户访问接口
    |   |   |           |   |-- UserDao.xml
    |   |   |           |   |-- WeeklyDao.java			//周报访问接口
    |   |   |           |   -- WeeklyDao.xml
    |   |   |           -- util				//工具类
    |   |   |               -- SendMail.java			//发送邮件找回密码工具
    |   |   |-- resources			//资源文件
    |   |   |   |-- application.properties 		//配置文件
    |   |   |   -- static			//静态资源
    |   |   |       |-- bootstrap	//bootstrap前端框架
    |   |   |       |   |-- css
    |   |   |       |   |   |-- bootstrap-theme.css
    |   |   |       |   |   |-- bootstrap-theme.css.map
    |   |   |       |   |   |-- bootstrap-theme.min.css
    |   |   |       |   |   |-- bootstrap-theme.min.css.map
    |   |   |       |   |   |-- bootstrap.css
    |   |   |       |   |   |-- bootstrap.css.map
    |   |   |       |   |   |-- bootstrap.min.css
    |   |   |       |   |   -- bootstrap.min.css.map
    |   |   |       |   |-- fonts
    |   |   |       |   |   |-- glyphicons-halflings-regular.eot
    |   |   |       |   |   |-- glyphicons-halflings-regular.svg
    |   |   |       |   |   |-- glyphicons-halflings-regular.ttf
    |   |   |       |   |   |-- glyphicons-halflings-regular.woff
    |   |   |       |   |   -- glyphicons-halflings-regular.woff2
    |   |   |       |   -- js
    |   |   |       |       |-- bootstrap.js
    |   |   |       |       |-- bootstrap.min.js
    |   |   |       |       -- npm.js
    |   |   |       |-- css		//自定义的css
    |   |   |       |   |-- bootstrap.min.css
    |   |   |       |   |-- course.css
    |   |   |       |   |-- demo.css
    |   |   |       |   |-- errstyle.css
    |   |   |       |   |-- font-awesome.min.css
    |   |   |       |   |-- login.css
    |   |   |       |   |-- reset.css
    |   |   |       |   |-- style.css
    |   |   |       |   |-- style1.css
    |   |   |       |   -- styles.css
    |   |   |       |-- images	//图片
    |   |   |       |   |-- activate.jpg
    |   |   |       |   |-- bg1.png
    |   |   |       |   |-- bgtp.gif
    |   |   |       |   |-- course.gif
    |   |   |       |   |-- footer.jpg
    |   |   |       |   |-- ia_100000000.jpg
    |   |   |       |   |-- img.gif
    |   |   |       |   |-- img1.gif
    |   |   |       |   |-- log.ico
    |   |   |       |   |-- logo.png
    |   |   |       |   |-- mmexport.gif
    |   |   |       |   |-- name.png
    |   |   |       |   |-- password.png
    |   |   |       |   -- title.jpg
    |   |   |       |-- js		//自定义的js文件
    |   |   |       |   |-- app.js
    |   |   |       |   |-- bootstrap.min.js
    |   |   |       |   |-- gVerify.js
    |   |   |       |   |-- hullabaloo.js
    |   |   |       |   |-- jquery-3.3.1.min.js
    |   |   |       |   |-- particles.min.js
    |   |   |       |   -- table2excel.js
    |   |   |       -- layui	//layui前端框架
    |   |   |           |-- css
    |   |   |           |   |-- ace-rtl.min.css
    |   |   |           |   |-- ace-skins.min.css
    |   |   |           |   |-- ace.min.css
    |   |   |           |   |-- font-awesome.min.css
    |   |   |           |   |-- layui.css
    |   |   |           |   |-- layui.mobile.css
    |   |   |           |   |-- loginStyle.css
    |   |   |           |   |-- main.css
    |   |   |           |   |-- menus.css
    |   |   |           |   |-- modules
    |   |   |           |   |   |-- code.css
    |   |   |           |   |   |-- laydate
    |   |   |           |   |   |   -- default
    |   |   |           |   |   |       -- laydate.css
    |   |   |           |   |   -- layer
    |   |   |           |   |       -- default
    |   |   |           |   |           |-- icon-ext.png
    |   |   |           |   |           |-- icon.png
    |   |   |           |   |           |-- layer.css
    |   |   |           |   |           |-- loading-0.gif
    |   |   |           |   |           |-- loading-1.gif
    |   |   |           |   |           -- loading-2.gif
    |   |   |           |   -- register.css
    |   |   |           |-- font
    |   |   |           |   |-- iconfont.eot
    |   |   |           |   |-- iconfont.svg
    |   |   |           |   |-- iconfont.ttf
    |   |   |           |   |-- iconfont.woff
    |   |   |           |   -- iconfont.woff2
    |   |   |           |-- js
    |   |   |           |   -- layui.js
    |   |   |           |-- lay
    |   |   |           |   -- modules
    |   |   |           |       |-- carousel.js
    |   |   |           |       |-- code.js
    |   |   |           |       |-- colorpicker.js
    |   |   |           |       |-- element.js
    |   |   |           |       |-- flow.js
    |   |   |           |       |-- form.js
    |   |   |           |       |-- jquery.js
    |   |   |           |       |-- laydate.js
    |   |   |           |       |-- layedit.js
    |   |   |           |       |-- layer.js
    |   |   |           |       |-- laypage.js
    |   |   |           |       |-- laytpl.js
    |   |   |           |       |-- mobile.js
    |   |   |           |       |-- rate.js
    |   |   |           |       |-- slider.js
    |   |   |           |       |-- table.js
    |   |   |           |       |-- transfer.js
    |   |   |           |       |-- tree.js
    |   |   |           |       |-- upload.js
    |   |   |           |       -- util.js
    |   |   |           |-- layui.all.js
    |   |   |           -- layui.js
    |   |   -- webapp
    |   |       -- WEB-INF
    |   |           -- jsp		//jsp文件
    |   |               |-- add_course.jsp		//添加课程页
    |   |               |-- add_subject.jsp		//添加学科页
    |   |               |-- add_user.jsp		//添加用户页
    |   |               |-- add_weekly.jsp		//添加周报页
    |   |               |-- allcourse.jsp		
    |   |               |-- classTime.jsp		//添加上课时间页
    |   |               |-- common		//多个页面要用到的jsp
    |   |               |   |-- footer.jsp		//版权信息
    |   |               |   |-- pageNav.jsp		//分页
    |   |               |   |-- termPageNav.jsp
    |   |               |   |-- userPageNav.jsp
    |   |               |   -- weeklyPageNav.jsp
    |   |               |-- courseEdit.jsp		//课程编辑页
    |   |               |-- courseInfo.jsp		//课程信息页
    |   |               |-- courseList.jsp		//课程列表页
    |   |               |-- email.jsp			//邮箱页
    |   |               |-- error	//错误操作时的jsp
    |   |               |   |-- 400.jsp
    |   |               |   -- 403.jsp
    |   |               |-- homePage.jsp		//主页面
    |   |               |-- index.jsp
    |   |               |-- login.jsp			//登录页
    |   |               |-- menu.jsp			//主菜单
    |   |               |-- pwdEdit.jsp			//修改密码页
    |   |               |-- refineInfo.jsp		//完善信息页
    |   |               |-- showSecret.jsp		//个人信息页
    |   |               |-- subjectEdit.jsp		//学科编辑页
    |   |               |-- termList.jsp		//学期列表
    |   |               |-- termSet.jsp			//学期设置页
    |   |               |-- timeEdit.jsp		//时间编辑页
    |   |               |-- userEdit.jsp		//用户编辑页
    |   |               |-- userInfo.jsp		//用户信息页
    |   |               |-- userList.jsp		//用户列表
    |   |               |-- weeklyEdit.jsp		//周报编辑页
    |   |               |-- weeklyEdit2.jsp
    |   |               |-- weeklyInfo.jsp		//周报信息页
    |   |               |-- weeklyInfoAll.jsp	//所有用户周报信息页
    |   |               |-- weeklyList.jsp		//周报列表
    |   |               |-- weeklyMyself.jsp	//登录用户周报
    |   |               |-- weeklyView.jsp		//周报预览

