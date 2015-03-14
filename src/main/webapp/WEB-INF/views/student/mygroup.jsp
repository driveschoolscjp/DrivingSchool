<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="joda" uri="http://www.joda.org/joda/time/tags" %>

<html>
<head>
    <title>Моя группа и инструктор</title>
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
<jsp:include page="../header.jsp"/>
<jsp:include page="../menu.jsp"/>

<div class="body">

    <br/>

    <div class="container-fluid col-xs-10 blackback">

        <div class="col-xs-12 col-md-6">

            <h1>Преподаватель теории</h1>
            <hr/>
            <div class="col-xs-4">
                <img class="img-responsive img-rounded" src="${me.group.teacher.photoURL}"
                     alt="${me.group.teacher.firstname} ${me.group.teacher.lastname}"/>
            </div>

            <div class="col-xs-8">
                <h3 class="zerotopmargin">${me.group.teacher.firstname} ${me.group.teacher.lastname}</h3>
                <br/>
                <h4><i class="fa fa-flag-o"></i> <joda:format value="${me.group.startDate}" style="M-"/></h4>
                <h4><i class="fa fa-flag-checkered"></i> <joda:format value="${me.group.finishDate}" style="M-"/></h4>
                <h4><i class="fa fa-clock-o"></i> ${me.group.description}</h4>
            </div>

            <div class="clearfix"></div>

            <h1>Моя группа ${me.group.name}</h1>
            <hr/>
            <div class="col-xs-12 table-responsive">
                <table class="table">
                    <thead>
                    <tr>
                        <th>Студент</th>
                        <th>Телефон</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="student" items="${students}">
                        <tr>
                            <td>${student.lastname} ${student.firstname}</td>
                            <td>${student.tel}</td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>

        </div>

        <div class="col-xs-12 col-md-6">

            <h1>Инструктор</h1>
            <hr/>
            <div class="col-xs-4">
                <img class="img-responsive img-rounded" src="${me.instructor.photoURL}"
                     alt="${me.instructor.firstname} ${me.instructor.lastname}"/>
            </div>

            <div class="col-xs-8">
                <h3 class="zerotopmargin">${me.instructor.firstname} ${me.instructor.lastname}</h3>
                <br/>
                <h4><i class="fa fa-car"></i> ${me.instructor.car.brand} ${me.instructor.car.model}</h4>
                <h4><i class="fa fa-tachometer"></i> ${me.instructor.car.horsePower} л.с. </h4>
                <h4><i class="fa fa-cog"></i> ${me.instructor.car.transmission.value} КПП</h4>

            </div>

            <div class="clearfix"></div>

            <h1>${me.instructor.car.brand} ${me.instructor.car.model}</h1>
            <hr/>
            <div class="col-xs-12">
                <img class="img-responsive img-rounded" src="${me.instructor.car.photoURL}"
                     alt="${me.instructor.car.brand} ${me.instructor.car.model}"/>
                <br/>
            </div>
        </div>

    </div>
</div>

<jsp:include page="../footer.jsp"/>
</body>
</html>