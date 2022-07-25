<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <title></title>

    <link rel = "stylesheet" href = "vendor/bootstrap/css/bootstrap.min.css" crossorigin = "anonymous" >
    <!-- 插件中使用的默认图标来自 Bootstrap 5.x 图标库（可以通过加载下面的 CSS 来启用）-->
    <link rel = "stylesheet" href = "https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.min.css" crossorigin = "anonymous" >
    <!-- 文件输入插件样式化 CSS 文件 -->
    <link href = "vendor/bootstrap/css/fileinput.min.css" media = "all" rel = "stylesheet" type = "text/css" />
    <!-- jQuery 库 -->
    <script src = "vendor/jquery/jquery.min.js" crossorigin = "anonymous" ></script>
    <!-- 如果您希望在详细模式中缩放和预览文件内容，则需要下面的 bootstrap.bundle.min.js
        对话。支持引导 5.x 或 4.x。您还可以使用 bootstrap js 3.3.x 版本。-->
    <script src = "vendor/bootstrap/js/bootstrap.bundle.min.js" crossorigin = "anonymous" ></script>
    <!-- 主文件输入插件脚本JS文件-->
    <script src = "vendor/bootstrap/js/fileinput.min.js" ></script>
    <!-- 如果您需要翻译您的语言，则可以选择包含如下所述的语言环境文件（将 LANG.js 替换为您的语言语言环境）-->
    <script src = "vendor/bootstrap/js/zh.js" ></script>
</head>
<body>
<div class="container">
    <div class="row">
        <div class="col-sm-12">
            <div class="file-loading">
                <input id="file-1" type="file" name="uploadFile">
            </div>
        </div>
    </div>
</div>
</body>
<script>
    $("#file-1").fileinput({
        language:'zh',
        uploadUrl: '${pageContext.request.contextPath}/user/upload',
        allowedFileExtensions: ['jpg','png','jpeg','gif'],
        maxFileCount: 1,
        maxFileSize: 10240,
    }).on('fileuploaded',function (event,data) {
        if (data.response) {
            alert("修改成功");
            location.href="${pageContext.request.contextPath}/user/edit"
        }
    })
</script>
</html>
