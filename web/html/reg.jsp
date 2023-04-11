<%--
  Created by IntelliJ IDEA.
  User: szkj
  Date: 2022-11-17
  Time: 10:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta charset="utf-8">
    <title>会员注册</title>
    <meta name="viewport" content="width=device-width,minimum-scale=0.5,maximum-scale=1.0,initial-scale=1.0,user-scalable=no" />
    <!--外接样式表-->
    <link rel="stylesheet" href="../css/bootstrap.css" />
    <!--自己定义的css-->
    <link rel="stylesheet" href="../css/style.css" />
    <!--鼠标悬浮显示下拉菜单的css-->
    <link rel="stylesheet" href="../css/extend.css" />
    <!--两个框架-->
    <script type="text/javascript" src="../js/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="../js/bootstrap.js"></script>
</head>
<body style="background-image: url(../img/dlbj.png);
             background-position: center;
             background-repeat: no-repeat;
             background-attachment: fixed;
             background-color: sandybrown;
            ">
<%--<%  //打开此页时检查用户是否登录--%>
<%--    String user=(String)session.getAttribute("LoginUser");--%>
<%--    if (user==null){--%>
<%--        System.out.println("user为空");--%>
<%--        request.getRequestDispatcher("/index.jsp").forward(request,response);--%>
<%--    }--%>
<%--%>--%>
<!--插入分离出来的菜单--->
<iframe src="navbar.html" style="visibility: hidden"
        onload="this.before((this.contentDocument.body||this.contentDocument).children[0]);this.remove()"
        class="col-md-12"
></iframe>
<div style="width: 40%;margin-left: 30%;margin-top: 5%">
    <h3>会员注册：</h3>
    <form method="post" action="/add">
        <label>会员名称：</label><input class="form-control" type="text" id="name" name="name"><br/>
        <label>密   码：</label><input class="form-control" type="password" id="pwd" name="pwd"><br/>
        <label>再次输入密码：</label><input class="form-control" type="password" id="pwd1" name="pwd1"><br/>
        <label>电话：</label><input class="form-control" type="text" id="tel" name="name"><br/>
        <label>生日：</label><input class="form-control" type="date" id="birthday" name="name"><br/>
        <div style="text-align: right;margin-top: 6px" >
            <button id="button1" class="btn btn-danger">返回首页</button>
            <button id="button2" class="btn btn-info">注册</button>
            <input  type="reset" class="btn btn-warning" value="重填"/>
        </div>
    </form>
</div>
</body>
<script>
    <%-- 返回列表页--%>
    $("#button1").click(function () {
        $("form").submit(function () {  //取消提交
            return false;
        })
        location.href = "/control.jsp"
    })
    <%--取消form提交--%>
    function cancelPost() {
        $("form").submit(function () {
            return false;
        })
    }
    <%-- 对要输入的数据进行校验 --%>
    $("#button2").click(function () {
        if (${empty LoginUser}){
            alert("请先登录！")
            location.href = "index.jsp";
            cancelPost();
            return
        }
        let user=$("#name").val();
        if (user===""){
            alert("用户名不能为空！")
            cancelPost();
            return
        }
        let p1=$("#pwd").val();
        let p2=$("#pwd1").val();
        if (p1===""){
            alert("密码不能为空，请重新输入！")
            cancelPost();
            return
        }
        if (p1!=p2){
            alert("两次密码不一致，请重新输入！")
            cancelPost();
            return
        }
        let dept=$("#dept").val();
        if (dept===""){
            alert("部门不能为空！")
            cancelPost();
            return
        }
        $("form").submit();
    })
    $("#button3").click(function () {
        cancelPost();
        location.href = "/logOut"
    })
</script>
</html>
