<%@ page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<html>
<head>
    <title>Group</title>


    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Bootstrap 101 Template</title>

    <!-- Bootstrap -->
    <link href="/css/bootstrap.css" rel="stylesheet">
    <link href="/css/default.css" rel="stylesheet">
    <link href="/css/font-awesome.css" rel="stylesheet">
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
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
            <div class="col-xs-11 col-sm-11 col-md-11 col-lg-11">

                <div class="container-fluid whiteback">
                    <form:form action="/admin/group/save" method="post" modelAttribute="group">
                        <form:hidden path="id"/>

                        <h3>Добавление группы</h3>
                        <hr>
                        <%--строка с полями--%>
                        <fieldset>
                            <div class="form-group col-md-6">
                                <label for="name">Название группы:</label>
                                <form:input path="name" class="form-control" placeholder="Группа 1"
                                            required="required"/>
                            </div>
                            <div class="form-group col-md-6">
                                <label for="startDate">Дата начала занятий: </label>
                                <form:input path="startDate" type="date" class="form-control" required="required"/>
                            </div>
                        </fieldset>
                        <fieldset>
                            <div class="form-group col-md-6">
                                <label>Учитель:</label><br/>
                                <form:select path="teacher.id" class="selectpicker">
                                    <c:forEach items="${teachers}" var="teacher">
                                        <option value="${teacher.id}" ${group.teacher.id==teacher.id?"selected":""}> ${teacher.firstname} ${teacher.lastname}</option>
                                    </c:forEach>
                                </form:select>
                            </div>
                            <div class="form-group col-md-6">
                                <label for="finishDate">Дата окончания занятий: </label>
                                <form:input path="finishDate" type="date" class="form-control" required="required"/>
                            </div>
                        </fieldset>


                        <hr/>
                        <div class="text-center">
                            <button class="btn  btn-primary" type="submit">Добавить группу</button>
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
