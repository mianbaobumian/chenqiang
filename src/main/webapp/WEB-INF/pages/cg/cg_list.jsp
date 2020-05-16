<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<link href="${pageContext.request.contextPath}/static/js/kindeditor-4.1.10/themes/default/default.css" type="text/css" rel="stylesheet">
<%@include file="../common/head.jsp" %>
<table class="easyui-datagrid" id="cgList" title="采购列表"
       data-options="singleSelect:false,collapsible:true,pagination:true,rownumbers:true,url:'${pageContext.request.contextPath}/Cg/list.do',
       	method:'get',pageSize:10,fitColumns:true,toolbar:toolbar_cg">
    <thead>
        <tr>
        	<th data-options="field:'ck',checkbox:true"></th>
        	<th data-options="field:'lsh',align:'center',width:150">采购单流水号</th>
        	<th data-options="field:'item_id',align:'center',width:150">商品编号</th>
            <th data-options="field:'item_name',align:'center',width:150">商品名</th>
            <th data-options="field:'lb',align:'center',width:150">商品类别</th>
            <th data-options="field:'ddsqsj',align:'center',width:150">采购单申请时间</th>
            <th data-options="field:'ywshsj',align:'center',width:150">业务审核时间</th>
            <th data-options="field:'yjdhrq',align:'center',width:150">预定到货日期</th>
			<th data-options="field:'cgsl',width:150,align:'center'">采购数量</th>
			<th data-options="field:'cgdj',width:150,align:'center'">采购单价</th>
			<th data-options="field:'cgzje',width:150,align:'center'">采购总金额</th>
			<th data-options="field:'zt',width:150,align:'center'">采购单状态</th>
        </tr>
    </thead>
</table>

<div  id="toolbar_cg" style=" height: 72px; padding: 3px 11px; background: #fafafa;">
	
	<%--<c:forEach items="${sessionScope.sysPermissionList}" var="per" >
		<c:if test="${per=='item:add' }" >
		    <div style="float: left;">
		        <a href="#" class="easyui-linkbutton" plain="true" icon="icon-add" onclick="cg_add()">新增</a>
		    </div>
		</c:if>
		<c:if test="${per=='item:edit' }" >
		    <div style="float: left;">
		        <a href="#" class="easyui-linkbutton" plain="true" icon="icon-edit" onclick="cg_edit()">编辑</a>
		    </div>
		</c:if>
		<c:if test="${per=='item:delete' }" >
		    <div style="float: left;">
		        <a href="#" class="easyui-linkbutton" plain="true" icon="icon-cancel" onclick="cg_delete()">删除</a>
		    </div>
		</c:if>
	</c:forEach>--%>
    <div id="search_cg1" style="padding:3px">
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
        采购单流水号:
        <input id="lsh" style="line-height:26px;border:1px solid #ccc;width: 120px">
        商品编号:
        <input id="item_id" style="line-height:26px;border:1px solid #ccc;width: 120px">
        商品名:
        <input id="item_name" style="line-height:26px;border:1px solid #ccc;width: 120px">
        类别:
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
    <%--</div>
    <div id="search_cg2" style="padding:3px">--%>
        申请时间段:
        <input class="easyui-datebox" id="sqqssj" style="width:120px" data-options="formatter:myformatter,parser:myparser">~
        <input class="easyui-datebox" id="sqjssj" style="width:120px" data-options="formatter:myformatter,parser:myparser">
        <a href="#" class="easyui-linkbutton" plain="true" iconCls="icon-search" onclick="doSearch_cg()">查询</a>
    </div>

	<div style="float: left;">
		<a href="#" class="easyui-linkbutton" plain="true" icon="icon-add" onclick="cg_add()">新增采购单</a>
	</div>
	<div style="float: left;">
		<a href="#" class="easyui-linkbutton" plain="true" icon="icon-edit" onclick="cg_edit()">修改采购单</a>
	</div>
	<div style="float: left;">
		<a href="#" class="easyui-linkbutton" plain="true" icon="icon-cancel" onclick="cg_delete()">删除采购单</a>
	</div>

	<div class="datagrid-btn-separator"></div>  
	
	<div style="float: left;">  
		<a href="#" class="easyui-linkbutton" plain="true" icon="icon-reload" onclick="cg_reload()">刷新</a>  
	</div>
    <div class="datagrid-btn-separator"></div>

    <div style="float: left;">
        <a href="#" class="easyui-linkbutton" plain="true" icon="icon-ok" onclick="doSh('01')">审核通过</a>
    </div>
    <div style="float: left;">
        <a href="#" class="easyui-linkbutton" plain="true" icon="icon-cancel" onclick="doSh('02')">审核不通过</a>
    </div>
