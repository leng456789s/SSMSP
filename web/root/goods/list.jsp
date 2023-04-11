<%--
  Created by IntelliJ IDEA.
  User: szkj
  Date: 2022-11-16
  Time: 17:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="com.mysql.cj.Session" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>商品列表</title>
    <link rel="stylesheet" href="/css/bootstrap.css">
    <script type="application/javascript" src="/js/jquery-3.2.1.min.js"></script>
    <script type="application/javascript" src="/js/bootstrap.js"></script>
    <style>
        body,H3{
            background-color: dodgerblue;
            color: white;
            text-align: left;
        }
        div{
            width: 90%;
            margin: auto;
            text-align: right;
        }
        table{
            width: 100%;
            background-color: aliceblue;
            color: black;
        }
        th,td{
            border: 1px solid darkblue;
            height: 35px;
            text-align: center;
            word-break: break-all; word-wrap:break-word; /*表格内容自动折行*/
        }
    </style>
</head>
<body>
<%--        <%  //取Session中的LoginUser，如果取不到，说明还没有登录，那转到登录页--%>
<%--            String user=(String)session.getAttribute("LoginUser");--%>
<%--            if (user==null){--%>
<%--                System.out.println("user为空");--%>
<%--                request.getRequestDispatcher("/index.jsp").forward(request,response);--%>
<%--            }--%>
<%--        %>--%>
        <div>
            <div style="width: 100%;margin-top: 30px;margin-bottom: 10px">
                <table style="width: 100%;border: 0px red;background-color: dodgerblue">
                <tr style="border: 0px">
                    <td style="text-align: left;border: 0px;">
                        <H3 style="color: white">商品列表页</H3>
                        <H4 style="color: white" >当前用户:${LoginUser}</H4>
                    </td>
                    <td style="text-align: right;border:0px;vertical-align: bottom;" >
                        <form action="/goods/list" method="post" class="form-inline" style="margin-bottom: 0px">
                            <H4 style="color: white;display: inline" >按:</H4>
                            <select class="form-control"  name="conIndex" id="select1">
                                <option value="0">全部</option>
                                <option value="1">id号</option>
                                <option value="2">商品名称</option>
                                <option value="3">类别</option>
                            </select>
                            <input class="form-control" name="text_search" type="text" width="100%">&nbsp;
                            <input type="submit" class="btn btn-warning" value="查找商品"/>
                        </form>
                    </td>
                    <td style="text-align: right;border: 0px;vertical-align: bottom">
                         <button id="button1" class="btn btn-info">添加商品</button>
                         <button id="button2" class="btn btn-danger">删除选中商品</button>
                    </td>
                </tr>
                </table>
            </div>
            <table class="table table-hover">
                <tr>
                    <th>复选</th><th>序号</th><th>id号</th><th>商品名称</th><th>类型</th><th>商品介绍</th><th>价格</th>
                    <th>图片</th><th>库存</th><th>操作项</th>
                </tr>
                <c:forEach items="${goodsList}" var="goods" varStatus="st1">
                    <tr>
                        <td class="td1" style="vertical-align: middle"><input name="chk" type="checkbox" value=${goods.id}></td>
                        <td class="td1" style="vertical-align: middle">${st1.count}</td>
                        <td class="td1" style="vertical-align: middle">${goods.id}</td>
                        <td class="td1" style="vertical-align: middle">${goods.name}</td>
                        <td class="td1" style="vertical-align: middle">${goods.type}</td>
                        <td class="td1" style="vertical-align: middle">${goods.info}</td>
                        <td class="td1" style="vertical-align: middle">${goods.price}</td>
                        <td class="td1" style="vertical-align: middle"><img src=../img/${goods.picture}  alt="暂无图片" width="100px" height="100px"></td>
                        <td class="td1" style="vertical-align: middle">${goods.num}</td>
                        <td class="td1" style="vertical-align: middle">
                            <a href="/goods/deleteById?id=${goods.id}">删除</a>
                            <a href="/goods/selectById?id=${goods.id}">修改</a>
                        </td>
                    </tr>
                </c:forEach>
            </table>
        </div>
        <div>
             共计： <span id='spanPage1'>${pageGoods.pageCount}</span>页&nbsp&nbsp&nbsp&nbsp
             当前第：<span id='spanPage2'>${pageGoods.pageNum}</span>页&nbsp&nbsp&nbsp&nbsp
             <button id='b1' onclick='Fpage(${pageGoods.pageNum})' class="btn btn-info">上一页</button>
             <button id='b2' onclick='Npage(${pageGoods.pageNum})' class="btn btn-info">下一页</button>
        </div>
</body>
<script>
        $("#button1").click(function () {
            location.href = "../root/goods/Add.jsp"
        })
        function Fpage(pageNum){ //前翻一页
            let CurrentPage = pageNum - 1;
            if (CurrentPage==0){
                 CurrentPage=1;
             }
             window.location.href="list?GoodsCurrentPage="+CurrentPage
        }
        function Npage(pageNum){ //后翻一页
             let CurrentPage=pageNum+1;
             if (CurrentPage>${pageGoods.totalPage}){
                 CurrentPage=${pageGoods.totalPage}
             }
             window.location.href="list?GoodsCurrentPage="+CurrentPage
        }
        $("#button2").click(function () {
            $("table input:checkbox").each(function(){
                if($(this).is(":checked")==true){
                    //alert($(this).val())
                    $.post(
                        "/goods/deleteById",
                        {"id":$(this).val()},
                        function () {
                           return
                        }
                    )
                }
            })
            location.href ="/goods/list"; //刷新页面
        })
</script>
</html>
