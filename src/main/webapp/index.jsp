<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <jsp:forward page="${pageContext.request.contextPath}/home/index?page=${param.page}"></jsp:forward>
</body>
</html>