<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link href="${pageContext.request.contextPath}/static/js/kindeditor-4.1.10/themes/default/default.css" type="text/css" rel="stylesheet">

<link href="${pageContext.request.contextPath}/static/css/uploadfile.css" rel="stylesheet">
<script src="${pageContext.request.contextPath}/static/js/jquery.uploadfile.js"></script>

<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/static/js/kindeditor-4.1.10/kindeditor-all-min.js"></script>
<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/static/js/kindeditor-4.1.10/lang/zh_CN.js"></script>

<div style="padding:10px 10px 10px 10px">
	<form id="skjlEditForm" class="skjlForm" method="post">
		<table cellpadding="5" >
			<tr>
				<td>收款流水号:</td>
				<td colspan="10">
					<input id="sklsh"  name="sklsh" data-options="required:true" readonly="true"/>
				</td>
			</tr>
			<tr>
				<td>订单号:</td>
				<td colspan="10">
					<input id="ddh"  name="ddh" data-options="required:true" readonly="true"/>
				</td>
			</tr>
			<tr>
				<td>收款总金额:</td>
				<td colspan="10">
					<input id="skzje" name="skzje" data-options="required:true"/>
				</td>
			</tr>
            <tr>
                <td>收款时间:</td>
                <td colspan="10">
                    <input class="easyui-datebox" id="sksj" name="sksj" style="width:120px" data-options="formatter:myformatter,required:true">
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
		<a href="javascript:void(0)" class="easyui-linkbutton" onclick="submitskjlEditForm()">提交</a>
		<a href="javascript:void(0)" class="easyui-linkbutton" onclick="clearskjlEditForm()">重置</a>
	</div>
</div>
<script type="text/javascript">
	//提交表单
	function submitskjlEditForm(){
		//有效性验证
		if(!$('#skjlEditForm').form('validate')){
			$.messager.alert('提示','表单还未填写完成!');
			return ;
		}

		//ajax的post方式提交表单
		//$("#userAddForm").serialize()将表单序列号为key-value形式的字符串
		$.post("${pageContext.request.contextPath}/Jsjl/updateSkjl.do",$("#skjlEditForm").serialize(), function(data){
			if(data.status == 200){
				$.messager.alert('提示', data.msg);
				clearskjlEditForm();
				$("#skjlEditWindow").window('close');
				$("#skjlList").datagrid("reload");
			}else{
				$.messager.alert('提示', data.msg);
			}
		});
	}

	function clearskjlEditForm(){
		$('#skjlEditForm').form('reset');
	}

    function myformatter(date){
        var y = date.getFullYear();
        var m = date.getMonth()+1;
        var d = date.getDate();
        return y+'-'+(m<10?('0'+m):m)+'-'+(d<10?('0'+d):d);
    }
</script>