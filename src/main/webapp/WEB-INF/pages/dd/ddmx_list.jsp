<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<link href="${pageContext.request.contextPath}/static/js/kindeditor-4.1.10/themes/default/default.css" type="text/css" rel="stylesheet">
<%@include file="../common/head.jsp" %>
<table class="easyui-datagrid" id="ddmxList" title="商品列表"
       data-options="singleSelect:false,collapsible:true,pagination:true,rownumbers:true,url:'${pageContext.request.contextPath}/Dd/listDdmx.do?ddh=${ddh}',
       	method:'get',pageSize:10,fitColumns:true,toolbar:toolbar_ddmx">
    <thead>
        <tr>
        	<th data-options="field:'ck',checkbox:true"></th>
        	<th data-options="field:'mxlsh',align:'center',width:150">订单明细流水号</th>
        	<th data-options="field:'ddh',align:'center',width:150">订单号</th>
        	<th data-options="field:'item_id',align:'center',width:150">商品编号</th>
            <th data-options="field:'item_name',align:'center',width:150">商品名</th>
            <th data-options="field:'lb',align:'center',width:150">商品类别</th>
            <th data-options="field:'sl',align:'center',width:150">商品数量</th>
            <th data-options="field:'dxzje',align:'center',width:150">单项总金额</th>
        </tr>
    </thead>
</table>

<div  id="toolbar_ddmx" style=" height: 38px; padding: 3px 11px; background: #fafafa;">
	
	<%--<c:forEach items="${sessionScope.sysPermissionList}" var="per" >
		<c:if test="${per=='item:add' }" >
		    <div style="float: left;">
		        <a href="#" class="easyui-linkbutton" plain="true" icon="icon-add" onclick="ddmx_add()">新增</a>
		    </div>
		</c:if>
		<c:if test="${per=='item:edit' }" >
		    <div style="float: left;">
		        <a href="#" class="easyui-linkbutton" plain="true" icon="icon-edit" onclick="ddmx_edit()">编辑</a>
		    </div>
		</c:if>
		<c:if test="${per=='item:delete' }" >
		    <div style="float: left;">
		        <a href="#" class="easyui-linkbutton" plain="true" icon="icon-cancel" onclick="ddmx_delete()">删除</a>
		    </div>
		</c:if>
	</c:forEach>--%>
    <div id="search_ddmx" style="padding:3px">
        <%--        <input id="search_text_item" class="easyui-searchbox"
                    data-options="searcher:doSearch_item,prompt:'请输入...',menu:'#menu_item'"
                    style="width:250px;vertical-align: middle;">
                </input>
                <div id="menu_item" style="width:120px">
                    <div data-options="name:'item_id'">商品名</div>
                    <div data-options="name:'item_name'">商品姓名</div>
        &lt;%&ndash;			<div data-options="name:'item_type'">商品类别</div>
                    <div data-options="name:'value_flag'">有效标志</div>&ndash;%&gt;
                </div>--%>
        <span>订单号:</span>
        <input id="ddh" style="line-height:26px;border:1px solid #ccc" readonly="true" value="${ddh}">
        <span>订单明细流水号:</span>
        <input id="mxlsh" style="line-height:26px;border:1px solid #ccc">
        <span>商品编号:</span>
        <input id="item_id" style="line-height:26px;border:1px solid #ccc">
        <span>商品名:</span>
        <input id="item_name" style="line-height:26px;border:1px solid #ccc">
        <span>类别:</span>
        <select id="lb" class="easyui-combobox" name="lb" panelHeight="auto" data-options="width:150,
                        editable:false,required:true">
            <option value="">未选择</option>
            <option value="1">生活用品</option>
            <option value="2">方便速食</option>
            <option value="3">酒水饮品</option>
            <option value="4">家用电器</option>
            <option value="5">除菌防疫</option>
            <option value="6">进口商品</option>
            <option value="7">调味品</option>
        </select>
        <a href="#" class="easyui-linkbutton" plain="true" iconCls="icon-search" onclick="doSearch_ddmx()">查询</a>
    </div>

	<div style="float: left;">
		<a href="#" class="easyui-linkbutton" plain="true" icon="icon-add" onclick="ddmx_add()">添加到订单明细</a>
	</div>
	<div style="float: left;">
		<a href="#" class="easyui-linkbutton" plain="true" icon="icon-edit" onclick="ddmx_edit()">更新订单明细</a>
	</div>
	<div style="float: left;">
		<a href="#" class="easyui-linkbutton" plain="true" icon="icon-cancel" onclick="ddmx_delete()">删除订单明细</a>
	</div>

	<div class="datagrid-btn-separator"></div>  
	
	<div style="float: left;">  
		<a href="#" class="easyui-linkbutton" plain="true" icon="icon-reload" onclick="ddmx_reload()">刷新</a>  
	</div>
</div>

