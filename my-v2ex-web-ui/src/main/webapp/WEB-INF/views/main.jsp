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
    <link href="../../static/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <link href="../../static/plugins/DataTables-1.10.15/media/css/dataTables.bootstrap.css" rel="stylesheet">
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
                            <div class="ul" id="node_w">
                                <a href="" class="tab_active">全部</a>
                                <c:forEach items="${nodeList}" var="node">
                                    <a href="javascript:void(0)" onclick="changeNode(this,'${node.id}')" >${node.nodename}</a>
                                </c:forEach>
                            </div>
                        </div>
                        <table id="dataTable" style="width: 100%;">
                            <thead></thead>
                            <tbody>

                            </tbody>
                        </table>
                    </div>
                </div>
                <jsp:include page="../includes/con_right.jsp"></jsp:include>
            </div>
        </div>
    </div>
</div>

<script src="../../static/js/jquery-3.3.1.min.js"></script>
<script src="../../static/plugins/bootstrap-3.3.7/js/bootstrap.min.js"></script>
<script src="../../static/plugins/DataTables-1.10.15/media/js/jquery.dataTables.js"></script>
<script src="../../static/plugins/moment/moment.js"></script>
<script src="../../static/plugins/DataTables-1.10.15/media/js/dataTables.bootstrap.js"></script>
<script src="../../static/js/app.js"></script>
<script>
    var _dataTable;
    $(function () {
        var _columns = [
            {
                "data": function (row, type, val, meta) {
                    var str = "";
                    var imgPath = "http://localhost:8080/upload/";
                    str += "<div class='post_wrap'>";
                    str += "<div class='post_head'><img src='" + imgPath + row.authorAvatar + "' /></div>";
                    str += "<div class='post_body'>";
                    str += "<h5><a href='/posts/detail/" + row.id + "' >" + row.title + "</a></h5>";
                    str += "<ul>";
                    str += "<li class='post_node'>" + row.nodeName + "</li>";
                    str += "<li class='post_author'>" + row.authorName + "</li>";
                    str += "<li class='post_date'>" + moment(row.created).format("YYYY-MM-DD HH:mm:ss") + "</li>";
                    if (row.replyUsername != null)
                        str += "<li class='post_reply'>最后回复来自 <span class='post_author'>" + row.replyUsername + "</span></li>";
                    str += "</ul>";
                    str += "</div>";
                    if (row.comments != 0){
                        str += "<div class='post_num'>";
                        str += "<span>" + row.comments + "</span>";
                        str += "</div>";
                    }
                    str += "</div>";
                    return str;
                }
            }
        ];
        _dataTable = App.initDataTables("/posts/page", _columns);
    });
    function changeNode(obj,nodeId) {
        var param = {
            "node_id": nodeId
        }
        _dataTable.settings()[0].ajax.data = param;
        _dataTable.ajax.reload();
        $("#node_w a").each(function(){
            $(this).removeClass("tab_active");
        });
        $(obj).addClass("tab_active");
    }
</script>
</body>
</html>