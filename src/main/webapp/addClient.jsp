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
    <title>add client</title>


    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Bootstrap 101 Template</title>

    <!-- Bootstrap -->
    <link href="/bootstrap/css/bootstrap.css" rel="stylesheet">
    <link href="/bootstrap/css/default.css" rel="stylesheet">
    <link href="/bootstrap/css/font-awesome.css" rel="stylesheet">
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

</head>



<jsp:include page="header.jsp" />


<div class="container-fluid">
    <div class="row">
        <div class="col-xs-6 col-sm-2 col-md-2 col-lg-2  col-xs-offset-3 col-sm-offset-5 col-md-offset-5 col-lg-offset-5">


    <form:form action="add" method="post" commandName="userForm">


        <h2 class="form-signin-heading" style="color: #ffffff">User Registration</h2>

        <label for="firstName" class="sr-only">First name</label>
        <form:input path="firstName" class="form-control" type="text"  placeholder="First name" id = "firstName" required = "text"   />
        <label for="familyName" class="sr-only">Family name</label>
        <form:input path="familyName" class="form-control" type="text"  placeholder="FamilyName" id = "familyName" required = "text"   />
        <label for="inputEmail" class="sr-only">Email address</label>
        <form:input path="email" type="email" id="inputEmail" class="form-control" placeholder="Email address" required="email" autofocus=""/>
        <label for="inputPassword" class="sr-only">Password</label>
        <form:password path="password" id="inputPassword" class="form-control" placeholder="Password" required="inputPassword"/>
        <label for="inputLogit" class="sr-only">Login</label>
    <form:input path="login"  class="form-control" type="text"  placeholder="User name" id = "inputLogit" required = "inputLogin"   />
       <br>

        <button class="btn btn-lg btn-primary btn-block" type="submit">Submit</button>

            </div>
    </form:form>

</div>
</div>
</div>    <!-- /container -->





<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
<script src="../../assets/js/ie10-viewport-bug-workaround.js"></script>



</body>
</html>
