<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<link href="${pageContext.request.contextPath}/static/js/kindeditor-4.1.10/themes/default/default.css" type="text/css" rel="stylesheet">
<%@include file="../common/head.jsp" %>
<table class="easyui-datagrid" id="itemList" title="商品列表"
       data-options="singleSelect:false,collapsible:true,pagination:true,rownumbers:true,url:'${pageContext.request.contextPath}/admin/Item/list.do',
       	method:'get',pageSize:10,fitColumns:true,toolbar:toolbar_item">
    <thead>
        <tr>
        	<th data-options="field:'ck',checkbox:true"></th>
        	<th data-options="field:'item_id',align:'center',width:150">商品编号</th>
            <th data-options="field:'item_name',align:'center',width:150">商品名</th>
            <th data-options="field:'lb',align:'center',width:150">商品类别</th>
			<th data-options="field:'zt',align:'center',width:150,formatter:formatItemStatus">商品状态</th>
			<th data-options="field:'ysj',width:150,align:'center'">预售价</th>
			<th data-options="field:'cbj',width:150,align:'center'">成本价</th>
			<th data-options="field:'hy',width:150,align:'center'">货源</th>
			<th data-options="field:'spms',width:150,align:'center'">商品描述</th>
			<th data-options="field:'bz',width:150,align:'center'">备注</th>
        </tr>
    </thead>
</table>

<div  id="toolbar_item" style=" height: 38px; padding: 3px 11px; background: #fafafa;">
	
	<%--<c:forEach items="${sessionScope.sysPermissionList}" var="per" >
		<c:if test="${per=='item:add' }" >
		    <div style="float: left;">
		        <a href="#" class="easyui-linkbutton" plain="true" icon="icon-add" onclick="item_add()">新增</a>
		    </div>
		</c:if>
		<c:if test="${per=='item:edit' }" >
		    <div style="float: left;">
		        <a href="#" class="easyui-linkbutton" plain="true" icon="icon-edit" onclick="item_edit()">编辑</a>
		    </div>
		</c:if>
		<c:if test="${per=='item:delete' }" >
		    <div style="float: left;">
		        <a href="#" class="easyui-linkbutton" plain="true" icon="icon-cancel" onclick="item_delete()">删除</a>
		    </div>
		</c:if>
	</c:forEach>--%>
    <div id="search_item" style="padding:3px">
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
        <span>商品编号:</span>
        <input id="item_id" style="line-height:26px;border:1px solid #ccc">
        <span>商品名:</span>
        <input id="item_name" style="line-height:26px;border:1px solid #ccc">
        <span>类别:</span>
        <select id="lb" class="easyui-combobox" name="item_type" panelHeight="auto" data-options="width:150,
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
        <span>有效标志:</span>
        <select id="zt" class="easyui-combobox" name="value_flag" panelHeight="auto" data-options="width:150,
                        editable:false,required:true">
            <option value="">未选择</option>
            <option value="1">有效商品</option>
            <option value="0">无效商品</option>
        </select>
        <a href="#" class="easyui-linkbutton" plain="true" iconCls="icon-search" onclick="doSearch_item()">查询</a>
    </div>

	<div style="float: left;">
		<a href="#" class="easyui-linkbutton" plain="true" icon="icon-add" onclick="item_add()">新增</a>
	</div>
	<div style="float: left;">
		<a href="#" class="easyui-linkbutton" plain="true" icon="icon-edit" onclick="item_edit()">编辑</a>
	</div>
	<div style="float: left;">
		<a href="#" class="easyui-linkbutton" plain="true" icon="icon-cancel" onclick="item_delete()">删除</a>
	</div>

	<div class="datagrid-btn-separator"></div>  
	
	<div style="float: left;">  
		<a href="#" class="easyui-linkbutton" plain="true" icon="icon-reload" onclick="item_reload()">刷新</a>  
	</div>
</div>  

<div id="itemEditWindow" class="easyui-window" title="编辑商品" data-options="modal:true,closed:true,resizable:true,
	iconCls:'icon-save',href:'${pageContext.request.contextPath}/admin/Item/updateItemPage.do'" style="width:45%;height:60%;padding:10px;">
