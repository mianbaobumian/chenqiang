<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<link href="${pageContext.request.contextPath}/static/js/kindeditor-4.1.10/themes/default/default.css" type="text/css" rel="stylesheet">
<%@include file="../common/head.jsp" %>
<table class="easyui-datagrid" id="ddList" title="订购列表"
       data-options="singleSelect:false,collapsible:true,pagination:true,rownumbers:true,pageSize:10,fitColumns:true,toolbar:toolbar_dd">
    <thead>
        <tr>
        	<th data-options="field:'ck',checkbox:true"></th>
        	<th data-options="field:'ddh',align:'center',width:150">订单号</th>
            <th data-options="field:'jyrq',align:'center',width:150">订单交易时间</th>
			<th data-options="field:'ddzje',width:150,align:'center'">订购总金额</th>
			<th data-options="field:'ddzt',width:150,align:'center'">订购单状态</th>
			<th data-options="field:'psfs',width:150,align:'center'">配送方式</th>
        </tr>
    </thead>
</table>

<div  id="toolbar_dd" style=" height: 72px; padding: 3px 11px; background: #fafafa;">
	
	<%--<c:forEach items="${sessionScope.sysPermissionList}" var="per" >
		<c:if test="${per=='item:add' }" >
		    <div style="float: left;">
		        <a href="#" class="easyui-linkbutton" plain="true" icon="icon-add" onclick="dd_add()">新增</a>
		    </div>
		</c:if>
		<c:if test="${per=='item:edit' }" >
		    <div style="float: left;">
		        <a href="#" class="easyui-linkbutton" plain="true" icon="icon-edit" onclick="dd_edit()">编辑</a>
		    </div>
		</c:if>
		<c:if test="${per=='item:delete' }" >
		    <div style="float: left;">
		        <a href="#" class="easyui-linkbutton" plain="true" icon="icon-cancel" onclick="dd_delete()">删除</a>
		    </div>
		</c:if>
	</c:forEach>--%>
    <div id="search_dd" style="padding:3px">
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
        订单号:
        <input id="ddh" style="line-height:26px;border:1px solid #ccc;width: 120px">
        商品编号:
        <input id="item_id" style="line-height:26px;border:1px solid #ccc;width: 120px">
        商品名:
        <input id="item_name" style="line-height:26px;border:1px solid #ccc;width: 120px">
        订购客户:
        <input id="dgkh" style="line-height:26px;border:1px solid #ccc;width: 120px">
        交易时间段:
        <input class="easyui-datebox" id="jyqssj" style="width:120px" data-options="formatter:myformatter,parser:myparser">~
        <input class="easyui-datebox" id="jyjssj" style="width:120px" data-options="formatter:myformatter,parser:myparser">
        <input type="hidden" id="hid_ddh" />
        <a href="#" class="easyui-linkbutton" plain="true" iconCls="icon-search" onclick="doSearch_dd()">查询</a>
    </div>

	<div style="float: left;">
		<a href="#" class="easyui-linkbutton" plain="true" icon="icon-add" onclick="dd_add()">新增订购单</a>
	</div>
	<div style="float: left;">
		<a href="#" class="easyui-linkbutton" plain="true" icon="icon-edit" onclick="dd_edit()">修改订购单</a>
	</div>
	<div style="float: left;">
		<a href="#" class="easyui-linkbutton" plain="true" icon="icon-cancel" onclick="dd_delete()">删除订购单</a>
	</div>

	<div class="datagrid-btn-separator"></div>  
	
	<div style="float: left;">  
		<a href="#" class="easyui-linkbutton" plain="true" icon="icon-reload" onclick="dd_reload()">刷新</a>  
	</div>
    <div class="datagrid-btn-separator"></div>

    <div style="float: left;">
        <a href="#" class="easyui-linkbutton" plain="true" icon="icon-ok" onclick="doChangeZt('01')">下单</a>
    </div>
    <div style="float: left;">
        <a href="#" class="easyui-linkbutton" plain="true" icon="icon-remove" onclick="doChangeZt('02')">发货</a>
    </div>
    <div style="float: left;">
        <a href="#" class="easyui-linkbutton" plain="true" icon="icon-cancel" onclick="doChangeZt('03')">退货</a>
    </div>
    <div style="float: left;">
        <a href="#" class="easyui-linkbutton" plain="true" icon="icon-undo" onclick="doChangeZt('04')">撤销</a>
    </div>
    <div style="float: left;">
        <a href="#" class="easyui-linkbutton" plain="true" icon="icon-ok" onclick="doChangeZt('05')">确认收货</a>
    </div>
</div>

<%--<div id="ddEditWindow" class="easyui-window" title="修改订购单" data-options="modal:true,closed:true,resizable:true,
	iconCls:'icon-save',href:'${pageContext.request.contextPath}/Dd/updateDdPage.do'" style="width:60%;height:60%;padding:10px;">
</div>
<div id="ddAddWindow" class="easyui-window" title="新增订购单" data-options="modal:true,closed:true,resizable:true,
	iconCls:'icon-edit',href:'${pageContext.request.contextPath}/Dd/addDdPage.do'" style="width:60%;height:60%;padding:10px;">
