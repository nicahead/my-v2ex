<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String imgpath = "http://localhost:8080/upload";
%>
<div class="con_right col-md-4 col-sm-12">
    <div class="bc">
        <div id="right_head_1" ${sessionScope.user==null ? "" : "hidden"}>
            <div class="item">
                <strong>V2EX = way to explore</strong><br>
                <span class="gray">V2EX 是一个关于分享和探索的地方</span>
            </div>
            <div class="item">
                <a href="/login" type="button" class="btn btn-default btn-block">登录</a>
                <div class="sub_item">
                    还没有账号？前去&nbsp;<a href="/signup" class="gray">注册</a>
                </div>
            </div>
        </div>
        <div id="right_head_2" ${sessionScope.user==null ? "hidden" : ""}>
            <div class="item">
                <img src="<%=imgpath%>/${sessionScope.user.avatar}" alt="" class="userImg">
                <div class="info_wrap">
                    <h4>${sessionScope.user.username}</h4>
                    <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
                </div>
            </div>
            <div class="item" style="flex-wrap: wrap">
                <a type="button" href="#" class="btn btn-default btn-block">查看通知</a>
                <a type="button" href="/posts/add" class="btn btn-default btn-block">发布新主题</a>
            </div>
        </div>

        <div class="blank"></div>
        <div class="item gray">
            热议主题
        </div>
        <div id="right_list1_wrap">

        </div>
        <div class="blank"></div>
        <div class="item gray">社区运行状态</div>
        <div class="item">
            <dl class="dl-horizontal">
                <dt class="gray">注册会员</dt>
                <dd id="user_num"></dd>
            </dl>
            <dl class="dl-horizontal">
                <dt class="gray">主题</dt>
                <dd id="post_num"></dd>
            </dl>
            <dl class="dl-horizontal">
                <dt class="gray">回复</dt>
                <dd id="comment_num"></dd>
            </dl>
        </div>
    </div>
</div>