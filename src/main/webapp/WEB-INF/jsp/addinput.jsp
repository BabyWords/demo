<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
    pageContext.setAttribute("basePath", basePath);
    pageContext.setAttribute("path", path);
%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>留言添加页面</title>
    <script type="text/javascript"
            src="<%=path%>/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="<%=path%>/layui/css/layui.css" type="text/css">
    <link rel="stylesheet"
          href="<%=path%>/css/bootstrap.min.css"
          type="text/css"/>
    <style type="text/css">
        .msgDialog {
            display: none;
        }
        #dd {
            width: 1800px;
            height: 150px;
            background: #1C2A67
        }
        #dd img {
            width: 70%;
            height: 100%
        }
    </style>
</head>
<body>
<div id="dd">
    <img src="<%=path%>/pic/bg_top.png">
</div>
<div class="container" style="margin-top:20px">
    <form id="addForm" action="<%=basePath%>/message/addmessage" method="post">
        <table  align="center" class="table table-bordered">
            <tr class="info">
                <td colspan="2"><span style="color:#f00"></span>${sessionScope.sessionuser.username},请填写您所遇到的问题</td>
            </tr>
            <tr>
                <td>留言标题</td>
                <td>
                    <input type="text" id="title" name="title" size="50"  placeholder="请输入标题">
                </td>
            </tr>
            <tr>
                <td>您的联系方式：</td>
                <td>
                    <input onKeyUp="value=value.replace(/[^\d]/g,'')" onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))" type="text" id="phonenumber" name="phonenumber" size="50" class="required" placeholder="请输入正确的电话号码">
                </td>
            </tr>
            <tr>
                <td>留言内容</td>
                <td>
                    <script id="content" name="content" type="text/plain"></script>
                </td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <%--<input type="submit" value="添加留言"/>--%>
                    <button class="btn btn-success" type="button" onclick="formsubmit()" value="添加留言">添加留言</button>
                    <%--<input type="button" value="返回列表" onclick="back()"/>--%>
                        <button class="btn btn-danger" type="button" value="返回列表" onclick="back()">返回列表</button>
                </td>
            </tr>
        </table>
    </form>
    <script type="text/javascript" src="<%=path%>/ueditor/ueditor.config.js"></script>
    <script type="text/javascript" src="<%=path%>/ueditor/ueditor.all.js"></script>
    <script type="text/javascript" src="<%=path%>/js/jquery.min.js"></script>
    <script type="text/javascript">
        var ue = UE.getEditor('content');
        function back(){
            history.go(-1);
        }
        function formsubmit() {
            var title=$("#title").val();

            if (title == ""){
                alert("请添加标题！");
                $("#title").focus();
                return;
            }else {
                if(title.length>50){
                    alert("标题过长")
                    return;
                }
                $("#addForm").submit();
            }
        }
    </script>
</div>
</body>
</div>
</html>