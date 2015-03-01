<%--
  Created by IntelliJ IDEA.
  User: acer
  Date: 26.02.15
  Time: 21:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

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


    <!--for VK-->
    <script src="http://vk.com/js/api/openapi.js" type="text/javascript"></script>




</head>

<body>
<div class="menu">

    <div class="container-fluid">

        <div class="row">
    <div class=" col-xs-offset-1 col-sm-offset-1  col-md-offset-1 col-lg-offset-1">


        <div id="2" style="display:block">
        <!--Включаю в форму для валидации по HTML 5-->
  <form action="login" method="post">



        <!--Логин-->
        <div class="roleMenu">
            <div class="container-fluid">

                <div class="input-group">
                    <span class="input-group-addon"><i class="fa fa-user fa-1x" style="color: #2370d5"></i></span>
                    <input class="form-control" type="text"  placeholder="User name" name = "login" required />
                </div>
                <div class="input-group">
                    <span class="input-group-addon"><i class="fa fa-key fa-1x" style="color: #2370d5"></i></span>
                    <input  class="form-control" type="password"  placeholder="Password" name = "password" required = "password"   />
                </div>
            </div>
        </div>
        <!--Кнопки входа/регистрации-->
        <div class="roleMenu">
            <div class="container">
                <div class="row">

                    <div class="btn-group btn-group-xs" style="margin-top: 1%;  margin-left: 4%">

                        <input type="submit" class="btn btn-primary btn"  value="Войти" >
                        <input type="button" class="btn btn-primary btn" value="Регистрация" >
                    </div>
                </div>
            </div>
        </div>
        <br>

</form>
        <!--Аккордион-->
        <div class="roleMenu">
<div class = "container-fluid">
            <div id="accordion" class="panel-group">
                <div class="panel panel-primary">

                    <div class="panel-heading">
                        <h1 class="panel-title">

                            <a href="#collapse-1" data-parent = "#accordion" data-toggle = "collapse"><i class="fa fa-graduation-cap fa-1x" style="color: #fffafa"></i>  Онлайн тесты </a>
                        </h1>
                    </div>

                    <div id = "collapse-1" class="panel-collapse collapse">

                        <ul>

                            <li> <a href="#"><i class="fa fa-motorcycle fa-1x" style="color: #2370d5"></i> Катигория А </a> </li>
                            <li> <a href="#"><i class="fa fa-car fa-1x" style="color: #2370d5"></i> Катигория B </a> </li>
                            <li> <a href="#"><i class="fa fa-truck fa-1x" style="color: #2370d5"></i> Катигория C </a></li>
                            <li> <a href="#"><i class="fa fa-bus fa-1x" style="color: #2370d5"></i> Катигория D </a> </li>
                        </ul>

                    </div>
                </div>
                <div class="panel panel-primary">

                    <div class="panel-heading">
                        <h1 class="panel-title">
                            <a href="#collapse-2" data-parent = "#accordion" data-toggle = "collapse"><i class="fa fa-tachometer fa-1x" style="color: #fffafa"></i>  Автомобили </a>
                        </h1>
                    </div>

                    <div id = "collapse-2" class="panel-collapse collapse">
                        <div class="panel-body">
                            <ul>

                                <li> <a href="#"> Ручная КПП </a> </li>
                                <li> <a href="#"> Автомат КПП </a> </li>
                            </ul>

                        </div>
                    </div>
                </div>
                <div class="panel panel-primary">

                    <div class="panel-heading">
                        <h1 class="panel-title">
                            <a href="#collapse-3" data-parent = "#accordion" data-toggle = "collapse"><i class="fa fa-male fa-1x" style="color: #fffafa"></i> Преподаватели</a>
                        </h1>
                    </div>

                    <div id = "collapse-3" class="panel-collapse collapse">
                        <div class="panel-body">
                            <ul>
                                <li> <a href="#"><i class="fa fa-mars fa-1x" style="color: #2370d5"></i> Мужчины </a></li>
                                <li> <a href="#"><i class="fa fa-venus fa-1x" style="color: #2370d5"></i> Женщины </a> </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
    </div>
        </div>


            <!--Вконтакте-->
            <div class="roleMenu"  style="margin-top: 1%;  margin-left: 4%">
                <div id="vk_groups"></div>
            </div>
        </div>

        <br>
        <br>
    </div>

        </div>
        </div>
    </div>




<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="bootstrap/js/bootstrap.js"></script>


<script type="text/javascript">
    VK.Widgets.Group("vk_groups", {mode: 0, width: "150", height: "20", color1: 'FFFFFF', color2: '337ab7', color3: '337ab7'}, 88282564);
</script>


</body>
</html>
