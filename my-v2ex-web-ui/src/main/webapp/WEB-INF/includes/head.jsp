<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div id="header">
    <div class="container">
        <div class="row">
            <div class="hd_wrap">
                <div class="hd_left col-md-8 col-xs-4">
                    <h1><a href="/main">V2EX</a></h1>
                    <div class="hd_search col-xs-0">
                        <div class="input-group">
                            <input type="text" class="form-control" id="search" placeholder="搜索本站">
                            <%--<a href="#" class="input-group-addon glyphicon glyphicon-search"></a>--%>
                        </div>
                    </div>
                </div>
                <div class="hd_right col-md-4 col-xs-8">
                    <ul class="r_nav">
                        <li><a href="/main">首页</a></li>
                        <li ${sessionScope.user==null ? "hidden" : ""}><a href="/setting">设置</a></li>
                        <li ${sessionScope.user==null ? "hidden" : ""}><a href="/logout">登出</a></li>
                        <li ${sessionScope.user==null ? "" : "hidden"}><a href="/signup">注册</a></li>
                        <li ${sessionScope.user==null ? "" : "hidden"}><a href="/login">登录</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>
