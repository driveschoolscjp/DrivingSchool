<%--
  Created by IntelliJ IDEA.
  User: alexey
  Date: 05.03.2015
  Time: 9:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Schedule</title>
    <link href="/css/my.css" rel="stylesheet">
    <script src="/js/jquery-1.11.2.min.js"></script>
    <script src="/js/daypilot-calendar.src.js"></script>
    <script src="/js/daypilot-navigator.src.js"></script>
    <script src="/js/daypilot-modal.src.js"></script>
    <script src="/js/daypilot-common.src.js"></script>

    <link href="/css/bootstrap.css" rel="stylesheet">
    <link href="/css/default.css" rel="stylesheet">
    <link href="/css/font-awesome.css" rel="stylesheet">
    <script src="/js/bootstrap.js"></script>

</head>
<body>

<jsp:include page="header.jsp"/>

<style type="text/css">
    .container11 {
        font-family: Verdana, Arial, Helvetica, sans-serif;
        color:#c7ddef;
        background-color: #66afe9;
    }
</style>
<div class="row">
    <div class="col-md-1">

    </div>
    <div class="col-md-2">
        <div id="nav"></div>
        <div class="container11 col-md-2">
            <p>Создавать:</p>
            <form role="form" id="onCreateForm">
                <div class="radio">
                    <label><input type="radio" name="interval_type" value = "lesson" checked>Новое занятие</label>
                </div>
                <div class="radio">
                    <label><input type="radio" name="interval_type" value = "nolesson">Неактивный интервал</label>
                </div>
            </form>
        </div>


    </div>
    <div class="col-md-8">




            <div id="dp"></div>

    </div>
    <div class="col-md-1">

    </div>

</div>



<script src="/js/schedule.js"></script>

</body>
</html>
