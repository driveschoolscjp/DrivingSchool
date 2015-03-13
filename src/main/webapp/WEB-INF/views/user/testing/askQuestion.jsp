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
                    <div class="text-center">
                        <c:if test="${question.pathToPicture!=null || question.pathToPicture!=''}">
                            <img src="${question.pathToPicture}">

                        </c:if>
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
                            <div class="col-xs-12 table-responsive">
                                <table class="table" id="table">

                                        <div class="btn-group btn-group-sm" role="group" aria-label="...">

                                            <c:forEach var="ans" items="${answers}">
                                                <br/>

                                                <c:choose>
                                                    <c:when test="${showAnswer}">
                                                        <c:choose>
                                                            <c:when test="${ans.correct}">
                                                                <tr>
                                                                <td class="answer right">
                                                              <li>  <a href="#" type="text"
                                                                   class="answer right">
                                                                    &nbsp;${ans.answer}
                                                                </a></li>
                                                                </td></tr>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <c:if test="${ans.id==idWrongAnswer}">
                                                                    <tr>
                                                                    <td class="answer wrong">
                                                                        <li>  <a href="#" type="text"
                                                                       class="answer wrong">
                                                                        &nbsp;${ans.answer}
                                                                    </a></li>
                                                                    </td></tr>
                                                                </c:if>
                                                                <c:if test="${ans.id!=idWrongAnswer}">
                                                                    <tr>
                                                                    <td class="answer">
                                                                        <li>   <a href="#" type="text"
                                                                   class="answer">
                                                                   &nbsp;${ans.answer}
                                                                </a></li>
                                                                    </td>
                                                                    </tr>
                                                                </c:if>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <tr>
                                                        <td class="answer">
                                                            <li>    <a href="/testing/answer?idAnswer=${ans.id}" type="text" class="answer">
                                                            &nbsp;${ans.answer}
                                                        </a></li>
                                                        </td>
                                                        </tr>
                                                    </c:otherwise>
                                                </c:choose>
                                            </c:forEach>
                                        </div>

                                </table>
                                <c:if test="${showAnswer}">
                                    <div>
                                        &nbsp; ${question.description}
                                    </div>
                                    <div class="text-center">
                                        <br/>
                                    <a href="/testing/question?idTicket=${question.ticket.id}" class="btn btn-primary" >
                                        Следующий вопрос
                                    </a>
                                   </div>
                                </c:if>
                            </div>
                        </div>
                        <br>
                    </fieldset>
                </div>
        </div>
    </div>
</div>

<jsp:include page="../../footer.jsp"/>
</body>
</html>
