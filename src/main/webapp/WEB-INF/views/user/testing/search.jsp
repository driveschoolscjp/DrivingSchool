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

            <div class="row">
        <div class="col-xs-10 col-xs-offset-1 alltikets blackback">

            <h3 class="text-center">Тесты ПДД</h3>
               <hr>

            <%--таблица с билетами--%>
            <div class="col-xs-12 table-responsive">
                <table class="table">
                    <tbody>

                    <tr>
                            <form action="/testing/start" method="post">

                                <div class="pull-left">
                                 <div class="btn-group btn-group-sm" role="group" aria-label="...">
                            <c:forEach var="exam" items="${exams}">

                                       <button href="/testing/search?idExam=${exam.id}" type="button"  class="btn  btn-primary">
                                                    ${exam.name}
                                       </button>

                            </c:forEach>
                                        </div>
                                    </div>
                            </form>


                    </tr>

                    </tbody>
                </table>
            </div>

            <div class="row">

                    <div class="col-xs-12 table-responsive">
                        <table class="table">
                                    <tr>

                                <c:forEach var="entry" items="${resMap}">
                                        <td>
                                            <c:if test="${entry.value>=passAnswers}">
                                                    <a href="/testing/question?idTicket=${entry.key.id}" type="button"
                                                       class="btn btn-primary btn-success"
                                                       style="background-color: darkgreen">
                                                        Билет ${entry.key.number}
                                                    </a>
                                            </c:if>
                                            <c:if test="${entry.value<passAnswers && (entry.value>0 || entry.value<0)}">
                                                    <a href="/testing/question?idTicket=${entry.key.id}" type="button"
                                                       class="btn btn-primary btn-success"
                                                       style="background-color: #ac2925">
                                                        Билет ${entry.key.number}
                                                    </a>
                                            </c:if>
                                            <c:if test="${entry.value==0}">
                                                    <a href="/testing/question?idTicket=${entry.key.id}" type="button"
                                                       class="btn btn-primary btn-success"
                                                       style="background-color: #000000">
                                                        Билет ${entry.key.number}
                                                    </a>
                                            </c:if>
                                        </td>
                                    <c:if test="${entry.key.number%5==0}">
                                            </tr>
                                            <tr>
                                            </c:if>
                                </c:forEach>
                            </tr>
                        </table>
                    </div>

           </div>
    </div>

</div>

</div>
</div>

    <jsp:include page="../../footer.jsp"/>


    <script src="//rawgithub.com/stidges/jquery-searchable/master/dist/jquery.searchable-1.0.0.min.js"></script>

</body>
</html>

