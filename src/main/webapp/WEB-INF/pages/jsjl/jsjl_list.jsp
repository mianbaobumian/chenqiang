<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<link href="${pageContext.request.contextPath}/static/js/kindeditor-4.1.10/themes/default/default.css" type="text/css" rel="stylesheet">
<%@include file="../common/head.jsp" %>
<table class="easyui-datagrid" id="jsjlList" title="财务明细列表"
       data-options="singleSelect:false,collapsible:true,pagination:true,rownumbers:true,url:'${pageContext.request.contextPath}/Jsjl/list.do',
       	method:'get',pageSize:10,fitColumns:true,toolbar:toolbar_jsjl">
    <thead>
        <tr>
        	<%--<th data-options="field:'ck',checkbox:true"></th>--%>
        	<th data-options="field:'jylsh',align:'center',width:150">交易流水号</th>
            <th data-options="field:'jyrq',align:'center',width:150">交易日期</th>
            <th data-options="field:'ddh',width:150,align:'center'">订单号</th>
            <th data-options="field:'skfs',align:'center',width:150">收款方式</th>
            <th data-options="field:'zfje',align:'center',width:150">支付金额</th>
            <th data-options="field:'czr',align:'center',width:150">操作人</th>
			<th data-options="field:'user_name',width:150,align:'center'">客户姓名</th>
			<th data-options="field:'bz',width:150,align:'center'">备注</th>
        </tr>
    </thead>
</table>

<div  id="toolbar_jsjl" style=" height: 72px; padding: 3px 11px; background: #fafafa;">
	
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
                    <div data-options="name:'ddh'">商品名</div>
                    <div data-options="name:'user_name'">商品姓名</div>
        &lt;%&ndash;			<div data-options="name:'item_type'">商品类别</div>
                    <div data-options="name:'value_flag'">有效标志</div>&ndash;%&gt;
                </div>--%>
        交易流水号:
        <input id="jylsh" style="line-height:26px;border:1px solid #ccc;width: 120px">
        订单号:
        <input id="ddh" style="line-height:26px;border:1px solid #ccc;width: 120px">
        客户名称:
        <input id="user_name" style="line-height:26px;border:1px solid #ccc;width: 120px">
        收款方式:
        <select id="skfs" class="easyui-combobox" name="skfs" panelHeight="auto" data-options="width:150,
                        editable:false,required:true">
            <option value="">未选择</option>
            <option value="1">银行转账</option>
            <option value="2">支付宝收款</option>
            <option value="3">微信收款</option>
        </select>
    <%--</div>
    <div id="search_cg2" style="padding:3px">--%>
        交易日期:
        <input class="easyui-datebox" id="jyqssj" style="width:120px" data-options="formatter:myformatter,parser:myparser">~
        <input class="easyui-datebox" id="jyjssj" style="width:120px" data-options="formatter:myformatter,parser:myparser">
        <a href="#" class="easyui-linkbutton" plain="true" iconCls="icon-search" onclick="doSearch_cg()">查询</a>
    </div>
	
	<div style="float: left;">  
		<a href="#" class="easyui-linkbutton" plain="true" icon="icon-reload" onclick="cg_reload()">刷新</a>  
	</div>
</div>

<script>
function doSearch_cg(jylsh,ddh,user_name,skfs,jyqssj,jyjssj){ //商品输入商品名,点击搜素,触发此函数
    var jylsh=$('#jylsh').val();
    var ddh=$('#ddh').val();
    var user_name=$('#user_name').val();
    var skfs=$('#skfs').val();
    var jyqssj=$('#jyqssj').val();
    var jyjssj=$('#jyjssj').val();
    $("#jsjlList").datagrid({
        title:'采购单列表', singleSelect:false, collapsible:true, pagination:true, rownumbers:true, method:'post',
        nowrap:true, toolbar:"toolbar_jsjl", url:'${pageContext.request.contextPath}/Jsjl/list.do',
        queryParams: {jylsh:jylsh,ddh:ddh, user_name:user_name,skfs:skfs,jyqssj:jyqssj,jyjssj:jyjssj},
        loadMsg:'数据加载中......', fitColumns:true,
        columns : [ [
            //{field:'ck',checkbox:true},
            {field:'jylsh',align:'center',width:150,title:'交易流水号'},
            {field:'jyrq',align:'center',width:150,title:'交易日期'},
            {field:'ddh',width:150,align:'center',title:'订单号'},
            {field:'skfs',align:'center',width:150,title:'收款方式'},
            {field:'zfje',align:'center',width:150,title:'支付金额'},
            {field:'czr',align:'center',width:150,title:'操作人'},
            {field:'user_name',width:150,align:'center',title:'客户姓名'},
            {field:'bz',width:150,align:'center',title:'备注'}
        ] ],
    });
}
	//根据index拿到该行值
	function oncgClickRow(index) {
		var rows = $('#jsjlList').datagrid('getRows');
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
    	var jsjlList = $("#jsjlList");
    	var sels = jsjlList.datagrid("getSelections");
    	var ids = [];
    	for(var i=0;i<sels.length;i++){
    		ids.push(sels[i].ddh);
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
                var sels = $("#jsjlList").datagrid("getSelections");
            	if("新增"!=sels[0].zt){
                    $.messager.alert('提示','该采购单已审核!');
                    return ;
                }
            	$("#cgEditWindow").window({
            		onLoad :function(){
            			//回显数据
            			var data = $("#jsjlList").datagrid("getSelections")[0];
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
                var sels = $("#jsjlList").datagrid("getSelections");
                for(var i=0;i<sels.length;i++){
                    if("新增"!=sels[i].zt){
                        $.messager.alert('提示','采购单'+sels[i].jylsh+'已审核,不能删除!');
                        return ;
                    }
                }
                var ids = [];
                for(var i=0;i<sels.length;i++){
                    ids.push(sels[i].jylsh);
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
                					$("#jsjlList").datagrid("reload");
                				});
                			}
                		});
            	    }
            	});
      		/*}
      	});*/
    }
    
    function cg_reload(){
    	$("#jsjlList").datagrid("reload");
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
        $("#jyqssj").datebox("setValue",myformatter(curr_time));
        $("#jyjssj").datebox("setValue",myformatter(curr_time));
        //获取时间
        var beginTime=$("#jyqssj").datebox("getValue");
        var endTime=$("#jyjssj").datebox("getValue");
    
    });
</script>