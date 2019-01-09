$(function() {
	$("form").validate({
		submitHandler : function(form) {// 必须写在验证前面，否则无法ajax提交
			ly.ajaxSubmit(form, {// 验证新增是否成功
				type : "post",
				dataType : "json",
				success : function(data) {
					var rs = JSON.parse(data);
					if (rs.result == "success") {
						if (CommnUtil.notNull(rs.score)) {
							layer.alert('恭喜你，添加成功，本次操作得分：'+rs.score+"，是否关闭窗口？", {
							    skin: 'layui-layer-molv' //样式类名  自定义样式
							    ,closeBtn: 1    // 是否显示关闭按钮
							    ,anim: 1 //动画类型
							    ,btn: ['关闭','取消'] //按钮
							    ,icon: 6    // icon
							    ,yes:function(){
							    	parent.grid.loadData();
									parent.layer.close(parent.pageii);
									return false;
							    }
							    ,btn2:function(){
							    	
						    }});
							
						}else {
							layer.confirm('添加成功!是否关闭窗口?', function(index) {
								parent.grid.loadData();
								parent.layer.close(parent.pageii);
								return false;
							});
						}
						$("#form")[0].reset();
					} else {
						layer.alert('添加失败！', 3);
					}
				}
			});
		},
		rules : {
			"itemFormMap.item_no" : {
				required : true,				
			},
			"itemFormMap.item_name" : {
				required : true,				
			},
			"itemFormMap.item_desc" : {
				required : true,				
			}
		},
		messages : {
			"itemFormMap.item_no" : {
				required : "请输入物料编号",
			},
			"itemFormMap.item_name" : {
				required : "请输入物料名称",
			},
			"itemFormMap.item_desc" : {
				required : "请输入物料描述",		
			}
		},
		errorPlacement : function(error, element) {// 自定义提示错误位置
			$(".l_err").css('display', 'block');
			// element.css('border','3px solid #FFCCCC');
			$(".l_err").html(error.html());
		},
		success : function(label) {// 验证通过后
			$(".l_err").css('display', 'none');
		}
	});
});
