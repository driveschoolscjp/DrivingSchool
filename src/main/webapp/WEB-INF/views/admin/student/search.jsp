<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

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

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->


    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="../../assets/js/ie10-viewport-bug-workaround.js"></script>

    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"/>
    <script src="/js/bootstrap.js"></script>

</head>
<body>

<jsp:include page="../../header.jsp"/>
<jsp:include page="../menuAdmin.jsp"/>

<div class="body">

    <div class="container-fluid">

        <div class="row">
            <div class="col-md-11 whiteback">

                <h3 class="text-center">Поиск студентов</h3>
                <hr>
                <%--три верхние кнопки--%>
                <div class="row">
                    <div class="col-md-4">
                        <a href="/admin/student/add" type="button" class="btn btn-primary btn-success">Добавить
                            студента</a>
                    </div>

                    <div class="col-md-4">
                        <form action="" method="post">
                            <select name="groupId" class="selectpicker input-xlarge">
                                <c:forEach items="${groups}" var="group">
                                    <option value="${group.id}">${group.name}</option>
                                </c:forEach>
                            </select>

                            <button type="submit" class="btn btn-primary">Поиск по группе</button>
                        </form>
                    </div>

                    <div class="col-md-4">
                        <input type="search" id="search" value="" class="form-control" placeholder="Поиск">
                    </div>
                </div>
                <hr>
                <%--таблица с данными--%>
                <div class="row">
                    <div class="col-md-12">
                        <table class="table" id="table">
                            <thead>
                            <tr>
                                <th>Фамилия</th>
                                <th>Имя</th>
                                <th>Отчество</th>
                                <th>Телефон</th>
                                <th>Email</th>
                                <th>Группа</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="student" items="${students}">
                                <tr>
                                    <td>${student.lastname}</td>
                                    <td>${student.firstname}</td>
                                    <td>${student.patronymic}</td>
                                    <td>${student.tel}</td>
                                    <td>${student.email}</td>
                                    <td>${student.group.name}</td>
                                    <td>
                                        <div class="btn-group-vertical pull-right">
                                            <a href="/admin/student/edit?id=${student.id}" type="button"
                                               class="btn btn-primary btn-sm"><i class="fa fa-user fa-xs">&nbsp;
                                                Редактировать</i></a>
                                            <a href="/admin/student/show?id=${student.id}" type="button"
                                               class="btn btn-primary btn-sm"><i class="fa fa-search fa-xs">&nbsp;
                                                Просмотреть</i></a>
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

<script>
    $(function () {
        $('#table').searchable({
            striped: true,
            oddRow: {'background-color': '#f5f5f5'},
            evenRow: {'background-color': '#fff'},
            searchType: 'fuzzy'
        });
    });</script>
<script src="//rawgithub.com/stidges/jquery-searchable/master/dist/jquery.searchable-1.0.0.min.js"></script>

</body>
</html>

