<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<head>
    <title>Редактор ответов</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="shortcut icon" href="http://s3.gazu.ru/favicon.ico" type="image/x-icon">

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

                <div class="container-fluid whiteback">

                    <h3 class="text-center"></h3>
                    <hr/>
                    <div class="row">
                        <div class="col-xs-6 ">
                            <label>Тема:</label>
                            <input value="${question.theme.name}" class="form-control" readonly="true"/>
                        </div>

                        <div class="col-xs-6 pull-right">
                            <label><br/></label>
                            <br/>

                            <div class="btn-group" role="group" aria-label="...">
                                <a href="/admin/testing/exam/search" type="button" class="btn btn-primary"
                                   title="Экзамены">
                                    <i class="fa fa-undo"> экзамены</i></a>

                                <a href="/admin/testing/exam/search" type="button" class="btn btn-primary"
                                   title="Выбранный экзамен">
                                    <i class="fa fa-undo"> ${ question.ticket.exam.name}</i></a>

                                <a href="/admin/testing/question/search?id=${question.ticket.id}" type="button"
                                   class="btn btn-primary"
                                   title="Выбранный билет">
                                    <i class="fa fa-undo"> ${question.ticket.number}</i></a>

                                <a href="/admin/testing/question/edit?id=${question.id}" type="button"
                                   class="btn btn-primary"
                                   title="Выбранный вопрос">
                                    <i class="fa fa-undo"> ${question.number}</i> </a>
                            </div>
                        </div>
                    </div>
                    <hr>
                    <%--строка с полями--%>


                    <fieldset>
                        <div class="form-group col-xs-10">
                            <label>Вопрос:</label><br/>
                            ${question.question}
                            <br/>
                            <c:if test="${question.pathToPicture!=null}">
                                <img src="${question.pathToPicture}">
                            </c:if>
                        </div>
                    </fieldset>
                    <hr/>
                    <div class="row">
                        <div class="form-group col-xs-12">
                            <label>Текст ответа:</label><br/>
                            <table class="table" id="table">
                                <div class="form-group col-xs-11">
                                    <c:forEach var="answ" items="${answers}">
                                        <tr>
                                            <td class="${answ.correct?'correct':'wrong'}">
                                                <div class="${(answer.id==answ.id)?'show':'hide'}">

                                                    <form:form action="/admin/testing/question/saveAnswer" method="post"
                                                               modelAttribute="answer">

                                                        <form:textarea path="ans" class="form-control" cols="10"
                                                                       rows="2"
                                                                       placeholder="Answer" required="required"
                                                                       autofocus=""/>
                                                        <form:hidden path="id"/>
                                                        <div class="${answ.correct?'hide':'show'}">
                                                        <%--<c:if test="${!answ.correct}">--%>
                                                            <br/>
                                                            <form:checkbox path="correct"/>
                                                            Установить верным
                                                        <%--</c:if>--%>
                                                        </div>
                                                        <input hidden name="questionId" value="${question.id}">

                                                        <div class="btn-group-vertical pull-right">
                                                            <button class="btn  btn-primary" type="submit">Сохранить
                                                                ответ
                                                            </button>
                                                        </div>

                                                    </form:form>

                                                </div>
                                                <div class="${(answer.id==answ.id)?'hide':'show'}">
                                                        ${answ.answer}
                                                </div>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </div>
                            </table>
                        </div>
                    </div>
                    <hr/>
                </div>
            </div>
        </div>
    </div>
</div>
<jsp:include page="../../../footer.jsp"/>
</body>
</html>
