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
    <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/img/lsocial.png">
    <title></title>
    <!-- Slick Slider -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/vendor/slick/slick.min.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/vendor/slick/slick-theme.min.css"/>
    <!-- Feather Icon-->
    <link href="${pageContext.request.contextPath}/vendor/icons/feather.css" rel="stylesheet" type="text/css">
    <!-- Bootstrap core CSS -->
    <link href="${pageContext.request.contextPath}/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <!-- 插件中使用的默认图标来自 Bootstrap 5.x 图标库（可以通过加载下面的 CSS 来启用）-->
    <link rel = "stylesheet" href = "https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.min.css" crossorigin = "anonymous" >
    <!-- 文件输入插件样式化 CSS 文件 -->
    <link href = "${pageContext.request.contextPath}/vendor/bootstrap/css/fileinput.min.css" media = "all" rel = "stylesheet" type = "text/css" />
    <!-- Custom styles for this template -->
    <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet">
</head>
<body>
<!-- Navigation -->
<nav class="navbar navbar-expand navbar-dark bg-dark osahan-nav-top p-0">
    <div class="container">
        <a class="navbar-brand mr-2" href="${pageContext.request.contextPath}/index.jsp"><img src="${pageContext.request.contextPath}/img/lsocial.png" alt="">
        </a>
        <form action="${pageContext.request.contextPath}/user/search" id="search-form" method="post" class="d-none d-sm-inline-block form-inline mr-auto my-2 my-md-0 mw-100 navbar-search">
            <div class="input-group">
                <input type="text" class="form-control shadow-none border-0" name="search_email" placeholder="输入邮箱搜索" aria-label="Search" aria-describedby="basic-addon2">
                <div class="input-group-append">
                    <button class="btn" form="search-form" type="submit">
                        <i class="feather-search"></i>
                    </button>
                </div>
            </div>
        </form>
        <ul class="navbar-nav ml-auto d-flex align-items-center">
            <li class="nav-item">
                <a class="nav-link" href="${pageContext.request.contextPath}/connect/agree"><i class="feather-users mr-2"></i><span class="d-none d-lg-inline">Connection</span></a>
            </li>
            <li class="nav-item dropdown mr-2">
                <a class="nav-link dropdown-toggle pr-0" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    <i class="feather-heart mr-2"></i><span class="d-none d-lg-inline">Couple Space</span>
                </a>
                <!-- Dropdown - User Information -->
                <div class="dropdown-menu dropdown-menu-right shadow-sm">
                    <a class="dropdown-item" href="${pageContext.request.contextPath}/connect/goDoubleSpace/dairy"><i class="feather-file-text mr-1"></i> Dairy</a>
                    <a class="dropdown-item" href="${pageContext.request.contextPath}/connect/goDoubleSpace/photos"><i class="feather-camera mr-1"></i> Photos</a>
                    <a class="dropdown-item" href="${pageContext.request.contextPath}/connect/goDoubleSpace/events"><i class="feather-clock mr-1"></i> Events</a>
                </div>
            </li>
            <!-- Nav Item - User Information -->
            <li class="nav-item dropdown no-arrow ml-1 osahan-profile-dropdown">
                <a class="nav-link dropdown-toggle pr-0" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    <img class="img-profile rounded-circle" src="${pageContext.request.contextPath}/photos/<c:out value="${user.avatar}"></c:out>">
                </a>
                <!-- Dropdown - User Information -->
                <div class="dropdown-menu dropdown-menu-right shadow-sm">
                    <div class="p-3 d-flex align-items-center">
                        <div class="dropdown-list-image mr-3">
                            <img class="rounded-circle" src="${pageContext.request.contextPath}/photos/<c:out value="${user.avatar}"></c:out>" alt="">
                            <div class="status-indicator bg-success"></div>
                        </div>
                        <div class="font-weight-bold">
                            <div class="text-truncate"><c:out value="${user.username}"></c:out></div>
                            <div class="small text-gray-500"><c:out value="${user.sex}"></c:out></div>
                        </div>
                    </div>
                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item" href="${pageContext.request.contextPath}/home/profile?page=1&uid=${user.id}"><i class="feather-user mr-1"></i> Profile</a>
                    <a class="dropdown-item" href="${pageContext.request.contextPath}/user/loginOut"><i class="feather-log-out mr-1"></i> Logout</a>
                </div>
            </li>
        </ul>
    </div>
