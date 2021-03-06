<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Редактор вопросов</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="shortcut icon" href="http://s3.gazu.ru/favicon.ico" type="image/x-icon">

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
            <br/>
            <div class="col-xs-11 whiteback">

                <br/>


                <h3 class="text-center">Редактор вопросов</h3>
                <hr/>
                <div class="row">
                    <div class="col-xs-4 col-xs-offset-1">
                        <div class="pull-left">
                <h4 class="text-center">Билет ${ticket.number}</h4>
                        </div>
                    </div>
                    <div class="col-xs-4 col-xs-offset-3 pull-right">
                <div class="btn-group" role="group" aria-label="...">
                    <a href="/admin/testing/exam/search" type="button" class="btn btn-primary"  title="Экзамены">
                        <i class="fa fa-undo"> экзамены</i></a>
                    <a href="/admin/testing/exam/search" type="button" class="btn btn-primary"  title="Выбранный экзамен">
                        <i class="fa fa-undo"> ${ ticket.exam.name}</i></a>
                </div>
                </div>
                </div>
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
                                <div class="text-center">
                               <h4> Вопросы: </h4>
                                </div>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <c:forEach var="question" items="${questions}">
                                <td>
                                    <div class="col-xs-4">
                                        <a href="/admin/testing/question/edit?id=${question.id}" type="button" class="btn btn-success">
                                         Вопрос ${question.number} </a>
                                    </div>
                                </td>
                                <c:if test="${question.number%5==0}">
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

