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

            <sec:authorize access="!isAuthenticated()">
                <div class="container roleMenu">
                    <form:form name="f" action="/login" method="post">

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

                    </form:form>
                </div>
            </sec:authorize>

            <%-- Можно было бы проще: <sec:authorize url="/admin">--%>
            <%-- Это дублирует правила описанные в SecurityConfig для url /admin--%>
            <sec:authorize access="hasRole('ROLE_ADMIN')">
                <div class="container roleMenu">

                    <div class="panel panel-primary">
                        <div class="panel-heading"><i class="fa fa-cog fa-2x"></i><span class="h3"> Админ</span>
                        </div>

                        <div class="list-group">
                            <a class="list-group-item" href="/admin/registration/search"><i class="fa fa-list"></i>
                                Заявки на обучение</a>
                            <a class="list-group-item" href="/admin/student/search"><i class="fa fa-child"></i> Студенты</a>
                            <a class="list-group-item" href="/admin/group/search"><i class="fa fa-users"></i> Группы</a>
                            <a class="list-group-item" href="/admin/teacher/search"><i class="fa fa-user-secret"></i>
                                Преподаватели</a>
                            <a class="list-group-item" href="/admin/car/search"><i class="fa fa-car"></i> Автомобили</a>
                            <a class="list-group-item" href="/schedule"><i class="fa fa-calendar"></i> График занятий по
                                вождению</a>
                            <a class="list-group-item active" onclick="sbmt();"><i class="fa fa-sign-out"></i> Выйти</a>
                        </div>
                    </div>

                </div>
            </sec:authorize>

            <sec:authorize access="hasRole('ROLE_STUDENT')">
                <div class="container roleMenu">

                    <div class="panel panel-primary">
                        <div class="panel-heading"><i class="fa fa-book fa-2x"></i><span class="h3">
                            <sec:authentication property="principal.username"/></span>
                        </div>

                        <div class="list-group">
                            <a class="list-group-item" href="#"><i class="fa fa-calendar-o"></i> Расписание группы</a>
                            <a class="list-group-item" href="#"><i class="fa fa-users"></i> Новости группы</a>
                            <a class="list-group-item" href="/testing/search?idExam=1"><i class="fa fa-history"></i> Экзамен ПДД</a>
                            <a class="list-group-item" href="/schedule"><i class="fa fa-calendar"></i> График занятий по
                                вождению</a>
                            <a class="list-group-item active" onclick="sbmt();"><i class="fa fa-sign-out"></i> Выйти</a>
                        </div>
                    </div>

                </div>
            </sec:authorize>

            <form:form action="/logout" method="post" id="logoutForm"/>

            <!--Вконтакте-->
            <div class="roleMenu">
                <div id="vk_groups" style="margin: 3em auto;"></div>
            </div>

        </div>
    </div>
</div>
<script src="/js/menu.js"></script>


</body>
</html>
