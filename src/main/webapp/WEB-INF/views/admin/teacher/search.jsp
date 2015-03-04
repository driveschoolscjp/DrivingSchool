<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>


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
    <link href="/css/search.css" rel="stylesheet">
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="../../assets/js/ie10-viewport-bug-workaround.js"></script>

    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="/js/bootstrap.js"></script>

</head>
<body>

<jsp:include page="../../header.jsp"/>
<jsp:include page="../menuAdmin.jsp"/>


<div class="body">

    <div class="container-fluid">

        <div class="row">
            <div class="col-md-11 whiteback">

                <h3 class="text-center">Поиск преподавателей</h3>
                <hr>
                <%--три верхние кнопки--%>
                <div class="row">
                    <div class="col-md-4">
                        <a href="/admin/teacher/add" type="button" class="btn btn-primary btn-success">Добавить
                            преподавателя</a>
                    </div>

                    <div class="col-md-4">
                        <form action="" method="post">
                            <select name="hasCar" class="selectpicker input-xlarge">
                                    <option value="1" ${hasCar==1?"selected":""}>All</option>
                                    <option value="2" ${hasCar==2?"selected":""}>Has car</option>
                                    <option value="3" ${hasCar==3?"selected":""}>No car</option>
                            </select>

                            <button type="submit" class="btn btn-primary">Has car</button>
                        </form>
                    </div>

                    <div class="col-md-4">
                        <input type="search" id="search" value="" class="form-control" placeholder="Найти по ФИО">
                    </div>
                </div>
                <%--таблица с данными--%>
                <div class="row">
                    <div class="col-md-12">
                        <table class="table" id="table">
                            <thead>
                            <tr>
                                <th>Вождение</th>
                                <th>Фамилия</th>
                                <th>Имя</th>
                                <th>Отчество</th>
                                <th>Телефон</th>
                                <th>Email</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="teacher" items="${teachers}">
                                <tr>
                                    <td align="center"><c:if test="${teacher.car!=null}">
                                        <i class="fa fa-car"></i>
                                    </c:if>
                                    </td>
                                    <td>${teacher.lastname}</td>
                                    <td>${teacher.firstname}</td>
                                    <td>${teacher.patronymic}</td>
                                    <td>${teacher.tel}</td>
                                    <td>${teacher.email}</td>
                                    <td>
                                        <div class="btn-group-vertical pull-right">
                                            <a href="/admin/teacher/edit?id=${teacher.id}" type="button"
                                               class="btn btn-primary btn-sm"><i class="fa fa-user fa-xs">&nbsp;
                                                Редактировать</i></a>
                                            <a href="/admin/teacher/show?id=${teacher.id}" type="button"
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

