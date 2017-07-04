
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
    pageContext.setAttribute("basePath", basePath);
    pageContext.setAttribute("path", path);
%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <link rel="stylesheet" type="text/css" href="<%=path%>/layui/css/layui.css"/>
    <link rel="stylesheet" href="<%=path%>/css/bootstrap.min.css" type="text/css"/>
    <script type="text/javascript" src="<%=path%>/js/jquery.min.js"></script>
    <%--<script type="text/javascript" src="<%=path%>/js/bootstrap.min.js"></script>--%>
    <style type="text/css">

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
    <title>反馈列表</title>
</head>
<body>
<script type="text/javascript" src="<%=path%>/layui/layui.js"></script>
<div id="dd">
    <img src="<%=path%>/pic/bg_top.png"/>
</div>
<div style="width:10%;float:left;margin-top:56px">
    <table width="100%" class="table">
        <tr>
            <td bgcolor="#444BB"><font color="white"/>操作</td>
        </tr>
        <tr>
            <td>
                欢迎，${sessionScope.sessionuser.username}
            </td>

        </tr>
        <tr>
            <td>
                <a href="<%=basePath%>message/tolist" style="font-size:15px">全部反馈</a>
            </td>

        </tr>
        <tr>
            <td>
                <a href="<%=basePath%>message/toaddinput" style="font-size:15px">添加反馈</a>
            </td>
        </tr>
        <tr>
            <td>
                <a href="<%=basePath%>message/showmymessage" style="font-size:15px">我的反馈</a>
            </td>
        </tr>
    </table>
</div>
<div style="float:left;width:90%">
    <h3 style="text-align:center">反馈列表</h3>
    <table align="center" width="100%" class="table table-striped table-bordered table-hover">
        <tr align="center">
            <td bgcolor="#444BB"><font color="white">序号</font></td>
            <td bgcolor="#444BB"><font color="white">标题</font></td>
            <td bgcolor="#444BB"><font color="white">发布时间</font></td>
            <td bgcolor="#444BB"><font color="white">作者</font></td>
            <td bgcolor="#444BB"><font color="white">部門</font></td>
            <c:if test="${sessionScope.sessionuser.type eq '0'}">
                <td bgcolor="#444BB"><font color="white">状态</font></td>
            </c:if>
            <c:if test="${sessionScope.sessionuser.type eq '3'}">
                <td bgcolor="#444BB"><font color="white">管理操作</font></td>
            </c:if>
        </tr>
        <c:forEach items="${messagelist}" var="list" varStatus="status">
            <tr id="tr${list.id}" align="center">
                <td><c:out value="${status.index+1}"> </c:out></td>
                <td><a href="<%=basePath%>message/showdetail?messageid=${list.id}">${list.title}</a></td>
                <td>${list.create_time}</td>
                <td>${list.username}</td>
                <td>${list.deptname}</td>
                <c:if test="${sessionScope.sessionuser.type eq '0'}">
                    <c:if test="${list.status eq '1'}">
                        <td>已处理</td>
                    </c:if>
                    <c:if test="${list.status eq '0'}">
                        <td>未处理</td>
                    </c:if>

                </c:if>

                <c:if test="${sessionScope.sessionuser.type eq '3'}">
                    <c:if test="${list.status eq '0'}">
                        <td><a id="${list.id}" href="#" onclick="changestatus('${list.id}')">标为已处理</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="#" onclick="deletemessage('${list.id}')">删除</a> </td>
                    </c:if>
                    <c:if test="${list.status eq '1'}">
                        <td>已处理&nbsp;&nbsp;|&nbsp;&nbsp;<a href="#" onclick="deletemessage('${list.id}')">删除</a> </td>
                    </c:if>
                </c:if>
            </tr>
        </c:forEach>
    </table>
    <div id="pagecontent"  align="center"></div>
</div>

<script type="text/javascript">
    layui.use(['layer', 'laypage'], function () {
        var laypage = layui.laypage;
        laypage({
            cont: 'pagecontent' //分页容器的id
            , pages: '${page.totalPage}' //总页数
            , skin: '#8ab86e' //自定义选中色值
            , skip: true //开启跳页
            , curr: '${page.currentPage}'
            , jump: function (obj, first) {
                if (first != true) {
                    window.location.href = "<%=basePath%>message/tolist?currentPage=" + obj.curr;
                }
            }
        });
    });
    function changestatus(id){

        $.ajax({
            url:'<%=basePath%>message/changestatus',
            data:{id:id},
            success:function(){
                $("#"+id).text("已处理");
            }
        });
    };

    function deletemessage(id){
        $.ajax({
            url:'<%=basePath%>message/deletemessage',
            data:{id:id},
            success:function(){
                $("#tr"+id).remove();
            }
        });
    };
</script>
</body>
</html>