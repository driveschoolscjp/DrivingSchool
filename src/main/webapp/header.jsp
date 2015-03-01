<%--
  Created by IntelliJ IDEA.
  User: acer
  Date: 26.02.15
  Time: 21:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Bootstrap 101 Template</title>

    <!-- Bootstrap -->
    <link href="bootstrap/css/bootstrap.css" rel="stylesheet">
    <link href="bootstrap/css/default.css" rel="stylesheet">
    <link href="bootstrap/css/font-awesome.css" rel="stylesheet">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->


    <!--for VK-->
    <script src="http://vk.com/js/api/openapi.js" type="text/javascript"></script>




</head>

<body>
<div class="header">

    <div class="navbar navbar-inverse  navbar-static-top">

        <!--Менйу-->
        <div class="container">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle ="collapse" data-target = "#responsive-menu">
                    <span class="sr-only">Открыть навигацийу </span>
                    <span class="icon-bar"> </span>
                    <span class="icon-bar"> </span>
                    <span class="icon-bar"> </span>
                </button>
                <a class="navbar-brand" href="#">
                    <img src="bootstrap/images/logo.png" height= "40"   alt="">
                </a>
            </div>

            <div class="collapse navbar-collapse" id="responsive-menu">
                <ul class="nav navbar-nav">
                    <li> <a href="#"><i class="fa fa-home fa-2x" style="color: #2370d5"></i> Дом</a></li>
                    <li> <a href="#"><i class="fa fa-calculator fa-2x"></i> Стоимость обучения</a> </li>
                    <li> <a href="#"><i class="fa fa-calendar fa-2x"></i> Расписание занятий</a></li>
                    <li> <a href="#"><i class="fa fa-user fa-2x"></i> Запись в автошколу</a></li>
                    <li> <a href="#"><i class="fa fa-mobile fa-2x"></i> Контакты</a></li>
                </ul>

            </div>
        </div>
    </div>


</div>


<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="bootstrap/js/bootstrap.js"></script>

</body>
</html>
