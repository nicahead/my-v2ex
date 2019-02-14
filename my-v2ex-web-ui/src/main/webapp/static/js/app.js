var App = function () {
    // 默认的 Dropzone 参数
    var defaultDropzoneOpts = {
        url: "",
        paramName: "dropFile",
        maxFiles: 1, // 一次性上传的文件数量上限
        maxFilesize: 2, // 文件大小，单位：MB
        acceptedFiles: ".jpg,.gif,.png,.jpeg", // 上传的类型
        addRemoveLinks: true,
        parallelUploads: 1, // 一次上传的文件数量
        dictDefaultMessage: '拖动文件至此或者点击上传',
        dictMaxFilesExceeded: "您最多只能上传 1 个文件！",
        dictResponseError: '文件上传失败!',
        dictInvalidFileType: "文件类型只能是*.jpg,*.gif,*.png,*.jpeg",
        dictFallbackMessage: "浏览器不受支持",
        dictFileTooBig: "文件过大上传文件最大支持",
        dictRemoveLinks: "删除",
        dictCancelUpload: "取消"
    };
    /**
     * 初始化 DataTables
     */
    var handlerInitDataTables = function (url, columns) {
        var _dataTable = $("#dataTable").DataTable({
            "paging": true,
            "info": false,
            "lengthChange": false,
            "ordering": false,
            "processing": true,
            "searching": false,
            "serverSide": true,
            "deferRender": true,
            "ajax": {
                "url": url
            },
            "columns": columns,
            "language": {
                "sProcessing": "处理中...",
                "sLengthMenu": "显示 _MENU_ 项结果",
                "sZeroRecords": "没有匹配结果",
                "sInfo": "显示第 _START_ 至 _END_ 项结果，共 _TOTAL_ 项",
                "sInfoEmpty": "显示第 0 至 0 项结果，共 0 项",
                "sInfoFiltered": "(由 _MAX_ 项结果过滤)",
                "sInfoPostFix": "",
                "sSearch": "搜索:",
                "sUrl": "",
                "sEmptyTable": "暂无数据",
                "sLoadingRecords": "载入中...",
                "sInfoThousands": ",",
                "oPaginate": {
                    "sFirst": "首页",
                    "sPrevious": "上页",
                    "sNext": "下页",
                    "sLast": "末页"
                },
                "oAria": {
                    "sSortAscending": ": 以升序排列此列",
                    "sSortDescending": ": 以降序排列此列"
                }
            }
        });
        return _dataTable;
    };
    /**
     * 初始化 Dropzone
     * @param opts
     */
    var handlerInitDropzone = function (opts) {
        // 关闭 Dropzone 的自动发现功能
        Dropzone.autoDiscover = false;
        // 继承
        $.extend(defaultDropzoneOpts, opts);
        new Dropzone(defaultDropzoneOpts.id, defaultDropzoneOpts);
    };
    /**
     * 初始化 热门文章列表
     */
    var handlerInitPopPosts = function () {
        $.ajax({
            type: "GET",
            url: "/posts/pop",
            dataType: "json",
            success: function (data) {
                var str = "";
                var imgPath = "http://localhost:8080/upload/";
                $.each(data, function (i, item) {
                    str += "<div class='item list_wrap'>";
                    str += "<img src='"+imgPath+item.authorAvatar+"'/>";
                    str += "<span><a href='/posts/detail/"+item.id+"' >"+item.title+"</a></span>";
                    str += "</div>";
                });
                $("#right_list1_wrap").append(str);
            }
        });
    };
    /**
     * 初始化 运行状态
     */
    var handlerInitV2EXInfo = function () {
        $.ajax({
            type: "GET",
            url: "/system",
            dataType: "json",
            success: function (data) {
                $("#user_num").append(data.userCount);
                $("#post_num").append(data.postCount);
                $("#comment_num").append(data.commentCount);
            }
        });
    };

    return {
        /**
         * 初始化
         */
        init: function () {
            handlerInitPopPosts();
            handlerInitV2EXInfo();
        },
        /**
         * 初始化 Dropzone
         * @param opts
         */
        initDropzone: function (opts) {
            handlerInitDropzone(opts);
        },
        /**
         * 初始化 DataTables
         * @param url
         * @param columns
         * @returns {*|jQuery}
         */
        initDataTables: function (url, columns) {
            return handlerInitDataTables(url, columns);
        }
    }
}();

$(document).ready(function () {
    App.init();
});