</div>--%>

<script>
function doSearch_dd(ddh,item_id,item_name,user_id,dgkh,jyqssj,jyjssj){ //商品输入商品名,点击搜素,触发此函数
    var ddh=$('#ddh').val();
    var item_id=$('#item_id').val();
    var item_name=$('#item_name').val();
    var dgkh=$('#dgkh').val();
    var jyqssj=$('#jyqssj').val();
    var jyjssj=$('#jyjssj').val();
    var user_id=$('#cg').val();
    $("#ddList").datagrid({
        title:'订购单列表', singleSelect:false, collapsible:true, pagination:true, rownumbers:true, method:'post',
        nowrap:true, toolbar:"toolbar_dd", url:'${pageContext.request.contextPath}/Dd/list.do',
        queryParams: {ddh:ddh,item_id:item_id, item_name:item_name,user_id:user_id,dgkh:dgkh,jyqssj:jyqssj,jyjssj:jyjssj},
        loadMsg:'数据加载中......', fitColumns:true,
        columns : [ [
            {field:'ck',checkbox:true},
            {field:'ddh',align:'center',width:150,title:'订单号'},
            {field:'jyrq',align:'center',width:150,title:'交易日期'},
            {field:'ddzje',width:150,align:'center',title:'订单总金额'},
            {field:'ddzt',width:150,align:'center',title:'订单状态'},
            {field:'psfs',width:150,align:'center',title:'配送方式'}//,formatter:psfsformatter,editor:myeditor
        ] ],
    });
}
	//根据index拿到该行值
	function onddClickRow(index) {
		var rows = $('#ddList').datagrid('getRows');
		return rows[index];
		
	}
/*	function psfsformatter(value,row) {
        return row.psfs;
    }*/

