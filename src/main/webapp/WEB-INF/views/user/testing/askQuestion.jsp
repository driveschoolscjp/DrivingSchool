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
<jsp:include page="/WEB-INF/views/header.jsp"/>
<jsp:include page="/WEB-INF/views/menu.jsp"/>

<div class="body">
    <br/>
    <div class="container-fluid">
        <div class="row">
            <div class="col-xs-10 col-xs-offset-1 alltikets blackback">
                    <h3 class="text-center">Вопрос ${question.number}</h3>
                <hr>
                <div class="container-fluid">
                <div class="row">
                    <div class="col-xs-10 col-md-10 col-lg-6 col-xs-offset-1 col-md-offset-1  col-lg-offset-3">
                    <img class="img-rounded testImages"
                         src="/images/test1.jpg"/>
                    </div>
                </div>
                </div>
                <hr/>
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
                                        <div class="btn-group btn-group-sm" role="group" aria-label="...">
                                            <c:forEach var="ans" items="${answers}">
                                                <c:choose>
                                                    <c:when test="${showAnswer}">
                                                        <c:choose>
                                                            <c:when test="${ans.correct}">

                                                                <a href="#" type="button" class="btn btn-primary btn-sm"
                                                                   style="background-color: darkgreen">
                                                                    &nbsp;${ans.answer}
                                                                </a>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <c:if test="${ans.id==idWrongAnswer}">
                                                                    <a href="#" type="button" class="btn btn-primary btn-sm"
                                                                       style="background-color: #ac2925">
                                                                        &nbsp;${ans.answer}
                                                                    </a>
                                                                </c:if>
                                                                <c:if test="${ans.id!=idWrongAnswer}">
                                                                <a href="#" type="button"
                                                                   class="btn btn-primary btn-sm">
                                                                   &nbsp;${ans.answer}
                                                                </a>
                                                                </c:if>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <a href="/testing/answer?idAnswer=${ans.id}" type="button"
                                                           class="btn btn-primary btn-sm">
                                                            &nbsp;${ans.answer}
                                                        </a>
                                                    </c:otherwise>
                                                </c:choose>
                                            </c:forEach>
                                        </div>
                                    </tr>
                                </table>
                                <c:if test="${showAnswer}">
                                    <div class="row">
                                        &nbsp; ${question.description}
                                    </div>
                                    <br/>
                                    <a href="/testing/question?idTicket=${question.ticket.id}" type="button"
                                       class="btn btn-primary btn-sm">
                                        &nbsp;Следующий вопрос
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

<jsp:include page="../../footer.jsp"/>
</body>
</html>
