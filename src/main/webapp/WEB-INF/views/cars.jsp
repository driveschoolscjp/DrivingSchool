<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

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

        <div><h1>Наши машины и инструктора</h1></div>

        <c:forEach var="car" items="${cars}">
            <hr/>

            <div class="row">
                <br/>

                <div class="col-xs-5 col-md-2">
                    <img class="img-responsive img-rounded" src="${car.instructor.photoURL}"
                         alt="${car.instructor.firstname} ${car.instructor.lastname}"/>
                    <br/>
                </div>

                <div class="col-xs-7 col-md-4">
                    <h1>${car.instructor.firstname} ${car.instructor.lastname}</h1>

                    <p><b>${car.instructor.description}</b></p>
                </div>

                <div class="col-xs-12 col-md-6">
                    <div class="thumbnailhover">
                        <div class="caption">
                            <form:form action="/registration?id=${car.id}" method="post">
                                <input type="hidden" value="${car.id}"/>
                                <h1>Хочу катать на ${car.brand} ${car.model}!</h1>

                                <button class="btn btn-primary" type="submit"><i
                                        class="fa fa-user-plus fa-xs"></i><b> Подать заявку на обучение</b></button>
                            </form:form>
                        </div>
                        <img class="img-responsive img-rounded" src="${car.photoURL}" alt="${car.brand} ${car.model}"/>
                    </div>

                    <table>
                        <tr>
                            <th colspan="6">${car.brand} ${car.model}<th>
                        </tr>
                        <tr>
                            <th><i class="fa fa-tachometer fa-2x"></i></th><th>${car.horsePower} л.с.</th>
                            <th><i class="fa fa-cog fa-2x"></i></th><th>${car.transmission} КПП</th>
                            <th><i class="fa fa-money fa-2x"></i></th><th>${car.pricePerHour} $/час</th>
                        </tr>
                    </table>
                </div>

            </div>
        </c:forEach>

    </div>
</div>
<div class="container-fluid col-xs-12">
<jsp:include page="footer.jsp"/>
</div>


<script src="/js/cars.js"></script>
</body>
</html>