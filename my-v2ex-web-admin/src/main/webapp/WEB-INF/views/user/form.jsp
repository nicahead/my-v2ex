<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>V2EX></title>
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <link rel="stylesheet" href="../../../static/plugins/bootstrap/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="../../../static/plugins/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="../../../static/plugins/Ionicons/css/ionicons.min.css">
    <link rel="stylesheet" href="../../../static/css/AdminLTE.min.css">
    <link rel="stylesheet" href="../../../static/css/skin-blue.min.css">
    <link rel="stylesheet" href="../../../static/plugins/dropzone/min/dropzone.min.css" />
    <link rel="stylesheet" href="../../../static/plugins/dropzone/min/basic.min.css" />
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body class="hold-transition skin-blue sidebar-mini" onload="setSelect(${editUser.role})">
<div class="wrapper">
    <jsp:include page="../../includes/head.jsp"></jsp:include>
    <jsp:include page="../../includes/sidebar.jsp"></jsp:include>
    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <h1>
                用户管理
            </h1>
            <div class="col-md-12">
                <c:if test="${baseResult!=null }">
                    <div class="alert alert-danger alert-dismissible" style="margin:15px 0 0 0">
                        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">
                            &times;
                        </button>
                            ${baseResult.message }
                    </div>
                </c:if>
            </div>
        </section>
        <!-- Main content -->
        <section class="content container-fluid">
            <div class="col-md-12">
                <!-- Horizontal Form -->
                <div class="box box-info">
                    <div class="box-header with-border">
                        <h3 class="box-title">${editUser.id==null?"添加":"编辑"}用户</h3>
                    </div>
                    <!-- /.box-header -->
                    <!-- form start -->
                    <form action="/user/save" method="post" class="form-horizontal">
                        <input name="id" value="${editUser.id}" type="hidden">
                        <input name="created" value="${editUser.created}" type="hidden">
                        <div class="box-body">
                            <div class="form-group">
                                <label for="inputUsername3" class="col-sm-2 control-label">用户名</label>
                                <div class="col-sm-10">
                                    <input type="text" name="username" value="${editUser.username}" class="form-control"
                                           id="inputUsername3"
                                           placeholder="Username">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="inputPassword3" class="col-sm-2 control-label">密码</label>
                                <div class="col-sm-10">
                                    <input type="password" name="password" class="form-control" id="inputPassword3"
                                           placeholder="Password">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="inputEmail3" class="col-sm-2 control-label">邮箱</label>
                                <div class="col-sm-10">
                                    <input type="text" name="email" value="${editUser.email}" class="form-control"
                                           id="inputEmail3" placeholder="Email">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="inputAvatar" class="col-sm-2 control-label">上传头像</label>
                                <div class="col-sm-10">
                                    <input name="avatar" value="${editUser.avatar}" class="form-control" id="inputAvatar" placeholder="Avatar" readonly="readonly">
                                    <div id="dropz" class="dropzone"></div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="inputRole" class="col-sm-2 control-label">角色</label>
                                <div class="col-sm-10">
                                    <select name="role" class="form-control" id="inputRole">
                                        <option value="1">管理员</option>
                                        <option value="0">普通会员</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <!-- /.box-body -->
                        <div class="box-footer">
                            <button type="button" class="btn btn-default" onclick="history.go(-1)">取消</button>
                            <button type="submit" class="btn btn-info pull-right">提交</button>
                        </div>
                        <!-- /.box-footer -->
                    </form>
                </div>
            </div>
        </section>
        <!-- /.content -->
    </div>
    <!-- /.content-wrapper -->
    <jsp:include page="../../includes/foot.jsp"></jsp:include>
</div>
<!-- ./wrapper -->
<script src="../../../static/plugins/jquery/dist/jquery.min.js"></script>
<script src="../../../static/plugins/bootstrap/dist/js/bootstrap.min.js"></script>
<script src="../../../static/js/adminlte.min.js"></script>
<script src="../../../static/plugins/iCheck/icheck.min.js"></script>
<script src="../../../static/plugins/dropzone/min/dropzone.min.js"></script>
<script src="../../../static/js/app.js"></script>
<script>
    function setSelect(id) {
        var ls = $("#inputRole").find("option"); //获取select下拉框的所有值
        for (var j = 1; j < ls.length; j++) {
            if ($(ls[j]).val() == id) {
                $(ls[j]).attr("selected", "selected");
            }
        }
    };
    App.initDropzone({
        id: "#dropz",
        url: "/upload",
        init: function () {
            this.on("success", function (file, data) {
                $("#inputAvatar").val(data.fileName);
            });
        }
    });
</script>
</body>
</html>