</nav>
<div class="py-4">
    <div class="container">
        <div class="row">
            <!-- Main Content -->
            <main class="col col-xl-6 order-xl-2 col-lg-12 order-lg-1 col-md-12 col-sm-12 col-12">
                <div class="box shadow-sm border rounded bg-white mb-3 osahan-share-post">
                    <ul class="nav nav-justified border-bottom osahan-line-tab" id="myTab" role="tablist">
                        <li class="nav-item">
                            <a class="nav-link active" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true"><i class="feather-edit"></i> Share an update</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" id="profile-tab" data-toggle="tab" href="#profile" role="tab" aria-controls="profile" aria-selected="false"><i class="feather-image"></i> Upload a photo</a>
                        </li>
                    </ul>
                    <div class="tab-content" id="myTabContent">
                        <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
                            <div class="p-3 d-flex align-items-center w-100" href="#">
                                <div class="dropdown-list-image mr-3">
                                    <img class="rounded-circle" src="${pageContext.request.contextPath}/photos/<c:out value="${user.avatar}"></c:out>" alt="">
                                    <div class="status-indicator bg-success"></div>
                                </div>
                                <div class="w-100">
                                    <form id="moment_form" method="post" action="${pageContext.request.contextPath}/moment/add-moment">
                                        <input type="hidden" name="uid" value="${user.id}">
                                        <textarea name="content" placeholder="Write your thoughts..." class="form-control border-0 p-0 shadow-none" rows="3"></textarea>
                                    </form>
                                </div>
                            </div>
                            <div class="border-top p-3 d-flex align-items-center">
                                <div class="mr-auto"></div>
                                <div class="flex-shrink-1">
                                    <button type="submit" form="moment_form" class="btn btn-primary btn-sm">Post Status</button>
                                </div>
                            </div>
                        </div>
                        <div class="tab-pane fade" id="profile" role="tabpanel" aria-labelledby="profile-tab">
                            <div class="p-3 w-100">
                                <textarea id="moment_content" name="moment_content" placeholder="Write your thoughts..." class="form-control border-0 p-0 shadow-none" rows="3"></textarea>
                                <input id="moment_imgUp" type="file" name="moment_img">
                            </div>
                        </div>
                    </div>
                </div>
                <c:forEach items="${momentList}" var="moment">
                <div class="box mb-3 shadow-sm border rounded bg-white osahan-post">
                    <div class="p-3 d-flex align-items-center border-bottom osahan-post-header">
                        <div class="dropdown-list-image mr-3">
                            <a href="${pageContext.request.contextPath}/home/profile?page=1&uid=${moment.user.id}">
                                <img class="rounded-circle" src="${pageContext.request.contextPath}/photos/${moment.user.avatar}" alt=""></a>
                        </div>
                        <div class="font-weight-bold">
                            <div class="text-truncate">${moment.user.username}</div>
                            <div class="small text-gray-500">${moment.user.sex}</div>
                        </div>
                        <span class="ml-auto small"><fmt:formatDate value="${moment.time}" pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate></span>
                    </div>
                    <div class="p-3 border-bottom osahan-post-body">
                        <p>${moment.content}</p>
                        <img src="${pageContext.request.contextPath}/img/${moment.img}" id="moment_img" class="img-fluid" onerror="noImg(${moment.img})" alt="">
                    </div>
                    <div class="p-3 border-bottom osahan-post-footer">
                        <a href="#" class="mr-3 text-secondary"><i class="feather-heart text-danger"></i> ${moment.like}</a>
                        <a href="#showComment${moment.id}" data-toggle="collapse" class="mr-3 text-secondary"><i class="feather-message-square"></i> ${moment.comment_num}</a>
                        <a href="#showComment${moment.id}" data-toggle="collapse" class="mr-3 text-secondary float-right"><i class="feather-align-right"></i></a>
                    </div>
                    <div id="showComment${moment.id}" class="panel-collapse collapse">
                    <c:forEach items="${moment.comments}" var="comment">
                    <div class="p-3 d-flex align-items-top border-bottom osahan-post-comment panel-body">
                        <div class="dropdown-list-image mr-3">
                            <a href="${pageContext.request.contextPath}/home/profile?page=1&uid=${comment.user.id}">
                                <img class="rounded-circle" src="${pageContext.request.contextPath}/photos/${comment.user.avatar}" alt="">
                            </a>
                        </div>
                        <div class="font-weight-bold">
                            <div class="text-truncate"> ${comment.user.username}</div>
                            <div class="small text-gray-500">${comment.content}</div>
                        </div>
                        <span class="ml-auto small"><fmt:formatDate value="${comment.time}" pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate></span>
                    </div>
                    </c:forEach>
                    </div>
                    <div class="p-3">
                        <form class="d-flex" action="${pageContext.request.contextPath}/comment/add-comment" method="post">
                            <textarea id="addComment" name="content" placeholder="Add Comment..." class="form-control border-0 p-0 shadow-none" rows="1"></textarea>
                            <input type="hidden" name="mid" value="<c:out value="${moment.id}"></c:out>">
                            <input type="submit" value="comment" class="btn btn-outline-primary pl-4 pr-4">
                            <input type="hidden" name="uid" value="<c:out value="${user.id}"></c:out>">
                        </form>
                    </div>
                </div>
                </c:forEach>
                <%--分页组件--%>
                <div class="col-md-12" style="background-color: white">
                    <nav aria-label="Page navigation example">
                        <ul class="pagination justify-content-center">
                            <li class="page-item"><a class="page-link" href="index.jsp?page=${pageInfo.firstPage}">首页</a></li>
                            <c:if test="${pageInfo.hasPreviousPage}">
                                <li class="page-item">
                                    <a class="page-link" href="index.jsp?page=${pageInfo.prePage}" aria-label="Previous">
                                        <span aria-hidden="true">&laquo;</span>
                                    </a>
                                </li>
                            </c:if>
                            <c:if test="${pageInfo.pages<=7}">
                                <c:forEach begin="1" end="${pageInfo.lastPage}" var="page">
                                    <li class="page-item <c:if test="${page==pageInfo.pageNum}">active</c:if>">
                                        <a class="page-link" href="index.jsp?page=${page}">${page}</a>
                                    </li>
                                </c:forEach>
                            </c:if>
                            <c:if test="${pageInfo.pages>7}">
                                <c:if test="${pageInfo.pageNum<=4}">
                                    <c:forEach begin="1" end="5" var="page">
                                        <li class="page-item <c:if test="${page==pageInfo.pageNum}">active</c:if>">
                                            <a class="page-link" href="index.jsp?page=${page}">${page}</a>
                                        </li>
                                    </c:forEach>
                                    <li class="page-item"><a class="page-link" href="#">...</a></li>
                                    <li class="page-item <c:if test="${page==pageInfo.pageNum}">active</c:if>">
                                        <a class="page-link" href="index.jsp?page=${pageInfo.lastPage}">${pageInfo.lastPage}</a>
                                    </li>
                                </c:if>
                                <c:if test="${pageInfo.pageNum>4}">
                                    <c:if test="${pageInfo.pageNum<pageInfo.lastPage-3}">
                                        <li class="page-item <c:if test="${page==pageInfo.pageNum}">active</c:if>">
                                            <a class="page-link" href="index.jsp?page=${pageInfo.firstPage}">${pageInfo.firstPage}</a>
                                        </li>
                                        <li class="page-item"><a class="page-link" href="#">...</a></li>
                                        <c:forEach begin="${pageInfo.pageNum-1}" end="${pageInfo.pageNum+1}" var="page">
                                            <li class="page-item <c:if test="${page==pageInfo.pageNum}">active</c:if>">
                                                <a class="page-link" href="index.jsp?page=${page}">${page}</a>
                                            </li>
                                        </c:forEach>
                                        <li class="page-item"><a class="page-link" href="#">...</a></li>
                                        <li class="page-item <c:if test="${page==pageInfo.pageNum}">active</c:if>">
                                            <a class="page-link" href="index.jsp?page=${pageInfo.lastPage}">${pageInfo.lastPage}</a>
                                        </li>
                                    </c:if>
                                    <c:if test="${pageInfo.pageNum>=pageInfo.lastPage-3}">
                                        <li class="page-item <c:if test="${page==pageInfo.pageNum}">active</c:if>">
                                            <a class="page-link" href="index.jsp?page=${pageInfo.firstPage}">${pageInfo.firstPage}</a>
                                        </li>
                                        <li class="page-item"><a class="page-link" href="#">...</a></li>
                                        <c:forEach begin="${pageInfo.lastPage-4}" end="${pageInfo.lastPage}" var="page">
                                            <li class="page-item <c:if test="${page==pageInfo.pageNum}">active</c:if>">
                                                <a class="page-link" href="index.jsp?page=${page}">${page}</a>
                                            </li>
                                        </c:forEach>
                                    </c:if>
                                </c:if>
                            </c:if>
                            <c:if test="${pageInfo.hasNextPage}">
                                <li class="page-item">
                                    <a class="page-link" href="index.jsp?page=${pageInfo.nextPage}" aria-label="Next">
                                        <span aria-hidden="true">&raquo;</span>
                                    </a>
                                </li>
                            </c:if>
                            <li class="page-item"><a class="page-link" href="index.jsp?page=${pageInfo.lastPage}">尾页</a></li>
                        </ul>
                    </nav>
                </div>
            </main>
            <aside class="col col-xl-3 order-xl-1 col-lg-6 order-lg-2 col-md-6 col-sm-6 col-12">
                <div class="box mb-3 shadow-sm border rounded bg-white profile-box text-center">
                    <div class="py-4 px-3 border-bottom">
                        <img src="${pageContext.request.contextPath}/photos/<c:out value="${user.avatar}"></c:out>" class="img-fluid mt-2 rounded-circle" alt="Responsive image">
                        <h5 class="font-weight-bold text-dark mb-1 mt-4"><c:out value="${user.username}"></c:out></h5>
                        <p class="mb-0 text-muted"><c:out value="${user.phone}"></c:out></p>
                    </div>
                    <div class="d-flex">
                        <div class="col-6 border-right p-3">
                            <h6 class="font-weight-bold text-dark mb-1"><c:out value="${updates}"></c:out></h6>
                            <p class="mb-0 text-black-50 small">Updates</p>
                        </div>
                        <div class="col-6 p-3">
                            <h6 class="font-weight-bold text-dark mb-1"><c:out value="${likes}"></c:out></h6>
                            <p class="mb-0 text-black-50 small">Likes</p>
                        </div>
                    </div>
                    <div class="overflow-hidden border-top">
                        <a class="font-weight-bold p-3 d-block" href="${pageContext.request.contextPath}/home/profile?page=1&uid=${user.id}"> View my profile </a>
                    </div>
                </div>
                <div class="box shadow-sm mb-3 rounded bg-white ads-box text-center">
                    <img src="${pageContext.request.contextPath}/img/<c:out value="${advertisement_1.img}"></c:out>" class="img-fluid" alt="Responsive image">
                    <div class="p-3 border-bottom">
                        <h6 class="font-weight-bold text-dark"><c:out value="${advertisement_1.topic}"></c:out></h6>
                        <p class="mb-0 text-muted"><c:out value="${advertisement_1.content}"></c:out></p>
                    </div>
                    <div class="p-3">
                        <button type="button" class="btn btn-outline-primary pl-4 pr-4" onclick="window.open('<c:out value="${advertisement_1.url}"></c:out>')"> GO TO SEE </button>
                    </div>
                </div>
            </aside>
            <aside class="col col-xl-3 order-xl-3 col-lg-6 order-lg-3 col-md-6 col-sm-6 col-12">
                <div class="box shadow-sm mb-3 rounded bg-white ads-box text-center overflow-hidden">
                    <img src="${pageContext.request.contextPath}/img/<c:out value="${advertisement_2.img}"></c:out>" class="img-fluid" alt="Responsive image">
                    <div class="p-3 border-bottom">
                        <h6 class="font-weight-bold text-gold"><c:out value="${advertisement_2.topic}"></c:out></h6>
                        <p class="mb-0 text-muted"><c:out value="${advertisement_2.content}"></c:out></p>
                    </div>
                    <div class="p-3">
                        <button type="button" class="btn btn-outline-gold pl-4 pr-4" onclick="window.open('<c:out value="${advertisement_2.url}"></c:out>')"> StartGame </button>
                    </div>
                </div>
                <div class="box shadow-sm border rounded bg-white mb-3">
                    <div class="box-title border-bottom p-3">
                        <h6 class="m-0">You May Be Interested
                        </h6>
                    </div>
                    <div class="box-body p-3">
                        <a href="${pageContext.request.contextPath}/home/profile?page=1&uid=${recommend_user.id}">
                            <div class="shadow-sm border rounded bg-white job-item mb-3">
                                <div class="d-flex align-items-center p-3 job-item-header">
                                    <div class="overflow-hidden mr-2">
                                        <h6 class="font-weight-bold text-dark mb-0 text-truncate"><c:out value="${recommend_user.username}"></c:out></h6>
                                        <div class="small text-gray-500"><i class="feather-user"></i> <c:out value="${recommend_user.sex}"></c:out></div>
                                        <div class="small text-gray-500"><i class="feather-calendar"></i> <c:out value="${recommend_userAge}"></c:out></div>
                                    </div>
                                    <img class="img-fluid ml-auto" src="${pageContext.request.contextPath}/photos/<c:out value="${recommend_user.avatar}"></c:out>" alt="">
                                </div>
                                <div class="d-flex align-items-center p-3 border-top border-bottom job-item-body">
                                    <span class="font-weight-bold text-muted"><c:out value="${recommend_user.email}"></c:out></span>
                                </div>
                            </div>
                        </a>
                    </div>
                </div>
            </aside>
        </div>
    </div>
