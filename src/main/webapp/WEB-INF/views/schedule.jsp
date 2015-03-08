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

</head>
<body>


<div style="float:left; width: 150px;">
    <div id="nav"></div>
    <div  style="float:left; width: 150px;">
        <form  id="onCreateForm" name="onCreateForm">
            <p><b>Создавать:</b></p>
            <p><input type="radio" name="interval_type" value="nolesson">Неактивное время у инструктора<Br></p>
            <p><input type="radio" name="interval_type" value="lesson" checked="checked">Урок вождения<Br></p>
        </form>
    </div>
</div>
<div style="margin-left: 150px;">
    <div id="dp"></div>
</div>


<script src="/js/schedule.js"></script>

</body>
</html>
