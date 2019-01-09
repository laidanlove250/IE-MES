<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@include file="/common/common.jspf" %>
<script type="text/javascript" src="${ctx}/js/workshopdata/workcenter/workcenter_add.js">
</script>
<style type="text/css">
.col-sm-3 {
	width: 15%;
	float: left;
}

.col-sm-9 {
	width: 85%;
	float: left;
}
label[class^="btn btn-default"]{
	margin-top: -4px;
}
</style>
</head>
<body>
	<div class="l_err" style="width: 100%; margin-top: 2px;"></div>
	<form id="form" name="form" class="form-horizontal" method="post"
		action="${ctx}/workshop/workcenter_addEntity.shtml">
		<section class="panel panel-default">
		<div class="panel-body">	
			<div class="form-group">
				<label class="col-sm-3 control-label">所属站点</label>
				<div class="col-sm-9">
					<input type="text" class="form-control" placeholder="请输入所属站点"
						name="workcenterFormMap.site" id="site" value="${sessionScope.site }" readonly>
				</div>
			</div>
			<div class="line line-dashed line-lg pull-in"></div>
			<div class="form-group">
				<label class="col-sm-3 control-label">工作中心编号</label>
				<div class="col-sm-9">
					<input type="text" class="form-control checkabh"
						placeholder="请输入工作中心编号" name="workcenterFormMap.workcenter_no" id="workcenter_no">
				</div>
			</div>
			<div class="line line-dashed line-lg pull-in"></div>
			<div class="form-group">
				<label class="col-sm-3 control-label">工作中心名称</label>
				<div class="col-sm-9">
					<input type="text" class="form-control checkName"
						placeholder="请输入工作中心名称" name="workcenterFormMap.workcenter_name" id="workcenter_name">
				</div>
			</div>
			<div class="line line-dashed line-lg pull-in"></div>
			<div class="form-group">
				<label class="col-sm-3 control-label">工作中心描述</label>
				<div class="col-sm-9">
					<input type="text" class="form-control" placeholder="请输入工作中心描述"
						name="workcenterFormMap.workcenter_description" id="workcenter_description">
				</div>
			</div>
			<div class="line line-dashed line-lg pull-in"></div>
			<div class="form-group">
				<label class="col-sm-3 control-label">版本</label>
				<div class="col-sm-9">
					<select class="form-control" name="workcenterFormMap.workcenter_version">
						<option value="A">A</option>
						<option value="B">B</option>
					</select>
				</div>
			</div>
			<div class="line line-dashed line-lg pull-in"></div>
			<div class="form-group">
				<label class="col-sm-3 control-label">工作中心层级</label>
				<div class="col-sm-9">
					<select class="form-control" name="workcenterFormMap.workcenter_class">
						<option value="workshop">车间</option>
						<option value="production_line">生产线</option>
						<option value="station">工位</option>
					</select>
				</div>
			</div>
			<div class="line line-dashed line-lg pull-in"></div>
			<div class="form-group">
				<label class="col-sm-3 control-label">工作中心类型</label>
				<div class="col-sm-9">
					<select class="form-control" name="workcenterFormMap.workcenter_type">
						<option value="assembly">装配</option>
						<option value="schedule">调度</option>
						<option value="ship">装运</option>
						<option value="shift">转移</option>
					</select>
				</div>
			</div>
			<div class="line line-dashed line-lg pull-in"></div>
			<div class="form-group">
				<label class="col-sm-3 control-label">父工作中心</label>
				<div class="col-sm-9">
					<div class="input-group">
						<input type="text" class="form-control" placeholder="请输入父工作中心"
							name="workcenterFormMap.workcenter_parent" id="workcenter_parent">
						<span class="input-group-btn">
							<button class="btn btn-info" id="workorder" type="button"
								style="height: 34px;"
								onclick="getfWorkCenter('workcenter_parent','workcenter_no');">
								<span class="glyphicon glyphicon-search"></span>
							</button>
						</span>
					</div>
				</div>
			</div>
			<div class="line line-dashed line-lg pull-in"></div>
			<div class="form-group">
				<label class="col-sm-3 control-label">是否可用</label>
				<div class="col-sm-9">
					<select class="form-control" name="workcenterFormMap.state">
						<option value="1">是</option>
						<option value="0">否</option>
					</select>
				</div>
			</div>
		</div>
		<footer class="panel-footer text-right bg-light lter">
			<button type="submit" class="btn btn-success btn-s-xs">提交</button>
		</footer> 
		</section>
	</form>
</body>
</html>