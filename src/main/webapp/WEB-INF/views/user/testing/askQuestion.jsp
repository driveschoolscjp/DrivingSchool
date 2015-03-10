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
<jsp:include page="../../header.jsp"/>

<div class="body">
    <div class="container-fluid">
        <div class="row">
            <div class="col-xs-11">

                <div class="container-fluid whiteback">

                    <h3 class="text-center">Вопрос ${question.number}</h3>
                    <hr>
                    <%--строка с полями--%>
                    <fieldset>
                        <div class="form-group col-xs-6">
                            <label>Тема:</label>
                            ${question.theme.name}
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
                                    <tr>
                                        <td>
                                            <c:forEach var="ans" items="${answers}">
                                                <c:choose>
                                                    <c:when test="${showAnswer}">
                                                        <c:choose>
                                                            <c:when test="${ans.correct}">
                                                                <a href="#" type="button" class="btn btn-primary btn-sm"
                                                                   style="background-color: darkgreen">
                                                                    <i class="fa fa-pencil fa-xs">${ans.answer}</i>
                                                                </a>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <c:if test="${ans.id==idWrongAnswer}">
                                                                    <a href="#" type="button" class="btn btn-primary btn-sm"
                                                                       style="background-color: #ac2925">
                                                                        <i class="fa fa-pencil fa-xs">${ans.answer}</i>
                                                                    </a>
                                                                </c:if>
                                                                <c:if test="${ans.id!=idWrongAnswer}">
                                                                <a href="#" type="button"
                                                                   class="btn btn-primary btn-sm">
                                                                    <i class="fa fa-pencil fa-xs">${ans.answer}</i>
                                                                </a>
                                                                </c:if>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <a href="/testing/answer?idAnswer=${ans.id}" type="button"
                                                           class="btn btn-primary btn-sm">
                                                            <i class="fa fa-pencil fa-xs">${ans.answer}</i>
                                                        </a>
                                                    </c:otherwise>
                                                </c:choose>
                                            </c:forEach>
                                        </td>
                                    </tr>
                                </table>
                                <c:if test="${showAnswer}">
                                    <div class="row">
                                    ${question.description}
                                    </div>
                                    <a href="/testing/question?idTicket=${question.ticket.id}" type="button"
                                       class="btn btn-primary btn-sm">
                                        <i class="fa fa-pencil fa-xs">Следующий вопрос</i>
                                    </a>
                                </c:if>
                            </div>
                        </div>
                    </fieldset>
                    <hr/>
                </div>

            </div>
        </div>
    </div>
</div>
<jsp:include page="../../footer.jsp"/>
</body>
</html>
