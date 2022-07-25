<%--
  Created by IntelliJ IDEA.
  User: jiangzixuan
  Date: 2022/4/13
  Time: 22:41
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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/baguetteBox.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/gallery-grid.css">
</head>
<body onload="selectPage('${type}')">
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
<div class="profile-cover text-center">
    <img class="img-fluid" src="${pageContext.request.contextPath}/img/loveIndex.png" alt="">
</div>
<div class="bg-white shadow-sm border-bottom">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="d-flex align-items-center py-3">
                    <div class="profile-left">
                        <h5 class="font-weight-bold text-dark mb-1 mt-0">${user1.username}
                            <span class="text-danger">
                              <i data-toggle="tooltip" data-placement="top" title="Verified" class="feather-heart"></i>
                           </span>${user2.username}
                        </h5>
                        <p class="mb-0 text-muted"> <fmt:formatDate value="${connection.create_time}" pattern="yyyy-MM-dd"></fmt:formatDate> </p>
                    </div>
                    <div class="profile-right ml-auto">
                        <button type="button" class="btn btn-light mr-2"> <i class="feather-x"></i> Disconnect </button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="pb-4 pt-3">
    <div class="container">
        <div class="align-content-center">
            <!-- Main Content -->
            <main class="col col-xl-12 order-xl-2 col-lg-12 order-lg-1 col-md-12 col-sm-12 col-12">
                <div class="box shadow-sm rounded bg-white mb-3 overflow-hidden">
                    <ul class="nav border-bottom osahan-line-tab" id="myTab" role="tablist">
                        <li class="nav-item">
                            <a class="nav-link" onclick="setType('dairy')" id="dairy-tab" data-toggle="tab" href="#dairy" role="tab" aria-controls="dairy" aria-selected="false">Dairy</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" onclick="setType('dairy')" id="photos-tab" data-toggle="tab" href="#photos" role="tab" aria-controls="photos" aria-selected="false">Photos</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" onclick="setType('dairy')" id="events-tab" data-toggle="tab" href="#events" role="tab" aria-controls="events" aria-selected="false">Events</a>
                        </li>
                    </ul>
                </div>
                <div class="tab-content" id="myTabContent">
                    <div class="tab-pane fade" id="dairy" role="tabpanel" aria-labelledby="dairy-tab">
                        <form role="form" action="${pageContext.request.contextPath}/connect/insertDairy" method="post" class="box shadow-sm border rounded bg-white mb-3">
                            <div class="form-group p-3 form-inline">
                                <input type="hidden" class="form-control" name="uid" value="${user.id}">
                                <input type="hidden" class="form-control" name="l_id" value="${connection.id}">
                                <input type="hidden" class="form-control" name="type" value="${type}" id="input_dairy">
                                <label for="time" class="col-sm-1">时间</label>
                                <input type="date" class="form-control col-sm-3" id="time" name="time">
                                <span class="col-sm-5"></span>
                                <label for="weather" class="col-sm-1">天气</label>
                                <select class="form-control col-sm-4>" id="weather" name="weather">
                                    <option>阴</option>
                                    <option>晴</option>
                                    <option>多云</option>
                                    <option>雨</option>
                                    <option>雪</option>
                                </select>
                            </div>
                            <div class="form-group p-3">
                                <label for="content">正文</label>
                                <textarea class="form-control" id="content" rows="5" name="content"></textarea>
                            </div>
                            <div class="text-right p-3">
                                <button type="submit" class="btn btn-outline-primary pl-4 pr-4">发布</button>
                            </div>
                        </form>
                        <c:forEach items="${dairyList}" var="dairy">
                        <div class="box shadow-sm border rounded bg-white mb-3">
                            <div class="box-title p-3 row">
                                <h6 class="m-0 col-md-11">${dairy.user.username}</h6>
                                <img src="${pageContext.request.contextPath}/photos/${dairy.user.avatar}" class="img-profile rounded-circle" width="50" height="50">
                            </div>
                            <div class="box-body border-bottom p-3">
                                <p><fmt:formatDate value="${dairy.time}" pattern="yyyy-MM-dd"></fmt:formatDate>  ${dairy.weather}
                                </p>
                                <p class="mb-0">${dairy.content}
                                </p>
                            </div>
                        </div>
                        </c:forEach>
                    </div>
                    <div class="tab-pane fade" id="photos" role="tabpanel" aria-labelledby="photos-tab">
                        <div class="box shadow-sm border rounded bg-white mb-3">
                            <div class="file-loading">
                                <input id="uploadPhotos" type="file" name="photos" multiple>
                            </div>
                        </div>
                        <div class="container box shadow-sm border rounded bg-white mb-3">                            <div class="container gallery-container">
                                <div class="tz-gallery">
                                    <div class="row">
                                        <c:forEach items="${photoList}" var="photo">
                                        <div class="col-sm-6 col-md-4">
                                            <a class="lightbox" href="${pageContext.request.contextPath}/photos/${photo.address}">
                                                <img src="${pageContext.request.contextPath}/photos/${photo.address}" alt="">
                                            </a>
                                        </div>
                                        </c:forEach>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="tab-pane fade" id="events" role="tabpanel" aria-labelledby="events-tab">
                        <form role="form" action="${pageContext.request.contextPath}/connect/insertEvent" method="post" class="box shadow-sm border rounded bg-white mb-3">
                            <input type="hidden" class="form-control" name="type" value="${type}" id="input_events">
                            <input type="hidden" class="form-control" name="l_id" value="${connection.id}">
                            <div class="form-group p-3">
                                <label for="event_time" class="col-sm-1">时间</label>
                                <input type="date" class="form-control" id="event_time" name="time">
                            </div>
                            <div class="form-group p-3">
                                <label for="event">事件</label>
                                <textarea class="form-control" id="event" rows="5" name="thing"></textarea>
                            </div>
                            <div class="text-right p-3">
                                <button type="submit" class="btn btn-outline-primary pl-4 pr-4">发布</button>
                            </div>
                        </form>
                        <div class="box shadow-sm border rounded bg-white p-3">
                            <div class="row">
                                <c:forEach items="${eventList}" var="event">
                                <div class="col-md-6">
                                    <div class="border job-item mb-3">
                                        <div class="d-flex align-items-center p-3 job-item-header">
                                            <div class="overflow-hidden mr-2">
                                                <h6 class="font-weight-bold text-dark mb-0 text-truncate">${event.thing}</h6>
                                            </div>
                                            <img class="img-fluid ml-auto" src="${pageContext.request.contextPath}/img/event_time.png" alt="">
                                        </div>
                                        <div class="d-flex align-items-center p-3 border-top border-bottom job-item-body">
                                            <span class="font-weight-bold text-primary">已有 ${event.resultTime} 天</span>
                                        </div>
                                    </div>
                                </div>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
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

