<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<html>
<head>
    <title>Запись в автошколу</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="shortcut icon" href="http://s3.gazu.ru/favicon.ico" type="image/x-icon">

    <!-- Bootstrap -->
    <link href="/css/bootstrap.css" rel="stylesheet">
    <link href="/css/default.css" rel="stylesheet">
    <link href="/css/registration.css" rel="stylesheet">
    <link href="/css/font-awesome.css" rel="stylesheet">

    <script src="/js/ie10-viewport-bug-workaround.js"></script>
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="/js/bootstrap.js"></script>

</head>

<body>
<jsp:include page="header.jsp"/>
<jsp:include page="menu.jsp"/>

<div class="body">

    <div class="container-fluid">
        <div class="row">
            <div class="col-xs-5 col-xs-offset-3 blackback">
                <form:form action="/registration/save" method="post" modelAttribute="registration" id="myForm">
                    <form:hidden path="id"/>

                    <h1 class="myHead">Запись в автошколу</h1>
                    <hr/>

                    <form:input path="lastname" class="lastname form-control" placeholder="Бурмистров"
                                required="required" pattern="[А-Яа-я-]{2,50}" cssErrorClass="error form-control"/>

                    <div>
                        <p class="lastname-help">Кириллица, не менее двух букв</p>
                    </div>
                    <br/>

                    <form:input path="firstname" class="name form-control" placeholder="Андрей"
                                required="required" pattern="[А-Яа-я-]{2,50}" cssErrorClass="error form-control"/>
                    <div>
                        <p class="name-help">Кириллица, не менее двух букв</p>
                    </div>
                    <br/>

                    <form:input path="patronymic" class="patronymic form-control" placeholder="Сергеевич"
                                required="required" pattern="[А-Яа-я-]{2,50}" cssErrorClass="error form-control"/>

                    <div>
                        <p class="patronymic-help">Кириллица, не менее двух букв</p>
                    </div>
                    <br/>

                    <form:input path="email" type="email" class="email form-control"
                                placeholder="nickname@mail.com" required="required" cssErrorClass="error form-control"/>
                    <div>
                        <p class="email-help">Почта будет использована для уведомления о предстоящих событиях</p>
                    </div>
                    <br/>

                    <form:input path="tel" type="tel" class="tel form-control" placeholder="987-654-32-10"
                                required="required" cssErrorClass="error form-control"/>
                    <div>
                        <p class="tel-help">Мы свяжемся с вами в течение суток</p>
                    </div>
                    <br/>

                    <form:select path="car.id" class="selectpicker mySelect form-control" required="required">
                        <c:forEach items="${cars}" var="car">
                            <option value="${car.id}" ${registration.car.id==car.id?"selected":""}>
                                    ${car.brand} ${car.model}</option>
                        </c:forEach>
                    </form:select>
                    <hr/>

                    <div class="text-center">
                        <input type="submit" class="btn btn-primary" value="Подать заявку">
                    </div>
                    <br/>
                </form:form>
            </div>
        </div>
    </div>
</div>
    <jsp:include page="footer.jsp"/>
<script src="/js/registration.js"></script>

</body>
</html>