</div>
<div id="itemAddWindow" class="easyui-window" title="添加商品" data-options="modal:true,closed:true,resizable:true,
	iconCls:'icon-save',href:'${pageContext.request.contextPath}/admin/Item/addItemPage.do'" style="width:45%;height:60%;padding:10px;">
</div>


<script>
function doSearch_item(item_id,item_name,lb,zt){ //商品输入商品名,点击搜素,触发此函数
    var item_id=$('#item_id').val();
    var item_name=$('#item_name').val();
    var lb=$('#lb').val();
    var zt=$('#zt').val();
    $("#itemList").datagrid({
        title:'商品列表', singleSelect:false, collapsible:true, pagination:true, rownumbers:true, method:'post',
        nowrap:true, toolbar:"toolbar_item", url:'${pageContext.request.contextPath}/admin/Item/list.do',
        queryParams: {item_id:item_id, item_name:item_name,lb:lb,zt:zt},
        loadMsg:'数据加载中......', fitColumns:true,
        columns : [ [
            {field : 'ck', checkbox:true },
            {field : 'item_id', width : 100, align:'center', title : '商品编号'},
            {field : 'item_name', width : 150, align : 'center', title : '商品名'},
            {field : 'lb', width : 150, align : 'center', title : '类别'},
            {field : 'zt', width : 150, title : '类型', align:'center',formatter:formatItemStatus},
            {field : 'ysj', width : 150, title : '预售价', align:'center'},
            {field : 'cbj', width : 150, title : '成本价', align:'center'},
            {field : 'hy', width : 150, title : '货源', align:'center'},
            {field : 'spms', width : 150, title : '商品描述', align:'center'},
            {field : 'bz', width : 150, title : '备注', align:'center'}
        ] ],
    });
}

function formatItemStatus(value){
        if (value == 1){
            return '有效商品';
        }else if(value == 0){
        	return '<span style="color:red;">无效商品</span>';
        }else {
        	return '<span style="color:#E5B717;">未知状态商品</span>';
        }
    }
	
	//根据index拿到该行值
	function onitemClickRow(index) {
		var rows = $('#itemList').datagrid('getRows');
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
	
    function getitemSelectionsIds(){
    	var itemList = $("#itemList");
    	var sels = itemList.datagrid("getSelections");
    	var ids = [];
    	for(var i=0;i<sels.length;i++){
    		ids.push(sels[i].item_id);
    	}
    	ids = ids.join(","); 
    	
    	return ids;
    }
    
    function item_add(){
    	/*$.get("item/add_judge",'',function(data){
       		if(data.msg != null){
       			$.messager.alert('提示', data.msg);
       		}else{*/
       			$("#itemAddWindow").window("open");
       		/*}
       	});*/
    }
    
    function item_edit(){
    	/*$.get("item/edit_judge",'',function(data){
       		if(data.msg != null){
       			$.messager.alert('提示', data.msg);
       		}else{*/
       			var ids = getitemSelectionsIds();
            	
            	if(ids.length == 0){
            		$.messager.alert('提示','必须选择一个商品才能编辑!');
            		return ;
            	}
            	if(ids.indexOf(',') > 0){
            		$.messager.alert('提示','只能选择一个商品!');
            		return ;
            	}
            	
            	$("#itemEditWindow").window({
            		onLoad :function(){
            			//回显数据
            			var data = $("#itemList").datagrid("getSelections")[0];
            			$("#itemEditForm").form("load", data);
            		}
            	}).window("open");
       		/*}
       	});*/
    }
    
    function item_delete(){
    	/*$.get("item/delete_judge",'',function(data){
      		if(data.msg != null){
      			$.messager.alert('提示', data.msg);
      		}else{*/
      			var ids = getitemSelectionsIds();
            	if(ids.length == 0){
            		$.messager.alert('提示','未选中商品!');
            		return ;
            	}
            	$.messager.confirm('确认','确定删除ID为 '+ids+' 的商品吗？',function(r){
            	    if (r){
            	    	var params = {"ids":ids};
                    	$.post("${pageContext.request.contextPath}/admin/Item/deleteItem.do",params, function(data){
                			if(data.status == 200){
                				$.messager.alert('提示','删除商品成功!',undefined,function(){
                					$("#itemList").datagrid("reload");
                				});
                			}
                		});
            	    }
            	});
      		/*}
      	});*/
    }
    
    function item_reload(){
    	$("#itemList").datagrid("reload");
    }
</script>