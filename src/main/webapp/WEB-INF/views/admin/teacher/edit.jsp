<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

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
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
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
            <div class="col-xs-11">

                <div class="container-fluid whiteback">
                    <form:form action="/admin/teacher/save" method="post" modelAttribute="teacher">
                        <form:hidden path="id"/>

                        <h3>Добавление преподавателя</h3>
                        <hr>
                        <%--строка с полями--%>
                        <fieldset>
                            <div class="form-group col-xs-4">
                                <label for="lastname">Lastname:</label>
                                <form:input path="lastname" class="form-control" placeholder="Black"
                                            required="required" cssErrorClass="error form-control"/>
                            </div>

                            <div class="form-group col-xs-4">
                                <label for="firstname">Name:</label>
                                <form:input path="firstname" class="form-control" placeholder="Jack"
                                            required="required" cssErrorClass="error form-control"/>
                            </div>

                            <div class="form-group col-xs-4">
                                <label for="patronymic">Patronymic:</label>
                                <form:input path="patronymic" class="form-control" placeholder="Robertovich"
                                            required="required" cssErrorClass="error form-control"/>
                            </div>
                        </fieldset>
                        <hr>

                        <fieldset>
                            <div class="form-group col-xs-6">
                                <label for="passport">Passport:</label>
                                <form:input path="passport" class="form-control" placeholder="AA571175"
                                            pattern="[А-Я]{2}[0-9]{6}" required="required"
                                            cssErrorClass="error form-control"/>
                            </div>

                            <div class="form-group col-xs-6">
                                <label for="inn">INN:</label>
                                <form:input path="inn" class="form-control" placeholder="12345678"
                                            pattern="[0-9]{8}" required="required" cssErrorClass="error form-control"/>
                            </div>
                        </fieldset>
                        <hr>

                        <fieldset>
                            <div class="form-group col-xs-6">
                                <label for="birthday">Birthday: </label>
                                <form:input path="birthday" type="date" class="form-control" required="required"
                                            cssErrorClass="error form-control"/>
                            </div>

                            <div class="col-xs-6">
                                <label for="gender">Gender</label><br>
                                    <%--<form:radiobuttons path="gender" class="radio-inline"/>--%>
                                <div class="col-xs-6">
                                    <form:radiobutton path="gender" value="MALE"/> <b>Мужской</b>
                                </div>

                                <div class="col-xs-6">
                                    <form:radiobutton path="gender" value="FEMALE"/> <b>Женский</b>
                                </div>
                            </div>

                        </fieldset>
                        <hr>


                        <fieldset>
                            <div class="form-group col-xs-4">
                                <label for="tel">Telephone:</label>
                                <form:input path="tel" type="tel" class="form-control" placeholder="987-654-32-10"
                                            required="required" cssErrorClass="error form-control"/>
                            </div>

                            <div class="form-group col-xs-4">
                                <label for="email">Email address:</label>
                                <form:input path="email" type="email" class="form-control"
                                            placeholder="nickname@mail.com" required="required"
                                            cssErrorClass="error form-control"/>

                            </div>

                            <div class="form-group col-xs-4">
                                <label for="photoURL">Photo URI:</label>
                                <form:input path="photoURL" class="form-control" type="url"
                                            placeholder="http//photo.com/teacher5.png" required="required"
                                            cssErrorClass="error form-control"/>
                            </div>
                        </fieldset>
                        <hr>

                        <fieldset>
                            <div class="form-group">
                                <label for="description">Description:</label>
                                <form:textarea path="description" class="form-control" rows="3"
                                               placeholder="Description"
                                               required="required" cssErrorClass="error form-control"/>
                            </div>
                        </fieldset>
                        <hr>

                        <div class="text-center">
                            <button class="btn  btn-primary" type="submit">Сохранить преподавателя</button>
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
