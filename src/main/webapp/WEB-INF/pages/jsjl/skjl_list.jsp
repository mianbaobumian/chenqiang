<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<link href="${pageContext.request.contextPath}/static/js/kindeditor-4.1.10/themes/default/default.css" type="text/css" rel="stylesheet">
<%@include file="../common/head.jsp" %>
<table class="easyui-datagrid" id="skjlList" title="收款列表"
       data-options="singleSelect:false,collapsible:true,pagination:true,rownumbers:true,url:'${pageContext.request.contextPath}/Jsjl/listSkjl.do',
       	method:'get',pageSize:10,fitColumns:true,toolbar:toolbar_skjl">
    <thead>
        <tr>
        	<th data-options="field:'ck',checkbox:true"></th>
        	<th data-options="field:'sklsh',align:'center',width:150">收款流水号</th>
        	<th data-options="field:'sksj',align:'center',width:150">收款时间</th>
            <th data-options="field:'ddh',align:'center',width:150">订单号</th>
            <th data-options="field:'ddzje',align:'center',width:150">订单总金额</th>
            <th data-options="field:'skzje',align:'center',width:150">收款总金额</th>
            <th data-options="field:'user_name',align:'center',width:150">客户姓名</th>
            <th data-options="field:'skzt',align:'center',width:150">收款状态</th>
			<th data-options="field:'skr',width:150,align:'center'">收款人</th>
			<th data-options="field:'skfs',width:150,align:'center'">收款方式</th>
        </tr>
    </thead>
</table>

<div  id="toolbar_skjl" style=" height: 72px; padding: 3px 11px; background: #fafafa;">
	
	<%--<c:forEach items="${sessionScope.sysPermissionList}" var="per" >
		<c:if test="${per=='item:add' }" >
		    <div style="float: left;">
		        <a href="#" class="easyui-linkbutton" plain="true" icon="icon-add" onclick="skjl_add()">待审核</a>
		    </div>
		</c:if>
		<c:if test="${per=='item:edit' }" >
		    <div style="float: left;">
		        <a href="#" class="easyui-linkbutton" plain="true" icon="icon-edit" onclick="skjl_edit()">编辑</a>
		    </div>
		</c:if>
		<c:if test="${per=='item:delete' }" >
		    <div style="float: left;">
		        <a href="#" class="easyui-linkbutton" plain="true" icon="icon-cancel" onclick="skjl_delete()">删除</a>
		    </div>
		</c:if>
	</c:forEach>--%>
    <div id="search_skjl" style="padding:3px">
        <%--        <input id="search_text_item" class="easyui-searchbox"
                    data-options="searcher:doSearch_item,prompt:'请输入...',menu:'#menu_item'"
                    style="width:250px;vertical-align: middle;">
                </input>
                <div id="menu_item" style="width:120px">
                    <div data-options="name:'ddh'">商品名</div>
                    <div data-options="name:'user_name'">商品姓名</div>
        &lt;%&ndash;			<div data-options="name:'item_type'">商品类别</div>
                    <div data-options="name:'value_flag'">有效标志</div>&ndash;%&gt;
                </div>--%>
        收款流水号:
        <input id="sklsh" style="line-height:26px;border:1px solid #ccc;width: 120px">
        订单号:
        <input id="ddh" style="line-height:26px;border:1px solid #ccc;width: 120px">
        客户姓名:
        <input id="user_name" style="line-height:26px;border:1px solid #ccc;width: 120px">
        收款状态:
        <select id="skzt" class="easyui-combobox" name="skzt" panelHeight="auto" data-options="width:150,
                        editable:false,required:true">
            <option value="">未选择</option>
            <option value="1">待审核</option>
            <option value="2">已收款</option>
        </select>
    <%--</div>
    <div id="search_skjl2" style="padding:3px">--%>
        收款时间段:
        <input class="easyui-datebox" id="skqssj" style="width:120px" data-options="formatter:myformatter,parser:myparser">~
        <input class="easyui-datebox" id="skjssj" style="width:120px" data-options="formatter:myformatter,parser:myparser">
        <a href="#" class="easyui-linkbutton" plain="true" iconCls="icon-search" onclick="dosearch_skjl()">查询</a>
    </div>

	<div style="float: left;">
		<a href="#" class="easyui-linkbutton" plain="true" icon="icon-add" onclick="skjl_add()">新增收款单</a>
	</div>
	<div style="float: left;">
		<a href="#" class="easyui-linkbutton" plain="true" icon="icon-edit" onclick="skjl_edit()">修改收款单</a>
	</div>
	<div style="float: left;">
		<a href="#" class="easyui-linkbutton" plain="true" icon="icon-cancel" onclick="skjl_delete()">删除收款单</a>
	</div>

	<div class="datagrid-btn-separator"></div>  
	
	<div style="float: left;">  
		<a href="#" class="easyui-linkbutton" plain="true" icon="icon-reload" onclick="skjl_reload()">刷新</a>  
	</div>
    <div class="datagrid-btn-separator"></div>

    <div style="float: left;">
        <a href="#" class="easyui-linkbutton" plain="true" icon="icon-ok" onclick="doSh()">审核通过</a>
    </div>
