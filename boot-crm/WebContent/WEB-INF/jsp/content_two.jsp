<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
</head>
<body>
	<!-- 客户列表查询部分  start-->
		<div id="page-wrapper">
			<div class="row">
				<div class="col-lg-12">
					<h3 class="page-header">客户跟进状态</h3>
				</div>
				<!-- /.col-lg-12 -->
			</div>
			<!-- /.row -->
			<div class="panel panel-default">
				<div class="panel-body">
					<form class="form-inline" method="get"
						action="${pageContext.request.contextPath }/customer/list2.action">
						<div class="form-group">
							<label for="customerName">客户名称</label> <input type="text"
								class="form-control" id="customerName" value="${custName }"
								name="custName" />
						</div>
						
						<div class="form-group">
							<label for="customerLeibi">客户类别</label> <select
								class="form-control" id="customerLeibi" name="custType">
								<option value="">--请选择--</option>
								<c:forEach items="${leibiType}" var="item">
									<option value="${item.dict_id}"
										<c:if test="${item.dict_id == custType}">selected</c:if>>
										${item.dict_item_name }</option>
								</c:forEach>
							</select>
						</div>
						
						<div class="form-group">
							<label for="custState">年营业额</label> <select
								class="form-control" id="custState" name="custState">
								<option value="">--请选择--</option>
								<c:forEach items="${stateType}" var="item">
									<option value="${item.dict_id}"
										<c:if test="${item.dict_id == custstate}"> selected</c:if>>
										${item.dict_item_name }</option>
								</c:forEach>
							</select>
						</div>
						<div class="form-group">
							<label for="custSchedule">跟进进度</label> <select class="form-control"
								id="custSchedule" name="custSchedule">
								<option value="">--请选择--</option>
								<c:forEach items="${scheduleType}" var="item">
									<option value="${item.dict_id}"
										<c:if test="${item.dict_id == custSchedule}"> selected</c:if>>
										${item.dict_item_name }</option>
								</c:forEach>
							</select>
						</div>
						<button type="submit" class="btn btn-primary"><i class="fa fa-search fa-fw"></i>查询</button>
						
					</form>
				</div>
			</div>
			
			<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-default">
						<div class="panel-heading">客户信息列表</div>
						<!-- /.panel-heading -->
						<table class="table table-bordered table-striped">
							<thead>
								<tr>
									<th>编号</th>
									<th>客户名称</th>
									<th>业务员</th>
									<th>客户类型</th>
									<th>跟进进度</th>
									<th>年营业额</th>
									<th>开始跟进日期</th>
									<th>最新进展</th>
									<th>操作</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${page.rows}" var="row">
									<tr style="text-align: center;">
										<td>${row.cust_id}</td>
										<td>${row.cust_name}</td>
										<td>${row.cust_industry}</td>
										<td>${row.cust_type}</td>
										<td>${row.cust_schedule}</td>
										<td>${row.cust_state}</td>
										<td><fmt:formatDate type="both" dateStyle="long" timeStyle="long" value="${row.cust_createtime}"/></td>
										<td>${row.cust_progress}</td>
										<td><a href="#" class="btn btn-primary btn-xs"
											data-toggle="modal" data-target="#customerEditDialog"
									onclick="editCustomer(${row.cust_id})"><i class="fa fa-rotate-right fa-fw"></i>修改</a> <a href="#"
											class="btn btn-danger btn-xs"
										onclick="deleteCustomer(${row.cust_id})"><i class="fa fa-trash fa-fw"></i>删除</a></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						<div class="col-md-12 text-right">
							<itheima:page
								url="${pageContext.request.contextPath }/customer/list2.action" />
						</div>
						<!-- /.panel-body -->
					</div>
					<!-- /.panel -->
				</div>
				<!-- /.col-lg-12 -->
			</div>
		</div>
		<!-- 客户列表查询部分  end-->
	<!-- 修改客户模态框 -->
	<div class="modal fade" id="customerEditDialog" tabindex="-1"
		role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">修改客户信息</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" id="edit_customer_form">
						<input type="hidden" id="edit_cust_id" name="cust_id" />
						<div class="form-group">
							<label for="edit_customerName" class="col-sm-2 control-label">客户名称</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="edit_customerName"
									placeholder="客户名称" name="cust_name" />
							</div>
						</div>
						<div class="form-group">
							<label for="edit_customerLeibi"
								style="float: left; padding: 7px 15px 0 27px;">客户类别</label>
							<div class="col-sm-10">
								<select class="form-control" id="edit_customerLeibi"
									name="cust_type">
									<option value="">--请选择--</option>
									<c:forEach items="${leibiType}" var="item">
										<option value="${item.dict_id}"
											<c:if test="${item.dict_id == custType}"> selected</c:if>>${item.dict_item_name }</option>
									</c:forEach>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label for="edit_custstate"
								class="col-sm-2 control-label">年营业额</label>
							<div class="col-sm-10">
								<select class="form-control" id="edit_custstate"
									name="cust_state">
									<option value="">--请选择--</option>
									<c:forEach items="${stateType}" var="item">
										<option value="${item.dict_id}"
											<c:if test="${item.dict_id == custstate}"> selected</c:if>>${item.dict_item_name }</option>
									</c:forEach>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label for="edit_schedule"
								style="float: left; padding: 7px 15px 0 27px;">跟进进度</label>
							<div class="col-sm-10">
								<select class="form-control" id="edit_schedule"
									name="cust_schedule">
									<option value="">--请选择--</option>
									<c:forEach items="${scheduleType}" var="item">
										<option value="${item.dict_id}"
											<c:if test="${item.dict_id == schedule}"> selected</c:if>>${item.dict_item_name }</option>
									</c:forEach>
								</select>
							</div>
						</div>
							<div class="form-group">
							<label for="edit_custIndustry"
								class="col-sm-2 control-label">业务员</label>
							<div class="col-sm-10">
								<select class="form-control" id="edit_custIndustry"
									name="cust_industry">
									<option value="">--请选择--</option>
									<c:forEach items="${industryType}" var="item">
										<option value="${item.dict_id}"
											<c:if test="${item.dict_id == custIndustry}"> selected</c:if>>${item.dict_item_name }</option>
									</c:forEach>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label for="edit_progress" class="col-sm-2 control-label">最新进展</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="edit_progress"
									placeholder="最新进展" name="cust_progress" />
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary"
						onclick="updateCustomer()">保存修改</button>
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
	<!-- 编写js代码 -->
	<script type="text/javascript">
	// 通过id获取修改的客户信息
	function editCustomer(id) {
	    $.ajax({
	        type:"get",
	        url:"<%=basePath%>customer/getCustomerById.action",
	        data:{"id":id},
	        success:function(data) {
	            $("#edit_cust_id").val(data.cust_id);
	            $("#edit_customerName").val(data.cust_name);
	            $("#edit_customerLeibi").val(data.cust_type)
	            $("#edit_custstate").val(data.cust_state)
	            $("#edit_schedule").val(data.cust_schedule)
	            $("#edit_custIndustry").val(data.cust_industry)
	            $("#edit_phone").val(data.cust_phone);
	            $("#edit_mobile").val(data.cust_mobile);
	            $("#edit_zipcode").val(data.cust_zipcode);
	            $("#edit_progress").val(data.cust_progress);
	            
	        }
	    });
	}
    // 执行修改客户操作
	function updateCustomer() {
		$.post("<%=basePath%>customer/update.action",$("#edit_customer_form").serialize(),function(data){
			if(data =="OK"){
				alert("客户信息更新成功！");
				window.location.reload();
			}else{
				alert("客户信息更新失败！");
				window.location.reload();
			}
		});
	}
	// 删除客户
	function deleteCustomer(id) {
	    if(confirm('确实要删除该客户吗?')) {
	$.post("<%=basePath%>customer/delete.action",{"id":id},
	function(data){
	            if(data =="OK"){
	                alert("客户删除成功！");
	                window.location.reload();
	            }else{
	                alert("删除客户失败！");
	                window.location.reload();
	            }
	        });
	    }
	}
</script>
</body>
</html>