</div>

<div id="cgEditWindow" class="easyui-window" title="修改采购单" data-options="modal:true,closed:true,resizable:true,
	iconCls:'icon-save',href:'${pageContext.request.contextPath}/Cg/updateCgPage.do'" style="width:45%;height:60%;padding:10px;">
</div>
<div id="cgAddWindow" class="easyui-window" title="新增采购单" data-options="modal:true,closed:true,resizable:true,
	iconCls:'icon-edit',href:'${pageContext.request.contextPath}/Cg/addCgPage.do'" style="width:45%;height:60%;padding:10px;">
</div>

<script>
function doSearch_cg(lsh,item_id,item_name,lb,sqqssj,sqjssj){ //商品输入商品名,点击搜素,触发此函数
    var lsh=$('#lsh').val();
    var item_id=$('#item_id').val();
    var item_name=$('#item_name').val();
    var lb=$('#lb').val();
    var sqqssj=$('#sqqssj').val();
    var sqjssj=$('#sqjssj').val();
    $("#cgList").datagrid({
        title:'采购单列表', singleSelect:false, collapsible:true, pagination:true, rownumbers:true, method:'post',
        nowrap:true, toolbar:"toolbar_cg", url:'${pageContext.request.contextPath}/Cg/list.do',
        queryParams: {lsh:lsh,item_id:item_id, item_name:item_name,lb:lb,sqqssj:sqqssj,sqjssj:sqjssj},
        loadMsg:'数据加载中......', fitColumns:true,
        columns : [ [
            {field:'ck',checkbox:true},
            {field:'lsh',align:'center',width:150,title:'采购单流水号'},
            {field:'item_id',align:'center',width:150,title:'商品编号'},
            {field:'item_name',align:'center',width:150,title:'商品名'},
            {field:'lb',align:'center',width:150,title:'商品类别'},
            {field:'ddsqsj',align:'center',width:150,title:'采购单申请时间'},
            {field:'ywshsj',align:'center',width:150,title:'业务审核时间'},
            {field:'yjdhrq',align:'center',width:150,title:'预定到货日期'},
            {field:'cgsl',width:150,align:'center',title:'采购数量'},
            {field:'cgdj',width:150,align:'center',title:'采购单价'},
            {field:'cgzje',width:150,align:'center',title:'采购总金额'},
            {field:'zt',width:150,align:'center',title:'采购单状态'}
        ] ],
    });
}
	//根据index拿到该行值
	function oncgClickRow(index) {
		var rows = $('#cgList').datagrid('getRows');
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
	
    function getcgSelectionsIds(){
    	var cgList = $("#cgList");
    	var sels = cgList.datagrid("getSelections");
    	var ids = [];
    	for(var i=0;i<sels.length;i++){
    		ids.push(sels[i].item_id);
    	}
    	ids = ids.join(","); 
    	
    	return ids;
    }
    
    function cg_add(){
    	/*$.get("item/add_judge",'',function(data){
       		if(data.msg != null){
       			$.messager.alert('提示', data.msg);
       		}else{*/
       			$("#cgAddWindow").window("open");
       		/*}
       	});*/
    }

    function cg_czjl(){
        /*$.get("item/add_judge",'',function(data){
               if(data.msg != null){
                   $.messager.alert('提示', data.msg);
               }else{*/
        $("#cgCzjlWindow").window("open");
        /*}
    });*/
    }

    function cg_edit(){
    	/*$.get("item/edit_judge",'',function(data){
       		if(data.msg != null){
       			$.messager.alert('提示', data.msg);
       		}else{*/
       			var ids = getcgSelectionsIds();
            	
            	if(ids.length == 0){
            		$.messager.alert('提示','必须选择一个采购单才能编辑!');
            		return ;
            	}
            	if(ids.indexOf(',') > 0){
            		$.messager.alert('提示','只能选择一个采购单!');
            		return ;
            	}
                var sels = $("#cgList").datagrid("getSelections");
            	if("新增"!=sels[0].zt){
                    $.messager.alert('提示','该采购单已审核!');
                    return ;
                }
            	$("#cgEditWindow").window({
            		onLoad :function(){
            			//回显数据
            			var data = $("#cgList").datagrid("getSelections")[0];
            			$("#cgEditForm").form("load", data);
            		}
            	}).window("open");
       		/*}
       	});*/
    }
    
    function cg_delete(){
    	/*$.get("item/delete_judge",'',function(data){
      		if(data.msg != null){
      			$.messager.alert('提示', data.msg);
      		}else{*/
                var sels = $("#cgList").datagrid("getSelections");
                for(var i=0;i<sels.length;i++){
                    if("新增"!=sels[i].zt){
                        $.messager.alert('提示','采购单'+sels[i].lsh+'已审核,不能删除!');
                        return ;
                    }
                }
                var ids = [];
                for(var i=0;i<sels.length;i++){
                    ids.push(sels[i].lsh);
                }
                ids = ids.join(",");
                if(ids.length == 0){
                    $.messager.alert('提示','未选中采购单!');
                    return ;
                }

            	$.messager.confirm('确认','确定删除ID为 '+ids+' 的采购单吗？',function(r){
            	    if (r){
            	    	var params = {"ids":ids};
                    	$.post("${pageContext.request.contextPath}/Cg/deleteCg.do",params, function(data){
                			if(data.status == 200){
                				$.messager.alert('提示','删除采购单成功!',undefined,function(){
                					$("#cgList").datagrid("reload");
                				});
                			}
                		});
            	    }
            	});
      		/*}
      	});*/
    }
    
    function cg_reload(){
    	$("#cgList").datagrid("reload");
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
        $("#sqqssj").datebox("setValue",myformatter(curr_time));
        $("#sqjssj").datebox("setValue",myformatter(curr_time));
        //获取时间
        var beginTime=$("#sqqssj").datebox("getValue");
        var endTime=$("#sqjssj").datebox("getValue");
    
    });
    
    function doSh(zt) {
        var ids = getcgSelectionsIds();

        if(ids.length == 0){
            $.messager.alert('提示','必须选择一个采购单才能编辑!');
            return ;
        }
        var sels = $("#cgList").datagrid("getSelections");
        for(var i=0;i<sels.length;i++){
            if("新增"!=sels[i].zt){
                $.messager.alert('提示','采购单'+sels[i].lsh+'已审核!');
                return ;
            }
        }
        var json=JSON.stringify(sels);
        $.ajax({
            url : "${pageContext.request.contextPath}/Cg/updateCgZt.do",
            type : 'post',
            data : {json:json,zt:zt},
            async : false,// 一定要是同步请求，否则会跳转；（ajax默认是异步的）
            success : function(text) {
                if (!text.success) {
                    //回显数据
                    var data = $("#cgList").datagrid("getSelections")[0];
                    $("#cgEditForm").form("load", data);
                }
            },
            error : function(text) {
                //回显数据
                var data = $("#cgList").datagrid("getSelections")[0];
                $("#cgEditForm").form("load", data);
            }
        });
        $("#cgList").datagrid("reload");
    }
</script>