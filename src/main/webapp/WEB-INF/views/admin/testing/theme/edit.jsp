<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

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
    <script src="../../../assets/js/ie10-viewport-bug-workaround.js"></script>

    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="/js/bootstrap.js"></script>

</head>

<body>
<jsp:include page="../../../header.jsp"/>
<jsp:include page="../../../menu.jsp"/>

<div class="body">
    <div class="container-fluid">
        <div class="row">
            <div class="col-xs-11">

                <div class="container-fluid whiteback">
                        <form:form action="/admin/testing/theme/save" method="post" modelAttribute="theme">
                            <form:hidden path="id"/>
                             <div class="row">
                                 <div class="col-xs-4 col-xs-offset-4">
                            <h3>Добавление темы</h3>
                             </div>
                             </div>
                            <hr>

                             <div class="row">

                                     <div class="col-xs-10">
                                         <form:input path="name" class="form-control" placeholder="Текст"
                                                     required="required"/>
                                     </div>



                            <div class="pull-right">
                                <div class="col-xs-1 col-xs-offset-1">
                                    <a href="/admin/testing/exam/search" type="button" class="btn btn-primary"  title="Экзамены">
                                        <i class="fa fa-undo"></i></a>
                            </div>
                            </div>
                             </div>
                            <hr>

                            <div class="text-center">
                                <button class="btn  btn-success" type="submit">Сохранить тему</button>
                            </div>
                        </form:form>
                </div>

            </div>
        </div>
    </div>
</div>
<jsp:include page="../../../footer.jsp"/>
</body>
</html>
