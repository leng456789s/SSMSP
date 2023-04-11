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
    <link rel="stylesheet" href="/css/bootstrap.css">
    <script type="application/javascript" src="/js/jquery-3.2.1.min.js"></script>
    <script type="application/javascript" src="/js/bootstrap.js"></script>
    <title>修改商品</title>
    <style>
        body,H3{
            background-color: dodgerblue;
            color: white;
            text-align: left;
        }
        .grid-container {  /*网格布局  两个列*/
            display: grid;
            grid-template-rows:100%; /*行宽度 高度*/
            grid-template-columns: 92% 8%; /*两个列宽的百分比*/
        }
    </style>
</head>
<body>
<%--   <%--%>
<%--       String user=(String)session.getAttribute("LoginUser");--%>
<%--       System.out.println(user);--%>
<%--       if (user==null){--%>
<%--            System.out.println("user为空");--%>
<%--            request.getRequestDispatcher("/index.jsp").forward(request,response);--%>
<%--       }--%>
<%--   %>--%>
   <div style="width: 50%;margin-left: 25%;margin-top: 1%">
       <h3>修改商品：</h3>
       <form   action="/goods/modify" method="post" enctype="multipart/form-data">
           <input type="hidden" id="id" name="name" value="${goods.id}">
           <label>商品名称：</label><input class="form-control" type="text" id="id" name="name" value=${goods.name}><br/>
           <label>类   别：</label>
           <select class="form-control"  name="type1" id="type1">
               <option value="奶茶">奶茶</option>
               <option value="美食">美食</option>
               <option value="咖啡">咖啡</option>
               <option value="其它">其它</option>
               <%--                    <option selected="selected" value="0">奶茶</option>--%>
           </select>
           <label>价   格：</label><input class="form-control" type="text" id="price1" name="price1" value=${goods.price}><br/>
           <label>库存数量：</label><input class="form-control" type="text" id="num" name="num" value=${goods.num}><br/>
           <label>商品简介：</label><textarea class="form-control"  id="info" name="info" rows="2" resize="none">${goods.info}</textarea>
           <label>图   片：</label><br/>
           <div class="grid-container" style="border: white 2px solid;">
               <div style="border: red 1px solid;text-align: center">
                   <img id="pic" src=../img/${goods.picture} class="img-thumbnail" style="width: 180px;height: 180px">
               </div>
               <div style="border: black 1px solid;text-align: right">
                   <input  type="file" name="myFile" id="img-upload" style="display: none">
                   <label  id="up" for="img-upload" class="btn btn-danger">选择<br>文件</label>
                   <button id="clear" class="btn btn-warning">清除</button>
               </div>
           </div>
           <div style="text-align: right;margin-top: 6px;" >
               <button id="button1" class="btn btn-info">返回列表</button>
               <input  id="button2" type="submit" value="修改" class="btn btn-info">
               <input  type="reset" class="btn btn-warning" value="清空"/>
           </div>
       </form>
   </div>
</body>
<script>
    $( //页面打开设置下拉列表的值
        function () {
            $("#type1").val("${goods.type}")
        }
    )
    <%-- 返回列表页--%>
    $("#button1").click(function () {
        $("form").submit(function () {  //取消提交
            return false;
        })
        location.href = "/goods/list"
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
        let name=$("#name").val();
        if (name===""){
            alert("商品名称不能为空！")
            cancelPost();
            return
        }
        let type1=$("#type1").val();
        if (type1===""){
            alert("类别名称不能为空！")
            cancelPost();
            return
        }
        let price=$("#price1").val();
        if (price===""){
            alert("价格不能为空，请重新输入！")
            cancelPost();
            return
        }
        let dept=$("#num").val();
        if (dept===""){
            alert("库存数量不能为空！")
            cancelPost();
            return
        }
        $("form").submit()
    })
    $("#img-upload").change(function () {
        let filePath=$("#img-upload").val();
        //alert(filePath) //显示路径，高版本的一些浏览器为的安全，这个路径是不正确的。
        //应对方式
        let url = null;
        let fileObj = document.getElementById("img-upload").files[0]; //得到一个文件对象
        if (window.createObjcectURL !== undefined) {//当文件对象不是未定义
            url = window.createOjcectURL(fileObj); //此时创建一个URL地址
        } else if (window.URL !== undefined) {  //如果
            url = window.URL.createObjectURL(fileObj);
        } else if (window.webkitURL !== undefined) {
            url = window.webkitURL.createObjectURL(fileObj);
        }
        //alert(url);//显示一个加密的路径。
        $("#pic").attr("src",url);
        // let imgElem = document.getElementById("img-upload");
        // imgElem.src = url;
    })
</script>
</html>
