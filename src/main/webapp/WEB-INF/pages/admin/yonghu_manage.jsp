<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html>
<meta name="content-type" content="text/html; charset=UTF-8">
<head>
    <title>用户管理</title>
    <%@include file="../common/head.jsp" %>
</head>
<script>
    $(function () {
        //datagrid初始化
        $('#dg').datagrid({
            //请求数据的url
            url: '${pageContext.request.contextPath}/admin/User/list.do',
            //载入提示信息
            loadMsg: 'loading...',
            //水平自动展开，如果设置此属性，则不会有水平滚动条，演示冻结列时，该参数不要设置
            fitColumns: true,
            //数据多的时候不换行
            nowrap: true,
            //设置分页
            pagination: true,
            //设置每页显示的记录数，默认是10个
            pageSize: 5,
            //每页显示记录数项目
            pageList: [5, 10, 15, 20],
            //指定id为标识字段，在删除，更新的时候有用，如果配置此字段，在翻页时，换页不会影响选中的项
            idField: 'id',
            //上方工具条 添加 修改 删除 刷新按钮
            toolbar:[{
                iconCls: 'icon-add',    //图标
                text: '添加',            //名称
                handler: function () {  //回调函数
                    $("#win").window({
                        title : '添加用户',
                        width : 850,
                        height : 495,
                        href:'${pageContext.request.contextPath}/admin/User/addUser.do',
                        cache:false,
                        onLoad: function() {
                        },
                        onClose : function() {
                            $(this).dialog('destroy');
                            $(this).remove();

                        }
                    });
                }
            },'-',{
                iconCls: 'icon-edit',
                text: '修改',
                handler: function () {
                    alert("添加");
                }
            },'-',{
                iconCls: 'icon-edit',
                text: '删除',
                handler: function () {
                    alert("删除");
                }
            },'-',{
                iconCls: 'icon-reload',
                text: '刷新',
                handler: function () {
                    alert("刷新");
                }
            }],
            //同列属性，但是这些列将会冻结在左侧,z大小不会改变，当宽度大于250时，会显示滚动条，但是冻结的列不在滚动条内
            frozenColumns:[[
                {field:'checkbox',checkbox:true},    //复选框
                {field:'user_id',title:'编号',width:200}    //id字段
            ]],
            columns:[[
                {field:'user_name',title:'用户姓名',width:200},   //typeName 字段
                {field:'user_type',title:'用户类别',width:200},   //orderNum 字段
                {field:'value_flag',title:'有效标志',width:200},   //orderNum 字段
            ]],
        });
    });
</script>
<body>
<div id="win"></div>
<table id="dg"></table>
</body>
</html>