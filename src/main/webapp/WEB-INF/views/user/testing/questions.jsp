<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<html>
<head>
    <title>Exams</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap -->
    <link href="/css/bootstrap.css" rel="stylesheet">
    <link href="/css/default.css" rel="stylesheet">
    <link href="/css/font-awesome.css" rel="stylesheet">
    <link href="/css/search.css" rel="stylesheet">

    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="../../assets/js/ie10-viewport-bug-workaround.js"></script>

    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="/js/bootstrap.js"></script>

</head>
<body>

<jsp:include page="/WEB-INF/views/header.jsp"/>
<jsp:include page="/WEB-INF/views/menu.jsp"/>


<div class="body">
    <br/>
    <div class="container-fluid">

        <div class="col-xs-10 col-xs-offset-1 alltikets whiteback">

            <h3 class="text-center">Экзамены</h3>
            <hr>

            <%--таблица с билетами--%>
            <div class="col-xs-12 table-responsive">
                <table class="table" id="table">
                    <thead>
                    <tr>
                        <th><Билет ${ticket.number}</th>
                    </tr>
                    </thead>
                    <tbody>
                    <form action="/testing/start" method="post" modelAttribute="typeMode">
                        <tr>
                            <c:forEach var="exam" items="${exams}">
                                <div class="row">
                                    <td>
                                        <div class="col-xs-12">
                                            <a href="/testing/search?idExam=${exam.id}" type="button"
                                               class="btn btn-primary btn-success">
                                                    ${exam.name}
                                            </a>
                                        </div>
                                    </td>
                                </div>
                            </c:forEach>
                        </tr>
                    </form>
                    <label>Билеты</label>
                    <tr>
                        <td>
                                <div class="col-xs-12">
                                    <table class="table">
                                        <tr>
                                            <c:forEach items="${tickets}" var="ticket">
                                            <div class="row">
                                            <div class="form-group col-xs-1">

                                                <a href="/testing/question?idTicket=${ticket.id}" type="button"
                                                   class="btn btn-primary btn-sm">
                                                    <i class="fa fa-pencil fa-xs">${ticket.number}</i>
                                                </a>
                                            </div>
                                                <c:if test="${ticket.number%10==0}">
                                                </div>
                                        </tr>
                                        <tr>
                                            <div class="row">
                                                </c:if>
                                            </div>
                                            </c:forEach>
                                        </tr>
                                    </table>
                                </div>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

 </div>
    <jsp:include page="../../footer.jsp"/>

    <script src="//rawgithub.com/stidges/jquery-searchable/master/dist/jquery.searchable-1.0.0.min.js"></script>

</body>
</html>

