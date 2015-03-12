<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<head>
    <title>Question</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap -->
    <link href="/css/bootstrap.css" rel="stylesheet">
    <link href="/css/default.css" rel="stylesheet">
    <link href="/css/font-awesome.css" rel="stylesheet">
    <script src="../../../assets/js/ie10-viewport-bug-workaround.js"></script>

    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="/js/bootstrap.js"></script>

</head>

<body>
<jsp:include page="../../../header.jsp"/>
<jsp:include page="../../../menu.jsp"/>

<div class="body">
    <div class="container-fluid">
        <div class="row">
            <div class="col-xs-11">

                <a href="/admin/testing/exam/search" type="button" class="btn btn-primary btn-success">
                    Все экзамены
                </a>
                <a href="/admin/testing/ticket/search?id=${question.ticket.exam.id}" type="button" class="btn btn-primary btn-success">
                    Экзамен ${question.ticket.exam.name}
                </a>
                <a href="/admin/testing/question/search?id=${question.id}" type="button" class="btn btn-primary btn-success">
                    Билет ${question.ticket.number}
                </a>
                <a href="/admin/testing/question/edit?id=${question.id}" type="button" class="btn btn-primary btn-success">
                    Вопрос ${question.number}
                </a>

                <div class="container-fluid whiteback">



                    <h3>Редактор ответа</h3>
                    <hr>
                    <%--строка с полями--%>
                    <fieldset>
                        <div class="form-group col-xs-6">
                            <label>Тема:</label>
                            <input value="${question.theme.name}" class="form-control" readonly="true"/>
                        </div>
                    </fieldset>
                    <fieldset>
                        <div class="form-group col-xs-6">
                            <label>Вопрос:</label><br/>
                            ${question.question}
                        </div>
                        <c:if test="${question.pathToPicture!=null}">
                            <img src="${question.pathToPicture}">
                        </c:if>
                    </fieldset>
                    <fieldset>
                        <div class="row">
                            <div class="col-xs-10 table-responsive">
                                <table class="table" id="table">
                                    <c:forEach var="answ" items="${answers}">
                                    <tr>
                                        <td>
                                            <c:choose>
                                                <c:when test="${answer.id==answ.id}">
                                                    <form:form action="/admin/testing/question/saveAnswer" method="post"
                                                               modelAttribute="answer">
                                                        <form:textarea path="ans" class="form-control" cols="10"
                                                                       rows="3"
                                                                       placeholder="Answer" required="required"
                                                                       autofocus=""/>
                                                        <form:hidden path="id" />
                                                        <form:checkbox path="correct" />
                                                            Установить верным
                                                        <input hidden name="questionId" value="${question.id}">
                                                        <div class="btn-group-vertical pull-right">
                                                            <button class="btn  btn-primary" type="submit">Сохранить
                                                                ответ
                                                            </button>
                                                        </div>
                                                    </form:form>
                                                </c:when>
                                                <c:otherwise>
                                                    <c:choose>
                                                    <c:when test="${answ.correct}">
                                                        <textarea class="form-control" style="background-color: #67b168" cols="10" rows="3"
                                                                  readonly="true">
                                                                ${answ.ans}
                                                        </textarea>
                                                    </c:when>
                                                        <c:otherwise><textarea class="form-control" style="background-color: #ce8483" cols="10" rows="3"
                                                                               readonly="true">
                                                                ${answ.ans}
                                                        </textarea>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </c:otherwise>
                                            </c:choose>
                                        </td>
                                        <td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <div class="form-group col-xs-11">
                                                </c:forEach>
                                                <c:if test="${answer.id==null}">
                                                    <form:form action="/admin/testing/question/saveAnswer" method="post"
                                                               modelAttribute="answer">
                                                        <form:textarea path="ans" class="form-control" cols="10"
                                                                       rows="3"
                                                                       placeholder="Answer" required="required"
                                                                       autofocus=""/>
                                                        <form:checkbox path="correct" />
                                                        <form:hidden path="id" />
                                                        <input hidden name="questionId" value="${question.id}">
                                                        <div class="btn-group-vertical pull-right">
                                                            <button class="btn  btn-primary" type="submit">Сохранить ответ</button>
                                                        </div>
                                                    </form:form>
                                                </c:if>
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                    </fieldset>
                    <hr/>
                </div>

            </div>
        </div>
    </div>
</div>
<jsp:include page="../../../footer.jsp"/>
</body>
</html>
