<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="itheima" uri="http://itheima.com/common/"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="renderer" content="webkit"/>
<title>ONE PIECE</title>
<!-- 引入css样式文件 -->
<!-- Bootstrap Core CSS -->
<link href="<%=basePath%>css/bootstrap.min.css" rel="stylesheet" />
<!-- MetisMenu CSS -->
<link href="<%=basePath%>css/metisMenu.min.css" rel="stylesheet" />
<!-- DataTables CSS -->
<link href="<%=basePath%>css/dataTables.bootstrap.css" rel="stylesheet" />
<!-- Custom CSS -->
<link href="<%=basePath%>css/sb-admin-2.css" rel="stylesheet" />
<!-- Custom Fonts -->
<link href="<%=basePath%>css/font-awesome.min.css" rel="stylesheet"
	type="text/css" />
<link href="<%=basePath%>css/simple-calendar.css" rel="stylesheet"
	type="text/css" />
	<link href="<%=basePath%>css/boot-crm.css" rel="stylesheet"
	type="text/css" />
 <style type="text/css">
 .demo-input{padding-left: 10px; height: 38px; min-width: 252px; line-height: 38px; border: 1px solid #e6e6e6;  background-color: #fff;  border-radius: 2px;}
 </style>
</head>
<body>
	<div id="wrapper">
		<!-- 导航栏部分 -->
		<nav class="navbar navbar-default navbar-static-top" role="navigation"
			style="margin-bottom: 0">
			<div class="navbar-header">
				<a class="navbar-brand" href="<%=basePath%>customer/list.action">One piece公司管理系统
					v2.0</a>
			</div>
			<!-- 导航栏右侧图标部分 -->
			<ul class="nav navbar-top-links navbar-right">
				<!-- 任务信息通知 start -->
				<li class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown" href="#"> <i
						class="fa fa-envelope fa-fw"></i> <i class="fa fa-caret-down"></i>
				</a>
					<ul class="dropdown-menu dropdown-messages">
						<li><a href="#">
								<div>
									<strong>骆某</strong> <span class="pull-right text-muted">
										<em>今天</em>
									</span>
								</div>
								<div>今天下班后开个会，讨论一下公司任务···</div>
						</a></li>
						<li class="divider"></li>
						<li><a class="text-center" href="${pageContext.request.contextPath }/task/task.action"
							target="right"> <strong>查看全部消息</strong>
								<i class="fa fa-angle-right"></i>
						</a></li>
					</ul></li>
				<!-- 任务信息通知 end -->
				<!-- 文件通知 start -->
				<li class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown" href="#"> <i class="fa fa-file-text fa-fw"></i>
						<i class="fa fa-caret-down"></i>
				</a>
					<ul class="dropdown-menu dropdown-tasks">
						<li><a href="#">
								<li><a href="#">
								<div>
									<strong>店长</strong> <span class="pull-right text-muted">
										<em>今天</em>
									</span>
								</div>
								<div><strong>人员档案：import.text</strong> <span class="pull-right text-muted"></div>
						</a></li>
						</a></li>
						<li class="divider"></li>
						<li><a class="text-center" href="${pageContext.request.contextPath }/text/text.action"
							target="right"> <strong>查看所有文件</strong>
								<i class="fa fa-angle-right"></i>
						</a></li>
					</ul></li>
				<!-- 文件通知 end -->
				<!-- 用户信息和系统设置 start -->
				<li class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown" href="#"> <i class="fa fa-user fa-fw"></i>
						<i class="fa fa-caret-down"></i>
				</a>
					<ul class="dropdown-menu dropdown-user">
						<li><a href="#"><i class="fa fa-user fa-fw"></i>
								用户：${USER_SESSION.user_name} </a></li>
						<li><a href="${pageContext.request.contextPath }/customer/info.action"
							target="right"><i class="fa fa-gear fa-fw"></i> 管理员设置</a></li>
						<li class="divider"></li>
						<li><a
							href="${pageContext.request.contextPath }/logout.action"> <i
								class="fa fa-sign-out fa-fw"></i>退出登录
						</a></li>
					</ul></li>
				<!-- 用户信息和系统设置结束 -->
			</ul>
			<!-- 左侧显示列表部分 start-->
			<div class="navbar-default sidebar" role="navigation">
				<div class="sidebar-nav navbar-collapse">
				<!-- 日历 -->
				<div id="container" style="float:none;margin: 0px auto;cursor: pointer;"></div>
					<ul class="nav" id="side-menu">
					<li><a href="${pageContext.request.contextPath }/customer/home.action"
						style="font-size: 16px; background-color: #AAFFEE" 	target="right"><b>公司发展历程</b>
					</a></li>
					<li><a href="#"
						style="font-size: 16px; background-color: #AAFFEE"> <i
							class="icon-font"></i><b>开始后台管理</b>
					</a>
					<ul class="nav sub-menu">
						<li><a href="${pageContext.request.contextPath }/customer/info.action"
							target="right"> <i class="fa fa-user fa-fw"></i> 管理员管理
						</a></li>
						<li><a
							href="${pageContext.request.contextPath }/customer/list1.action"
							target="right"> <i class="fa fa-edit fa-fw"></i> 客户信息管理
						</a></li>
						<li><a 	href="${pageContext.request.contextPath }/customer/list2.action"
							target="right"> <i class="fa fa-dashboard fa-fw"></i>
								客户跟进状态
						</a></li>
						<li><a href="${pageContext.request.contextPath }/task/task.action"
							target="right"> <i class="fa fa-tasks fa-fw"></i>
								公司任务、信息
						</a></li>
						<li><a href="${pageContext.request.contextPath }/text/text.action"
							target="right"> <i class="fa fa-file fa-fw"></i>
								公司档案室
						</a></li>
					</ul>
					</li>
					</ul>
				</div>
			</div>
			<!-- 左侧显示列表部分 end-->

			<div class="page-wrapper">
				<iframe
					src="${pageContext.request.contextPath }/customer/left.action"
					width="100%" height="800px" frameborder="0" name="right">
				</iframe>
			</div>
		</nav>
		</div>
		<!-- 引入js文件 -->
		<!-- jQuery -->
		<script src="<%=basePath%>js/jquery-1.11.3.min.js"></script>
		<!-- Bootstrap Core JavaScript -->
		<script src="<%=basePath%>js/bootstrap.min.js"></script>
		<!-- Metis Menu Plugin JavaScript -->
		<script src="<%=basePath%>js/metisMenu.min.js"></script>
		<!-- DataTables JavaScript -->
		<script src="<%=basePath%>js/jquery.dataTables.min.js"></script>
		<!-- Custom Theme JavaScript -->
		<script src="<%=basePath%>js/sb-admin-2.js"></script>
		 <script src="<%=basePath%>js/laydate/laydate.js"></script>
		 <script src="<%=basePath%>js/simple-calendar.js"></script>
		 <script>
    var myCalendar = new SimpleCalendar('#container');
    myCalendar.updateSize('250px', '400px');
</script>
</body>
</html>