</div>

<div id="skjEditWindow" class="easyui-window" title="修改收款单" data-options="modal:true,closed:true,resizable:true,
	iconCls:'icon-save',href:'${pageContext.request.contextPath}/Jsjl/updateSkjlPage.do'" style="width:45%;height:60%;padding:10px;">
</div>
<div id="skjlAddWindow" class="easyui-window" title="新增收款单" data-options="modal:true,closed:true,resizable:true,
	iconCls:'icon-edit',href:'${pageContext.request.contextPath}/Jsjl/addSkjlPage.do'" style="width:45%;height:60%;padding:10px;">
</div>

<script>
function dosearch_skjl(sklsh,ddh,user_name,skzt,skqssj,skjssj){ //商品输入商品名,点击搜素,触发此函数
    var sklsh=$('#sklsh').val();
    var ddh=$('#ddh').val();
    var user_name=$('#user_name').val();
    var skzt=$('#skzt').val();
    var skqssj=$('#skqssj').val();
    var skjssj=$('#skjssj').val();
    $("#skjlList").datagrid({
        title:'收款列表', singleSelect:false, collapsible:true, pagination:true, rownumbers:true, method:'post',
        nowrap:true, toolbar:"toolbar_skjl", url:'${pageContext.request.contextPath}/Jsjl/listSkjl.do',
        queryParams: {sklsh:sklsh,ddh:ddh, user_name:user_name,skzt:skzt,skqssj:skqssj,skjssj:skjssj},
        loadMsg:'数据加载中......', fitColumns:true,
        columns : [ [
            {field:'ck',checkbox:true},
            {field:'sklsh',align:'center',width:150,title:'收款流水号'},
            {field:'sksj',align:'center',width:150,title:'收款时间'},
            {field:'ddh',align:'center',width:150,title:'订单号'},
            {field:'ddzje',align:'center',width:150,title:'订单总金额'},
            {field:'skzje',align:'center',width:150,title:'收款总金额'},
            {field:'user_name',align:'center',width:150,title:'客户姓名'},
            {field:'skzt',align:'center',width:150,title:'收款状态'},
            {field:'skr',width:150,align:'center',title:'收款人'},
            {field:'skfs',width:150,align:'center',title:'收款方式'}
        ] ],
    });
}
	//根据index拿到该行值
	function onskjlClickRow(index) {
		var rows = $('#skjlList').datagrid('getRows');
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

    function getskjlSelectionsIds(){
    	var skjlList = $("#skjlList");
    	var sels = skjlList.datagrid("getSelections");
    	var ids = [];
    	for(var i=0;i<sels.length;i++){
    		ids.push(sels[i].sklsh);
    	}
    	ids = ids.join(",");

    	return ids;
    }

    function skjl_add(){
    	/*$.get("item/add_judge",'',function(data){
       		if(data.msg != null){
       			$.messager.alert('提示', data.msg);
       		}else{*/
       			$("#skjlAddWindow").window("open");
       		/*}
       	});*/
    }
    function skjl_edit(){
    	/*$.get("item/edit_judge",'',function(data){
       		if(data.msg != null){
       			$.messager.alert('提示', data.msg);
       		}else{*/
       			var ids = getskjlSelectionsIds();

            	if(ids.length == 0){
            		$.messager.alert('提示','必须选择一个收款单才能编辑!');
            		return ;
            	}
            	if(ids.indexOf(',') > 0){
            		$.messager.alert('提示','只能选择一个收款单!');
            		return ;
            	}
                var sels = $("#skjlList").datagrid("getSelections");
            	if("待审核"!=sels[0].zt){
                    $.messager.alert('提示','该收款单已审核!');
                    return ;
                }
            	$("#skjEditWindow").window({
            		onLoad :function(){
            			//回显数据
            			var data = $("#skjlList").datagrid("getSelections")[0];
            			$("#skjEditForm").form("load", data);
            		}
            	}).window("open");
       		/*}
       	});*/
    }

    function skjl_delete(){
    	/*$.get("item/delete_judge",'',function(data){
      		if(data.msg != null){
      			$.messager.alert('提示', data.msg);
      		}else{*/
                var sels = $("#skjlList").datagrid("getSelections");
                for(var i=0;i<sels.length;i++){
                    if("待审核"!=sels[i].zt){
                        $.messager.alert('提示','收款单'+sels[i].sklsh+'已审核,不能删除!');
                        return ;
                    }
                }
                var ids = [];
                for(var i=0;i<sels.length;i++){
                    ids.push(sels[i].sklsh);
                }
                ids = ids.join(",");
                if(ids.length == 0){
                    $.messager.alert('提示','未选中收款单!');
                    return ;
                }

            	$.messager.confirm('确认','确定删除ID为 '+ids+' 的收款单吗？',function(r){
            	    if (r){
            	    	var params = {"ids":ids};
                    	$.post("${pageContext.request.contextPath}/Jsjl/deleteSkjl.do",params, function(data){
                			if(data.status == 200){
                				$.messager.alert('提示','删除收款单成功!',undefined,function(){
                					$("#skjlList").datagrid("reload");
                				});
                			}
                		});
            	    }
            	});
      		/*}
      	});*/
    }

    function skjl_reload(){
    	$("#skjlList").datagrid("reload");
    }

    function myformatter(date){
        var y = date.getFullYear();
        var m = date.getMonth()+1;
        var d = date.getDate();
        return y+'-'+(m<10?('0'+m):m)+'-'+(d<10?('0'+d):d);
    }

    function myparser(s){
        if (!s) return new Date();
        var ss = (s.split('-'));
        var y = parseInt(ss[0],10);
        var m = parseInt(ss[1],10);
        var d = parseInt(ss[2],10);
        if (!isNaN(y) && !isNaN(m) && !isNaN(d)){
            return new Date(y,m-1,d);
        } else {
            return new Date();
        }
    }

    //页面加载

    $(function(){

        //设置时间
        var curr_time = new Date();
        $("#skqssj").datebox("setValue",myformatter(curr_time));
        $("#skjssj").datebox("setValue",myformatter(curr_time));
        //获取时间
        var beginTime=$("#skqssj").datebox("getValue");
        var endTime=$("#skjssj").datebox("getValue");

    });

    function doSh(zt) {
        var ids = getskjlSelectionsIds();

        if(ids.length == 0){
            $.messager.alert('提示','必须选择一个收款单才能编辑!');
            return ;
        }
        var sels = $("#skjlList").datagrid("getSelections");
        for(var i=0;i<sels.length;i++){
            if("待审核"!=sels[i].zt){
                $.messager.alert('提示','收款单'+sels[i].sklsh+'已审核!');
                return ;
            }
        }
        var json=JSON.stringify(sels);
        $.ajax({
            url : "${pageContext.request.contextPath}/Jsjl/updateSkjlZt.do",
            type : 'post',
            data : {json:json,zt:zt},
            async : false,// 一定要是同步请求，否则会跳转；（ajax默认是异步的）
            success : function(text) {
                if (!text.success) {
                    //回显数据
                    var data = $("#skjlList").datagrid("getSelections")[0];
                    $("#skjEditForm").form("load", data);
                }
            },
            error : function(text) {
                //回显数据
                var data = $("#skjlList").datagrid("getSelections")[0];
                $("#skjEditForm").form("load", data);
            }
        });
        $("#skjlList").datagrid("reload");
    }
</script>