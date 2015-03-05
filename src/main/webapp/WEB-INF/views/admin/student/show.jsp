<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

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
    <script src="../../assets/js/ie10-viewport-bug-workaround.js"/>

    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"/>
    <script src="/js/bootstrap.js"/>

</head>

<body>
<jsp:include page="../../header.jsp"/>
<jsp:include page="../menuAdmin.jsp"/>

<div class="body">
    <div class="container-fluid">
        <div class="row">
            <div class="col-xs-11 col-sm-11 col-md-11 col-lg-11">

                <div class="container-fluid whiteback">
                    <form:form action="/admin/student/search" method="get" modelAttribute="student">

                        <h3>Просмотр студента</h3>
                        <hr>

                        <fieldset>
                            <div class="form-group col-md-4">
                                <label for="lastname">Lastname:</label>
                                <form:input path="lastname" class="form-control" disabled="true"/>
                            </div>

                            <div class="form-group col-md-4">
                                <label for="firstname">Name:</label>
                                <form:input path="firstname" class="form-control" disabled="true"/>
                            </div>

                            <div class="form-group col-md-4">
                                <label for="patronymic">Patronymic:</label>
                                <form:input path="patronymic" class="form-control" disabled="true"/>
                            </div>
                        </fieldset>
                        <hr>

                        <fieldset>
                            <div class="form-group col-md-6">
                                <label for="passport">Passport:</label>
                                <form:input path="passport" class="form-control" disabled="true"/>
                            </div>

                            <div class="form-group col-md-6">
                                <label for="inn">INN:</label>
                                <form:input path="inn" class="form-control" disabled="true"/>
                            </div>
                        </fieldset>
                        <hr>

                        <fieldset>
                            <div class="form-group col-md-6">
                                <label for="birthday">Birthday: </label>
                                <form:input path="birthday" type="date" class="form-control" disabled="true"/>
                            </div>

                            <div class="col-md-6">
                                <label for="gender">Gender</label><br>
                                <form:input path="gender" class="form-control" disabled="true"/>
                            </div>

                        </fieldset>
                        <hr>

                        <fieldset>
                            <div class="form-group col-md-4">
                                <label for="tel">Telephone:</label>
                                <form:input path="tel" type="tel" class="form-control" disabled="true"/>
                            </div>

                            <div class="form-group col-md-4">
                                <label for="email">Email address:</label>
                                <form:input path="email" type="email" class="form-control" disabled="true"/>

                            </div>

                            <div class="form-group col-md-4">
                                <label for="photoURI">Photo URI:</label>
                                <form:input path="photoURI" class="form-control" type="url" disabled="true"/>
                            </div>
                        </fieldset>
                        <hr>

                        <fieldset>
                            <div class="form-group col-md-4">
                                <label>Группа:</label><br/>
                                <form:input path="group.name" class="form-control" disabled="true"/>
                            </div>

                            <div class="form-group col-md-4">
                                <label>Инструктор:</label><br/>
                                <form:input path="instructor.firstname" class="form-control" disabled="true"/>
                            </div>

                            <div class="form-group col-md-4">
                                <label for="rideNumber">Количество занятий вождением:</label>
                                <form:input path="rideNumber" class="form-control" disabled="true"/>
                            </div>
                        </fieldset>
                        <hr>

                        <fieldset>
                            <div class="form-group col-md-6">
                                <label for="login">Login:</label>
                                <form:input path="login" class="form-control" disabled="true"/>
                            </div>

                            <div class="form-group col-md-6">
                                <label for="password">Password:</label>
                                <form:input path="password" class="form-control" disabled="true"/>
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
</div>

<jsp:include page="../../footer.jsp"/>
</body>
</html>