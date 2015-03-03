<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>


<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Bootstrap 101 Template</title>

    <!-- Bootstrap -->
    <link href="/css/bootstrap.css" rel="stylesheet">
    <link href="/css/default.css" rel="stylesheet">
    <link href="/css/font-awesome.css" rel="stylesheet">
    <link href="/css/search.css" rel="stylesheet">
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="../../assets/js/ie10-viewport-bug-workaround.js"></script>

    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="/js/bootstrap.js"></script>
    <script src="//rawgithub.com/stidges/jquery-searchable/master/dist/jquery.searchable-1.0.0.min.js"></script>

</head>
<body>

<jsp:include page="../../header.jsp"/>
<jsp:include page="../menuAdmin.jsp"/>


<div class="body">


<div class="container-fluid">

    <div class="row">
        <div class=" col-xs-6 col-sm-6 col-md-6 col-lg-6 col-xs-offset-2 col-sm-offset-2 col-md-offset-2 col-lg-offset-2">
            <table class="table" id="table">
                <thead>
                <tr>
                    <th></th>
                    <th></th>
                    <th>
                        <div class="pull-right">
                            <h3 style="color: #ffffff">Поиск по группе</h3>

                            <form action="/admin/student/search" method="post">
                                <select name="groupId" class="selectpicker">
                                    <c:forEach items="${groups}" var="group">
                                        <option value="${group.id}">${group.name}</option>
                                    </c:forEach>
                                </select>
                                <button type="submit" value="Поиск по группе">Поиск по группе</button>
                            </form>
                        </div>
                    </th>
                </tr>
                <tr>
                    <th></th>
                    <th></th>
                     <th>
                    <input type="search" id="search" value="" class="form-control" placeholder="Поиск по ФИО студента">
                     </th>
                </tr>
                <tr>
                    <th style="color: #ffffff">Имя</th>
                    <th style="color: #ffffff">Фамилия</th>
                    <th style="color: #ffffff">Отчество</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="student" items="${students}">

                    <tr>
                        <td>${student.firstname}</td>
                        <td>${student.lastname}</td>
                        <td>${student.patronymic} &nbsp;
                            <div class="btn-group-vertical pull-right">
                                <a href="/admin/student/edit?id=${student.id}" type="button" class="btn btn-default btn-xs"  ><i class="fa fa-user-plus fa-xs">&nbsp; Редактировать</i></a>
                                <a href="/admin/student/show?id=${student.id}" type="button" class="btn btn-default btn-xs"><i class="fa fa-search fa-xs">&nbsp;  Просмотреть</i></a>
                            </div>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
            <hr>
        </div>
    </div>
</div>

    </div>




<style>.row-padding {
    margin-top: 25px;
    margin-bottom: 25px;
}</style>

<script>
    $(function () {
    $( '#table' ).searchable({
        striped: true,
        oddRow: { 'background-color': '#f5f5f5' },
        evenRow: { 'background-color': '#fff' },
        searchType: 'fuzzy'
    });

    $( '#searchable-container' ).searchable({
        searchField: '#container-search',
        selector: '.row',
        childSelector: '.col-xs-4',
        show: function( elem ) {
            elem.slideDown(100);
        },
        hide: function( elem ) {
            elem.slideUp( 100 );
        }
    })
});</script>


</body>
</html>

