<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+ path + "/";
    pageContext.setAttribute("basePath", basePath);
    pageContext.setAttribute("path", path);
%>
<html>
<head>
    <meta charset="utf-8">

    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="keywords" content="">
    <meta name="description" content="">
    <link href="css/bootstrap.min14ed.css?v=3.3.6" rel="stylesheet">
    <link href="css/font-awesome.min93e3.css?v=4.4.0" rel="stylesheet">
    <link href="css/animate.min.css" rel="stylesheet">
    <link href="css/style.min862f.css?v=4.1.0" rel="stylesheet">
    <!--[if lt IE 9]>
    <meta http-equiv="refresh" content="0;ie.html"/>
    <![endif]-->
    <%--<script>if(window.top !== window.self){ window.top.location = window.location;}</script>--%>
</head>
<body>

<div class="middle-box text-center loginscreen  animated fadeInDown">
    <div>
        <div>
            <h2>管理员登陆</h2>
        </div>
        <%--<h3>欢迎使用 H+</h3>--%>

        <form class="m-t" role="form" method="post" action="<%=basePath%>user/login" id="LoginFrm">
            <div class="form-group">
                <input type="text" class="form-control" placeholder="用户名"  id="userid" name="userid">
            </div>
            <div class="form-group">
                <input type="password" class="form-control" placeholder="密码"  id="password" name="password">
            </div>
            <button type="button" class="btn btn-primary block full-width m-b" onclick="doLogin();">登 录</button>
        </form>
    </div>
</div>

<script src="js/jquery.min.js?v=2.1.4"></script>
<script src="js/bootstrap.min.js?v=3.3.6"></script>
<script type="text/javascript" src="http://tajs.qq.com/stats?sId=9051096" charset="UTF-8"></script>
<<script type="text/javascript">
    <%--function doLogin(){--%>
        <%--$.post("${path}/user/login.do",$("LoginFrm").serialise())--%>
    <%--}--%>
        function doLogin(){
            document.getElementById("LoginFrm").submit();
        }
</script>
</body>
</html>
