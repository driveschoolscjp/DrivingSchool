<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<html>
<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Menu</title>

    <!-- Bootstrap -->
    <link href="/css/bootstrap.css" rel="stylesheet">
    <link href="/css/default.css" rel="stylesheet">
    <link href="/css/font-awesome.css" rel="stylesheet">
    <!--for VK-->
    <script src="http://vk.com/js/api/openapi.js" type="text/javascript"></script>


</head>

<body>
<div class="menu">

    <div class="container-fluid">

        <div class="row">
            <div class=" col-xs-offset-1">

                <sec:authorize access="!isAuthenticated()">
                <!--Включаю в форму для валидации по HTML 5-->
                <c:url value="/j_spring_security_check" var="loginUrl"/>
                <form action=/j_spring_security_check method="POST">
                    <!--Логин-->
                    <div class="roleMenu">
                        <div class="container-fluid">

                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-user fa-1x"
                                                                       style="color: #2370d5; width:14px;"></i></span>
                                    <input class="form-control" type="text" placeholder="User name" name="j_username"
                                           required/>
                                </div>
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-key fa-1x"
                                                                       style="color: #2370d5"></i></span>
                                    <input class="form-control" type="password" placeholder="Password" name="j_password"
                                           required="password"/>
                                </div>

                        </div>
                    </div>

                    <!--Кнопки входа/регистрации-->
                    <div class="roleMenu">
                        <div class="container">
                            <div class="row">

                                <div class="btn-group btn-group-xs" style="margin-top: 1%;  margin-left: 4%">

                                    <input type="submit" class="btn btn-primary btn" value="Войти">
                                    <input type="button" class="btn btn-primary btn" value="Регистрация">
                                </div>
                            </div>
                        </div>
                    </div>
                    <br>
                </form>
                </sec:authorize>
                <!--Аккордион-->
                <div class="roleMenu">
                    <div class="container-fluid">
                        <div id="accordion" class="panel-group">
                            <div class="panel panel-primary">

                                <div class="panel-heading">
                                    <h1 class="panel-title">

                                        <a href="#collapse-1" data-parent="#accordion" data-toggle="collapse"><i
                                                class="fa fa-graduation-cap fa-1x" style="color: #fffafa"></i> Онлайн
                                            тесты </a>
                                    </h1>
                                </div>

                                <div id="collapse-1" class="panel-collapse collapse">

                                    <ul>

                                        <li><a href="#"><i class="fa fa-motorcycle fa-1x" style="color: #2370d5"></i>
                                            Катигория А </a></li>
                                        <li><a href="#"><i class="fa fa-car fa-1x" style="color: #2370d5"></i> Катигория
                                            B </a></li>
                                        <li><a href="#"><i class="fa fa-truck fa-1x" style="color: #2370d5"></i>
                                            Катигория C </a></li>
                                        <li><a href="#"><i class="fa fa-bus fa-1x" style="color: #2370d5"></i> Катигория
                                            D </a></li>
                                    </ul>

                                </div>
                            </div>
                            <div class="panel panel-primary">

                                <div class="panel-heading">
                                    <h1 class="panel-title">
                                        <a href="#collapse-2" data-parent="#accordion" data-toggle="collapse"><i
                                                class="fa fa-tachometer fa-1x" style="color: #fffafa"></i> Автомобили
                                        </a>
                                    </h1>
                                </div>

                                <div id="collapse-2" class="panel-collapse collapse">
                                    <div class="panel-body">
                                        <ul>

                                            <li><a href="#"> Ручная КПП </a></li>
                                            <li><a href="#"> Автомат КПП </a></li>
                                        </ul>

                                    </div>
                                </div>
                            </div>
                            <div class="panel panel-primary">

                                <div class="panel-heading">
                                    <h1 class="panel-title">
                                        <a href="#collapse-3" data-parent="#accordion" data-toggle="collapse"><i
                                                class="fa fa-male fa-1x" style="color: #fffafa"></i> Преподаватели</a>
                                    </h1>
                                </div>

                                <div id="collapse-3" class="panel-collapse collapse">
                                    <div class="panel-body">
                                        <ul>
                                            <li><a href="#"><i class="fa fa-mars fa-1x" style="color: #2370d5"></i>
                                                Мужчины </a></li>
                                            <li><a href="#"><i class="fa fa-venus fa-1x" style="color: #2370d5"></i>
                                                Женщины </a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="container">
                            <!--Вконтакте-->
                            <div class="roleMenu" style="margin-top: 1%;  margin-left: 5px">
                                <div id="vk_groups"></div>
                            </div>
                        </div>

                    </div>
                </div>

            </div>
        </div>
    </div>
</div>


<script type="text/javascript">
    VK.Widgets.Group("vk_groups", {
        mode: 0,
        width: "150",
        height: "20",
        color1: 'FFFFFF',
        color2: '337ab7',
        color3: '337ab7'
    }, 88282564);
</script>


</body>
</html>