</div>
<!-- Bootstrap core JavaScript -->
<script src="${pageContext.request.contextPath}/vendor/jquery/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- slick Slider JS-->
<script type="text/javascript" src="${pageContext.request.contextPath}/vendor/slick/slick.min.js"></script>
<!-- 主文件输入插件脚本JS文件-->
<script src = "${pageContext.request.contextPath}/vendor/bootstrap/js/fileinput.min.js" ></script>
<!-- 如果您需要翻译您的语言，则可以选择包含如下所述的语言环境文件（将 LANG.js 替换为您的语言语言环境）-->
<script src = "${pageContext.request.contextPath}/vendor/bootstrap/js/zh.js" ></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/myjs.js"></script>
<script type="text/javascript">
    $("#moment_imgUp").fileinput({
        language:'zh',
        uploadUrl: '${pageContext.request.contextPath}/moment/add-imgMoment',
        allowedFileExtensions: ['jpg','png','jpeg','gif'],
        maxFileCount: 1,
        maxFileSize: 10240,
        uploadLabel:"发布",
        uploadExtraData: function () {
            var data={
                moment_content:$("#moment_content").val()
            }
            return data;
        }
    }).on('fileuploaded',function (event,data) {
        if (data.response) {
            alert("发布成功");
            location.href="${pageContext.request.contextPath}/index.jsp"
        }
    })
</script>
</body>
</html>
