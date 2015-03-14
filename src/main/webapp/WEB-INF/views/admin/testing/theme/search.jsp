<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Theme</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap -->
    <link href="/css/bootstrap.css" rel="stylesheet">
    <link href="/css/default.css" rel="stylesheet">
    <link href="/css/font-awesome.css" rel="stylesheet">
    <link href="/css/search.css" rel="stylesheet">

    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="../../../assets/js/ie10-viewport-bug-workaround.js"></script>

    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="/js/bootstrap.js"></script>
    <script src="/js/search.js"></script>

</head>
<body>

<jsp:include page="../../../header.jsp"/>
<jsp:include page="../../../menu.jsp"/>


<div class="body">

    <div class="container-fluid">
        <div class="row">
            <br/>
            <div class="col-xs-11 whiteback">

                <h3 class="text-center">Темы</h3>
                <hr>
                <%--три верхние кнопки--%>
                <div class="row">
                    <div class="pull-left">
                    <div class="col-xs-2 col-xs-offset-1">
                        <a href="/admin/testing/theme/add" type="button" class="btn btn-success">Добавить
                            тему</a>
                    </div>
                    </div>


                    <div class="col-xs-4 col-xs-offset-1">
                        <input type="search" id="search" value="" class="form-control" placeholder="Поиск">
                    </div>

                    <div class="pull-right">
                    <div class="col-xs-2 col-xs-offset-1">
                        <a href="/admin/testing/exam/search" type="button" class="btn btn-primary"  title="Экзамены">
                            <i class="fa fa-undo"></i></a>
                    </div>
                        <div class="col-xs-1"></div>
                    </div>

                </div>
                <hr>
                <%--таблица с данными--%>
                <div class="row">
                    <div class="col-xs-12 table-responsive">
                        <table class="table" id="table">
                            <thead>
                            <tr>
                                <th>Название</th>
                                <th></th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="theme" items="${themes}">
                                <tr>
                                    <td>${theme.name}</td>
                                    <td>
                                        <div class="pull-right">
                                            <a href="/admin/testing/theme/edit?id=${theme.id}" type="button"
                                               class="btn btn-primary btn-sm"><i class="fa fa-pencil fa-xs">
                                                Редактировать</i></a>
                                        </div>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<jsp:include page="../../../footer.jsp"/>

<script src="//rawgithub.com/stidges/jquery-searchable/master/dist/jquery.searchable-1.0.0.min.js"></script>

</body>
</html>

