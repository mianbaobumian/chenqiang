<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link href="${pageContext.request.contextPath}/static/js/kindeditor-4.1.10/themes/default/default.css" type="text/css" rel="stylesheet">

<link href="${pageContext.request.contextPath}/static/css/uploadfile.css" rel="stylesheet">
<script src="${pageContext.request.contextPath}/static/js/jquery.uploadfile.js"></script>

<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/static/js/kindeditor-4.1.10/kindeditor-all-min.js"></script>
<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/static/js/kindeditor-4.1.10/lang/zh_CN.js"></script>

<div style="padding:10px 10px 10px 10px">
	<form id="ddmxAddForm" class="cgForm" method="post">
		<table cellpadding="5" >
			<tr>
				<td>商品名:</td>
				<td colspan="10">
					<input id="cg" class="easyui-combogrid" name="item_id" data-options="required:true"/>
					<input type="hidden" id="hdKeyword" />
				</td>
			</tr>
			<tr>
				<td>数量:</td>
				<td colspan="10">
					<input class="easyui-numberspinner" style="width:80px;" id="sl" name="sl" data-options="required:true"/>
				</td>
                <td><input type="hidden" id="ddh" name="ddh" value=${ddh}></td>
                <td><input type="hidden" id="dgkh" name="dgkh" value=${dgkh}></td>
			</tr>
			<%--<tr>
				<td>采购单价:</td>
				<td colspan="10">
					<input class="easyui-numberspinner" style="width:80px;" id="cgdj" name="cgdj"/>
				</td>
			</tr>--%>
		</table>
	</form>
	<div style="padding:5px">
		<a href="javascript:void(0)" class="easyui-linkbutton" onclick="submitddmxAddForm()">提交</a>
		<a href="javascript:void(0)" class="easyui-linkbutton" onclick="clearddmxAddForm()">重置</a>
	</div>
</div>
<script type="text/javascript">
	//提交表单
	function submitddmxAddForm(){
		//有效性验证
		if(!$('#ddmxAddForm').form('validate')){
			$.messager.alert('提示','表单还未填写完成!');
			return ;
		}

		//ajax的post方式提交表单
		//$("#userAddForm").serialize()将表单序列号为key-value形式的字符串
		$.post("${pageContext.request.contextPath}/Dd/addDdmx.do",$("#ddmxAddForm").serialize(), function(data){
			if(data.status == 200){
				$.messager.alert('提示', data.msg);
				clearddmxAddForm();
				$("#ddmxAddWindow").window('close');
				$("#ddmxList").datagrid("reload");
			}else{
				$.messager.alert('提示', data.msg);
			}
		});
	}

	function clearddmxAddForm(){
		$('#ddmxAddForm').form('reset');
	}

	$(function () {
		$('#cg').combogrid({
			width:400,
			panelWidth: 450,
			idField: 'item_id',        //ID字段
			textField: 'item_name',    //显示的字段
			url: "${pageContext.request.contextPath}/Kc/list.do",
			fitColumns: true,
			striped: true,
			editable: true,
			pagination: true,           //是否分页
			rownumbers: true,           //序号
			collapsible: false,         //是否可折叠的
			fit: true,                  //自动大小
			method: 'post',
			columns: [[
				{ field: 'item_id', title: '商品编号', width: 100,hidden: true },
				{ field: 'item_name', title: '商品名', width: 200 },
				{ field: 'lb', title: '商品类别', width: 100},
				{ field: 'kcs', title: '库存数', width: 200},
			]],
			keyHandler: {
				up: function () {               //【向上键】押下处理
					//取得选中行
					var selected = $('#cg').combogrid('grid').datagrid('getSelected');
					if (selected) {
						//取得选中行的rowIndex
						var index = $('#cg').combogrid('grid').datagrid('getRowIndex', selected);
						//向上移动到第一行为止
						if (index > 0) {
							$('#cg').combogrid('grid').datagrid('selectRow', index - 1);
						}
					} else {
						var rows = $('#cg').combogrid('grid').datagrid('getRows');
						$('#cg').combogrid('grid').datagrid('selectRow', rows.length - 1);
					}
				},
				down: function () {             //【向下键】押下处理
					//取得选中行
					var selected = $('#cg').combogrid('grid').datagrid('getSelected');
					if (selected) {
						//取得选中行的rowIndex
						var index = $('#cg').combogrid('grid').datagrid('getRowIndex', selected);
						//向下移动到当页最后一行为止
						if (index < $('#cg').combogrid('grid').datagrid('getData').rows.length - 1) {
							$('#cg').combogrid('grid').datagrid('selectRow', index + 1);
						}
					} else {
						$('#cg').combogrid('grid').datagrid('selectRow', 0);
					}
				},
				enter: function () {             //【回车键】押下处理
					//选中后让下拉表格消失
					$('#cg').combogrid('hidePanel');
				},
				query: function (keyword) {     //【动态搜索】处理
					//设置查询参数
					var queryParams = $('#cg').combogrid("grid").datagrid('options').queryParams;
					queryParams.item_name = keyword;
					$('#cg').combogrid("grid").datagrid('options').queryParams = queryParams;
					//重新加载
					$('#cg').combogrid("grid").datagrid("reload");

					$('#cg').combogrid("setValue", keyword);
					//将查询条件存入隐藏域
					$('#hdKeyword').val(keyword);
				}
			}/*,
			onSelect: function () {              //选中处理
				$('#txtGender').val($('#cg').combogrid('grid').datagrid('getSelected').Gender);
			}*/
		});

		//取得分页组件对象
		var pager = $('#cg').combogrid('grid').datagrid('getPager');

		if (pager) {
			$(pager).pagination({
				pageSize: 10,               //每页显示的记录条数，默认为10
				pageList: [10, 5, 3],       //可以设置每页记录条数的列表
				beforePageText: '第',       //页数文本框前显示的汉字
				afterPageText: '页    共 {pages} 页',
				displayMsg: '当前显示 {from} - {to} 条记录   共 {total} 条记录',
				//选择页的处理
				onSelectPage: function (pageNumber, pageSize) {
					//按分页的设置取数据
					getData(pageNumber, pageSize);
					//设置表格的pageSize属性，表格变化时按分页组件设置的pageSize显示数据
					$('#cg').combogrid("grid").datagrid('options').pageSize = pageSize;
					//将隐藏域中存放的查询条件显示在combogrid的文本框中
					$('#cg').combogrid("setValue", $('#hdKeyword').val());
				},
				//改变页显示条数的处理
				//（处理后还是走onSelectPage事件，所以设置也写到onSelectPage事件中了）
				onChangePageSize: function () { },
				//点击刷新的处理
				onRefresh: function (pageNumber, pageSize) {
					//按分页的设置取数据
					getData(pageNumber, pageSize);
					//将隐藏域中存放的查询条件显示在combogrid的文本框中
					$('#cg').combogrid("setValue", $('#hdKeyword').val());
				}
			});
		}

		var getData = function (page, rows) {
			$.ajax({
				type: "POST",
				url: "${pageContext.request.contextPath}/Kc/list.do",
				data: "page=" + page + "&rows=" + rows + "&item_name=" + $('#hdKeyword').val(),
				error: function (XMLHttpRequest, textStatus, errorThrown) {
					alert(textStatus);
					$.messager.progress('close');
				},
				success: function (data) {
					$('#cg').combogrid('grid').datagrid('loadData', data);
				}
			});
		};
	});
</script>