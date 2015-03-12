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

        <div class="col-xs-10 col-xs-offset-1 alltikets blackback">

            <h3 class="text-center">Результаты</h3>
            <hr>
            <div class="col-xs-4 ">
            <h4>Билет ${ticket.number}</h4>
            </div>
            <th>
            <%--таблица с билетами--%>
            <div class="col-xs-12 table-responsive">
                <table class="table">

                    <tbody>
                    <form action="/testing/start" method="post">
                        <tr>
                            <c:forEach var="entry" items="${resMap}">
                                <div class="row">
                                    <td>
                                        <c:if test="${entry.value != null}">
                                            <c:if test="${entry.value.correct}">
                                            <div class="col-xs-12">
                                                <a href="/testing/true?idAnswer=${entry.value.id}" type="button"
                                                   class="btn btn-primary btn-success"
                                                   style="background-color: darkgreen">
                                                    Вопрос ${entry.key.number}
                                                </a>
                                            </div>
                                            </c:if>
                                        </c:if>
                                        <c:if test="${entry.value != null}">
                                        <c:if test="${!entry.value.correct}">
                                            <div class="col-xs-12">
                                                <a href="/testing/true?idAnswer=${entry.value.id}" type="button"
                                                   class="btn btn-primary btn-success"
                                                   style="background-color: #ac2925">
                                                    Вопрос ${entry.key.number}
                                                </a>
                                            </div>
                                        </c:if>
                                        </c:if>
                                        <c:if test="${entry.value==null}">
                                            <div class="col-xs-12">
                                                <a href="/testing/true?idAnswer=${entry.value.id}" type="button"
                                                   class="btn btn-primary btn-success"
                                                   style="background-color: #ffffff">
                                                    Вопрос ${entry.key.number}
                                                </a>
                                            </div>
                                        </c:if>
                                    </td>
                                </div>
                            </c:forEach>
                        </tr>
                    </form>
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

