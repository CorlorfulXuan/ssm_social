<%--
  Created by IntelliJ IDEA.
  User: jiangzixuan
  Date: 2022/3/20
  Time: 10:47
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
            <main class="col">
                <div class="box mb-3 shadow-sm border rounded bg-white profile-box text-center">
                    <div class="py-4 px-3 border-bottom">
                        <img src="${pageContext.request.contextPath}/photos/${pro_user.avatar}" class="mt-2 rounded-circle" width="200" height="200" alt="Responsive image">
                        <h5 class="font-weight-bold text-dark mb-1 mt-4">${pro_user.username}</h5>
                    </div>
                    <div class="d-flex">
                        <div class="col-6 border-right p-3">
                            <p class="mb-0 text-black-50 small">性别</p>
                            <h6 class="font-weight-bold text-dark mb-1">${pro_user.sex}</h6>
                        </div>
                        <div class="col-6 p-3">
                            <p class="mb-0 text-black-50 small">年龄</p>
                            <h6 class="font-weight-bold text-dark mb-1">${age}</h6>
                        </div>
                    </div>
                    <div class="d-flex">
                        <div class="col-6 border-right p-3">
                            <p class="mb-0 text-black-50 small">邮箱</p>
                            <h6 class="font-weight-bold text-dark mb-1">${pro_user.email}</h6>
                        </div>
                        <div class="col-6 p-3">
                            <p class="mb-0 text-black-50 small">电话</p>
                            <h6 class="font-weight-bold text-dark mb-1">${pro_user.phone}</h6>
                        </div>
                    </div>
                    <div class="d-flex">
                        <div class="col-6 border-right p-3">
                            <p class="mb-0 text-black-50 small">动态数</p>
                            <h6 class="font-weight-bold text-dark mb-1">${updates}</h6>
                        </div>
                        <div class="col-6 p-3">
                            <p class="mb-0 text-black-50 small">获赞数</p>
                            <h6 class="font-weight-bold text-dark mb-1">${likes}</h6>
                        </div>
                    </div>
                    <div class="overflow-hidden border-top">
                        <a class="font-weight-bold p-3 d-block" href="javascript:void(0)" onclick="goConnect(${pro_user.id},'${pro_user.username}')"> Connect </a>
                    </div>
                </div>
                <c:forEach items="${momentList}" var="moment">
                    <div class="box mb-3 shadow-sm border rounded bg-white osahan-post">
                        <div class="p-3 d-flex align-items-center border-bottom osahan-post-header">
                            <div class="dropdown-list-image mr-3">
                                <img class="rounded-circle" src="${pageContext.request.contextPath}/photos/${moment.user.avatar}" alt="">
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
                                        <img class="rounded-circle" src="${pageContext.request.contextPath}/photos/${comment.user.avatar}" alt="">
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
                            <li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/home/profile?page=${pageInfo.firstPage}&uid=${pro_user.id}">首页</a></li>
                            <c:if test="${pageInfo.hasPreviousPage}">
                                <li class="page-item">
                                    <a class="page-link" href="${pageContext.request.contextPath}/home/profile?page=${pageInfo.prePage}&uid=${pro_user.id}" aria-label="Previous">
                                        <span aria-hidden="true">&laquo;</span>
                                    </a>
                                </li>
                            </c:if>
                            <c:if test="${pageInfo.pages<=7}">
                                <c:forEach begin="1" end="${pageInfo.lastPage}" var="page">
                                    <li class="page-item <c:if test="${page==pageInfo.pageNum}">active</c:if>">
                                        <a class="page-link" href="${pageContext.request.contextPath}/home/profile?page=${page}&uid=${pro_user.id}">${page}</a>
                                    </li>
                                </c:forEach>
                            </c:if>
                            <c:if test="${pageInfo.pages>7}">
                                <c:if test="${pageInfo.pageNum<=4}">
                                    <c:forEach begin="1" end="5" var="page">
                                        <li class="page-item <c:if test="${page==pageInfo.pageNum}">active</c:if>">
                                            <a class="page-link" href="${pageContext.request.contextPath}/home/profile?page=${page}&uid=${pro_user.id}">${page}</a>
                                        </li>
                                    </c:forEach>
                                    <li class="page-item"><a class="page-link" href="#">...</a></li>
                                    <li class="page-item <c:if test="${page==pageInfo.pageNum}">active</c:if>">
                                        <a class="page-link" href="${pageContext.request.contextPath}/home/profile?page=${pageInfo.lastPage}&uid=${pro_user.id}">${pageInfo.lastPage}</a>
                                    </li>
                                </c:if>
                                <c:if test="${pageInfo.pageNum>4}">
                                    <c:if test="${pageInfo.pageNum<pageInfo.lastPage-3}">
                                        <li class="page-item <c:if test="${page==pageInfo.pageNum}">active</c:if>">
                                            <a class="page-link" href="${pageContext.request.contextPath}/home/profile?page=${pageInfo.firstPage}&uid=${pro_user.id}">${pageInfo.firstPage}</a>
                                        </li>
                                        <li class="page-item"><a class="page-link" href="#">...</a></li>
                                        <c:forEach begin="${pageInfo.pageNum-1}" end="${pageInfo.pageNum+1}" var="page">
                                            <li class="page-item <c:if test="${page==pageInfo.pageNum}">active</c:if>">
                                                <a class="page-link" href="${pageContext.request.contextPath}/home/profile?page=${page}&uid=${pro_user.id}">${page}</a>
                                            </li>
                                        </c:forEach>
                                        <li class="page-item"><a class="page-link" href="#">...</a></li>
                                        <li class="page-item <c:if test="${page==pageInfo.pageNum}">active</c:if>">
                                            <a class="page-link" href="${pageContext.request.contextPath}/home/profile?page=${pageInfo.lastPage}&uid=${pro_user.id}">${pageInfo.lastPage}</a>
                                        </li>
                                    </c:if>
                                    <c:if test="${pageInfo.pageNum>=pageInfo.lastPage-3}">
                                        <li class="page-item <c:if test="${page==pageInfo.pageNum}">active</c:if>">
                                            <a class="page-link" href="${pageContext.request.contextPath}/home/profile?page=${page}&uid=${pro_user.id}">${pageInfo.firstPage}</a>
                                        </li>
                                        <li class="page-item"><a class="page-link" href="#">...</a></li>
                                        <c:forEach begin="${pageInfo.lastPage-4}" end="${pageInfo.lastPage}" var="page">
                                            <li class="page-item <c:if test="${page==pageInfo.pageNum}">active</c:if>">
                                                <a class="page-link" href="${pageContext.request.contextPath}/home/profile?page=${page}&uid=${pro_user.id}">${page}</a>
                                            </li>
                                        </c:forEach>
                                    </c:if>
                                </c:if>
                            </c:if>
                            <c:if test="${pageInfo.hasNextPage}">
                                <li class="page-item">
                                    <a class="page-link" href="${pageContext.request.contextPath}/home/profile?page=${pageInfo.nextPage}&uid=${pro_user.id}" aria-label="Next">
                                        <span aria-hidden="true">&raquo;</span>
                                    </a>
                                </li>
                            </c:if>
                            <li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/home/profile?page=${pageInfo.lastPage}&uid=${pro_user.id}">尾页</a></li>
                        </ul>
                    </nav>
                </div>

            </main>
        </div>
    </div>
</div>
<!-- Bootstrap core JavaScript -->
<script src="${pageContext.request.contextPath}/vendor/jquery/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- slick Slider JS-->
<script type="text/javascript" src="${pageContext.request.contextPath}/vendor/slick/slick.min.js"></script>
<!-- Custom scripts for all pages-->
<script type="text/javascript" src="${pageContext.request.contextPath}/js/myjs.js"></script>
<script>
    function goConnect(uid,name) {
        if (confirm("确定和"+name+"建立关系吗？")){
            location.href="${pageContext.request.contextPath}/connect/start/"+uid+"/"+${pageInfo.pageNum}
        }
    }
</script>
</body>
</html>
