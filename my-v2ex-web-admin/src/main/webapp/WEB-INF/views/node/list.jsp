<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tags" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>V2EX>节点列表</title>
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <link rel="stylesheet" href="../../../static/plugins/bootstrap/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="../../../static/plugins/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="../../../static/plugins/Ionicons/css/ionicons.min.css">
    <link rel="stylesheet" href="../../../static/css/AdminLTE.min.css">
    <link rel="stylesheet" href="../../../static/css/skin-blue.min.css">
    <link rel="stylesheet" href="../../../static/plugins/iCheck/all.css">

    <link rel="stylesheet" type="text/css"
          href="../../../static/plugins/DataTables-1.10.15/media/css/dataTables.bootstrap.css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">
    <jsp:include page="../../includes/head.jsp"></jsp:include>
    <jsp:include page="../../includes/sidebar.jsp"></jsp:include>
    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <h1>
                节点管理
                <%--<small>用户列表</small>--%>
            </h1>
        </section>
        <!-- Main content -->
        <section class="content container-fluid">
            <div class="row">
                <div class="col-xs-12">
                    <div class="box">
                        <div class="box-header">
                            <h3 class="box-title">节点列表</h3>
                            <c:if test="${baseResult!=null }">
                                <div class="alert alert-success alert-dismissible" style="margin:15px 0 0 0">
                                    <button type="button" class="close" data-dismiss="alert" aria-hidden="true">
                                        &times;
                                    </button>
                                        ${baseResult.message }
                                </div>
                            </c:if>
                            <div class="row" style="padding: 10px 0 0 15px">
                                <a type="button" href="/node/form" class="btn btn-sm btn-default"><i
                                        class="fa fa-plus-square"></i>添加</a>
                                <button type="button" onclick="App.deleteMulti('delete')"
                                        class="btn btn-sm btn-default"><i class="fa fa-trash"></i>批量删除
                                </button>
                                <%--<form action="/user/list" method="post">--%>
                                    <%--<button type="submit" class="btn btn-sm btn-default"--%>
                                            <%--style="float:right;margin-right: 10px;"><i--%>
                                            <%--class="fa fa-search"></i>搜索--%>
                                    <%--</button>--%>
                                    <%--<div class="input-group input-group-sm"--%>
                                         <%--style="width: 150px;float:right;margin-right: 10px;">--%>
                                        <%--<input type="text" name="nodename" id="nodename" class="form-control pull-right"--%>
                                               <%--placeholder="Nodename">--%>
                                    <%--</div>--%>
                                <%--</form>--%>
                            </div>
                        </div>
                        <!-- /.box-header -->
                        <div class="box-body table-responsive no-padding">
                            <table class="table table-hover display" id="dataTable">
                                <thead>
                                <tr>
                                    <th><input type="checkbox" class="minimal icheck_master"/></th>
                                    <th>节点名称</th>
                                    <th>节点描述</th>
                                    <th>帖子数</th>
                                    <th>操作</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${nodeList}" var="node">
                                    <tr>
                                        <td><input id=${node.id} type="checkbox" class="minimal"></td>
                                        <td>${node.nodename}</td>
                                        <td>${node.description}</td>
                                        <td>20</td>
                                        <td>
                                            <a href="/node/form?id=${node.id}" type="button" class="btn btn-sm btn-primary"><i class="fa fa-edit"></i>编辑</a>&nbsp;&nbsp;
                                            <button onclick="App.deleteSingle('delete',${node.id})" class="btn btn-sm btn-danger"><i class="fa fa-trash-o"></i>删除</button>
                                        </td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                        <!-- /.box-body -->
                    </div>
                    <!-- /.box -->
                </div>
            </div>
        </section>
        <!-- /.content -->
    </div>
    <!-- /.content-wrapper -->
    <jsp:include page="../../includes/foot.jsp"></jsp:include>
</div>
<!-- ./wrapper -->

<script src="../../../static/plugins/jquery/dist/jquery.js"></script>
<script src="../../../static/plugins/bootstrap/dist/js/bootstrap.min.js"></script>
<script src="../../../static/plugins/DataTables-1.10.15/media/js/jquery.dataTables.js"></script>
<script src="../../../static/plugins/DataTables-1.10.15/media/js/dataTables.bootstrap.js"></script>
<script src="../../../static/js/adminlte.min.js"></script>
<script src="../../../static/plugins/iCheck/icheck.min.js"></script>
<script src="../../../static/plugins/moment/moment.js"></script>
<script src="../../../static/js/app.js"></script>
<tags:model></tags:model>
</body>
</html>