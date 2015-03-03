<%--
  Created by IntelliJ IDEA.
  User: acer
  Date: 01.03.15
  Time: 8:11
  To change this template use File | Settings | File Templates.
--%>

<%@ page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>


<html>
<head>
    <title>teacher</title>


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
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

</head>

<body>
<jsp:include page="../../header.jsp"/>
<jsp:include page="../menuAdmin.jsp"/>

<div class="body">
    <div class="container-fluid">
        <div class="row">
            <div style="background-color: #cccccc" class="col-xs-7 col-sm-3 col-md-2 col-lg-2  ">


               <img src="" />
                <p class="form-signin-heading" style="color: #ffffff">Teacher info</p>

                <p>Name ${teacher.firstname}</p>

                <p>Last name ${teacher.lastname}</p>

                <p>Patronymic ${teacher.patronymic}</p>

                <p>Passport ${teacher.passport}</p>

                <p>INN ${teacher.inn}</p>

                <p>Telephone ${teacher.tel}</p>

                    <%--<label for="birthday" class="sr-only">Birthday</label>--%>
                    <%--<form:input path="birthday" id="birthday" class="form-control"  type="date" placeholder="Birthday" required="birthday"/>--%>

                <p>Gender ${teacher.gender}</p>

            <p>Email ${teacher.email}</p>

            <p>Description ${teacher.description}</p>

                    <br>


            </div>
            <!-- /container -->

        </div>
    </div>
</div>

<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
<script src="../../assets/js/ie10-viewport-bug-workaround.js"></script>

<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="/js/bootstrap.js"></script>

</body>
</html>
