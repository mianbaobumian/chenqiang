<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link href="${pageContext.request.contextPath}/static/js/kindeditor-4.1.10/themes/default/default.css" type="text/css" rel="stylesheet">

<link href="${pageContext.request.contextPath}/static/css/uploadfile.css" rel="stylesheet">
<script src="${pageContext.request.contextPath}/static/js/jquery.uploadfile.js"></script>

<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/static/js/kindeditor-4.1.10/kindeditor-all-min.js"></script>
<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/static/js/kindeditor-4.1.10/lang/zh_CN.js"></script>

<div style="padding:10px 10px 10px 10px">
	<form id="itemEditForm" class="itemForm" method="post">
		<input type="hidden" name="id"/>
	    <table cellpadding="5">
			<tr>
				<td>商品编号:</td>
				<td>
					<input id="item_id" class="easyui-textbox" type="text" name="item_id" data-options="required:true" readonly="readonly"/>
				</td>
			</tr>
			<tr>
				<td>商品名:</td>
				<td>
					<input id="item_name" class="easyui-textbox" type="text" name="item_name"
						   data-options="required:true"/>
				</td>
			</tr>
			<tr>
				<td>商品类型:</td>
				<td>
					<select id="lb" class="easyui-combobox" name="lb" panelHeight="auto" data-options="width:150,
                        editable:false,required:true">
						<option value="1">生活用品</option>
						<option value="2">方便速食</option>
						<option value="3">酒水饮品</option>
						<option value="4">家用电器</option>
						<option value="5">除菌防疫</option>
						<option value="6">进口商品</option>
						<option value="7">调味品</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>商品状态:</td>
				<td>
					<select id="zt" class="easyui-combobox" name="zt" panelHeight="auto" data-options="width:150,
                        editable:false,required:true">
						<option value="1">有效商品</option>
						<option value="0">无效商品</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>预售价:</td>
				<td>
					<input class="easyui-textbox" type="text" name="ysj" data-options="required:true"/>
				</td>
			</tr>
			<tr>
				<td>成本价:</td>
				<td>
					<input class="easyui-textbox" type="text" name="cbj" data-options="required:true"/>
				</td>
			</tr>
			<tr>
				<td>货源:</td>
				<td>
					<input class="easyui-textbox" type="text" name="hy" data-options="required:true"/>
				</td>
			</tr>
			<tr>
				<td>商品描述:</td>
				<td>
					<input class="easyui-textbox" type="text" name="spms" data-options="required:true"/>
				</td>
			</tr>
			<tr>
				<td>备注:</td>
				<td>
					<input class="easyui-textbox" type="text" name="bz" data-options="required:true"/>
				</td>
			</tr>
	    </table>
	</form>
	<div style="padding:5px">
	    <a href="javascript:void(0)" class="easyui-linkbutton" onclick="submitItemEditForm()">提交</a>
	</div>
</div>
<script type="text/javascript">
	function submitItemEditForm(){
		if(!$('#itemEditForm').form('validate')){
			$.messager.alert('提示','表单还未填写完成!');
			return ;
		}
		$.post("${pageContext.request.contextPath}/admin/Item/updateItem.do",$("#itemEditForm").serialize(), function(data){
			if(data.status == 200){
				$.messager.alert('提示', data.msg);
				$("#itemEditWindow").window('close');
				$("#itemList").datagrid("reload");
			}else{
				$.messager.alert('提示', data.msg);
			}
		});
	}
</script>
