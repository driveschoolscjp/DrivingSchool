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
    <script src="/js/daypilot-all.min.js"></script>

</head>
<body>
<div style="float:left; width: 150px;">
    <div id="nav"></div>
</div>
<div style="margin-left: 150px;">
    <div id="dp"></div>
</div>

<script type="text/javascript">
    var nav = new DayPilot.Navigator("nav");
    nav.showMonths = 3;
    nav.selectMode = "week";
    nav.onTimeRangeSelected = function(args) {
        dp.startDate = args.start;
        dp.update();
    };
    nav.init();

    var dp = new DayPilot.Calendar("dp");
    dp.viewType = "Week";
    dp.init();

</script>
</body>
</html>
