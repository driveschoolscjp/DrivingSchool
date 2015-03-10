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

                <div class="container-fluid whiteback">

                    <h3 class="text-center">Вопрос ${question.number}</h3>

                    <form:form action="/admin/testing/question/saveAnswer?id=${question.id}" method="post" modelAttribute="answer">
                        <form:hidden path="id"/>

                        <h3>Редактор вопроса</h3>
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
                        </fieldset>
                        <fieldset>
                            <div class="row">
                                <div class="col-xs-10 table-responsive">
                            <table class="table" id="table">
                                <c:forEach var="ans" items="${answers}">
                                    <tr>
                                        <td>
                                                <c:choose>
                                                    <c:when test="${answer.id==ans.id}">
                                                        <form:textarea path="answer" class="form-control" cols= "10" rows= "3"
                                                                       placeholder="Answer" required="required" autofocus=""/>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <textarea class="form-control" cols= "10" rows= "3"
                                                                        readonly="true">
                                                            ${ans.answer}
                                                            </textarea>
                                                    </c:otherwise>
                                                </c:choose>
                                        </td>
                                        <td>
                                            Верный
                                            <%--<input type="checkbox" value="${ans.correct}" readonly="true">--%>
                                        </td>
                                        <td>

                                            <div class="btn-group-vertical pull-right">
                                                <a href="/admin/testing/question/editAnswer?id=${ans.id}" type="button"
                                                   class="btn btn-primary btn-sm"><i class="fa fa-pencil fa-xs">
                                                    Редактировать</i></a>
                                                </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <div class="form-group col-xs-11">
                                </c:forEach>
                                <c:if test="${answer.id==null}">
                                    <form:textarea path="answer" class="form-control" cols= "10" rows= "3"
                                                   placeholder="Answer" required="required" autofocus=""/>
                                </c:if>
                                                </div>
                                    </td>
                                    </tr>
                                <tr>
                                    <td>
                                        <div class="btn-group-vertical pull-right">
                                            <button class="btn  btn-primary" type="submit">Сохранить ответ</button>
                                        </div>
                                    </td>
                                    <td>
                                        Верный
                                        <%--<form:checkbox path="correct" value="false"/>--%>
                                    </td>
                                </tr>
                            </table>
                                    </div>
                                </div>
                        </fieldset>
                        <hr />
                    </form:form>
                </div>

            </div>
        </div>
    </div>
</div>
<jsp:include page="../../../footer.jsp"/>
</body>
</html>
