<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<html>
<head>
    <title>Просмотр автомобиля</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="shortcut icon" href="http://s3.gazu.ru/favicon.ico" type="image/x-icon">

    <!-- Bootstrap -->
    <link href="/css/bootstrap.css" rel="stylesheet">
    <link href="/css/default.css" rel="stylesheet">
    <link href="/css/font-awesome.css" rel="stylesheet">
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
            <div class="container-fluid whiteback col-xs-11">
                <form:form action="/admin/car/search" method="get" modelAttribute="car">

                    <h3>Просмотр автомобиля</h3>
                    <hr>
                    <%--строка с полями--%>
                    <fieldset>
                        <div class="form-group col-xs-4">
                            <label for="brand">Марка</label>
                            <form:input path="brand" class="form-control" disabled="true"/>
                        </div>

                        <div class="form-group col-xs-4">
                            <label for="model">Модель</label>
                            <form:input path="model" class="form-control" disabled="true"/>
                        </div>

                        <div class="form-group col-xs-4">
                            <label>Инструктор</label><br/>
                            <form:input path="instructor.firstname" class="form-control" disabled="true"/>
                        </div>

                    </fieldset>
                    <hr>

                    <fieldset>
                        <div class="col-xs-8">
                            <img src="${car.photoURL}" class="img-responsive img-thumbnail"
                                 alt="${car.brand} ${car.model}">
                        </div>

                        <div class="col-xs-4">
                            <div class="form-group">
                                <label for="transmission">Коробка передач</label>
                                <input id="transmission" class="form-control" value="${car.transmission.value}"
                                       disabled="true"/>
                            </div>

                            <div class="form-group">
                                <label for="horsePower">Мощность (л.с.)</label>
                                <form:input path="horsePower" class="form-control" disabled="true"/>
                            </div>

                            <div class="form-group">
                                <label for="pricePerHour">Стоимость обучения ($/час)</label>
                                <form:input path="pricePerHour" class="form-control" disabled="true"/>
                            </div>
                        </div>
                    </fieldset>
                    <hr/>

                    <div class="text-center">
                        <button class="btn  btn-primary" type="submit">Назад</button>
                    </div>
                </form:form>
            </div>


        </div>
    </div>
</div>

<jsp:include page="../../footer.jsp"/>
</body>
</html>
