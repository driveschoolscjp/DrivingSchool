<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="joda" uri="http://www.joda.org/joda/time/tags" %>

<html>
<head>
    <title>Поиск групп</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap -->
    <link href="/css/bootstrap.css" rel="stylesheet">
    <link href="/css/default.css" rel="stylesheet">
    <link href="/css/font-awesome.css" rel="stylesheet">
    <link href="/css/search.css" rel="stylesheet">

    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="../../assets/js/ie10-viewport-bug-workaround.js"></script>

    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="/js/bootstrap.js"></script>

</head>
<body>

<jsp:include page="../../header.jsp"/>
<jsp:include page="../../menu.jsp"/>


<div class="body">

    <div class="container-fluid">

        <div class="row">
            <div class="col-xs-11 whiteback">

                <h3 class="text-center">Поиск групп</h3>
                <hr>
                <%--три верхние кнопки--%>
                <div class="row">
                    <div class="col-xs-3">
                        <a href="/admin/group/add" type="button" class="btn btn-success">Добавить
                            группу</a>
                    </div>

                    <div class="col-xs-5">
                        <form action="" method="post">
                            <div class="col-xs-7">
                                <select name="id" class="selectpicker form-control">
                                    <c:forEach items="${teachers}" var="teacher">
                                        <option value="${teacher.id}">${teacher.firstname} ${teacher.lastname}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="col-xs-5">
                                <button type="submit" class="btn btn-primary">Поиск по преподавателю</button>
                            </div>
                        </form>
                    </div>
                    <div class="col-xs-4">
                        <input type="search" id="search" value="" class="form-control" placeholder="Найти">
                    </div>
                </div>
                <hr>
                <%--таблица с данными--%>
                <div class="row">
                    <div class="col-xs-12 table-responsive">
                        <table class="table" id="table">
                            <thead>
                            <tr>
                                <th>Название группы</th>
                                <th>Преподаватель</th>
                                <th>Дата начала занятий</th>
                                <th>Дата окончания занятий</th>
                                <th></th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="group" items="${groups}">
                                <tr>
                                    <td>${group.name}</td>
                                    <td>${group.teacher.lastname} ${group.teacher.firstname} ${group.teacher.patronymic}</td>
                                    <td><joda:format value="${group.startDate}" style="M-"/></td>
                                    <td><joda:format value="${group.startDate}" style="M-"/></td>
                                    <td>
                                        <div class="btn-group pull-right">
                                            <a onclick="adminMessageFromGroups('${group.id}', '${group.name}')"
                                               type="button" title="Отправить сообщение"
                                               class="btn btn-warning"><i class="fa fa-envelope"></i></a>
                                            <a href="/admin/group/show?id=${group.id}" type="button" title="Посмотреть"
                                               class="btn btn-success"><i class="fa fa-search"></i></a>
                                            <a href="/admin/group/edit?id=${group.id}" type="button"
                                               title="Редактировать"
                                               class="btn btn-primary"><i class="fa fa-pencil"></i></a>
                                        </div>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>

</div>

<jsp:include page="../../footer.jsp"/>

<script src="//rawgithub.com/stidges/jquery-searchable/master/dist/jquery.searchable-1.0.0.min.js"></script>
<script src="/js/search.js"></script>
</body>
</html>

