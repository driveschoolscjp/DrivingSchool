<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<html>
<head>
    <title>Testing</title>
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

                <a href="/admin/testing/exam/edit?id=${question.ticket.exam.id}" type="button"
                   class="btn btn-primary btn-success">
                    Экзамен ${question.ticket.exam.name}
                </a>
                <a href="/admin/testing/ticket/edit?id=${question.ticket.id}" type="button"
                   class="btn btn-primary btn-success">
                    Билет ${question.ticket.number}
                </a>

                <div class="container-fluid whiteback">
                    <form:form action="/admin/testing/question/save" method="post" modelAttribute="question">
                        <form:hidden path="id"/>
                        <form:hidden path="ticket.id"/>

                        <h3>Редактирование вопроса</h3>
                        <hr>

                        <fieldset>
                            <div class="form-group col-xs-4">
                                <label for="number">Вопрос:</label>
                                <form:input path="number" class="form-control" placeholder="Black"
                                            readonly="true"/>
                            </div>
                        </fieldset>
                        <hr>

                        <fieldset>
                            <div class="form-group col-xs-4">
                                <label>Билет:</label><br/> ${question.ticket.number}
                                    <%--<input hidden name="ticketId" value="${question.ticket.id}"/>--%>
                            </div>
                            <div class="form-group col-xs-4">
                                <label>Тема:</label><br/>
                                <form:select path="theme.id" class="selectpicker form-control" required="required">
                                    <c:forEach items="${themes}" var="theme">
                                        <option value="${theme.id}" ${question.theme.id==theme.id?"selected":""}>${theme.name}</option>
                                    </c:forEach>
                                </form:select>
                            </div>
                        </fieldset>
                        <hr>

                        <fieldset>
                            <form:textarea path="ques" class="form-control" cols="20" rows="6"
                                           placeholder="Question" required="required" autofocus=""/>
                        </fieldset>
                        <fieldset>
                            <form:textarea path="description" class="form-control" cols="20" rows="6"
                                           placeholder="Description" required="required" autofocus=""/>
                        </fieldset>
                        <hr/>
                        <div class="text-center">
                            <button class="btn  btn-primary" type="submit">Сохранить вопрос</button>
                        </div>
                    </form:form>
                    <c:forEach items="${answers}" var="answ">
                        <c:choose>
                            <c:when test="${answ.correct}">
                        <textarea style="background-color: #67b168" class="form-control" cols="10" rows="3"
                                  readonly="true">
                                ${answ.ans}
                        </textarea>
                                <a href="/admin/testing/question/editAnswer?id=${answ.id}" type="button"
                                   class="btn btn-primary btn-success">
                                    Редактировать
                                </a>
                            </c:when>
                            <c:otherwise>
                                <textarea style="background-color: #ce8483" class="form-control" cols="10" rows="3"
                                          readonly="true">
                                        ${answ.ans}
                                </textarea>
                                <a href="/admin/testing/question/editAnswer?id=${answ.id}" type="button"
                                   class="btn btn-primary btn-success">
                                    Редактировать
                                </a>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                </div>
                <a href="/admin/testing/question/addAnswer?id=${question.id}" type="button"
                   class="btn btn-primary btn-success">
                    Добавить ответ
                </a>
            </div>
        </div>
    </div>
</div>
<jsp:include page="../../../footer.jsp"/>
</body>
</html>
