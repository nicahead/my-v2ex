<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <!--[if lt IE 9]>
    <script src="../../static/plugins/bootstrap-3.3.7/js/html5shiv.min.js"></script>
    <script src="../../static/plugins/bootstrap-3.3.7/js/respond.min.js"></script>
    <![endif]-->
</head>
<body onload="initWangEditor()">
<jsp:include page="../includes/head.jsp"></jsp:include>
<div class="blank"></div>
<div id="content">
    <div class="container">
        <div class="row">
            <div class="con_wrap">
                <div class="con_left col-md-8 col-sm-12">
                    <div class="bc">
                        <div class="node_wrap">
                            <div class="content_head_wrap"><a href="/main">V2EX</a> › 创作新主题</div>
                        </div>
                        <div class="post_wrap">
                            <form action="/posts/add" method="post" role="form" class="col-md-12 col-sm-12 col-xs-12">
                                <input type="hidden" name="author_id" value="${sessionScope.user.id}">
                                <input type="hidden" name="author_name" value="${sessionScope.user.username}">
                                <div class="form-group">
                                    <label for="title">标题：</label>
                                    <input type="text" name="title" class="form-control" id="title" placeholder="请输入标题">
                                </div>
                                <div class="form-group">
                                    <label for="content1">正文：</label>
                                    <input type="hidden" name="content" id="content1">
                                    <div id="editor">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="nodes">节点：</label>
                                    <input type="hidden" name="node_name" id="node_name">
                                    <select name="node_id" id="nodes" class="form-control">
                                        <c:forEach items="${nodeList}" var="node">
                                            <option value="${node.id}">${node.nodename}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <button id="btnSubmit" type="submit" class="btn btn-default" style="float: right;">提交</button>
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
<script src="../../static/plugins/wangEditor/wangEditor.min.js"></script>
<script src="../../static/js/app.js"></script>
<script>
    function initWangEditor() {
        var E = window.wangEditor;
        var editor = new E('#editor');
        // 配置服务器端地址
        editor.customConfig.uploadImgServer = '/upload';
        editor.customConfig.uploadFileName = 'editorFiles';
        editor.create();
        $("#btnSubmit").bind("click", function () {
            var contentHtml = editor.txt.html();
            var node_name = $("#nodes").find("option:selected").text();
            $("#content1").val(contentHtml);
            $("#node_name").val(node_name);
        });
    }
</script>
</body>
</html>