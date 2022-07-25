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
        <li><a href="${pageContext.request.contextPath}/admin_adsList.jsp"><span class="glyphicon glyphicon-adjust"></span> 广告管理</a></li>
        <li class="active"><a href="${pageContext.request.contextPath}/admin_connection.jsp"><span class="glyphicon glyphicon-link"></span> 绑定管理</a></li>
        <li><a href="${pageContext.request.contextPath}/admin_dairyList.jsp"><span class="glyphicon glyphicon-text-width"></span> 日记管理</a></li>
        <li><a href="${pageContext.request.contextPath}/admin_photoList.jsp"><span class="glyphicon glyphicon-picture"></span> 照片管理</a></li>
        <li><a href="${pageContext.request.contextPath}/admin_eventList.jsp"><span class="glyphicon glyphicon-time"></span> 事件管理</a></li>
    </ul>
</div><!--/.sidebar-->

<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
    <div class="row">
        <ol class="breadcrumb">
            <li><a href="${pageContext.request.contextPath}/admin_index.jsp"><span class="glyphicon glyphicon-home"></span></a></li>
            <li class="active">绑定管理</li>
        </ol>
    </div><!--/.row-->


    <div class="row">
        <div class="col-lg-12">
            <div class="panel panel-default">
                <div class="panel-heading">绑定列表</div>
                <div class="panel-body">
                    <table data-toggle="table" data-locale="zh-CN" data-url="${pageContext.request.contextPath}/admin/connection-list" data-show-refresh="true" data-show-toggle="true" data-show-columns="true"
                           data-search="true" data-select-item-name="id" data-pagination="true" data-sort-name="id">
                        <thead>
                        <tr>
                            <th data-field="id" data-sortable="true">ID</th>
                            <th data-field="uid1"  data-sortable="true">User1</th>
                            <th data-field="uid2"  data-sortable="true">User2</th>
                            <th data-field="create_time" data-sortable="true">Create_ime</th>
                            <th data-field="isConfirm" data-sortable="true">IsConfirm</th>
                            <th data-field="dairy_num" data-sortable="true">Dairy_num</th>
                            <th data-field="photo_num" data-sortable="true">Photo_num</th>
                            <th data-field="event_num" data-sortable="true">Event_num</th>
                            <th data-field="operator" data-events="operateEvents" data-formatter="actionFormatter">Operator</th>
                        </tr>
                        </thead>
                    </table>
                </div>
            </div>
        </div>
    </div><!--/.row-->

    <%--    删除态模拟框--%>
    <div class="modal fade" id="delModal" tabindex="-1" role="dialog" aria-labelledby="delModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title" id="delModalLabel">操作提示:</h4>
                </div>
                <div class="modal-body">
                    <input type="hidden" id="del_ids" name="ids" value="">
                    <h5 id="delBody">确定要删除选中的数据？</h5>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" id="deleteIds">确定删除</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">取消
                    </button>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal -->
    </div>
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
        var html = "<img src=\'${pageContext.request.contextPath}/img/"+value+"\' width=\'50\' height=\'50\'/>";
        return html
    }

    //操作栏的格式化
    function actionFormatter(value, row, index) {
        return [
            '<button id="deleteTable" type="button" style="margin:5px" class="btn  btn-xs btn-danger" onclick="DeleteByIds('+row.id+')">删除</button>',
        ].join('');
    }
    //定义表格操作编辑删除 title="删除"
    function DeleteByIds(id){
        var ids = [];
        ids.push(id);
        //把ids的值给到隐藏输入框
        $('#del_ids').val(JSON.stringify(ids));
        //调出删除模态框
        $("#delModal").modal();
    }
    // 点确定按钮发delete请求
    $("#deleteIds").click(function() {
        var del_ids = $('#del_ids').val();
        $.ajax({
            cache: false,
            url: "${pageContext.request.contextPath}/admin/delConnection", //url
            type: "DELETE",  //方法类型
            contentType:"application/json",//设置请求参数类型为json字符串
            dataType: "json",  //预期服务器返回的数据类型
            data: JSON.stringify({ids: del_ids}),
            success: function (result) {
                //隐藏模态框
                $("#delModal").modal('hide');
                if (result.msg === "success"){
                    // 此处可以显示一个toast消息
                    alert('删除成功！')
                    location.reload();
                }else if(result.msg === "login"){
                    alert("请先登录")
                    location.href="${pageContext.request.contextPath}/admin_login.jsp"
                } else {
                    alert("删除失败")
                }
            },
            error: function () {
                $("#delModal").modal('hide');
                // 此处可以显示一个toastr消息
                alert("删除失败,服务器异常")
            }
        });
    })

</script>
</body>

</html>

