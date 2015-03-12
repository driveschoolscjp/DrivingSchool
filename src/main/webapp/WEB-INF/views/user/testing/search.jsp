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

    <div class="container-fluid">

        <div class="col-xs-11 whiteback">

            <h3 class="text-center">Экзамены</h3>
            <hr>

            <%--таблица с билетами--%>
            <div class="col-xs-12 table-responsive">
                <table class="table" id="table">
                    <thead>
                    <tr>
                        <th>Экзамены</th>
                    </tr>
                    </thead>
                    <tbody>
                    <form action="/testing/start" method="post">
                        <tr>
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
                        </tr>
                    </form>
                    <label>Билеты</label>
                    <tr>
                        <td>
                                <div class="col-xs-12">
                                    <table class="table">
                                        <tr>

                                            <c:forEach var="entry" items="${resMap}">
                                                <div class="row">
                                                    <td>
                                                        <c:if test="${entry.value>=passAnswers}">
                                                            <div class="col-xs-12">
                                                                <a href="/testing/question?idTicket=${entry.key.id}" type="button"
                                                                   class="btn btn-primary btn-success"
                                                                   style="background-color: darkgreen">
                                                                        Билет ${entry.key.number}
                                                                </a>
                                                            </div>
                                                        </c:if>
                                                        <c:if test="${entry.value<passAnswers && (entry.value>0 || entry.value<0)}">
                                                            <div class="col-xs-12">
                                                                <a href="/testing/question?idTicket=${entry.key.id}" type="button"
                                                                   class="btn btn-primary btn-success"
                                                                   style="background-color: #ac2925">
                                                                    Билет ${entry.key.number}
                                                                </a>
                                                            </div>
                                                        </c:if>
                                                        <c:if test="${entry.value==0}">
                                                            <div class="col-xs-12">
                                                                <a href="/testing/question?idTicket=${entry.key.id}" type="button"
                                                                   class="btn btn-primary btn-success"
                                                                   style="background-color: #000000">
                                                                    Билет ${entry.key.number}
                                                                </a>
                                                            </div>
                                                        </c:if>
                                                    </td>
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

