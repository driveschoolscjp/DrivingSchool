<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Student</title>
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

<jsp:include page="../header.jsp"/>
<jsp:include page="../menu.jsp"/>

<div class="body">

    <div class="container-fluid">

        <div class="row">
            <div class="col-xs-11 whiteback">

                <h3 class="text-center">Просмотр заявок</h3>
                <hr>
                <%--три верхние кнопки--%>
                <div class="row">
                    <div class="col-xs-offset-8 col-xs-4">
                        <input type="search" id="search" value="" class="form-control" placeholder="Поиск">
                    </div>
                </div>
                <hr>
                <%--таблица с данными--%>
                <div class="row">
                    <div class="col-xs-12 table-responsive">
                        <table class="table" id="table">
                            <thead>
                            <tr>
                                <th>Фамилия</th>
                                <th>Имя</th>
                                <th>Отчество</th>
                                <th>Телефон</th>
                                <th>Email</th>
                                <th>Авто</th>
                                <th></th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="registration" items="${registrations}">
                                <tr>
                                    <td>${registration.lastname}</td>
                                    <td>${registration.firstname}</td>
                                    <td>${registration.patronymic}</td>
                                    <td>${registration.tel}</td>
                                    <td>${registration.email}</td>
                                    <td>${registration.car.brand} ${registration.car.model}</td>
                                    <td>
                                        <div class="btn-group pull-right">
                                            <a href= "/admin/student/register?id=${registration.id}"
                                               type="button"
                                               class="btn btn-success"><i class="fa fa-plus"></i></a>
                                            <a href= "/admin/registration/delete?id=${registration.id}"
                                               type="button"
                                               class="btn btn-danger"><i class="fa fa-trash"></i></a>
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

<jsp:include page="../footer.jsp"/>
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

