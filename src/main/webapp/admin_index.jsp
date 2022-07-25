<%--
  Created by IntelliJ IDEA.
  User: jiangzixuan
  Date: 2022/4/19
  Time: 17:33
  To change this template use File | Settings | File Templates.
--%>
<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Admin</title>

    <link href="${pageContext.request.contextPath}/admin/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/admin/css/datepicker3.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/admin/css/bootstrap-table.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/admin/css/styles.css" rel="stylesheet">

    <!--[if lt IE 9]>
    <script src="${pageContext.request.contextPath}/admin/js/html5shiv.js"></script>
    <script src="${pageContext.request.contextPath}/admin/js/respond.min.js"></script>
    <![endif]-->

</head>

<body>
<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" href="#"><span>LSocial</span>Admin</a>
            <ul class="user-menu">
                <li class="dropdown pull-right">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                        <span class="glyphicon glyphicon-user"></span> ${admin.username} <span class="caret"></span></a>
                    <ul class="dropdown-menu" role="menu">
                        <li><a href="${pageContext.request.contextPath}/admin/loginOut"><span class="glyphicon glyphicon-log-out"></span> Logout</a></li>
                    </ul>
                </li>
            </ul>
        </div>

    </div><!-- /.container-fluid -->
</nav>

<div id="sidebar-collapse" class="col-sm-3 col-lg-2 sidebar">
    <div>
        <img src="${pageContext.request.contextPath}/img/chart.png" height="50" width="300">
    </div>
    <ul class="nav menu">
        <li><a href="${pageContext.request.contextPath}/admin_userList.jsp"><span class="glyphicon glyphicon-user"></span> 用户管理</a></li>
        <li><a href="${pageContext.request.contextPath}/admin_momentList.jsp"><span class="glyphicon glyphicon-envelope"></span> 动态管理</a></li>
        <li><a href="${pageContext.request.contextPath}/admin_commentList.jsp"><span class="glyphicon glyphicon-comment"></span> 评论管理</a></li>
        <li><a href="${pageContext.request.contextPath}/admin_adsList.jsp"><span class="glyphicon glyphicon-adjust"></span> 广告管理</a></li>
        <li><a href="${pageContext.request.contextPath}/admin_connection.jsp"><span class="glyphicon glyphicon-link"></span> 绑定管理</a></li>
        <li><a href="${pageContext.request.contextPath}/admin_dairyList.jsp"><span class="glyphicon glyphicon-text-width"></span> 日记管理</a></li>
        <li><a href="${pageContext.request.contextPath}/admin_photoList.jsp"><span class="glyphicon glyphicon-picture"></span> 照片管理</a></li>
        <li><a href="${pageContext.request.contextPath}/admin_eventList.jsp"><span class="glyphicon glyphicon-time"></span> 事件管理</a></li>
    </ul>
</div><!--/.sidebar-->

<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">

    <h1>Welcome</h1>

</div><!--/.main-->

<script src="${pageContext.request.contextPath}/admin/js/jquery-1.11.1.min.js"></script>
<script src="${pageContext.request.contextPath}/admin/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/admin/js/chart.min.js"></script>
<script src="${pageContext.request.contextPath}/admin/js/chart-data.js"></script>
<script src="${pageContext.request.contextPath}/admin/js/easypiechart.js"></script>
<script src="${pageContext.request.contextPath}/admin/js/easypiechart-data.js"></script>
<script src="${pageContext.request.contextPath}/admin/js/bootstrap-datepicker.js"></script>
<script src="${pageContext.request.contextPath}/admin/js/bootstrap-table.js"></script>
<script>
    !function ($) {
        $(document).on("click","ul.nav li.parent > a > span.icon", function(){
            $(this).find('em:first').toggleClass("glyphicon-minus");
        });
        $(".sidebar span.icon").find('em:first').addClass("glyphicon-plus");
    }(window.jQuery);

    $(window).on('resize', function () {
        if ($(window).width() > 768) $('#sidebar-collapse').collapse('show')
    })
    $(window).on('resize', function () {
        if ($(window).width() <= 767) $('#sidebar-collapse').collapse('hide')
    })
</script>
</body>

</html>

