<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<link href="${pageContext.request.contextPath}/static/js/kindeditor-4.1.10/themes/default/default.css" type="text/css" rel="stylesheet">
<%@include file="../common/head.jsp" %>
<table class="easyui-datagrid" id="userList" title="用户列表" 
       data-options="singleSelect:false,collapsible:true,pagination:true,rownumbers:true,url:'${pageContext.request.contextPath}/admin/User/list.do',
       	method:'get',pageSize:10,fitColumns:true,toolbar:toolbar_user">
    <thead>
        <tr>
        	<th data-options="field:'ck',checkbox:true"></th>
        	<th data-options="field:'user_id',align:'center',width:150">用户名</th>
            <th data-options="field:'user_name',align:'center',width:150">用户姓名</th>
            <th data-options="field:'user_password',align:'center',width:150">用户密码</th>
			<th data-options="field:'user_type',align:'center',width:150">用户类型</th>
			<th data-options="field:'value_flag',width:150,align:'center',formatter:formatUserStatus">用户状态</th>
        </tr>
    </thead>
</table>

<div  id="toolbar_user" style=" height: 38px; padding: 3px 11px; background: #fafafa;">
	
	<%--<c:forEach items="${sessionScope.sysPermissionList}" var="per" >
		<c:if test="${per=='user:add' }" >
		    <div style="float: left;">
		        <a href="#" class="easyui-linkbutton" plain="true" icon="icon-add" onclick="user_add()">新增</a>
		    </div>
		</c:if>
		<c:if test="${per=='user:edit' }" >
		    <div style="float: left;">
		        <a href="#" class="easyui-linkbutton" plain="true" icon="icon-edit" onclick="user_edit()">编辑</a>
		    </div>
		</c:if>
		<c:if test="${per=='user:delete' }" >
		    <div style="float: left;">
		        <a href="#" class="easyui-linkbutton" plain="true" icon="icon-cancel" onclick="user_delete()">删除</a>
		    </div>
		</c:if>
	</c:forEach>--%>
    <div id="search_user" style="padding:3px">
        <%--        <input id="search_text_user" class="easyui-searchbox"
                    data-options="searcher:doSearch_user,prompt:'请输入...',menu:'#menu_user'"
                    style="width:250px;vertical-align: middle;">
                </input>
                <div id="menu_user" style="width:120px">
                    <div data-options="name:'user_id'">用户名</div>
                    <div data-options="name:'user_name'">用户姓名</div>
        &lt;%&ndash;			<div data-options="name:'user_type'">用户类别</div>
                    <div data-options="name:'value_flag'">有效标志</div>&ndash;%&gt;
                </div>--%>
        <span>用户名:</span>
        <input id="user_id" style="line-height:26px;border:1px solid #ccc">
        <span>用户姓名:</span>
        <input id="user_name" style="line-height:26px;border:1px solid #ccc">
        <span>用户类别:</span>
        <select id="user_type" class="easyui-combobox" name="user_type" panelHeight="auto" data-options="width:150,
                        editable:false,required:true">
            <option value="">未选择</option>
            <option value="1">订货方</option>
            <option value="2">管理人员</option>
        </select>
        <span>有效标志:</span>
        <select id="value_flag" class="easyui-combobox" name="value_flag" panelHeight="auto" data-options="width:150,
                        editable:false,required:true">
            <option value="">未选择</option>
            <option value="1">有效用户</option>
            <option value="0">无效用户</option>
        </select>
        <a href="#" class="easyui-linkbutton" plain="true" iconCls="icon-search" onclick="doSearch_user()">查询</a>
    </div>

	<div style="float: left;">
		<a href="#" class="easyui-linkbutton" plain="true" icon="icon-add" onclick="user_add()">新增</a>
	</div>
	<div style="float: left;">
		<a href="#" class="easyui-linkbutton" plain="true" icon="icon-edit" onclick="user_edit()">编辑</a>
	</div>
	<div style="float: left;">
		<a href="#" class="easyui-linkbutton" plain="true" icon="icon-cancel" onclick="user_delete()">删除</a>
	</div>

	<div class="datagrid-btn-separator"></div>  
	
	<div style="float: left;">  
		<a href="#" class="easyui-linkbutton" plain="true" icon="icon-reload" onclick="user_reload()">刷新</a>  
	</div>
</div>  

<div id="userEditWindow" class="easyui-window" title="编辑用户" data-options="modal:true,closed:true,resizable:true,
	iconCls:'icon-save',href:'${pageContext.request.contextPath}/admin/User/updateUserPage.do'" style="width:45%;height:60%;padding:10px;">
</div>
<div id="userAddWindow" class="easyui-window" title="添加用户" data-options="modal:true,closed:true,resizable:true,
	iconCls:'icon-save',href:'${pageContext.request.contextPath}/admin/User/addUserPage.do'" style="width:45%;height:60%;padding:10px;">
</div>


