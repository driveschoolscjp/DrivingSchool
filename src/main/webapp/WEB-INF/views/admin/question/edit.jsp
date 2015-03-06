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
    <script src="../../assets/js/ie10-viewport-bug-workaround.js"></script>

    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="/js/bootstrap.js"></script>

</head>

<body>
<jsp:include page="../../header.jsp"/>
<jsp:include page="../menuAdmin.jsp"/>

<div class="body">
    <div class="container-fluid">
        <div class="row">
            <div class="col-xs-11">

                <div class="container-fluid whiteback">
                    <form:form action="/admin/question/save" method="post" modelAttribute="question">
                        <form:hidden path="id"/>

                        <h3>Добавление вопроса</h3>
                        <hr>
                        <%--строка с полями--%>
                        <fieldset>
                            <div class="form-group col-xs-2">
                                <label>Вопрос:</label><br/>
                                <form:input path="number" cssClass="form-control" readonly="true"/>
                            </div>
                            <div class="form-group col-xs-4">
                                <label>Билет:</label><br/>
                                <form:input path="ticket" cssClass="form-control" readonly="true"/>
                            </div>
                            <div class="form-group col-xs-6">
                                <label>Тема:</label><br/>
                                <form:select path="theme.id" class="selectpicker form-control">
                                    <c:forEach items="${themes}" var="theme">
                                        <option value="${theme.id}" ${question.theme.id==theme.id?"selected":""}> ${theme.name}</option>
                                    </c:forEach>
                                </form:select>
                            </div>
                        </fieldset>
                        <hr />
                        <fieldset>
                            <div class="form-group col-xs-12">
                                <label>Вопрос:</label><br/>
                                <form:textarea path="question" class="form-control" cols= "20" rows= "6"
                                               placeholder="Question" required="required" autofocus=""/>
                            </div>
                        </fieldset>

                        <hr/>
                        <div class="text-center">
                            <button class="btn  btn-primary" type="submit">Сохранить вопрос</button>
                        </div>
                    </form:form>
                </div>

            </div>
        </div>
    </div>
</div>
<jsp:include page="../../footer.jsp"/>
</body>
</html>