<div id="ddmxEditWindow" class="easyui-window" title="更新明细" data-options="modal:true,closed:true,resizable:true,
	iconCls:'icon-save',href:'${pageContext.request.contextPath}/Dd/ddmxUpdatePage.do'" style="width:45%;height:60%;padding:10px;">
</div>
<div id="ddmxAddWindow" class="easyui-window" title="新增明细" data-options="modal:true,closed:true,resizable:true,
	iconCls:'icon-edit',href:'${pageContext.request.contextPath}/Dd/ddmxAddPage.do?ddh=${ddh}&dgkh=${dgkh}'" style="width:45%;height:60%;padding:10px;">
</div>

<script>
    function doSearch_ddmx(mxlsh,item_id,item_name,lb){ //商品输入商品名,点击搜素,触发此函数
        var item_id=$('#item_id').val();
        var mxlsh=$('#mxlsh').val();
        var item_name=$('#item_name').val();
        var lb=$('#lb').val();
        $("#ddmxList").datagrid({
            title:'商品列表', singleSelect:false, collapsible:true, pagination:true, rownumbers:true, method:'post',
            nowrap:true, toolbar:"toolbar_ddmx", url:'${pageContext.request.contextPath}/Dd/listDdmx.do',
            queryParams: {ddh:${ddh},mxlsh:mxlsh,item_id:item_id, item_name:item_name,lb:lb},
            loadMsg:'数据加载中......', fitColumns:true,
            columns : [ [
                {field:'ck',checkbox:true},
                {field:'mxlsh',align:'center',width:150,title:'订单明细流水号'},
                {field:'ddh',align:'center',width:150,title:'订单号'},
                {field:'item_id',align:'center',width:150,title:'商品编号'},
                {field:'item_name',align:'center',width:150,title:'商品名'},
                {field:'lb',align:'center',width:150,title:'商品类别'},
                {field:'sl',align:'center',width:150,title:'商品数量'},
                {field:'dxzje',align:'center',width:150,title:'单项总金额'}
            ] ],
        });
    }

	//根据index拿到该行值
	function onddmxClickRow(index) {
		var rows = $('#ddmxList').datagrid('getRows');
		return rows[index];
		
	}
	
/*	//格式化角色信息
	function formatRole(value, row, index){
		return "<a href=javascript:openRole("+index+")>"+row.roleName+"</a>";
	};

	//打开角色信息
	function  openRole(index){
		var row = onitemClickRow(index);
		$.get("role/get/"+row.roleId,'',function(data){
			$("#itemRoleWindow").window({
	    		onLoad :function(){
	    			//回显数据
	    			$("#itemRoleEditForm").form("load", data);
	    			itemPermissionInit();
	    		}
	    	}).window("open");
    	});
	};*/
	
    function getddmxSelectionsIds(){
    	var ddmxList = $("#ddmxList");
    	var sels = ddmxList.datagrid("getSelections");
    	var ids = [];
    	for(var i=0;i<sels.length;i++){
    		ids.push(sels[i].mxlsh);
    	}
    	ids = ids.join(","); 
    	
    	return ids;
    }
    
    function ddmx_add(){
    	/*$.get("item/add_judge",'',function(data){
       		if(data.msg != null){
       			$.messager.alert('提示', data.msg);
       		}else{*/
       			$("#ddmxAddWindow").window("open");
       		/*}
       	});*/
    }

    function ddmx_edit(){
    	/*$.get("item/edit_judge",'',function(data){
       		if(data.msg != null){
       			$.messager.alert('提示', data.msg);
       		}else{*/
       			var ids = getddmxSelectionsIds();
            	
            	if(ids.length == 0){
            		$.messager.alert('提示','必须选择一条明细才能编辑!');
            		return ;
            	}
            	if(ids.indexOf(',') > 0){
            		$.messager.alert('提示','只能选择一条明细!');
            		return ;
            	}
            	
            	$("#ddmxEditWindow").window({
            		onLoad :function(){
            			//回显数据
            			var data = $("#ddmxList").datagrid("getSelections")[0];
            			$("#ddmxEditForm").form("load", data);
            		}
            	}).window("open");
       		/*}
       	});*/
    }
    
    function ddmx_delete(){
    	/*$.get("item/delete_judge",'',function(data){
      		if(data.msg != null){
      			$.messager.alert('提示', data.msg);
      		}else{*/
      			var ids = getddmxSelectionsIds();
            	if(ids.length == 0){
            		$.messager.alert('提示','未选中商品!');
            		return ;
            	}
            	$.messager.confirm('确认','确定清空ID为 '+ids+' 的商品吗？',function(r){
            	    if (r){
            	    	var params = {"ids":ids};
                    	$.post("${pageContext.request.contextPath}/Dd/deleteDdMx.do",params, function(data){
                			if(data.status == 200){
                				$.messager.alert('提示','删除商品成功!',undefined,function(){
                					$("#ddmxList").datagrid("reload");
                				});
                			}
                		});
            	    }
            	});
      		/*}
      	});*/
    }
    
    function ddmx_reload(){
    	$("#ddmxList").datagrid("reload");
    }
</script>