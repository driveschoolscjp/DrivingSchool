<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<html>

<head>

    <title>Error!</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="shortcut icon" href="http://s3.gazu.ru/favicon.ico" type="image/x-icon">

    <!-- Bootstrap -->
    <link href="/css/bootstrap.css" rel="stylesheet">
    <link href="/css/default.css" rel="stylesheet">
    <link href="/css/font-awesome.css" rel="stylesheet">

    <!--for VK-->
    <script src="http://vk.com/js/api/openapi.js" type="text/javascript"></script>
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="/js/bootstrap.js"></script>

</head>

<body>
<jsp:include page="header.jsp"/>
<jsp:include page="menu.jsp"/>

<div class="body">
    <div class="errpg">
        <br/>
        <br/>
        <img src="/images/error.gif" alt=""/>
        <br/>
        <br/>

        <h1 class="blackback">Ой! Что-то пошло не так</h1>
    </div>
</div>

<jsp:include page="footer.jsp"/>

</body>
</html>
