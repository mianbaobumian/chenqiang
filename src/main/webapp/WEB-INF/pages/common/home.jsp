<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>网上订货系统</title>
        <%@include file="/WEB-INF/pages/common/head.jsp" %>
        <style type="text/css">
            body {
                font-family: microsoft yahei;
            }
        </style>
        <script>
            /**
             * 打开选项卡
             * @param text  选项卡标题
             * @param url   请求打开路径
             */
            function openTab(text,url,icon) {
                //判断当前选项卡是否存在
                if($('#tabs').tabs('exists',text)){
                    //如果存在 显示
                    $("#tabs").tabs("select",text);
                }else{
                    //如果不存在 则新建一个
                    console.log("${pageContext.request.contextPath}/"+url+"'");
                    $("#tabs").tabs('add',{
                        title:text,
                        closable:true,      //是否允许选项卡摺叠。
                        iconCls:icon,    //显示图标
                        content:"<iframe frameborder=0 scrolling='auto' style='width:100%;height:100%' src='${pageContext.request.contextPath}/"+url+"'></iframe>"
                        //url 远程加载所打开的url
                    })
                }
            }
        </script>
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
                    <a href="javascript:openTab('订货单管理','dingdan_manage.jsp','icon-man')" class="easyui-linkbutton"
                       data-options="plain:true,iconCls:'icon-man'" style="width: 150px">订货单管理</a>
                    <a href="javascript:openTab('退货管理','huowu_rollback.jsp','icon-undo')" class="easyui-linkbutton"
                       data-options="plain:true,iconCls:'icon-undo'" style="width: 150px">退货管理</a>
                    <a href="javascript:openTab('物流查询','wuliu_search.jsp','icon-search')" class="easyui-linkbutton"
                       data-options="plain:true,iconCls:'icon-search'" style="width: 150px">物流查询</a>
                </div>
                <div title="库存管理" data-options="iconCls:'icon-bkgl'" style="padding:10px;">
                    <a href="javascript:openTab('库存管理','kucun_manage.jsp','icon-man')" class="easyui-linkbutton"
                       data-options="plain:true,iconCls:'icon-man'" style="width: 150px;">库存管理</a>
                </div>
                <div title="采购管理" data-options="iconCls:'icon-bklb'" style="padding:10px">
                    <a href="javascript:openTab('采购商品管理','caigoushangping_manage.jsp','icon-man')" class="easyui-linkbutton"
                       data-options="plain:true,iconCls:'icon-man'" style="width: 150px;">采购商品管理</a>
                    <a href="javascript:openTab('采购商品审核','caigoushangping_check.jsp','icon-man')" class="easyui-linkbutton"
                       data-options="plain:true,iconCls:'icon-edit'" style="width: 150px;">采购商品审核</a>
                    <a href="javascript:openTab('查询供应商','gongyingshang_search.jsp','icon-search')" class="easyui-linkbutton"
                       data-options="plain:true,iconCls:'icon-search'" style="width: 150px;">查询供应商</a>
                </div>
                <div title="财务管理" data-options="iconCls:'icon-plgl'" style="padding:10px">
                    <a href="javascript:openTab('财务明细查询','caiwumingxi_search.jsp','icon-search')" class="easyui-linkbutton"
                       data-options="plain:true,iconCls:'icon-search'" style="width: 150px">财务明细查询</a>
                    <a href="javascript:openTab('收付款管理','sufukun_manage.jsp','icon-man')" class="easyui-linkbutton"
                       data-options="plain:true,iconCls:'icon-man'" style="width: 150px;">收付款管理</a>
                </div>
                <div title="系统管理" data-options="iconCls:'icon-system'" style="padding:10px">
                    <a href="javascript:openTab('用户管理','admin/User/userIndex.do','icon-man')" class="easyui-linkbutton"
                       data-options="plain:true,iconCls:'icon-man'" style="width: 150px">用户管理</a>
                    <a href="javascript:openTab('商品信息管理','shangpinginfo_manage.jsp','icon-remove')" class="easyui-linkbutton"
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
        <div region="south" style="height: 35px;padding: 5px" align="center">
            <div region="south" style="height: 35px;padding: 5px" align="center">
            Copyright © 2019-2020 陈镪网上订货系统系统 版权所有
        </div>
        </div>
    </body>
</html>