<script>
function doSearch_user(user_id,user_name,user_type,value_flag){ //用户输入用户名,点击搜素,触发此函数
    var user_id=$('#user_id').val();
    var user_name=$('#user_name').val();
    var user_type=$('#user_type').val();
    var value_flag=$('#value_flag').val();
    $("#userList").datagrid({
        title:'用户列表', singleSelect:false, collapsible:true, pagination:true, rownumbers:true, method:'post',
        nowrap:true, toolbar:"toolbar_user", url:'${pageContext.request.contextPath}/admin/User/list.do',
        queryParams: {user_id:user_id, user_name:user_name,user_type:user_type,value_flag:value_flag},
        loadMsg:'数据加载中......', fitColumns:true,
        columns : [ [
            {field : 'ck', checkbox:true },
            {field : 'user_id', width : 150, align:'center', title : '用户名'},
            {field : 'user_name', width : 150, align : 'center', title : '用户姓名'},
            {field : 'user_password', width : 150, align : 'center', title : '用户密码'},
            {field : 'user_type', width : 150, title : '用户类型', align:'center'},
            {field : 'value_flag', width : 150, title : '用户状态', align:'center', formatter:formatUserStatus}
        ] ],
    });
}

function formatUserStatus(value){
        if (value == 1){
            return '有效用户';
        }else if(value == 0){
        	return '<span style="color:red;">无效用户</span>';
        }else {
        	return '<span style="color:#E5B717;">未知状态用户</span>';
        }
    }
	
	//根据index拿到该行值
	function onUserClickRow(index) {
		var rows = $('#userList').datagrid('getRows');
		return rows[index];
		
	}
	
/*	//格式化角色信息
	function formatRole(value, row, index){
		return "<a href=javascript:openRole("+index+")>"+row.roleName+"</a>";
	};

	//打开角色信息
	function  openRole(index){
		var row = onUserClickRow(index);
		$.get("role/get/"+row.roleId,'',function(data){
			$("#userRoleWindow").window({
	    		onLoad :function(){
	    			//回显数据
	    			$("#userRoleEditForm").form("load", data);
	    			userPermissionInit();
	    		}
	    	}).window("open");
    	});
	};*/
	
	function submitUserRoleEditForm(){
		if(!$('#userRoleEditForm').form('validate')){
			$.messager.alert('提示','表单还未填写完成!');
			return ;
		}
	
		if($("input[name='permissionOption3']:checked").length>0){
			var permission = '';
			$("input[name='permissionOption3']:checked").each(function(){
				permission += $(this).val()+',';
			}); 
			$("#userRoleEditForm [name=permission]").val(permission);
		}
		$.post("role/update_all",$("#userRoleEditForm").serialize(), function(data){
			if(data.label == 200){
				$.messager.alert('提示', data.msg);
				$("#userRoleInfo").dialog("close");
			}else{
				$.messager.alert('提示', data.msg);
			}
		});
	}
	
    function getUserSelectionsIds(){
    	var userList = $("#userList");
    	var sels = userList.datagrid("getSelections");
    	var ids = [];
    	for(var i=0;i<sels.length;i++){
    		ids.push(sels[i].user_id);
    	}
    	ids = ids.join(","); 
    	
    	return ids;
    }
    
    function user_add(){
    	/*$.get("user/add_judge",'',function(data){
       		if(data.msg != null){
       			$.messager.alert('提示', data.msg);
       		}else{*/
       			$("#userAddWindow").window("open");
       		/*}
       	});*/
    }
    
    function user_edit(){
    	/*$.get("user/edit_judge",'',function(data){
       		if(data.msg != null){
       			$.messager.alert('提示', data.msg);
       		}else{*/
       			var ids = getUserSelectionsIds();
            	
            	if(ids.length == 0){
            		$.messager.alert('提示','必须选择一个用户才能编辑!');
            		return ;
            	}
            	if(ids.indexOf(',') > 0){
            		$.messager.alert('提示','只能选择一个用户!');
            		return ;
            	}
            	
            	$("#userEditWindow").window({
            		onLoad :function(){
            			//回显数据
            			var data = $("#userList").datagrid("getSelections")[0];
            			$("#userEditForm").form("load", data);
            		}
            	}).window("open");
       		/*}
       	});*/
    }
    
    function user_delete(){
    	/*$.get("user/delete_judge",'',function(data){
      		if(data.msg != null){
      			$.messager.alert('提示', data.msg);
      		}else{*/
      			var ids = getUserSelectionsIds();
            	if(ids.length == 0){
            		$.messager.alert('提示','未选中用户!');
            		return ;
            	}
            	$.messager.confirm('确认','确定删除ID为 '+ids+' 的用户吗？',function(r){
            	    if (r){
            	    	var params = {"ids":ids};
                    	$.post("${pageContext.request.contextPath}/admin/User/deleteUser.do",params, function(data){
                			if(data.status == 200){
                				$.messager.alert('提示','删除用户成功!',undefined,function(){
                					$("#userList").datagrid("reload");
                				});
                			}
                		});
            	    }
            	});
      		/*}
      	});*/
    }
    
    function user_reload(){
    	$("#userList").datagrid("reload");
    }
</script>