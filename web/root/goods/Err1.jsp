<%--
  Created by IntelliJ IDEA.
  User: szkj
  Date: 2022-11-16
  Time: 17:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <script src="js/jquery-3.2.1.min.js"></script>
    <title>用户名或密码错误</title>
</head>
<script type="text/javascript">
    $(function () {
        setTimeout(function () {
            location.href = "index.jsp";},
            3000);
    });
</script>
<style>
      div{
          text-align: center;margin-top: 15%;
          border: red  2px solid;
          border-radius: 10px;width:80%;
          margin-left: 10%;background-color: dodgerblue;
      }
</style>
<body style="background-image:url(imgs/1.png)">
     <div>
         <h1 style="color: red">请输入正确的用户名和密码！3秒后将自动跳转至登录页面。</h1>
         <h2 style="color: red"><a href="index.jsp">点击返回登录页面</a></h2>
     </div>
</body>
</html>
