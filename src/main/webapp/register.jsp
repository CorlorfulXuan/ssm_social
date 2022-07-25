<%--
  Created by IntelliJ IDEA.
  User: jiangzixuan
  Date: 2022/3/19
  Time: 22:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" type="image/png" href="img/lsocial.png">
    <title></title>
    <!-- Slick Slider -->
    <link rel="stylesheet" type="text/css" href="vendor/slick/slick.min.css"/>
    <link rel="stylesheet" type="text/css" href="vendor/slick/slick-theme.min.css"/>
    <!-- Feather Icon-->
    <link href="vendor/icons/feather.css" rel="stylesheet" type="text/css">
    <!-- Bootstrap core CSS -->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom styles for this template -->
    <link href="css/style.css" rel="stylesheet">
</head>
<body>
<div class="bg-white">
    <div class="container">
        <div class="row justify-content-center align-items-center d-flex vh-100">
            <div class="col-md-4 mx-auto">
                <div class="osahan-login py-4">
                    <div class="text-center mb-4">
                        <img src="img/login.png" alt="">
                        <h5 class="font-weight-bold mt-3">Join LSocial</h5>
                        <p class="text-muted">Start connection</p>
                    </div>
                    <form action="${pageContext.request.contextPath}/user/register" method="post">
                        <div class="form-group">
                            <label class="mb-1">Username</label>
                            <div class="position-relative icon-form-control">
                                <i class="feather-user position-absolute"></i>
                                <input type="text" class="form-control" name="username">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="mb-1">Email</label>
                            <div class="position-relative icon-form-control">
                                <i class="feather-at-sign position-absolute"></i>
                                <input type="email" class="form-control" name="email">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="mb-1">Password (6 or more characters)</label>
                            <div class="position-relative icon-form-control">
                                <i class="feather-unlock position-absolute"></i>
                                <input type="password" class="form-control" name="password">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="mb-1">Phone</label>
                            <div class="position-relative icon-form-control">
                                <i class="feather-phone-call position-absolute"></i>
                                <input type="text" class="form-control" name="phone">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="mb-1">Born</label>
                            <div class="position-relative icon-form-control">
                                <i class="feather-calendar position-absolute"></i>
                                <input type="date" class="form-control" name="born">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="mb-1">Sex</label>
                            <div class="position-relative icon-form-control">
                                <label class="mb-1">Man</label>&nbsp;<input type="radio" name="sex" value="man" checked="checked">&nbsp;
                                <label class="mb-1">Woman</label>&nbsp;<input type="radio" name="sex" value="woman">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="mb-1">You agree to the LSocial <a href="#">User Agreement</a>, <a href="#">Privacy Policy</a>, and <a  href="#">Cookie Policy</a>.</label>
                        </div>
                        <input class="btn btn-primary btn-block text-uppercase" type="submit" value="Agree & Join">
                        <div class="py-3 d-flex align-item-center">
                            <span class="ml-auto"> Already on LSocial? <a class="font-weight-bold" href="login.jsp">Sign in</a></span>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Bootstrap core JavaScript -->
<script src="vendor/jquery/jquery.min.js"></script>
<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- slick Slider JS-->
<script type="text/javascript" src="vendor/slick/slick.min.js"></script>

</body>
</html>
