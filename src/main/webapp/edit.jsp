<%--
  Created by IntelliJ IDEA.
  User: jiangzixuan
  Date: 2022/3/19
  Time: 22:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/img/lsocial.png">
    <title></title>
    <!-- Slick Slider -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/vendor/slick/slick.min.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/vendor/slick/slick-theme.min.css"/>
    <!-- Feather Icon-->
    <link href="${pageContext.request.contextPath}/vendor/icons/feather.css" rel="stylesheet" type="text/css">
    <!-- Bootstrap core CSS -->
    <link href="${pageContext.request.contextPath}/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom styles for this template -->
    <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet">
</head>
<body>
<div class="bg-white">
    <div class="container">
        <div class="row justify-content-center align-items-center d-flex vh-100">
            <div class="col-md-4 mx-auto">
                <div class="osahan-login py-4">
                    <div class="text-center mb-4">
                        <a href="${pageContext.request.contextPath}/uploadAvatar.jsp"><img src="${pageContext.request.contextPath}/photos/${user.avatar}" class="mt-2 rounded-circle" width="200" height="200" alt="Responsive image"></a>
                        <p class="text-muted">点击可修改头像</p>
                    </div>
                    <form action="${pageContext.request.contextPath}/user/update" method="post">
                        <input type="hidden" name="id" value="${user.id}">
                        <div class="form-group">
                            <label class="mb-1">Username</label>
                            <div class="position-relative icon-form-control">
                                <i class="feather-user position-absolute"></i>
                                <input type="text" class="form-control" name="username" value="${user.username}">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="mb-1">Email</label>
                            <div class="position-relative icon-form-control">
                                <i class="feather-at-sign position-absolute"></i>
                                <input type="email" class="form-control" name="email" value="${user.email}">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="mb-1">Phone</label>
                            <div class="position-relative icon-form-control">
                                <i class="feather-phone-call position-absolute"></i>
                                <input type="text" class="form-control" name="phone" value="${user.phone}">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="mb-1">Born</label>
                            <div class="position-relative icon-form-control">
                                <i class="feather-calendar position-absolute"></i>
                                <input type="date" class="form-control" name="born" value="<fmt:formatDate value='${user.born}' pattern='yyyy-MM-dd'></fmt:formatDate>">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="mb-1">Sex</label>
                            <div class="position-relative icon-form-control">
                                <label class="mb-1">Man</label>&nbsp;<input type="radio" name="sex" value="man" checked="checked">&nbsp;
                                <label class="mb-1">Woman</label>&nbsp;<input type="radio" name="sex" value="woman">
                            </div>
                        </div>
                        <input class="btn btn-primary btn-block text-uppercase" type="submit" value="修改">
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Bootstrap core JavaScript -->
<script src="${pageContext.request.contextPath}/vendor/jquery/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- slick Slider JS-->
<script type="text/javascript" src="${pageContext.request.contextPath}/vendor/slick/slick.min.js"></script>

</body>
</html>
