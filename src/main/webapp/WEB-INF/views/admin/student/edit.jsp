<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<html>
<head>
    <title>Редактирование студента</title>
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
                    <form:form action="/admin/student/save" method="post" modelAttribute="student">
                        <form:hidden path="id"/>

                        <h3>Редактирование студента</h3>
                        <hr>

                        <fieldset>
                            <div class="form-group col-xs-4">
                                <label for="lastname">Фамилия</label>
                                <form:input path="lastname" class="form-control" placeholder="Иванов"
                                            required="required" pattern="[А-Яа-я]{2,50}" cssErrorClass="error form-control"/>
                            </div>

                            <div class="form-group col-xs-4">
                                <label for="firstname">Имя</label>
                                <form:input path="firstname" class="form-control" placeholder="Алексей"
                                            required="required" pattern="[А-Яа-я]{2,50}" cssErrorClass="error form-control"/>
                            </div>

                            <div class="form-group col-xs-4">
                                <label for="patronymic">Отчество</label>
                                <form:input path="patronymic" class="form-control" placeholder="Геннадьевич"
                                            required="required" pattern="[А-Яа-я]{2,50}" cssErrorClass="error form-control"/>
                            </div>
                        </fieldset>
                        <hr>

                        <fieldset>
                            <div class="form-group col-xs-6">
                                <label for="passport">Пасспорт</label>
                                <form:input path="passport" class="form-control" placeholder="АН571175"
                                            pattern="[А-Я]{2}[0-9]{6}" required="required"
                                            cssErrorClass="error form-control"/>
                            </div>

                            <div class="form-group col-xs-6">
                                <label for="inn">ИНН</label>
                                <form:input path="inn" class="form-control" placeholder="12345678"
                                            pattern="[0-9]{8}" required="required" cssErrorClass="error form-control"/>
                            </div>
                        </fieldset>
                        <hr>

                        <fieldset>
                            <div class="form-group col-xs-6">
                                <label for="birthday">День рождения</label>
                                <form:input path="birthday" type="date" class="form-control" required="required"
                                            cssErrorClass="error form-control"/>
                            </div>

                            <div class="col-xs-6">
                                <label for="gender">Пол</label><br>

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
                            <div class="form-group col-xs-6">
                                <label for="tel">Телефон</label>
                                <form:input path="tel" type="tel" class="form-control" placeholder="987-654-32-10"
                                            required="required" cssErrorClass="error form-control"/>
                            </div>

                            <div class="form-group col-xs-6">
                                <label for="email">Email</label>
                                <form:input path="email" type="email" class="form-control"
                                            placeholder="nickname@mail.com" required="required"
                                            cssErrorClass="error form-control"/>

                            </div>
                        </fieldset>
                        <hr>

                        <fieldset>
                            <div class="form-group col-xs-4">
                                <label>Группа</label><br/>
                                <form:select path="group.id" class="selectpicker form-control" required="required">
                                    <c:forEach items="${groups}" var="group">
                                        <option value="${group.id}" ${student.group.id==group.id?"selected":""}>${group.name}</option>
                                    </c:forEach>
                                </form:select>
                            </div>

                            <div class="form-group col-xs-4">
                                <label>Инструктор</label><br/>
                                <form:select path="instructor.id" class="selectpicker form-control" required="required">
                                    <c:forEach items="${instructors}" var="instructor">
                                        <option value="${instructor.id}" ${student.instructor.id==instructor.id?"selected":""}>
                                                ${instructor.firstname} ${instructor.lastname}
                                            - ${instructor.car.brand} ${instructor.car.model}</option>
                                    </c:forEach>
                                </form:select>
                            </div>

                            <div class="form-group col-xs-4">
                                <label for="rideNumber">Количество занятий вождением</label>
                                <form:input path="rideNumber" class="form-control" type="number" min="10" max="20"
                                            step="5" placeholder="10" required="required"
                                            cssErrorClass="error form-control"/>
                            </div>
                        </fieldset>
                        <hr>

                        <fieldset>
                            <div class="form-group col-xs-6">
                                <label for="login">Логин</label>
                                <form:input path="login" class="form-control" placeholder="login"
                                            required="required" cssErrorClass="error form-control"/>
                            </div>

                            <div class="form-group col-xs-6">
                                <label for="password">Пароль</label>
                                <form:input path="password" class="form-control" placeholder="password"
                                            required="required" cssErrorClass="error form-control"/>
                            </div>
                        </fieldset>
                        <hr/>
                        <div class="text-center">
                            <button class="btn  btn-primary" type="submit">Сохранить студента</button>
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
