<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Car</title>
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

                <h3 class="text-center">Поиск автомобилей</h3>
                <hr>
                <%--три верхние кнопки--%>
                <div class="row">
                    <div class="col-xs-4">
                        <a href="/admin/car/add" type="button" class="btn btn-primary btn-success">Добавить
                            автомобиль</a>
                    </div>

                    <div class="col-xs-4 col-xs-offset-4">
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
                                <th>Марка</th>
                                <th>Модель</th>
                                <th>Мощность (л.с.)</th>
                                <th>Цена/час (UAH)</th>
                                <th>КПП</th>
                                <th>Инструктор</th>
                                <th></th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="car" items="${cars}">
                                <tr>
                                    <td>${car.brand}</td>
                                    <td>${car.model}</td>
                                    <td>${car.horsePower}</td>
                                    <td>${car.pricePerHour}</td>
                                    <td>${car.transmission}</td>
                                    <td>${car.instructor.firstname} ${car.instructor.lastname}</td>
                                    <td>
                                        <div class="btn-group pull-right">
                                            <a href="/admin/car/show?id=${car.id}" type="button"
                                               class="btn btn-success"><i class="fa fa-search"></i></a>
                                            <a href="/admin/car/edit?id=${car.id}" type="button"
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

