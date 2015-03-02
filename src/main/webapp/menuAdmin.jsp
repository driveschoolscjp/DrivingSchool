<%--
  Created by IntelliJ IDEA.
  User: acer
  Date: 26.02.15
  Time: 21:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<html>
<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Bootstrap 101 Template</title>

    <!-- Bootstrap -->
    <link href="bootstrap/css/bootstrap.css" rel="stylesheet">
    <link href="bootstrap/css/default.css" rel="stylesheet">
    <link href="bootstrap/css/font-awesome.css" rel="stylesheet">


    <!--for VK-->
    <script src="http://vk.com/js/api/openapi.js" type="text/javascript"></script>




</head>

<body>
<div class="menu">

    <div class="container-fluid">

        <div class="row">
            <div class=" col-xs-offset-1 col-sm-offset-1  col-md-offset-1 col-lg-offset-1">

                <div>
                    <p style="color: #ffffff"><i class="fa fa-cog fa-2x" ></i> Admin </p>

                    <div class="list-group">
                        <a class="list-group-item" href="add"><i class="fa fa-user-plus fa-1x"></i>&nbsp; Add</a>
                        <a class="list-group-item" href="#"><i class="fa fa-user-times fa-1x"></i>&nbsp; Delete</a>
                        <a class="list-group-item" href="users"><i class="fa fa-users fa-1x"></i>&nbsp;  Show users</a>

                    </div>
                </div>

                <br>
                <br>
            </div>

        </div>
    </div>
</div>




<%--<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->--%>
<%--<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>--%>
<%--<!-- Include all compiled plugins (below), or include individual files as needed -->--%>
<%--<script src="bootstrap/js/bootstrap.js"></script>--%>


</body>
</html>
