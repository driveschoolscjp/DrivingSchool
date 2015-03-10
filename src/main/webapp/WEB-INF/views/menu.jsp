<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ page isELIgnored="false" %>

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
            <div>

                <sec:authorize access="!isAuthenticated()">
                    <!--Включаю в форму для валидации по HTML 5-->
                    <form:form name="f" action="/login" method="post">
                        <!--Логин-->
                        <div class="roleMenu">
                            <div class="container-fluid">
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-user fa-1x"
                                                                       style="color: #2370d5; width:14px;"></i></span>
                                    <input class="form-control" name="username" type="text" placeholder="Username"
                                           required="required"/>
                                </div>
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-key fa-1x"
                                                                       style="color: #2370d5"></i></span>
                                    <input class="form-control" name="password" type="password" placeholder="Password"
                                           required="required"/>
                                </div>
                                <br/>

                                <div class="row text-center">
                                    <input type="submit" class="btn btn-primary btn-xs" value="Войти">
                                </div>

                            </div>
                        </div>
                    </form:form>
                </sec:authorize>

                <%-- Можно было бы проще: <sec:authorize url="/admin">--%>
                <%-- Это дублирует правила описанные в SecurityConfig для url /admin--%>
                <sec:authorize access="hasRole('ROLE_ADMIN')">
                    <div>
                        <div class="roleMenu">
                            <div class="container-fluid">
                                <h3 style="color: #ffffff"><i class="fa fa-cog"></i> Админ</h3>
                                <br/>
                                <div class="list-group">
                                    <a class="list-group-item" href="/admin/student/search"><i class="fa fa-child"></i> Студенты</a>
                                    <a class="list-group-item" href="/admin/group/search"><i class="fa fa-users"></i> Группы</a>
                                    <a class="list-group-item" href="/admin/teacher/search"><i class="fa fa-user-secret"></i> Преподаватели</a>
                                    <a class="list-group-item" href="/admin/car/search"><i class="fa fa-car"></i> Автомобили</a>
                                    <a class="list-group-item" href="/schedule"><i class="fa fa-calendar"></i> График занятий по вождению</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </sec:authorize>

                <sec:authorize access="hasRole('ROLE_STUDENT')">
                    <div>
                        <div class="roleMenu">
                            <div class="container-fluid">
                                <h3 style="color: #ffffff"><i class="fa fa-book"></i> Студент</h3>
                                <br/>
                                <div class="list-group">
                                    <a class="list-group-item" href="#"><i class="fa fa-calendar-o"></i> Расписание группы</a>
                                    <a class="list-group-item" href="#"><i class="fa fa-users"></i> Новости группы</a>
                                    <a class="list-group-item" href="#"><i class="fa fa-history"></i> История тестов</a>
                                    <a class="list-group-item" href="/schedule"><i class="fa fa-calendar"></i> График занятий по вождению</a>
                                </div>
                            </div>
                        </div>
                    </div>


                    <!--Аккордеон-->
                    <div class="roleMenu">
                        <div class="container-fluid">
                            <div id="accordion" class="panel-group">
                                <div class="panel panel-primary">
                                    <div class="panel-heading">
                                        <h1 class="panel-title">
                                            <a href="#collapse-1" data-parent="#accordion" data-toggle="collapse"><i
                                                    class="fa fa-graduation-cap fa-1x"></i> Онлайн
                                                тесты</a>
                                        </h1>
                                    </div>
                                    <div id="collapse-1" class="panel-collapse collapse">
                                        <ul>
                                            <li><a href="#"><i class="fa fa-motorcycle fa-1x"></i> Катигория А </a></li>
                                            <li><a href="#"><i class="fa fa-car fa-1x"></i> Катигория B </a></li>
                                            <li><a href="#"><i class="fa fa-truck fa-1x"></i> Катигория C </a></li>
                                            <li><a href="#"><i class="fa fa-bus fa-1x"></i> Катигория D </a></li>
                                        </ul>
                                    </div>
                                </div>

                                <div class="panel panel-primary">
                                    <div class="panel-heading">
                                        <h1 class="panel-title">
                                            <a href="#collapse-2" data-parent="#accordion" data-toggle="collapse">
                                                <i                                                class="fa fa-tachometer fa-1x"></i>Группа
                                            </a>
                                        </h1>
                                    </div>

                                    <div id="collapse-2" class="panel-collapse collapse">
                                        <div class="panel-body">
                                            <ul>
                                                <li><a href="#">Расписание группы</a></li>
                                                <li><a href="#">Новости группы</a></li>
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
                                                <li><a href="#"><i class="fa fa-mars fa-1x"></i> Мужчины</a></li>
                                                <li><a href="#"><i class="fa fa-venus fa-1x"></i> Женщины</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>

                                <div class="panel panel-primary">
                                    <div class="panel-heading">
                                        <h1 class="panel-title">
                                            <a href="/schedule"><i class="fa fa-male fa-1x"></i> График занятий по вождению</a>
                                        </h1>
                                    </div>
                                </div>
                            </div>



                        </div>
                    </div>

                </sec:authorize>

                <sec:authorize access="isAuthenticated()">
                    <div class="roleMenu">
                        <div class="container-fluid">
                            <form:form action="/logout" method="post">
                                <h3 style="color:#ffffff;">Hello <sec:authentication property="principal.username"/>!
                                    <sec:authentication property="authorities"/></h3>
                                <input class="btn btn-warning btn-block" type="submit" value="Logout"/>
                            </form:form>
                        </div>
                    </div>
                </sec:authorize>


                <!--Вконтакте-->
                <div class="roleMenu">
                        <div id="vk_groups" style="margin: 5em auto;"></div>
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
