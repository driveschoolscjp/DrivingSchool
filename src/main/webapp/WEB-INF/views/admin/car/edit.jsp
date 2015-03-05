<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

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
            <div class="col-xs-11">

                <div class="container-fluid whiteback">
                        <form:form action="/admin/car/save" method="post" modelAttribute="car">
                            <form:hidden path="id"/>

                            <h3>Добавление автомобиля</h3>
                            <hr>
                            <%--строка с полями--%>
                            <fieldset>
                                <div class="form-group col-xs-4">
                                    <label for="brand">Brand:</label>
                                    <form:input path="brand" class="form-control" placeholder="Honda"
                                                required="required"/>
                                </div>

                                <div class="form-group col-xs-4">
                                    <label for="model">Model:</label>
                                    <form:input path="model" class="form-control" placeholder="H2000"
                                                required="required"/>
                                </div>

                                <div class="form-group col-xs-4">
                                    <label>Инструктор:</label><br/>
                                    <form:select path="instructor.id" class="selectpicker form-control">
                                        <c:forEach items="${instructors}" var="instructor">
                                            <option value="${instructor.id}" ${car.instructor.id==instructor.id?"selected":""}>${instructor.firstname} ${instructor.lastname}</option>
                                        </c:forEach>
                                    </form:select>
                                </div>

                            </fieldset>
                            <hr>

                            <fieldset>

                                <div class="form-group col-xs-3">
                                    <label for="transmission">Transmission</label><br>

                                    <div class="col-xs-6">
                                        <form:radiobutton path="transmission" value="AUTO"/> <b>Auto</b>
                                    </div>

                                    <div class="col-xs-6">
                                        <form:radiobutton path="transmission" value="MANUAL"/> <b>Manual</b>
                                    </div>
                                </div>

                                <div class="form-group col-xs-3">
                                    <label for="engineSize">Engine size:</label>
                                    <form:input path="engineSize" class="form-control" placeholder="1.8"
                                                type="number" min="1" max="15"
                                                step="0.1" required="required"/>
                                </div>

                                <div class="form-group col-xs-3">
                                    <label for="pricePerHour">Rrice / Hour: UAH</label>
                                    <form:input path="pricePerHour" class="form-control" type="number" min="10"
                                                max="10000" step="1" required="required"/>
                                </div>

                                <div class="form-group col-xs-3">
                                    <label for="photoURI">Photo URI:</label>
                                    <form:input path="photoURI" class="form-control" type="url"
                                                placeholder="http//photo.com/car5.png" required="required"/>
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
</div>
<jsp:include page="../../footer.jsp"/>
</body>
</html>
