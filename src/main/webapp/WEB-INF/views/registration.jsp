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

    <!-- Bootstrap -->
    <link href="/css/bootstrap.css" rel="stylesheet">
    <link href="/css/default.css" rel="stylesheet">
    <link href="/css/registration.css" rel="stylesheet">
    <link href="/css/font-awesome.css" rel="stylesheet">
    <script src="../../assets/js/ie10-viewport-bug-workaround.js"></script>


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
        <div class="col-xs-5 col-xs-offset-1">
            <form:form action="/registration/save" method="post" modelAttribute="registration" id = "myForm">
            <form:hidden path="id"/>

                <h1 class = "myHead">Запись в автошколу</h1>
                <hr/>
                <br/>

                <form:input path="firstname" class="name" placeholder="Jack"
                            required="required"/>

                <div>
                    <p class="name-help">Не менее двух букв.</p>
                </div>
                <br/>

                    <form:input path="lastname" class="lastname" placeholder="Black"
                            required="required"/>

                <div>
                    <p class="lastname-help">Не менее двух букв.</p>
                </div>
                <br/>

                <form:input path="patronymic" class="patronymic" placeholder="Robertovich"
                            required="required"/>

                <div>
                    <p class="patronymic-help">Не менее двух букв.</p>
                </div>
                <br/>

                <form:input path="email" type="email" class="email"
                            placeholder="nickname@mail.com" required="required"/>
                <div>
                    <p class="email-help">На элекронную почту будет выслано уведомление о регистрации.</p>
                </div>
                <br/>

                <form:input path="tel" type="tel" class="tel" placeholder="987-654-32-10"
                            required="required"/>
                <div>
                    <p class="tel-help">Мы свяжемся с вами в течении суток.</p>
                </div>
                <br/>


                <form:select path="car.id" class="selectpicker mySelect" required="required">
                    <c:forEach items="${cars}" var="car">
                        <option value="${car.id}" ${registration.car.id==car.id?"selected":""}>
                            ${car.brand} ${car.model}</option>
                    </c:forEach>
                </form:select>
                <br/>
                <hr/>
<div class="col-xs-8 col-xs-offset-1">

                <input type="submit" class="btn btn-primary btn-sm" value="Подать заявку">

</div>
            </form:form>
        </div>
    </div>
</div>
</div>

<div class="container-fluid col-xs-12">
    <br/>
    <br/>
    <jsp:include page="footer.jsp"/>
</div>


<script src="/js/registration.js"></script>

</body>
</html>