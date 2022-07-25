<%--
  Created by IntelliJ IDEA.
  User: jiangzixuan
  Date: 2022/4/13
  Time: 14:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
    <script type="text/javascript">
        onloadFun = function(msg,isConfirm) {
            if (confirm(msg)) {
                if (isConfirm === 1){
                    location.href="${pageContext.request.contextPath}/connect/confirm";
                }else {
                    location.href="${pageContext.request.contextPath}/index.jsp";
                }
            }else {
                location.href="${pageContext.request.contextPath}/connect/refuse/"+${cid};
            }
        }
    </script>
</head>
<body onload="onloadFun('${msg}',${isConfirm})">

</body>
</html>
