<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link href="${pageContext.request.contextPath}/static/js/kindeditor-4.1.10/themes/default/default.css" type="text/css" rel="stylesheet">

<link href="${pageContext.request.contextPath}/static/css/uploadfile.css" rel="stylesheet">
<script src="${pageContext.request.contextPath}/static/js/jquery.uploadfile.js"></script>

<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/static/js/kindeditor-4.1.10/kindeditor-all-min.js"></script>
<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/static/js/kindeditor-4.1.10/lang/zh_CN.js"></script>

<div style="padding:10px 10px 10px 10px">
	<form id="userAddForm" class="userForm" method="post">
	    <table cellpadding="5" >
	        <tr>
	            <td>用户名:</td>
	            <td>
	            	<input id="user_id" class="easyui-textbox" type="text" name="user_id" data-options="required:true"/>
	            </td>
	        </tr>
	        <tr>
	            <td>用户姓名:</td>
	            <td>
	            	<input id="user_name" class="easyui-textbox" type="text" name="user_name"
						   data-options="required:true"/>
	            </td>
	        </tr>
	        <tr>
	            <td>用户密码:</td>
	            <td>
	            	<input class="easyui-textbox" type="text" name="user_password" data-options="required:true"/>
	            </td>
	        </tr>
	        <tr>
	            <td>用户类型:</td>
	            <td>
					<select class="easyui-combobox" name="user_type" panelHeight="auto" data-options="width:150,
		            		editable:false,required:true">
						<option value="1">订货方</option>
						<option value="2">管理人员</option>
					</select>
	            </td>
	        </tr>
	        <tr>
	            <td>用户状态:</td>
	            <td>
		            <select class="easyui-combobox" name="value_flag" panelHeight="auto" data-options="width:150,
		            		editable:false,required:true">
						<option value="1">有效用户</option>
						<option value="0">无效用户</option>
					</select>
				</td>
	        </tr>
	    </table>
	</form>
	<div style="padding:5px">
	    <a href="javascript:void(0)" class="easyui-linkbutton" onclick="submitUserAddForm()">提交</a>
	    <a href="javascript:void(0)" class="easyui-linkbutton" onclick="clearUserAddForm()">重置</a>
	</div>
</div>
<script type="text/javascript">
	//提交表单
	function submitUserAddForm(){
		//有效性验证
		if(!$('#userAddForm').form('validate')){
			$.messager.alert('提示','表单还未填写完成!');
			return ;
		}
		
		//ajax的post方式提交表单
		//$("#userAddForm").serialize()将表单序列号为key-value形式的字符串
		$.post("${pageContext.request.contextPath}/admin/User/addUser.do",$("#userAddForm").serialize(), function(data){
			if(data.status == 200){
				$.messager.alert('提示', data.msg);
				clearUserAddForm();
				$("#userAddWindow").window('close');
				$("#userList").datagrid("reload");
			}else{
				$.messager.alert('提示', data.msg);
			}
		});
	}
	
	function clearUserAddForm(){
		$('#userAddForm').form('reset');
	}
</script>
