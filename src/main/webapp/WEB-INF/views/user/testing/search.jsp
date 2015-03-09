<%@ page import="com.luxoft.drivingschool.controller.testing.ExamMode" %>
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

<jsp:include page="../../header.jsp"/>



<div class="body">

    <div class="container-fluid">

        <div class="row">
            <div class="col-xs-11 whiteback">

                <h3 class="text-center">Экзамены</h3>
                <hr>

                <%--таблица с билетами--%>
                <div class="row">
                    <div class="col-xs-12 table-responsive">
                        <table class="table" id="table">
                            <thead>
                            <tr>
                                <th>Экзамены</th>
                            </tr>
                            </thead>
                            <tbody>
                            <form action="/testing/start" method="post" modelAttribute="typeMode">
                            <tr>
                                <div class="row">
                                        <c:forEach var="exam" items="${exams}">
                                            <td>
                                            <div class="col-xs-12">
                                                <a href="/testing/search?idExam=${exam.id}" type="button"
                                                   class="btn btn-primary btn-success">
                                                        ${exam.name}
                                                </a>
                                            </div>
                                            </td>
                                        </c:forEach>
                                </div>
                            </tr>
                                </form>
                        <tr>
                        <td>
                                <form action="/testing/start" method="post">
                            <div class="col-xs-12">
                                <div class="form-group col-xs-3">
                                <label>Билет</label>
                                    <input id = "idTicket" type="number" min="1" max="${ticketQuantity}" name="idTicket"
                                            step="1" required="required" value="1"/>
                                </div>

                                <div class="col-xs-5">
                                    <button type="submit" class="btn btn-primary">Выбрать билет</button>
                                </div>
                            </div>
                                    </form>
                        </td>
                        </tr>
                        <tr>
                            <td>
                                <form:form action="/testing/startTicket" method="post">
                                    <div class="col-xs-12">
                                        <button type="submit" class="btn btn-primary">Случайный билет</button>
                                    </div>
                            </td>
                                    </form:form>
                        </tr>
                        <tr>
                            <td>
                                <form:form action="/testing/randomQuestion" method="post">
                                <div class="col-xs-12">
                                    <button type="submit" class="btn btn-primary">20 случайных билетов</button>
                                </div>
                                    </form:form>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <form:form action="/testing/randomQuestion" method="post">
                                <div class="form-group col-xs-12">
                                    <label>Темы:</label><br/>
                                    <select id="idTheme" name="idTheme" class="selectpicker form-control" required="required">
                                        <c:forEach items="${themes}" var="theme">
                                            <option value="${theme.id}">${theme.name}</option>
                                        </c:forEach>
                                        <button type="submit" class="btn btn-primary">Вопросы по теме</button>
                                    </select>
                                </div>
                                    </form:form>
                            </td>
                        </tr>
                        </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<jsp:include page="../../footer.jsp"/>
<script>
    $(function () {
        $('#table').searchable({
            striped: true,
            oddRow: {'background-color': '#f5f5f5'},
            evenRow: {'background-color': '#fff'},
            searchType: 'fuzzy'
        });
    });</script>
<script src="//rawgithub.com/stidges/jquery-searchable/master/dist/jquery.searchable-1.0.0.min.js"></script>

</body>
</html>

