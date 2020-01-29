<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>网上订货系统</title>
        <%@include file="/common/head.jsp" %>
        <style type="text/css">
            body {
                font-family: microsoft yahei;
            }
        </style>
    </head>
    <body class="easyui-layout">
        <div region="north" style="height: 78px; background-color: #E0ECFF">
            <table style="padding: 5px" width="100%">
                <tr>
                    <td width="50%">
                        <h2>网上订货系统</h2>
                    </td>
                    <td valign="bottom" align="right" width="50%">
                        <font size="3">  <strong>欢迎：</strong>admin</font>
                    </td>
                </tr>
            </table>
        </div>
        <div region="west" style="width: 200px" title="导航菜单" split="true">
            <div class="easyui-accordion" data-options="fit:true,border:false">
                <div title="订单管理" data-options="selected:true,iconCls:'icon-item'" style="padding: 10px">
                    <a href="#" class="easyui-linkbutton"
                       data-options="plain:true,iconCls:'icon-man'" style="width: 150px">订货单管理</a>
                    <a href="#" class="easyui-linkbutton"
                       data-options="plain:true,iconCls:'icon-undo'" style="width: 150px">退货管理</a>
                    <a href="#" class="easyui-linkbutton"
                       data-options="plain:true,iconCls:'icon-man'" style="width: 150px">物流查询</a>
                </div>
                <div title="库存管理" data-options="iconCls:'icon-bkgl'" style="padding:10px;">
                    <a href="#" class="easyui-linkbutton"
                       data-options="plain:true,iconCls:'icon-man'" style="width: 150px;">库存管理</a>
                </div>
                <div title="采购管理" data-options="iconCls:'icon-bklb'" style="padding:10px">
                    <a href="#" class="easyui-linkbutton"
                       data-options="plain:true,iconCls:'icon-man'" style="width: 150px;">采购商品管理</a>
                    <a href="#" class="easyui-linkbutton"
                       data-options="plain:true,iconCls:'icon-edit'" style="width: 150px;">采购商品审核</a>
                    <a href="#" class="easyui-linkbutton"
                       data-options="plain:true,iconCls:'icon-search'" style="width: 150px;">查询供应商</a>
                </div>
                <div title="财务管理" data-options="iconCls:'icon-plgl'" style="padding:10px">
                    <a href="#" class="easyui-linkbutton"
                       data-options="plain:true,iconCls:'icon-search'" style="width: 150px">财务明细查询</a>
                    <a href="#" class="easyui-linkbutton"
                       data-options="plain:true,iconCls:'icon-man'" style="width: 150px;">收付款管理</a>
                </div>
                <div title="系统管理" data-options="iconCls:'icon-system'" style="padding:10px">
                    <a href="#" class="easyui-linkbutton"
                       data-options="plain:true,iconCls:'icon-man'" style="width: 150px">用户管理</a>
                    <a href="#" class="easyui-linkbutton"
                       data-options="plain:true,iconCls:'icon-remove'" style="width: 150px;">商品信息管理</a>
                </div>
            </div>
        </div>
        <div data-options="region:'center'" style="background:#eee;">
            <div class="easyui-tabs" fit="true" border="false" id="tabs">
                <div title="首页" data-options="iconCls:'icon-home'">
                    <div align="center" style="padding-top: 100px"><font color="red" size="10">欢迎使用</font></div>
                </div>
            </div>
        </div>
        <div region="south" style="height: 25px;padding: 5px" align="center">
            <div region="south" style="height: 25px;padding: 5px" align="center">
            Copyright © 2019-2020 陈镪网上订货系统系统 版权所有
        </div>
        </div>
    </body>
</html>