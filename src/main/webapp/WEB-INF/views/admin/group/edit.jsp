<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<html>
<head>
    <title>Редактирование группы</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="shortcut icon" href="http://s3.gazu.ru/favicon.ico" type="image/x-icon">

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
<jsp:include page="../../menu.jsp"/>

<div class="body">
    <div class="container-fluid">
        <div class="row">
            <div class="col-xs-11">

                <div class="container-fluid whiteback">
                    <form:form action="/admin/group/save" method="post" modelAttribute="group">
                        <form:hidden path="id"/>

                        <h3>Редактирование группы</h3>
                        <hr>

                        <fieldset>
                            <div class="form-group col-xs-6">
                                <label for="name">Название группы</label>
                                <form:input path="name" class="form-control" placeholder="Группа 1"
                                            required="required" cssErrorClass="error form-control"/>
                            </div>

                            <div class="form-group col-xs-6">
                                <label>Преподаватель</label><br/>
                                <form:select path="teacher.id" class="selectpicker form-control" required="required">
                                    <c:forEach items="${teachers}" var="teacher">
                                        <option value="${teacher.id}" ${group.teacher.id==teacher.id?"selected":""}>
                                                ${teacher.firstname} ${teacher.lastname}</option>
                                    </c:forEach>
                                </form:select>
                            </div>

                        </fieldset>
                        <hr>

                        <fieldset>
                            <div class="form-group col-xs-6">
                                <label for="description">Описание</label>
                                <form:input path="description" class="form-control" required="required"
                                            cssErrorClass="error form-control"/>
                            </div>

                            <div class="form-group col-xs-3">
                                <label for="startDate">Дата начала занятий</label>
                                <form:input path="startDate" class="form-control" type="date" required="required"
                                            cssErrorClass="error form-control"/>
                            </div>

                            <div class="form-group col-xs-3">
                                <label for="finishDate">Дата окончания занятий</label>
                                <form:input path="finishDate" class="form-control" type="date" required="required"
                                            cssErrorClass="error form-control"/>
                            </div>
                        </fieldset>
                        <hr>

                        <div class="text-center">
                            <button class="btn  btn-primary" type="submit">Сохранить группу</button>
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
