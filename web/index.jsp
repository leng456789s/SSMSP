<%--
  Created by IntelliJ IDEA.
  User: Leng2
  Date: 2023/4/3
  Time: 10:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>$Title$</title>
  </head>
  <body>
  <jsp:forward page="${pageContext.request.contextPath}/goods/listAll?GoodsCurrentPage=1"></jsp:forward>
  </body>
</html>
