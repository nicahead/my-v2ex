<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>V2EX</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="../../static/css/main.css" rel="stylesheet">
    <link href="../../static/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <link href="../../static/plugins/bootstrap-3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <link href="../../static/plugins/dropzone/min/dropzone.min.css" rel="stylesheet"/>
    <link href="../../static/plugins/dropzone/min/basic.min.css" rel="stylesheet"/>
    <!--[if lt IE 9]>
    <script src="../../static/plugins/bootstrap-3.3.7/js/html5shiv.min.js"></script>
    <script src="../../static/plugins/bootstrap-3.3.7/js/respond.min.js"></script>
    <![endif]-->
</head>
<body>
<jsp:include page="../includes/head.jsp"></jsp:include>
<div class="blank"></div>
<div id="content">
    <div class="container">
        <div class="row">
            <div class="con_wrap">
                <div class="con_left col-md-8 col-sm-12">
                    <div class="bc">
                        <div class="node_wrap">
                            <div class="content_head_wrap"><a href="/main">V2EX</a> › 注册</div>
                        </div>
                        <div class="post_wrap">
                            <form action="/save" method="post" class="form-horizontal col-md-12" role="form">
                                <div class="form-group">
                                    <label for="username" class="col-md-2 col-sm-2 control-label">用户名</label>
                                    <div class="col-md-10 col-sm-10">
                                        <input type="text" name="username" value="${editUser.username}"
                                               class="form-control" id="username" placeholder="请使用半角的 a-z 或数字 0-9">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="password" class="col-md-2 col-sm-2 control-label">密码</label>
                                    <div class="col-md-10 col-sm-10">
                                        <input type="password" name="password" value="${editUser.password}"
                                               class="form-control" id="password" placeholder="请输入密码">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="email" class="col-md-2 col-sm-2 control-label">电子邮箱</label>
                                    <div class="col-md-10 col-sm-10">
                                        <input type="text" name="email" value="${editUser.email}" class="form-control"
                                               id="email" placeholder="请使用真实电子邮箱注册，以便在忘记密码时找回密码">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="avatar" class="col-md-2 col-sm-2 control-label">上传头像</label>
                                    <div class="col-md-10 col-sm-10">
                                        <input name="avatar" value="${editUser.avatar}" class="form-control" id="avatar"
                                               placeholder="Avatar" readonly="readonly">
                                        <div id="dropz" class="dropzone"></div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-sm-offset-2 col-sm-10">
                                        <button type="submit" class="btn btn-default" style="float: right;">注册</button>
                                        <br>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
                <jsp:include page="../includes/con_right.jsp"></jsp:include>
            </div>
        </div>
    </div>
</div>


<!-- jQuery (Bootstrap 的 JavaScript 插件需要引入 jQuery) -->
<script src="../../static/js/jquery-3.3.1.min.js"></script>
<!-- 包括所有已编译的插件 -->
<script src="../../static/plugins/bootstrap-3.3.7/js/bootstrap.min.js"></script>
<script src="../../static/plugins/dropzone/min/dropzone.min.js"></script>
<script src="../../static/js/app.js"></script>
<script>
    App.initDropzone({
        id: "#dropz",
        url: "/upload",
        init: function () {
            this.on("success", function (file, data) {
                $("#avatar").val(data.fileName);
            });
        }
    });
</script>
</body>
</html>