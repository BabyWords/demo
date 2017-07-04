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
    <title>留言详情页面</title>
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
            width: 2000px;
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
<div class="container" style="margin-top:20px;" align="center">
        <table align="center" class="table table-bordered">
            <tr class="info">
                <td colspan="2" >反馈详情</td>
            </tr>
            <tr>
                <td>标题</td>
                <td>
                    ${message.title}
                </td>
            </tr>
            <tr>
                <td>联系方式：</td>
                <td>
                    ${message.phonenumber}
                </td>
            </tr>

            <tr class="info">
                <td colspan="2">留言内容</td>
            </tr>
            <tr>
                <td colspan="2">
                    ${message.content}
                </td>
            </tr>
            <%--<tr>--%>
                <%--<td>操作</td>--%>
                <%--<td>--%>
                    <%--<a href="#">标记为已处理</a>--%>
                <%--</td>--%>
            <%--</tr>--%>
            <tr>
                <td colspan="2" align="center">
                    <button type="button" class="btn btn-danger" onclick="back()">返回列表</button>
                    <%--<input type="button" value="返回列表" onclick="back()"/>--%>
                </td>

            </tr>

        </table>
</div>
<script type="text/javascript">

    function back(){
        history.go(-1);
    }
</script>
</body>
</div>
</html>