<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String imgpath = "http://localhost:8080/upload";
%>
<!-- Left side column. contains the logo and sidebar -->
<aside class="main-sidebar">
    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">
        <!-- Sidebar user panel (optional) -->
        <div class="user-panel">
            <div class="pull-left image">
                <img src="<%=imgpath%>/${sessionScope.user.avatar }" class="img-circle" alt="User Image">
            </div>
            <div class="pull-left info">
                <p>${sessionScope.user.username }</p>
                <!-- Status -->
                <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
            </div>
        </div>

        <!-- search form (Optional) -->
        <form action="#" method="get" class="sidebar-form">
            <div class="input-group">
                <input type="text" name="q" class="form-control" placeholder="Search...">
                <span class="input-group-btn">
              <button type="submit" name="search" id="search-btn" class="btn btn-flat"><i class="fa fa-search"></i>
              </button>
            </span>
            </div>
        </form>
        <!-- /.search form -->

        <!-- Sidebar Menu -->
        <ul class="sidebar-menu" data-widget="tree" id="sideBarUl">
            <li class="header">HEADER</li>
            <!-- Optionally, you can add icons to the links -->
            <li ><a href="/main"><i class="fa fa-anchor"></i> <span>仪表盘</span></a></li>
            <li class="treeview">
                <a href="#"><i class="fa fa-user"></i> <span>用户管理</span>
                    <span class="pull-right-container">
                <i class="fa fa-angle-left pull-right"></i>
              </span>
                </a>
                <ul class="treeview-menu">
                    <li><a href="/user/list"><i class="fa fa-sliders"></i>用户列表</a></li>
                    <li><a href="/user/form"><i class="fa fa-plus-square-o"></i>添加用户</a></li>
                </ul>
            </li>
            <li class="treeview">
                <a href="#"><i class="fa fa-file-archive-o"></i> <span>节点管理</span>
                    <span class="pull-right-container">
                <i class="fa fa-angle-left pull-right"></i>
              </span>
                </a>
                <ul class="treeview-menu">
                    <li><a href="/node/list"><i class="fa fa-sliders"></i>节点列表</a></li>
                    <li><a href="/node/form"><i class="fa fa-plus-square-o"></i>添加节点</a></li>
                </ul>
            </li>
            <li><a href="#"><i class="fa fa-bookmark"></i> <span>帖子管理</span></a></li>
            <li><a href="#"><i class="fa fa-bell"></i> <span>留言管理</span></a></li>
        </ul>
        <!-- /.sidebar-menu -->
    </section>
    <!-- /.sidebar -->
</aside>