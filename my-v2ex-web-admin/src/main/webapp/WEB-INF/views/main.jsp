<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>V2EX>仪表盘</title>
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <link rel="stylesheet" href="../../static/plugins/bootstrap/dist/css/bootstrap.min.css">
  <link rel="stylesheet" href="../../static/plugins/font-awesome/css/font-awesome.min.css">
  <link rel="stylesheet" href="../../static/plugins/Ionicons/css/ionicons.min.css">
  <link rel="stylesheet" href="../../static/css/AdminLTE.min.css">
  <link rel="stylesheet" href="../../static/css/skin-blue.min.css">
  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->
</head>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">
  <jsp:include page="../includes/head.jsp"></jsp:include>
  <jsp:include page="../includes/sidebar.jsp"></jsp:include>
  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        仪表盘
      </h1>
    </section>
    <!-- Main content -->
    <section class="content container-fluid">
      <div class="row">
        <div class="col-lg-3 col-xs-6">
          <!-- small box -->
          <div class="small-box bg-aqua">
            <div class="inner">
              <h3>${sysInfo.userCount}</h3>
              <p>总用户</p>
            </div>
            <div class="icon">
              <i class="fa fa-user"></i>
            </div>
            <a href="/user/list" class="small-box-footer">
              More info <i class="fa fa-arrow-circle-right"></i>
            </a>
          </div>
        </div>
        <!-- ./col -->
        <div class="col-lg-3 col-xs-6">
          <!-- small box -->
          <div class="small-box bg-green">
            <div class="inner">
              <h3>${sysInfo.newUserCount}</h3>
              <p>今日新增用户</p>
            </div>
            <div class="icon">
              <i class="ion ion-person-add"></i>
            </div>
            <a href="/user/list" class="small-box-footer">
              More info <i class="fa fa-arrow-circle-right"></i>
            </a>
          </div>
        </div>
        <!-- ./col -->
        <div class="col-lg-3 col-xs-6">
          <!-- small box -->
          <div class="small-box bg-yellow">
            <div class="inner">
              <h3>${sysInfo.nodeCount}</h3>
              <p>总节点</p>
            </div>
            <div class="icon">
              <i class="ion fa fa-linode"></i>
            </div>
            <a href="/node/list" class="small-box-footer">
              More info <i class="fa fa-arrow-circle-right"></i>
            </a>
          </div>
        </div>
        <!-- ./col -->
        <div class="col-lg-3 col-xs-6">
          <!-- small box -->
          <div class="small-box bg-red">
            <div class="inner">
              <h3>${sysInfo.postCount}</h3>
              <p>总帖子</p>
            </div>
            <div class="icon">
              <i class="fa fa-book"></i>
            </div>
            <a href="/post/list" class="small-box-footer">
              More info <i class="fa fa-arrow-circle-right"></i>
            </a>
          </div>
        </div>
        <!-- ./col -->
        <!-- ./col -->
        <div class="col-lg-3 col-xs-6">
          <!-- small box -->
          <div class="small-box bg-orange">
            <div class="inner">
              <h3>${sysInfo.newPostCount}</h3>
              <p>今日新增帖子</p>
            </div>
            <div class="icon">
              <i class="fa fa-bookmark"></i>
            </div>
            <a href="/post/list" class="small-box-footer">
              More info <i class="fa fa-arrow-circle-right"></i>
            </a>
          </div>
        </div>
        <!-- ./col -->
        <!-- ./col -->
        <div class="col-lg-3 col-xs-6">
          <!-- small box -->
          <div class="small-box bg-red">
            <div class="inner">
              <h3>${sysInfo.commentCount}</h3>
              <p>总评论</p>
            </div>
            <div class="icon">
              <i class="fa fa-reply"></i>
            </div>
            <a href="/comment/list" class="small-box-footer">
              More info <i class="fa fa-arrow-circle-right"></i>
            </a>
          </div>
        </div>
        <!-- ./col -->
        <!-- ./col -->
        <div class="col-lg-3 col-xs-6">
          <!-- small box -->
          <div class="small-box bg-aqua">
            <div class="inner">
              <h3>${sysInfo.newCommentCount}</h3>
              <p>今日新增评论</p>
            </div>
            <div class="icon">
              <i class="fa fa-comment-o"></i>
            </div>
            <a href="/comment/list" class="small-box-footer">
              More info <i class="fa fa-arrow-circle-right"></i>
            </a>
          </div>
        </div>
        <!-- ./col -->
      </div>
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
  <jsp:include page="../includes/foot.jsp"></jsp:include>
</div>
<!-- ./wrapper -->
<!-- REQUIRED JS SCRIPTS -->
<script src="../../static/plugins/jquery/dist/jquery.min.js"></script>
<script src="../../static/plugins/bootstrap/dist/js/bootstrap.min.js"></script>
<!-- AdminLTE App -->
<script src="../../static/js/adminlte.min.js"></script>
</body>
</html>