<%--
  Created by IntelliJ IDEA.
  User: jiangzixuan
  Date: 2022/4/19
  Time: 22:46
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
        <li class="active"><a href="${pageContext.request.contextPath}/admin_adsList.jsp"><span class="glyphicon glyphicon-adjust"></span> 广告管理</a></li>
        <li><a href="${pageContext.request.contextPath}/admin_connection.jsp"><span class="glyphicon glyphicon-link"></span> 绑定管理</a></li>
        <li><a href="${pageContext.request.contextPath}/admin_dairyList.jsp"><span class="glyphicon glyphicon-text-width"></span> 日记管理</a></li>
        <li><a href="${pageContext.request.contextPath}/admin_photoList.jsp"><span class="glyphicon glyphicon-picture"></span> 照片管理</a></li>
        <li><a href="${pageContext.request.contextPath}/admin_eventList.jsp"><span class="glyphicon glyphicon-time"></span> 事件管理</a></li>
    </ul>
</div><!--/.sidebar-->

<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
    <div class="row">
        <ol class="breadcrumb">
            <li><a href="${pageContext.request.contextPath}/admin_index.jsp"><span class="glyphicon glyphicon-home"></span></a></li>
            <li class="active">广告管理</li>
        </ol>
    </div><!--/.row-->


    <div class="row">
        <div class="col-lg-12">
            <div class="panel panel-default">
                <div class="panel-heading">广告列表</div>
                <div class="panel-body">
                    <table data-toggle="table" data-locale="zh-CN" data-url="${pageContext.request.contextPath}/admin/ads-list" data-show-refresh="true" data-show-toggle="true" data-show-columns="true"
                           data-search="true" data-select-item-name="id" data-pagination="true" data-sort-name="id">
                        <thead>
                        <tr>
                            <th data-field="id" data-sortable="true">ID</th>
                            <th data-field="topic"  data-sortable="true">Topic</th>
                            <th data-field="content" data-sortable="true">Content</th>
                            <th data-field="url" data-sortable="true">Url</th>
                            <th data-field="img" data-formatter="showImg">Img</th>
                            <th data-field="operator" data-events="operateEvents" data-formatter="actionFormatter">Operator</th>
                        </tr>
                        </thead>
                    </table>
                </div>
            </div>
        </div>
    </div><!--/.row-->

</div><!--/.main-->

<script src="${pageContext.request.contextPath}/admin/js/jquery-1.11.1.min.js"></script>
<script src="${pageContext.request.contextPath}/admin/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/admin/js/chart.min.js"></script>
<script src="${pageContext.request.contextPath}/admin/js/chart-data.js"></script>
<script src="${pageContext.request.contextPath}/admin/js/easypiechart.js"></script>
<script src="${pageContext.request.contextPath}/admin/js/easypiechart-data.js"></script>
<script src="${pageContext.request.contextPath}/admin/js/bootstrap-datepicker.js"></script>
<script src="${pageContext.request.contextPath}/admin/js/bootstrap-table.js"></script>
<script src="${pageContext.request.contextPath}/admin/js/bootstrap-table-zh-CN.js"></script>
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
    function showImg(value) {
        var html = "<img src=\'${pageContext.request.contextPath}/img/"+value+"\' width=\'150\' height=\'150\'/>";
        return html
    }

    //操作栏的格式化
    function actionFormatter(value, row, index) {
        return [
            '<button id="editTable" type="button" style="margin:5px" class="btn  btn-xs btn-info" onclick="editViewById('+row.id+')">编辑</button>'
            ].join('');
    }
    function editViewById(id) {
        location.href="${pageContext.request.contextPath}/admin/editAds/"+id;
    }
</script>
</body>

</html>


