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
                                        <c:choose>
                                            <c:when test="${showAnswer}">
                                                <c:if test="${ans.isTrue}">
                                                    <td style="background-color: darkgreen">
                                                </c:if>
                                            </c:when>
                                                    <c:otherwise>
                                                    <td>
                                                    </c:otherwise>
                                        </c:choose>
                                            <a href="/testing/answer?id=${ans.id}" type="button" class="btn btn-primary btn-sm">
                                                <i class="fa fa-pencil fa-xs">${ans.answer}</i>
                                            </a>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </table>
                                    </div>
                                </div>
                        </fieldset>
                        <hr />
                </div>

            </div>
        </div>
    </div>
</div>
<jsp:include page="../../footer.jsp"/>
</body>
</html>
