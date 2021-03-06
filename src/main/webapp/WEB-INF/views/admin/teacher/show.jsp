<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<html>
<head>
    <title>Просмотр преподавателя</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="shortcut icon" href="http://s3.gazu.ru/favicon.ico" type="image/x-icon">

    <!-- Bootstrap -->
    <link href="/css/bootstrap.css" rel="stylesheet">
    <link href="/css/default.css" rel="stylesheet">
    <link href="/css/font-awesome.css" rel="stylesheet">
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
            <div class="col-xs-11">

                <div class="container-fluid whiteback">
                    <form:form action="/admin/teacher/search" method="get" modelAttribute="teacher">

                        <h3>Просмотр преподавателя</h3>
                        <hr>

                        <fieldset>
                            <div class="form-group col-xs-4">
                                <label for="lastname">Фамилия</label>
                                <form:input path="lastname" class="form-control" disabled="true"/>
                            </div>

                            <div class="form-group col-xs-4">
                                <label for="firstname">Имя</label>
                                <form:input path="firstname" class="form-control" disabled="true"/>
                            </div>

                            <div class="form-group col-xs-4">
                                <label for="patronymic">Отчество</label>
                                <form:input path="patronymic" class="form-control" disabled="true"/>
                            </div>
                        </fieldset>
                        <hr>

                        <fieldset>
                            <div class="form-group col-xs-6">
                                <label for="passport">Пасспорт</label>
                                <form:input path="passport" class="form-control" disabled="true"/>
                            </div>

                            <div class="form-group col-xs-6">
                                <label for="inn">ИНН</label>
                                <form:input path="inn" class="form-control" disabled="true"/>
                            </div>
                        </fieldset>
                        <hr>

                        <fieldset>
                            <div class="form-group col-xs-6">
                                <label for="birthday">День рождения</label>
                                <form:input path="birthday" type="date" class="form-control" disabled="true"/>
                            </div>

                            <div class="col-xs-6">
                                <label for="gender">Пол</label><br>
                                <form:input path="gender" class="form-control" disabled="true"/>
                            </div>

                        </fieldset>
                        <hr>

                        <fieldset>
                            <div class="form-group col-xs-6">
                                <label for="tel">Телефон</label>
                                <form:input path="tel" type="tel" class="form-control" disabled="true"/>
                            </div>

                            <div class="form-group col-xs-6">
                                <label for="email">Email</label>
                                <form:input path="email" type="email" class="form-control" disabled="true"/>

                            </div>


                        </fieldset>
                        <hr>

                        <fieldset>
                            <div class="col-xs-4">
                                <img src="${teacher.photoURL}" class="img-responsive img-thumbnail"
                                     alt="${teacher.firstname} ${teacher.lastname}">
                            </div>

                            <div class="form-group col-xs-8">
                                <label for="description">Описание</label>
                                <form:textarea path="description" class="form-control" rows="5"
                                               disabled="true"/>
                            </div>
                        </fieldset>
                        <hr>

                        <div class="text-center">
                            <button class="btn  btn-primary" type="submit">Назад</button>
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
