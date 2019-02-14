<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <title>V2EX</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="../../static/css/main.css" rel="stylesheet">
    <link href="../../static/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <link href="../../static/plugins/bootstrap-3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <link href="../../static/plugins/wangEditor/wangEditor.min.css" rel="stylesheet"/>
    <link href="../../static/plugins/DataTables-1.10.15/media/css/dataTables.bootstrap.css" rel="stylesheet">
    <!--[if lt IE 9]>
    <script src="../../static/plugins/bootstrap-3.3.7/js/html5shiv.min.js"></script>
    <script src="../../static/plugins/bootstrap-3.3.7/js/respond.min.js"></script>
    <![endif]-->
</head>
<body onload="initData('${post.id}')">
<jsp:include page="../includes/head.jsp"></jsp:include>
<div class="blank"></div>
<div id="content">
    <div class="container">
        <div class="row">
            <div class="con_wrap">
                <div class="con_left col-md-8 col-sm-12">
                    <div class="bc">
                        <div class="node_wrap">
                            <div class="content_head_wrap"><a href="/main">V2EX</a> › ${post.node_name}</div>
                            <h1 class="post_title">${post.title}</h1>
                            <span class="post_author">${post.author_name}</span> &nbsp;&nbsp;
                            <span class="post_date">发表于</span>&nbsp;&nbsp;
                            <span class="post_author"><fmt:formatDate value="${post.created}"
                                                                      pattern="yyyy-MM-dd HH:mm"/></span> &nbsp;&nbsp;
                            <span class="post_date">最后修改于</span>&nbsp;&nbsp;
                            <span class="post_author"><fmt:formatDate value="${post.updated}"
                                                                      pattern="yyyy-MM-dd HH:mm"/></span>
                        </div>
                        <div class="post_wrap">
                            <div style="width: 100%;height: 100%;">
                                ${post.content}
                            </div>
                        </div>
                        <div class="blank"></div>
                        <div class="post_wrap">
                            <jsp:useBean id="time" class="java.util.Date">
                                <jsp:setProperty name="time" property="hours" param="hh"/>
                                <jsp:setProperty name="time" property="minutes" param="mm"/>
                                <jsp:setProperty name="time" property="seconds" param="ss"/>
                            </jsp:useBean>
                            ${post.comments} 回复 | 直到 <fmt:formatDate value="${time}" pattern="yyyy-MM-dd HH:mm"/>
                        </div>
                        <table id="dataTable" style="width: 100%;">
                            <thead></thead>
                            <tbody>

                            </tbody>
                        </table>
                        <div class="blank"></div>
                        <c:if test="${sessionScope.user!=null}">
                            <div class="post_wrap">
                                <form action="/comments/add" method="post" role="form" style="width: 100%">
                                    <input type="hidden" name="post_id" value="${post.id}"/>
                                        <%--被回复人，默认为该贴作者，圈人会修改默认值--%>
                                    <input type="hidden" name="replyed_id" value="${post.author_id}" id="replyed_id"/>
                                    <input type="hidden" name="author_id" value="${sessionScope.user.id}"/>
                                    <input type="hidden" name="author_name" value="${sessionScope.user.username}"/>
                                    <input type="hidden" name="content" id="comment"/>
                                    <div class="form-group">
                                        <label for="comment">评论该帖：</label>
                                        <div id="editor">
                                            <div class="pre"></div>
                                        </div>
                                    </div>
                                    <button id="btnSubmit" type="submit" class="btn btn-default" style="float: right">提交
                                    </button>
                                </form>
                            </div>
                        </c:if>
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
<script src="../../static/plugins/wangEditor/wangEditor.min.js"></script>
<script src="../../static/plugins/DataTables-1.10.15/media/js/jquery.dataTables.js"></script>
<script src="../../static/plugins/moment/moment.js"></script>
<script src="../../static/plugins/DataTables-1.10.15/media/js/dataTables.bootstrap.js"></script>
<script src="../../static/js/app.js"></script>
<script>
    function initData(post_id) {
        var _dataTable;
        var _columns = [
            {
                "data": function (row, type, val, meta) {
                    var str = "";
                    var imgPath = "http://localhost:8080/upload/";
                    var xh = meta.row + 1;
                    str += "<div class='post_wrap'>";
                    str += "<div class='post_head'><img src='" + imgPath + row.author_avatar + "' /></div>";
                    str += "<div class='post_body'>";
                    str += "<h5>" + row.author_name + "&nbsp;&nbsp;<span class='post_date'>" + moment(row.created).format("YYYY-MM-DD HH:mm:ss") + "</span>&nbsp;<a class=\"post_date\" href=\"javascript:void(0)\" onclick=\"reply('" + row.author_id + "','" + row.author_name + "')\">回复他</a></h5>";
                    str += "<ul>";
                    str += "<li style='width:100%;'>" + row.content + "<li>";
                    str += "</ul>";
                    str += "</div>";
                    str += "<div class='post_num'>";
                    str += "<span>" + xh + "&nbsp;#</span>";
                    str += "</div>";
                    str += "</div>";
                    return str;
                }
            }
        ];
        var param = {
            "post_id": post_id
        }
        _dataTable = App.initDataTables("/comments/page", _columns);
        _dataTable.settings()[0].ajax.data = param;
        _dataTable.ajax.reload();

        //初始化wangEditor
        var E = window.wangEditor;
        var editor = new E('#editor');
        // 配置服务器端地址
        editor.customConfig.uploadImgServer = '/upload';
        editor.customConfig.uploadFileName = 'editorFiles';
        editor.create();
        $("#btnSubmit").bind("click", function () {
            var contentHtml = editor.txt.html();
            $("#comment").val(contentHtml);
        });
    }

    function reply(id, name) {
        $("#replyed_id").val(id);
        $("#editor .pre").append("@"+name+"<br>");
    }
</script>
</body>
</html>