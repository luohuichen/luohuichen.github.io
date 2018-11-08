<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
<title>ONE PIECE</title>
<!-- 引入css样式任务信息 -->
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
<link href="<%=basePath%>css/boot-crm.css" rel="stylesheet"
	type="text/css" />
	<style type="text/css">
	table {
	width: 100%;
	table-layout: fixed;
}
.text{
text-align:left;
	width: 100%;
	word-break:keep-all;
	 white-space: nowrap;
	 overflow: hidden;
	text-overflow:ellipsis;
	 font-size: 18px;
	}
	</style>
</head>
<body>
	<div id="page-wrapper">
		<div class="row">
			<div class="col-lg-12">
				<h2 class="page-header">公司日常任务与信息</h2>
				<a href="#" class="btn btn-primary" data-toggle="modal" 
		           data-target="#newCustomerDialog" onclick="cleartask()"><i class="fa fa-plus-square-o fa-fw"></i>添加任务信息</a> 
			</div>
			<!-- /.col-lg-12 -->
		</div>
		<br>
		<div class="row">
			<div class="col-lg-11">
				<div class="panel panel-default">
					<div class="panel-heading">任务信息列表</div>
					
					<!-- /.panel-heading -->
					<table class="table table-bordered table-striped">
							<c:forEach items="${page.rows}" var="rows">
								<tr style="text-align: center;">
								    <td class="text col-lg-11" data-toggle="modal" data-target="#taskEditDialog" onclick="edittask(${rows.task_id})">&nbsp发&nbsp&nbsp布&nbsp&nbsp人&nbsp&nbsp：${rows.task_name}<br>发&nbsp布&nbsp时&nbsp间 ：<fmt:formatDate type="both" dateStyle="long" timeStyle="long" value="${rows.task_time}"/><br>任务或信息：${rows.task_info}</td>
									<td  class="col-lg-1"> <a href="#"
										class="btn btn-danger btn-xs"
										onclick="deletetask(${rows.task_id})" style="width: 87%;height: 50%;font-size: 18px;margin-top: 20px;"><i class="fa fa-trash fa-fw"></i>删除</a></td>
								</tr>
							</c:forEach>
					</table>
					<div class="col-md-12 text-right">
							<itheima:page
								url="${pageContext.request.contextPath }/task/task.action" />
						</div>
				</div>
				<!-- /.panel -->
			</div>
			<!-- /.col-lg-12 -->
		</div>
	</div>
<!-- 创建任务信息模态框 -->
	<div class="modal fade" id="newCustomerDialog" tabindex="-1"
		role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">新建任务信息</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" id="new_task_form">
						<div class="form-group">
							<label for="new_taskName" class="col-sm-2 control-label">
								发布人</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="new_taskName"
									placeholder="发布人" name="task_name"/>
							</div>
						</div>
						<div class="form-group">
							<label for="new_info" class="col-sm-2 control-label">Text</label>
							<div class="col-sm-10">
							<textarea rows="5" cols="50" class="form-control" id="new_info"
								placeholder="任务、信息" name="task_info"></textarea>
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary"
						onclick="createtask()">创建任务信息</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 任务模态框 -->
	<div class="modal fade" id="taskEditDialog" tabindex="-1"
		role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">查看任务信息</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" id="edit_task_form">
						<input type="hidden" id="edit_task_id" name="task_id" />
						<div class="form-group">
							<label for="edit_name" class="col-sm-3 control-label">发布人</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" id="edit_name"
									placeholder="发布人" name="task_name" />
							</div>
						</div>
					
						<div class="form-group">
							<label for="edit_time" class="col-sm-3 control-label">发布时间</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" id="edit_time"
									placeholder="发布时间" name="task_time" />
							</div>
						</div>
						<div class="form-group">
							<label for="edit_info" class="col-sm-3 control-label">任务或信息</label>
							<div class="col-sm-9">
								<textarea rows="5" cols="50" class="form-control" id="edit_info"
									placeholder="任务或信息" name="task_info"></textarea>
							</div>
						</div>
						
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 引入js任务信息 -->
	<!-- jQuery -->
	<script src="<%=basePath%>js/jquery-1.11.3.min.js"></script>
	<!-- Bootstrap Core JavaScript -->
	<script src="<%=basePath%>js/bootstrap.min.js"></script>
	<!-- Metis Menu Plugin JavaScript -->
	<script src="<%=basePath%>js/metisMenu.min.js"></script>
	<!-- DataTables JavaScript -->
	<script src="<%=basePath%>js/jquery.dataTables.min.js"></script>
	<script src="<%=basePath%>js/dataTables.bootstrap.min.js"></script>
	<!-- Custom Theme JavaScript -->
	<script src="<%=basePath%>js/sb-admin-2.js"></script>
	<!-- 编写js代码 -->
	<script type="text/javascript">
	//清空新建任务窗口中的数据
	function cleartask() {
	    $("#new_taskName").val("")
	    $("#new_time").val("")
	    $("#new_info").val("")
	}
	// 通过id获取任务与信息
	function edittask(id) {
	    $.ajax({
			
	        type:"get",
	        url:"<%=basePath%>task/gettaskById.action",
	        data:{"id":id},
	        success:function(data) {
	        	var t = new Date(data.task_time);
	            $("#edit_name").val(data.task_name);
	            $("#edit_time").val(t.Format("yyyy-MM-dd hh:mm:ss")); 
	            $("#edit_info").val(data.task_info);
	            
	        }
	    });
	}
	Date.prototype.Format = function (fmt) { //author: meizz
		  var o = {
		    "M+": this.getMonth() + 1, //月份
		    "d+": this.getDate(), //日
		    "h+": this.getHours(), //小时
		    "m+": this.getMinutes(), //分
		    "s+": this.getSeconds(), //秒
		    "q+": Math.floor((this.getMonth() + 3) / 3), //季度
		    "S": this.getMilliseconds() //毫秒
		  };
		  if (/(y+)/.test(fmt)) fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
		  for (var k in o)
		  if (new RegExp("(" + k + ")").test(fmt)) fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
		  return fmt;
		}
	// 创建任务信息
	function createtask() {
	$.post("<%=basePath%>task/taskcreate.action",
	$("#new_task_form").serialize(),function(data){
	        if(data =="OK"){
	            alert("任务信息创建成功！");
	            window.location.reload();
	        }else{
	            alert("任务信息创建失败！");
	            window.location.reload();
	        }
	    });
	}
   
	// 删除任务信息
	function deletetask(id) {
	    if(confirm('确实要删除该任务信息吗?')) {
	$.post("<%=basePath%>task/taskdelete.action",{"id":id},
	function(data){
	            if(data =="OK"){
	                alert("任务信息删除成功！");
	                window.location.reload();
	            }else{
	                alert("删除任务信息失败！");
	                window.location.reload();
	            }
	        });
	    }
	}
</script>
</body>
</html>