<script type="text/javascript" src="${pageContext.request.contextPath}/js/baguetteBox.min.js"></script>
<!-- 主文件输入插件脚本JS文件-->
<script src = "${pageContext.request.contextPath}/vendor/bootstrap/js/fileinput.min.js" ></script>
<!-- 如果您需要翻译您的语言，则可以选择包含如下所述的语言环境文件（将 LANG.js 替换为您的语言语言环境）-->
<script src = "${pageContext.request.contextPath}/vendor/bootstrap/js/zh.js" ></script>
<script type="text/javascript">
    $("#uploadPhotos").fileinput({
        language:'zh',
        uploadUrl: '${pageContext.request.contextPath}/connect/uploadPhotos',
        allowedFileExtensions: ['jpg','png','jpeg','gif'],
        maxFileCount: 3,
        maxFileSize: 10240,
        uploadAsync: false,
    }).on('filebatchuploadsuccess',function (event,data) {
        if (data.response.test=='success') {
            alert("上传成功")
            location.reload();
        }
    })
    var selectPage = function (type) {
        var dairy_tab = document.getElementById('dairy-tab')
        var photos_tab = document.getElementById('photos-tab')
        var events_tab = document.getElementById('events-tab')
        var dairy = document.getElementById('dairy')
        var photos = document.getElementById('photos')
        var events = document.getElementById('events')
        if (type === 'events') {
            events_tab.setAttribute('class','nav-link active')
            events_tab.setAttribute('aria-selected','true')
            events.setAttribute('class','tab-pane fade show active')
        }else if (type === 'dairy') {
            dairy_tab.setAttribute('class','nav-link active')
            dairy_tab.setAttribute('aria-selected','true')
            dairy.setAttribute('class','tab-pane fade show active')
        }else{
            photos_tab.setAttribute('class','nav-link active')
            photos_tab.setAttribute('aria-selected','true')
            photos.setAttribute('class','tab-pane fade show active')
        }
    }
    var setType = function (type) {
        var input_dairy = document.getElementById('input_dairy')
        var input_events = document.getElementById('input_events')
        input_dairy.setAttribute('value',type)
        input_events.setAttribute('value',type)
    }
    baguetteBox.run('.tz-gallery');
</script>


</body>
</html>
