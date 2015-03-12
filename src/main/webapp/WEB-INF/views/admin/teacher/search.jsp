<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Teacher</title>
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

                <h3 class="text-center">Поиск преподавателей</h3>
                <hr>
                <%--три верхние кнопки--%>
                <div class="row">
                    <div class="col-xs-3">
                        <a href="/admin/teacher/add" type="button" class="btn btn-primary btn-success">Добавить
                            преподавателя</a>
                    </div>

                    <div class="col-xs-5">
                        <form action="" method="post">
                            <div class="col-xs-7">
                                <select name="hasCar" class="selectpicker form-control">
                                    <option value="1" ${hasCar==1?"selected":""}>Все</option>
                                    <option value="2" ${hasCar==2?"selected":""}>С авто</option>
                                    <option value="3" ${hasCar==3?"selected":""}>Без авто</option>
                                </select>
                            </div>
                            <div class="col-xs-5">
                                <button type="submit" class="btn btn-primary">Наличие авто</button>
                            </div>
                        </form>
                    </div>

                    <div class="col-xs-4">
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
                                <th>Инструктор</th>
                                <th>Фамилия</th>
                                <th>Имя</th>
                                <th>Отчество</th>
                                <th>Телефон</th>
                                <th>Email</th>
                                <th></th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="teacher" items="${teachers}">
                                <tr>
                                    <td class="text-center"><c:if test="${teacher.car!=null}">
                                        <i class="fa fa-car" style="color: #337ab7"></i>
                                    </c:if>
                                    </td>
                                    <td>${teacher.lastname}</td>
                                    <td>${teacher.firstname}</td>
                                    <td>${teacher.patronymic}</td>
                                    <td>${teacher.tel}</td>
                                    <td>${teacher.email}</td>
                                    <td>
                                        <div class="btn-group pull-right">
                                            <a href="/admin/teacher/show?id=${teacher.id}" type="button"
                                               class="btn btn-success"><i class="fa fa-search"></i></a>
                                            <a href="/admin/teacher/edit?id=${teacher.id}" type="button"
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

<script src="//rawgithub.com/stidges/jquery-searchable/master/dist/jquery.searchable-1.0.0.min.js"></script>
<script src="/js/search.js"></script>
</body>
</html>

