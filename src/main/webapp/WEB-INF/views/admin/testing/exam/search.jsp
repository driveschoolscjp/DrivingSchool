<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
        <br/>
            <div class="col-xs-11 whiteback">

                <h3 class="text-center">Экзамены</h3>
                <hr>
                <%--таблица с билетами--%>
                <div class="row">
                    <div class="col-xs-12 table-responsive">
                        <table class="table">
                            <tbody>

                            <div class="row">
                            <tr>
                                <%--новый билет--%>
                                <div class="row">

                                    <div  class="pull-left">
                                        <div class="col-xs-3">
                                            <a href="/admin/testing/exam/add" type="button" class="btn btn-success"> Добавить
                                                экзамен</a>
                                        </div>
                                    </div>

                                    <div class="pull-right">
                                        <div class="col-xs-3">
                                            <a href="/admin/testing/theme/search" type="button" class="btn btn-primary">
                                                Темы
                                            </a>
                                        </div>
                                    </div>

                                </div>
                            </tr>
                            </div>
                            <hr/>
                            <br/>
                            <div class="row">
                            <tr>
                                <div class="btn-group btn-group-sm" role="group" aria-label="...">
                                    <c:forEach var="exam" items="${exams}">
                                                <a href="/admin/testing/ticket/search?id=${exam.id}" type="button"
                                                   class="btn btn-primary">
                                                        ${exam.name}
                                                </a>
                                    </c:forEach>
                                 </div>
                            </tr>
                            </div>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
</div>


<jsp:include page="../../../footer.jsp"/>

<script src="//rawgithub.com/stidges/jquery-searchable/master/dist/jquery.searchable-1.0.0.min.js"></script>

</body>
</html>

