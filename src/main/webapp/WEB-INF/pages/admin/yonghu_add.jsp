<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html>
<head>
    <title>用户管理</title>
    <%@include file="../common/head.jsp" %>
    <script>
        var yonghutype = [{
            "id" : "1",
            "text" : "订货方"
        }, {
            "id" : "2",
            "text" : "管理人员"
        }];
        var yonghuzt = [{
            "id" : "1",
            "text" : "有效"
        }, {
            "id" : "0",
            "text" : "无效"
        }];
        var list_yonghutype = new Array();
        list_yonghutype.push(yonghutype);
        $('#user_type').combobox({
            data: list_yonghutype
        });
        var list_yonghuzt = new Array();
        list_yonghuzt.push(yonghuzt);
        $('#user_type').combobox({
            data: list_yonghuzt
        });
    </script>
</head>
<body>
<div style="margin:20px 0;"></div>
<div class="easyui-panel" title="用户新增" style="width:400px">
    <div style="padding:10px 60px 20px 60px">
        <form id="form1" method="post">
            <table cellpadding="5">
                <tr>
                    <td>用户姓名:</td>
                    <td><input id="user_name" class="easyui-textbox" type="text" name="user_name" data-options="required:true"></input></td>
                </tr>
                <tr>
                    <td>用户类型:</td>
                    <td>
                        <input id="user_type" class="easyui-combobox" name="user_type" data-options="required:true,valueField:'id',textField:'text'"></select>
                    </td>
                </tr>
                <tr>
                    <td>有效状态:</td>
                    <td>
                        <select id="value_flag" class="easyui-combobox" name="value_flag" data-options="required:true,valueField:'id',textField:'text'"></select>
                    </td>
                </tr>
            </table>
        </form>
        <div style="text-align:center;padding:5px">
            <a href="javascript:void(0)" class="easyui-linkbutton" onclick="submitForm()">Submit</a>
            <a href="javascript:void(0)" cl ass="easyui-linkbutton" onclick="clearForm()">Clear</a>
        </div>
    </div>
</div>
<script>
    function submitForm(){
        $('#form1').form('submit');
    }
    function clearForm(){
        $('#form1').form('clear');
    }
</script>
</body>
</html>