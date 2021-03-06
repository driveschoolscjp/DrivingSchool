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

    <!-- Bootstrap -->
    <link href="/css/bootstrap.css" rel="stylesheet">
    <link href="/css/default.css" rel="stylesheet">
    <link href="/css/font-awesome.css" rel="stylesheet">
    <link href="/css/messageform.css" rel="stylesheet">
    <!--for VK-->
    <script src="http://vk.com/js/api/openapi.js" type="text/javascript"></script>
    <script src="/js/typeahead.bundle.js"></script>
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
                        <input type="submit" class="btn btn-primary btn-block" value="Войти">

                    </form:form>
                </div>
            </sec:authorize>

            <%-- Можно было бы проще: <sec:authorize url="/admin">--%>
            <%-- Это дублирует правила описанные в SecurityConfig для url /admin--%>
            <sec:authorize access="hasRole('ROLE_ADMIN')">
                <script src="/js/adminmessages.js"></script>
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
                            <a class="list-group-item" href="/admin/testing/exam/search"><i class="fa fa-file-text-o"></i> Тесты ПДД</a>
                            <a class="list-group-item" href="/schedule"><i class="fa fa-calendar"></i> График занятий</a>
                            <a class="list-group-item" href="" onclick="showModal2()" data-toggle="modal"><i
                                    class="fa fa-envelope-o"></i> Сообщения</a>
                            <a class="list-group-item active" onclick="sbmt();"><i class="fa fa-sign-out"></i> Выйти</a>
                        </div>
                    </div>

                    <div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel2" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header bg-primary">
                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                    <h4>Отправить сообщение</h4>
                                </div>
                                <div class="modal-body">
                                    <form id="MessageForm1" method="post" action="submitMF">
                                        <div class="row">
                                            <div id="selector1" class="btn-group col-xs-4" data-toggle="buttons">
                                                <label class="btn btn-primary active" id="student1">
                                                    <input type="radio"> Студенту
                                                </label>
                                                <label class="btn btn-primary" id="group1">
                                                    <input type="radio"> Группе
                                                </label>
                                            </div>

                                            <div class="col-xs-6">
                                                <div id="messageField">
                                                    <input class="typeahead form-control" type="text"
                                                           placeholder="Получатель">
                                                </div>
                                            </div>

                                            <div class="col-xs-2 checkbox">
                                                <label><input type="checkbox" id="isEmail"> <b>E-mail</b></label>
                                            </div>
                                        </div>
                                        <br/>

                                        <div class="form-group">
                                            <label for="theme">Тема:</label>
                                            <input type="text" name="theme" id="theme" class="input-xlarge form-control control-label">
                                        </div>
                                        <div class="form-group">
                                            <label for="message1">Сообщение:</label>
                                            <textarea name="message1" id="message1" rows="7" class="form-control control-label"></textarea>
                                        </div>
                                    </form>
                                </div>
                                <div class="modal-footer bg-primary">
                                    <input class="btn btn-success" type="submit" id="submitMF" value="Отправить">
                                    <a href="#" class="btn btn-danger" data-dismiss="modal">Отмена</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </sec:authorize>

            <sec:authorize access="hasRole('ROLE_STUDENT')">
                <script src="/js/studentmessages.js"></script>
                <div class="container roleMenu">
                    <div class="panel panel-primary">
                        <div class="panel-heading"><i class="fa fa-book fa-2x"></i><span class="h3">
                            <sec:authentication property="principal.username"/></span>
                        </div>
                        <div class="list-group">
                            <a class="list-group-item" href="#" data-toggle="modal" id="messagesItem"><i class="fa fa-envelope-o"></i> Сообщения
                                <span id="amount" class="badge" style="color: yellow"></span></a>
                            <a class="list-group-item" href="/student/news"><i class="fa fa-newspaper-o"></i> Новости</a>
                            <a class="list-group-item" href="/student/mygroup"><i class="fa fa-university"></i> Моя группа</a>
                            <a class="list-group-item" href="/testing/search?idExam=1"><i class="fa fa-pencil-square-o"></i> Тесты ПДД</a>
                            <a class="list-group-item" href="/student/roadsigns"><i class="fa fa-minus-circle"></i> Дорожные знаки</a>
                            <a class="list-group-item" href="/schedule"><i class="fa fa-calendar"></i> График занятий </a>
                            <a class="list-group-item active" onclick="sbmt();"><i class="fa fa-sign-out"></i> Выйти</a>
                        </div>
                    </div>
                </div>

                <div class="modal fade" id="myModal1" tabindex="-1" role="dialog" aria-hidden="true">
                    <div class="modal-dialog modal-lg">
                        <div class="modal-content">
                            <div class="modal-header bg-primary">
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                <h4>Мои сообщения</h4>
                            </div>
                            <div class="modal-body">

                                <table id="messagesTable" class="table">
                                    <tbody></tbody>
                                </table>
                                <button id="delButton" type="button" class="btn btn-default">Удалить</button>
                                <div class="form-group hide" id="messageText">
                                    <label for="messagearea">Тема: <label id="themearea"></label></label>
                                    <textarea  readonly id="messagearea" rows="7" class="form-control control-label"></textarea>
                                </div>
                            </div>
                            <div class="modal-footer bg-primary">
                                    <ul class="pager" id="pageList">
                                        <li id="prev1"><a>Пред</a></li>
                                        <li id="current1"><a></a></li>
                                        <li id="next1"><a>След</a></li>
                                    </ul>


                                <a class="btn btn-success hide" onclick="backToTable()" id="backButton">Назад</a>
                            </div>
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





