<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="joda" uri="http://www.joda.org/joda/time/tags" %>

<html>
<head>
    <title>Наши машины и инструктора</title>
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
<jsp:include page="header.jsp"/>
<jsp:include page="menu.jsp"/>

<div class="body">
    <div class="container-fluid col-xs-10 allcars">

        <div><h1>Теоретические группы</h1></div>

        <c:forEach var="group" items="${groups}">
            <hr/>

            <div class="row">
                <br/>

                <div class="col-xs-5 col-md-3">
                    <img class="img-responsive img-rounded" src="${group.teacher.photoURL}"
                         alt="${group.teacher.firstname} ${group.teacher.lastname}"/>
                    <br/>
                </div>

                <div class="col-xs-7 col-md-5">
                    <h1>${group.teacher.firstname} ${group.teacher.lastname}</h1>

                    <p><b>${group.teacher.description}</b></p>
                </div>

                <div class="col-xs-12 col-md-4">
                    <h1>${group.name}</h1>

                    <h3>Дата начала</h3>
                    <h4><i class="fa fa-calendar"></i> <joda:format value="${group.startDate}" style="L-"/></h4>

                    <h3>Дата окончания</h3>
                    <h4><i class="fa fa-calendar"></i> <joda:format value="${group.finishDate}" style="L-"/> </h4>

                    <h3>Расписание занятий</h3>
                    <h4><i class="fa fa-book"></i> ${group.description}</h4>
                </div>
            </div>
        </c:forEach>

    </div>
</div>
<div class="container-fluid col-xs-12">
    <jsp:include page="footer.jsp"/>
</div>
</body>
</html>