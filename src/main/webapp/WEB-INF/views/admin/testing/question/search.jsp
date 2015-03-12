<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Questions</title>
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
            <div class="col-xs-11 whiteback">

                <a href="/admin/testing/exam/search" type="button" class="btn btn-primary btn-success">
                    Все экзамены
                </a>
                <a href="/admin/testing/ticket/search?id=${ticket.exam.id}" type="button" class="btn btn-primary btn-success">
                    Экзамен ${ticket.exam.name}
                </a>
                <a href="/admin/testing/question/search?id=${ticket.id}" type="button" class="btn btn-primary btn-success">
                    Билет ${ticket.number}
                </a>

                <h3 class="text-center">Билет ${ticket.number}</h3>
                <h3 class="text-center">Редактор вопросов</h3>
                <hr>
                <%--новый билет--%>
                <c:if test="${moreQuestions}">
                    <div class="row">
                        <div class="col-xs-4">
                            <a href="/admin/testing/question/add?id=${ticket.id}" type="button" class="btn btn-primary btn-success">Добавить
                                вопрос</a>
                        </div>
                    </div>
                </c:if>
                <hr>
                <%--таблица с вопросами--%>
                <div class="row">
                    <div class="col-xs-12 table-responsive">
                        <table class="table" id="table">
                            <thead>
                            <tr>
                                <th>Вопросы</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <c:forEach var="question" items="${questions}">
                                <td>
                                    <div class="col-xs-4">
                                        <a href="/admin/testing/question/edit?id=${question.id}" type="button" class="btn btn-primary btn-success">
                                                ${question.number}
                                        </a>
                                    </div>
                                </td>
                                <c:if test="${question.number%10==0}">
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

