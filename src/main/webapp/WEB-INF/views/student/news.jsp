<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<html>
<head>
    <title>Новости</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="shortcut icon" href="http://s3.gazu.ru/favicon.ico" type="image/x-icon">

    <!-- Bootstrap -->
    <link href="/css/bootstrap.css" rel="stylesheet">
    <link href="/css/default.css" rel="stylesheet">
    <link href="/css/font-awesome.css" rel="stylesheet">
    <script src="../../assets/js/ie10-viewport-bug-workaround.js"></script>

    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="/js/bootstrap.js"></script>
</head>

<body>
<jsp:include page="../header.jsp"/>
<jsp:include page="../menu.jsp"/>

<div class="body">
    <div class="container-fluid col-xs-10">
        <br/>
        <div>
            <script type="text/javascript">document.write('\x3Cscript type="text/javascript" src="' + ('https:' == document.location.protocol ? 'https://' : 'http://') + 'feed.mikle.com/js/rssmikle.js">\x3C/script>');</script>
            <script type="text/javascript">(function () {
                var params = {
                    rssmikle_url: "http://www.drive.ru/export/rss.xml",
                    rssmikle_frame_width: "650",
                    rssmikle_frame_height: "400",
                    frame_height_by_article: "15",
                    rssmikle_target: "_blank",
                    rssmikle_font: "Arial, Helvetica, sans-serif",
                    rssmikle_font_size: "14",
                    rssmikle_border: "off",
                    responsive: "on",
                    rssmikle_css_url: "",
                    text_align: "left",
                    text_align2: "left",
                    corner: "on",
                    scrollbar: "off",
                    autoscroll: "off",
                    scrolldirection: "up",
                    scrollstep: "3",
                    mcspeed: "20",
                    sort: "Rnd",
                    rssmikle_title: "on",
                    rssmikle_title_sentence: "Автоновости",
                    rssmikle_title_link: "",
                    rssmikle_title_bgcolor: "#337AB7",
                    rssmikle_title_color: "#FFFFFF",
                    rssmikle_title_bgimage: "",
                    rssmikle_item_bgcolor: "#FFFFFF",
                    rssmikle_item_bgimage: "",
                    rssmikle_item_title_length: "70",
                    rssmikle_item_title_color: "#337AB7",
                    rssmikle_item_border_bottom: "on",
                    rssmikle_item_description: "on",
                    item_link: "off",
                    rssmikle_item_description_length: "500",
                    rssmikle_item_description_color: "#666666",
                    rssmikle_item_date: "off",
                    rssmikle_timezone: "Etc/GMT",
                    datetime_format: "%e.%m.%Y %k:%M:%S",
                    item_description_style: "text+tn",
                    item_thumbnail: "crop",
                    item_thumbnail_selection: "auto",
                    article_num: "15",
                    rssmikle_item_podcast: "off",
                    keyword_inc: "",
                    keyword_exc: ""
                };
                feedwind_show_widget_iframe(params);
            })();</script>
        </div>
    </div>
</div>

<jsp:include page="../footer.jsp"/>
</body>
</html>