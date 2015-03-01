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

<body>

<jsp:include page="header.jsp" />
<jsp:include page="menuAdmin.jsp" />

<div class="body">




    <div align="center">
        <table border="0"  style="color: #ffffff">
            <tr>
                <td colspan="2" align="center"><h2>Registration Succeeded!</h2></td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <h3>Thank you for registering! Here's the review of details:</h3>
                </td>
            </tr>
            <tr>
                <td>User id:</td>
                <td>${userForm.id}</td>
            </tr>

            <tr>
                <td>User login:</td>
                <td>${userForm.login}</td>
            </tr>

            <tr>
                <td>User password:</td>
                <td>${userForm.password}</td>
            </tr>

            <tr>
                <td>Name:</td>
                <td>${userForm.firstName}</td>
            </tr>

            <tr>
                <td>Surname:</td>
                <td>${userForm.familyName}</td>
            </tr>
            <tr>
                <td>Email:</td>
                <td>${userForm.email}</td>
            </tr>
        </table>
    </div>



</div>
</body>
</html>