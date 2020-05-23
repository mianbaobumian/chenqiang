<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link href="${pageContext.request.contextPath}/static/js/kindeditor-4.1.10/themes/default/default.css" type="text/css" rel="stylesheet">

<link href="${pageContext.request.contextPath}/static/css/uploadfile.css" rel="stylesheet">
<script src="${pageContext.request.contextPath}/static/js/jquery.uploadfile.js"></script>

<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/static/js/kindeditor-4.1.10/kindeditor-all-min.js"></script>
<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/static/js/kindeditor-4.1.10/lang/zh_CN.js"></script>

<div style="padding:10px 10px 10px 10px">
	<form id="skjlAddForm" class="skjlForm" method="post">
		<table cellpadding="5" >
			<tr>
				<td>订单号:</td>
				<td colspan="10">
					<input id="ddh"  name="ddh" data-options="required:true"/>
				</td>
			</tr>
			<tr>
				<td>收款总金额:</td>
				<td colspan="10">
					<input id="skzje" name="skzje" data-options="required:true"/>
				</td>
			</tr>

			<tr>
				<td>收款方式：</td>
				<td colspan="10">
					<select id="skfs" value='1' class="easyui-combobox" name="skfs" panelHeight="auto" data-options="width:150,
                        editable:false,required:true">
						<option value="1">银行转账</option>
						<option value="2">支付宝收款</option>
					</select>
				</td>
				<td><input type="hidden" id="skr" name="ddh" value=${user.user_id}></td>
			</tr>
		</table>
	</form>
	<div style="padding:5px">
		<a href="javascript:void(0)" class="easyui-linkbutton" onclick="submitskjlAddForm()">提交</a>
		<a href="javascript:void(0)" class="easyui-linkbutton" onclick="clearskjlAddForm()">重置</a>
	</div>
</div>
<script type="text/javascript">
	//提交表单
	function submitskjlAddForm(){
		//有效性验证
		if(!$('#skjlAddForm').form('validate')){
			$.messager.alert('提示','表单还未填写完成!');
			return ;
		}

		//ajax的post方式提交表单
		//$("#userAddForm").serialize()将表单序列号为key-value形式的字符串
		$.post("${pageContext.request.contextPath}/Jsjl/addSkjl.do",$("#skjlAddForm").serialize(), function(data){
			if(data.status == 200){
				$.messager.alert('提示', data.msg);
				clearskjlAddForm();
				$("#skjlAddWindow").window('close');
				$("#skjlList").datagrid("reload");
			}else{
				$.messager.alert('提示', data.msg);
			}
		});
	}

	function clearskjlAddForm(){
		$('#skjlAddForm').form('reset');
	}
</script>