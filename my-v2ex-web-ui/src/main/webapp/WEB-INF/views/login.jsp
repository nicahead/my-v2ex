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
                            <div class="content_head_wrap"><a href="/main">V2EX</a> › 登录</div>
                        </div>
                        <div class="post_wrap">
                            <form action="/login" method="post" class="form-horizontal col-md-12" role="form">
                                <div class="form-group">
                                    <label for="username" class="col-md-2 col-sm-2 control-label">用户名</label>
                                    <div class="col-md-10 col-sm-10">
                                        <input type="text" name="username" class="form-control" id="username"
                                               placeholder="请输入用户名">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="password" class="col-md-2 col-sm-2 control-label">密码</label>
                                    <div class="col-md-10 col-sm-10">
                                        <input type="password" name="password" class="form-control" id="password"
                                               placeholder="请输入密码">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-sm-offset-2 col-sm-10">
                                        <button type="submit" class="btn btn-default" style="float: right;">登录</button>
                                        <br>
                                        <%--<span><a href="">我忘记密码了</a></span>--%>
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


<script src="../../static/js/jquery-3.3.1.min.js"></script>
<script src="../../static/plugins/bootstrap-3.3.7/js/bootstrap.min.js"></script>
<script src="../../static/js/app.js"></script>
</body>
</html>