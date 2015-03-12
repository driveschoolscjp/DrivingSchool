<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Tickets</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap -->
    <link href="/css/bootstrap.css" rel="stylesheet">
    <link href="/css/default.css" rel="stylesheet">
    <link href="/css/font-awesome.css" rel="stylesheet">
    <link href="/css/search.css" rel="stylesheet">

    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="../../../assets/js/ie10-viewport-bug-workaround.js"></script>

    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="/js/bootstrap.js"></script>

</head>
<body>

<jsp:include page="../../../header.jsp"/>
<jsp:include page="../../../menu.jsp"/>


<div class="body">

    <div class="container-fluid">

        <div class="row">
            <a href="/admin/testing/exam/search" type="button" class="btn btn-primary btn-success">
                Все экзамены
            </a>
            <div class="col-xs-11 whiteback">


                <h3 class="text-center">Экзамен ${exam.name}</h3>
                <h3 class="text-center">Редактор билетов</h3>
                <hr>
                <%--новый билет--%>
                <c:if test="${moreTickets}">
                <div class="row">
                    <div class="col-xs-4">
                        <a href="/admin/testing/ticket/add?id=${exam.id}" type="button" class="btn btn-primary btn-success">Добавить
                            билет</a>
                    </div>
                </div>
                </c:if>
                <hr>
                <%--таблица с билетами--%>
                <div class="row">
                    <div class="col-xs-12 table-responsive">
                        <table class="table" id="table">
                            <thead>
                            <tr>
                                <th>Билеты</th>
                            </tr>
                            </thead>
                            <tbody>
                                <tr>
                                <c:forEach var="ticket" items="${tickets}">
                                    <td>
                                        <div class="col-xs-12">
                                        <a href="/admin/testing/question/search?id=${ticket.id}" type="button" class="btn btn-primary btn-success">
                                            ${ticket.number}
                                        </a>
                                        </div>
                                    </td>
                                        <c:if test="${ticket.id%10==0}">
                                            </tr><tr>
                                        </c:if>
                            </c:forEach>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<jsp:include page="../../../footer.jsp"/>

<script src="//rawgithub.com/stidges/jquery-searchable/master/dist/jquery.searchable-1.0.0.min.js"></script>

</body>
</html>

