<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<html>
<head>
    <title>Редактирование автомобиля</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap -->
    <link href="/css/bootstrap.css" rel="stylesheet">
    <link href="/css/default.css" rel="stylesheet">
    <link href="/css/font-awesome.css" rel="stylesheet">
    <script src="../../assets/js/ie10-viewport-bug-workaround.js"></script>

    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="/js/bootstrap.js"></script>

</head>

<body>
<jsp:include page="../../header.jsp"/>
<jsp:include page="../../menu.jsp"/>

<div class="body">
    <div class="container-fluid">
        <div class="row">
            <div class="col-xs-11 container-fluid whiteback">

                <form:form action="/admin/car/save" method="post" modelAttribute="car">
                    <form:hidden path="id"/>

                    <h3>Редактирование автомобиля</h3>
                    <hr>
                    <%--строка с полями--%>
                    <fieldset>
                        <div class="form-group col-xs-4">
                            <label for="brand">Марка</label>
                            <form:input path="brand" class="form-control" placeholder="Honda"
                                        required="required" cssErrorClass="error form-control"/>
                        </div>

                        <div class="form-group col-xs-4">
                            <label for="model">Модель</label>
                            <form:input path="model" class="form-control" placeholder="H2000"
                                        required="required" cssErrorClass="error form-control"/>
                        </div>

                        <div class="form-group col-xs-4">
                            <label>Инструктор</label><br/>
                            <form:select path="instructor.id" class="selectpicker form-control" required="required">
                                <c:forEach items="${instructors}" var="instructor">
                                    <option value="${instructor.id}" ${car.instructor.id==instructor.id?"selected":""}>${instructor.firstname} ${instructor.lastname}</option>
                                </c:forEach>
                            </form:select>
                        </div>

                    </fieldset>
                    <hr>

                    <fieldset>

                        <div class="form-group col-xs-3">
                            <label for="transmission">Коробка передач</label><br>

                            <div class="col-xs-6">
                                <form:radiobutton path="transmission" value="AUTO"/> <b>Авто</b>
                            </div>

                            <div class="col-xs-6">
                                <form:radiobutton path="transmission" value="MANUAL"/> <b>Ручная</b>
                            </div>
                        </div>

                        <div class="form-group col-xs-3">
                            <label for="horsePower">Мощность (л.с.)</label>
                            <form:input path="horsePower" class="form-control"
                                        type="number" min="0" max="1500"
                                        step="1" required="required" cssErrorClass="error form-control"/>
                        </div>

                        <div class="form-group col-xs-3">
                            <label for="pricePerHour">Стоимость обучения ($/час)</label>
                            <form:input path="pricePerHour" class="form-control" type="number" min="10"
                                        max="1000" step="1" required="required" cssErrorClass="error form-control"/>
                        </div>

                        <div class="form-group col-xs-3">
                            <label for="photoURL">URL фото</label>
                            <form:input path="photoURL" class="form-control" type="url"
                                        placeholder="http//photo.com/car5.png" required="required"
                                        cssErrorClass="error form-control"/>
                        </div>

                    </fieldset>
                    <hr>
                    <div class="text-center">
                        <button class="btn  btn-primary" type="submit">Сохранить автомобиль</button>
                    </div>
                </form:form>

            </div>
        </div>
    </div>
</div>
<jsp:include page="../../footer.jsp"/>
</body>
</html>
