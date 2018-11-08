<%@page import="java.text.SimpleDateFormat"%>
<%-- <%@page import="com.sun.jmx.snmp.Timestamp"%> --%>
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
<link href="<%=basePath%>css/boot-crm.css" rel="stylesheet"
	type="text/css" />
<style type="text/css">
table {
	width: 100%;
	table-layout: fixed;
}

.text {
	text-align: left;
	width: 100%;
	word-break: keep-all;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
	font-size: 18px;
}
</style>
</head>
<body>
	<div id="page-wrapper">
		<div class="row">
			<div class="col-lg-12">
				<h2 class="page-header">公司档案上传下载查看</h2>
				<a href="#" class="btn btn-primary" data-toggle="modal"
					data-target="#newCustomerDialog" onclick="cleartext()"><i class="fa fa-plus-square-o fa-fw"></i>上传文件</a>
			</div>
			<!-- /.col-lg-12 -->
		</div>
		<br>
		<div class="row">
			<div class="col-lg-11">
				<div class="panel panel-default">
					<div class="panel-heading">文件列表</div>

					<!-- /.panel-heading -->
					<table class="table table-bordered table-striped">
						<thead>
							<tr>
								<th class="col-lg-1">上传人</th>
								<th class="col-lg-3">上传时间</th>
								<th class="col-lg-6">文件</th>
								<th class="col-lg-2">操作</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${page.rows}" var="rows">
								<tr style="text-align: center;">
									<td>${rows.text_name}</td>
									<td><fmt:formatDate type="both" dateStyle="long" timeStyle="long" value="${rows.text_time}"/></td>
									<td>${rows.text_file}</td>
									<td><a
										href="${pageContext.request.contextPath }/text/download.action?filename=${rows.text_file}"
										class="btn btn-primary btn-xs"><i class="fa fa-download fa-fw"></i>下载</a> <a href="#"
										class="btn btn-danger btn-xs"
										onclick="deleteText(${rows.text_id})"><i class="fa fa-trash fa-fw"></i>删除</a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<div class="col-md-12 text-right">
						<itheima:page
							url="${pageContext.request.contextPath }/text/text.action" />
					</div>
				</div>
				<!-- /.panel -->
			</div>
			<!-- /.col-lg-12 -->
		</div>
	</div>
	<!-- 创建任务文件模态框 -->
	<div class="modal fade" id="newCustomerDialog" tabindex="-1"
		role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">上传文件</h4>
				</div>
				<div class="modal-body">
					<%-- action="${pageContext.request.contextPath }/text/textcreate.action" --%>
					<form class="form-horizontal" id="new_text_form" method="post"
						enctype="multipart/form-data">
						<div class="form-group">
							<label for="new_textName" class="col-sm-3 control-label">
								上传人</label>
							<div class="col-sm-4">
								<input type="text" class="form-control" id="new_textName"
									placeholder="上传人" name="name" />
							</div>
						</div>
						<div class="form-group">
							<label for="new_flie" class="col-sm-3 control-label">请选择文件</label>
							<div class="col-sm-3">
								<input type="file" id="new_flie" placeholder="上传文件" name="file"
									multiple="multiple" />
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary"
						onclick="createtext()">上传文件</button>
				</div>
			</div>
		</div>
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
	<script src="<%=basePath%>js/dataTables.bootstrap.min.js"></script>
	<!-- Custom Theme JavaScript -->
	<script src="<%=basePath%>js/sb-admin-2.js"></script>
	<script src="<%=basePath%>js/jquery.form.js"></script>
	<!-- 编写js代码 -->
	<script type="text/javascript">
	//清空新建文件窗口中的数据
	function cleartext() {
	    $("#new_textName").val("")
	    $("#new_flie").val("")
	}
	// 通过id获取文件信息
	function edittext(id) {
	    $.ajax({
	        type:"get",
	        url:"<%=basePath%>text/gettextById.action",
	        data:{"id":id},
	        success:function(data) {
	            $("#edit_name").val(data.text_name);
	            $("#edit_time").val(data.text_time); 
	            $("#edit_info").val(data.text_file);
	            
	        }
	    });
	}

	/* 上传文件 */
	function createtext(){ 
        $('#new_text_form').ajaxSubmit({
        type: 'post', // 提交方式 get/post
        url: '<%=basePath%>text/textcreate.action', // 需要提交的 url
        success: function(data) { // data 保存提交后返回的数据，一般为 json 数据
        	if(data =="OK"){
	            alert("文件上传成功！");
	            window.location.reload();
	        }else{
	            alert("文件上传失败！");
	            window.location.reload();
	        }
        }
    });
    return false; // 阻止表单自动提交事件
}
	// 删除文件
	function deleteText(id) {
	    if(confirm('确实要删除该文件吗?')) {
	$.post("<%=basePath%>text/textdelete.action",{"id":id},
	function(data){
	            if(data =="OK"){
	                alert("文件删除成功！");
	                window.location.reload();
	            }else{
	                alert("删除文件失败！");
	                window.location.reload();
	            }
	        });
	    }
	}
</script>
</body>
</html>