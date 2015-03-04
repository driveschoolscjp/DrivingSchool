<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>


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
    <link href="/css/search.css" rel="stylesheet">
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

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
            <div class="col-md-11 whiteback">

                <h3 class="text-center">Поиск групп</h3>
                <hr>
                <%--три верхние кнопки--%>
                <div class="row">
                    <div class="col-md-4">
                        <a href="/admin/group/add" type="button" class="btn btn-primary btn-success">Добавить
                            группу</a>
                    </div>

                    <div class="col-md-4">
                        <form action="" method="post">
                            <select name="groupId" class="selectpicker input-xlarge">
                                <c:forEach items="${teachers}" var="teacher">
                                    <option value="${teacher.id}">${teacher.firstname}</option>
                                </c:forEach>
                            </select>

                            <button type="submit" class="btn btn-primary">Поиск по учителю</button>
                        </form>
                    </div>
                    <div class="col-md-4">
                        <input type="search" id="search" value="" class="form-control" placeholder="Найти">
                    </div>
                </div>
                <%--таблица с данными--%>
                <div class="row">
                    <div class="col-md-12">
                        <table class="table" id="table">
                            <thead>
                            <tr>
                                <th>Название группы</th>
                                <th>Учитель</th>
                                <th>Дата начала занятий</th>
                                <th>Дата окончания занятий</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="group" items="${groups}">
                                <tr>
                                    <td>${group.name}</td>
                                    <td>${group.teacher.firstname} &nbsp; ${group.teacher.lastname} &nbsp; ${group.teacher.patronymic}</td>
                                    <td>${group.startDate}</td>
                                    <td>${group.finishDate}</td>
                                    <td>
                                        <div class="btn-group-vertical pull-right">
                                            <a href="/admin/group/edit?id=${group.id}" type="button"
                                               class="btn btn-primary btn-sm"><i class="fa fa-user fa-xs">&nbsp;
                                                Редактировать</i></a>
                                            <a href="/admin/group/show?id=${group.id}" type="button"
                                               class="btn btn-primary btn-sm"><i class="fa fa-search fa-xs">&nbsp;
                                                Просмотреть</i></a>
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
<jsp:include page="../../footer.jsp"/>
<script>
    $(function () {
        $('#table').searchable({
            striped: true,
            oddRow: {'background-color': '#f5f5f5'},
            evenRow: {'background-color': '#fff'},
            searchType: 'fuzzy'
        });
    });</script>
<script src="//rawgithub.com/stidges/jquery-searchable/master/dist/jquery.searchable-1.0.0.min.js"></script>

</body>
</html>

