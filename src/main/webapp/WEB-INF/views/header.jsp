
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Bootstrap 101 Template</title>

    <!-- Bootstrap -->
    <link href="/css/bootstrap.css" rel="stylesheet">
    <link href="/css/default.css" rel="stylesheet">
    <link href="/css/font-awesome.css" rel="stylesheet">
    <!--for VK-->
    <script src="http://vk.com/js/api/openapi.js" type="text/javascript"></script>




</head>

<body>
<div class="header">

    <div class="navbar navbar-inverse  navbar-static-top">

        <!--Меню-->
        <div class="container">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle ="collapse" data-target = "#responsive-menu">
                    <span class="sr-only">Открыть навигацийу </span>
                    <span class="icon-bar"> </span>
                    <span class="icon-bar"> </span>
                    <span class="icon-bar"> </span>
                </button>
                <a class="navbar-brand" href="#">
                    <img src="/images/logo.png" height="40" alt="">
                </a>
            </div>

            <div class="collapse navbar-collapse" id="responsive-menu">
                <ul class="nav navbar-nav">
                    <li> <a href="/home"><i class="fa fa-home fa-2x" style="color: #2370d5"></i> Дом</a></li>
                    <li> <a href="#"><i class="fa fa-calculator fa-2x"></i> Стоимость обучения</a> </li>
                    <li> <a href="#"><i class="fa fa-calendar fa-2x"></i> Расписание занятий</a></li>
                    <li> <a href="#"><i class="fa fa-user fa-2x"></i> Запись в автошколу</a></li>
                    <li> <a href="/logoutUser/contact/contact"><i class="fa fa-mobile fa-2x"></i> Контакты</a></li>
                </ul>

            </div>
        </div>
    </div>


</div>
</body>
</html>
