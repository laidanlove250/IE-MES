var pageii = null;
var grid = null;
$(function() {

	grid = lyGrid({
		pagId : 'paging',
		l_column : [ {
			colkey : "id",
			name : "id"
		}, {
			colkey : "site",
			name : "站点编号"
		}, {
			colkey : "pod_function_no",
			name : "pod功能编号"
		}, {
			colkey : "pod_function_name",
			name : "pod功能名称"
		}, {
			colkey : "pod_function_url",
			name : "pod功能路径"
		}, {
			colkey : "create_time",
			name : "创建时间",
			renderData : function(rowindex,data, rowdata, column) {
				return new Date(data).format("yyyy-MM-dd hh:mm:ss");
			}
		}, {
			colkey : "by_user",
			name : "创建人"
		}],
		jsonUrl : rootPath + '/produce/pod_function_findPage.shtml',
		dymCol:true,
		checkbox : true,
		serNumber : false
	});

	$("#addFun").click("click", function() {
		addAccount();
	});
	$("#editFun").click("click", function() {
		editAccount();
	});
	$("#delFun").click("click", function() {
		delAccount();
	});
	$("#search").click("click", function() {
		var searchParams = $("#searchForm").serializeJson();
		grid.setOptions({
			data : searchParams
		});
	});
});
function editAccount() {
	var cbox = grid.getSelectedCheckbox();
	if (cbox.length > 1 || cbox == "") {
		layer.msg("只能选中一个");
		return;
	}
	pageii = layer.open({
		title : "编辑",
		type : 2,
		area : [ "50%", "60%" ],
		content : rootPath + '/produce/pod_function_editUI.shtml?id=' + cbox
	});
}
function addAccount() {
	pageii = layer.open({
		title : "新增",
		type : 2,
		area : [ "50%", "60%" ],
		content : rootPath + '/produce/pod_function_addUI.shtml'
	});
}
function delAccount() {
	var cbox = grid.getSelectedCheckbox();
	if (cbox == "") {
		layer.msg("请选择删除项！！");
		return;
	}
	layer.confirm('是否删除？', function(index) {
		var url = rootPath + '/produce/pod_function_deleteEntity.shtml';
		var s = CommnUtil.ajax(url, {
			ids : cbox.join(",")
		}, "json");
		if (s == "success") {
			layer.msg('删除成功');
			grid.loadData();
		} else {
			layer.msg('删除失败');
		}
	});
}