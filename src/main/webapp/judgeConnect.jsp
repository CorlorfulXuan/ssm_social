<%--
  Created by IntelliJ IDEA.
  User: jiangzixuan
  Date: 2022/4/13
  Time: 13:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
    <script type="text/javascript">
        onloadFun = function(msg,page,uid) {
            if (confirm(msg)) {
                location.href="${pageContext.request.contextPath}/home/profile?page="+page+"&uid="+uid;
            }
        }
    </script>
</head>
<body onload="onloadFun('${msg}',${page},${user2.id});">

</body>
</html>