/*    function myeditor() {
        editor:{
            type:'combobox',
                options:{
                valueField:'productid',
                    textField:'productname',
                    method:'get',
                    url:'products.json',
                    required:true
            }
        }
    }*/
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
	
    function getddSelectionsIds(){
    	var ddList = $("#ddList");
    	var sels = ddList.datagrid("getSelections");
    	var ids = [];
    	for(var i=0;i<sels.length;i++){
    		ids.push(sels[i].ddh);
    	}
    	ids = ids.join(","); 
    	
    	return ids;
    }
    
    function dd_add(){
        //var dgkh=$("#dgkh").val();
        var dgkh="admin";
        parent.openTab('新增订购单','Dd/addDdPage.do?dgkh='+dgkh,'icon-man');
       /* $.ajax({
            url : "${pageContext.request.contextPath}/Dd/getDdh.do",
            type : 'post',
            async : false,// 一定要是同步请求，否则会跳转；（ajax默认是异步的）
            success : function(data) {
                ddh=data.msg
                $('#hid_ddh').val(ddh);
            }
        });*/
    	/*$.get("item/add_judge",'',function(data){
       		if(data.msg != null){
       			$.messager.alert('提示', data.msg);
       		}else{*/
       			//$("#ddAddWindow").window("open");
       		/*}
       	});*/
    }

    function dd_edit(){
    	/*$.get("item/edit_judge",'',function(data){
       		if(data.msg != null){
       			$.messager.alert('提示', data.msg);
       		}else{*/
                var dgkh="admin";
       			var ids = getddSelectionsIds();
            	
            	if(ids.length == 0){
            		$.messager.alert('提示','必须选择一个订购单才能编辑!');
            		return ;
            	}
            	if(ids.indexOf(',') > 0){
            		$.messager.alert('提示','只能选择一个订购单!');
            		return ;
            	}
                var sels = $("#ddList").datagrid("getSelections");
            	var ddh=sels[0].ddh;
                if(ids.length == 0){
                    $.messager.alert('提示','必须选择一个订购单才能编辑!');
                    return ;
                }
                if(ids.indexOf(',') > 0){
                    $.messager.alert('提示','只能选择一个订购单!');
                    return ;
                }
                var sels = $("#ddList").datagrid("getSelections");
                if("新增"==sels[0].ddzt){
                    if(ddzt!='04'||ddzt!='01'){
                        $.messager.alert('提示','新增状态的订购单'+sels[0].ddh+'不能做下单或撤销以外的操作!');
                        return ;
                    }
                }
                if("下单"==sels[0].ddzt){
                    if(ddzt!='02'||ddzt!='04'){
                        $.messager.alert('提示','下单状态的订购单'+sels[0].ddh+'不能做发货或撤销以外的操作!');
                        return ;
                    }
                }
                if("发货"==sels[0].ddzt){
                    if(ddzt!='03'||ddzt!='05'){
                        $.messager.alert('提示','发货状态的订购单'+sels[0].ddh+'不能做退货或确认收货以外的操作!');
                        return ;
                    }
                }
                if("撤销"==sels[0].ddzt){
                    $.messager.alert('提示','撤销状态的订购单'+sels[0].ddh+'不能做任何的操作!');
                    return ;
                }
                if("确认收货"==sels[0].ddzt){
                    $.messager.alert('提示','确认收货状态的订购单'+sels[0].ddh+'不能做任何的操作!');
                    return ;
                }
                parent.openTab('更新订购单','Dd/updateDdPage.do?dgkh='+dgkh+'&ddh='+ddh,'icon-man');
       		/*}
       	});*/
    }
    
    function dd_delete(){
    	/*$.get("item/delete_judge",'',function(data){
      		if(data.msg != null){
      			$.messager.alert('提示', data.msg);
      		}else{*/
                var sels = $("#ddList").datagrid("getSelections");
                for(var i=0;i<sels.length;i++){
                    var sels = $("#ddList").datagrid("getSelections");
                    if("新增"==sels[i].ddzt){
                        if(ddzt!='04'||ddzt!='01'){
                            $.messager.alert('提示','新增状态的订购单'+sels[i].ddh+'不能做下单或撤销以外的操作!');
                            return ;
                        }
                    }
                    if("下单"==sels[i].ddzt){
                        if(ddzt!='02'||ddzt!='04'){
                            $.messager.alert('提示','下单状态的订购单'+sels[i].ddh+'不能做发货或撤销以外的操作!');
                            return ;
                        }
                    }
                    if("发货"==sels[i].ddzt){
                        if(ddzt!='03'||ddzt!='05'){
                            $.messager.alert('提示','发货状态的订购单'+sels[i].ddh+'不能做退货或确认收货以外的操作!');
                            return ;
                        }
                    }
                    if("撤销"==sels[i].ddzt){
                        $.messager.alert('提示','撤销状态的订购单'+sels[i].ddh+'不能做任何的操作!');
                        return ;
                    }
                    if("确认收货"==sels[i].ddzt){
                        $.messager.alert('提示','确认收货状态的订购单'+sels[i].ddh+'不能做任何的操作!');
                        return ;
                    }
                }
                var ids = [];
                for(var i=0;i<sels.length;i++){
                    ids.push(sels[i].ddh);
                }
                ids = ids.join(",");
                if(ids.length == 0){
                    $.messager.alert('提示','未选中订购单!');
                    return ;
                }

            	$.messager.confirm('确认','确定删除ID为 '+ids+' 的订购单吗？',function(r){
            	    if (r){
            	    	var params = {"ids":ids};
                    	$.post("${pageContext.request.contextPath}/Dd/deletedd.do",params, function(data){
                			if(data.status == 200){
                				$.messager.alert('提示','删除订购单成功!',undefined,function(){
                					$("#ddList").datagrid("reload");
                				});
                			}
                		});
            	    }
            	});
      		/*}
      	});*/
    }
    
    function dd_reload(){
    	$("#ddList").datagrid("reload");
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
    
    function doChangeZt(ddzt) {
        var ids = getddSelectionsIds();

        if(ids.length == 0){
            $.messager.alert('提示','必须选择一个订购单才能编辑!');
            return ;
        }
        if(ids.indexOf(',') > 0){
            $.messager.alert('提示','只能选择一个订购单!');
            return ;
        }
        var sels = $("#ddList").datagrid("getSelections");
        if("新增"==sels[0].ddzt){
            if(ddzt!='04'||ddzt!='01'){
                $.messager.alert('提示','新增状态的订购单'+sels[0].ddh+'不能做下单或撤销以外的操作!');
                return ;
            }
        }
        if("下单"==sels[0].ddzt){
            if(ddzt!='02'||ddzt!='04'){
                $.messager.alert('提示','下单状态的订购单'+sels[0].ddh+'不能做发货或撤销以外的操作!');
                return ;
            }
        }
        if("发货"==sels[0].ddzt){
            if(ddzt!='03'||ddzt!='05'){
                $.messager.alert('提示','发货状态的订购单'+sels[0].ddh+'不能做退货或确认收货以外的操作!');
                return ;
            }
        }
        if("撤销"==sels[0].ddzt){
            $.messager.alert('提示','撤销状态的订购单'+sels[0].ddh+'不能做任何的操作!');
            return ;
        }
        if("确认收货"==sels[0].ddzt){
            $.messager.alert('提示','确认收货状态的订购单'+sels[0].ddh+'不能做任何的操作!');
            return ;
        }
        var json=JSON.stringify(sels);
        $.ajax({
            url : "${pageContext.request.contextPath}/Dd/updateDdzt.do",
            type : 'post',
            data : {json:json,ddzt:ddzt},
            async : false,// 一定要是同步请求，否则会跳转；（ajax默认是异步的）
            success : function(text) {
                if (!text.success) {
                    //回显数据
                    var data = $("#ddList").datagrid("getSelections")[0];
                    $("#ddEditForm").form("load", data);
                }
            },
            error : function(text) {
                //回显数据
                var data = $("#ddList").datagrid("getSelections")[0];
                $("#ddEditForm").form("load", data);
            }
        });
        $("#ddList").datagrid("reload");
    }
</script>