<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Редактор билетов</title>
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

        <br/>
            <div class="col-xs-11 whiteback">


                <h3 class="text-center">Редактор билетов</h3>
                <hr>
                <div class="row">

                       <div class="row">

                           <%--новый билет--%>
                           <div class="col-xs-3 col-xs-offset-1">
                               <c:if test="${moreTickets}">
                                           <a href="/admin/testing/ticket/add?id=${exam.id}" type="button" class="btn btn-success">Добавить
                                               билет</a>
                               </c:if>
                           </div>

                           <div class="col-xs-3 col-xs-offset-1">
                            <h4>Экзамен ${exam.name}</h4>
                        </div>


                    <div class="col-xs-2 col-xs-offset-1">
                        <div class="pull-right">
                            <a href="/admin/testing/exam/search" type="button" class="btn btn-primary"  title="Экзамены">
                                <i class="fa fa-undo"></i></a>
                        </div>
                    </div>
                           <div class="col-xs-1"></div>

                       </div>
                <%--таблица с билетами--%>
                <div class="row">
                    <div class="col-xs-12 table-responsive">
                        <table class="table" id="table">

                                <tr>
                                <c:forEach var="ticket" items="${tickets}">
                                    <td>
                                        <div class="col-xs-1 col-xs-offset-1">
                                       <a href="/admin/testing/question/search?id=${ticket.id}" type="button" class="btn btn-success">билет № ${ticket.number}</a>
                                       </div>
                                   </td>
                                        <c:if test="${ticket.number%5==0}">
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

