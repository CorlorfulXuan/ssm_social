<%--
  Created by IntelliJ IDEA.
  User: jiangzixuan
  Date: 2022/3/19
  Time: 22:46
  To change this template use File | Settings | File Templates.
--%>
<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
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
                    <form action="${pageContext.request.contextPath}/admin/updateAds" method="post" enctype="multipart/form-data">
                        <input type="hidden" name="id" value="${ads.id}">
                        <div class="form-group">
                            <label class="mb-1">Topic</label>
                            <div class="position-relative icon-form-control">
                                <i class="feather-edit position-absolute"></i>
                                <input type="text" class="form-control" name="topic" value="${ads.topic}">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="mb-1">Content</label>
                            <div class="position-relative icon-form-control">
                                <i class="feather-edit position-absolute"></i>
                                <input type="text" class="form-control" name="content" value="${ads.content}">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="mb-1">Url</label>
                            <div class="position-relative icon-form-control">
                                <i class="feather-link-2 position-absolute"></i>
                                <input type="url" class="form-control" name="url" value="${ads.url}">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="mb-1">Img</label>
                            <div class="position-relative icon-form-control">
                                <i class="feather-image position-absolute"></i>
                                <input type="file" class="form-control" name="imgFile" accept="image/*">
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
