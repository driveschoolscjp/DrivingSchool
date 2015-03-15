<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<html>
<head>
    <title>Дорожные знаки</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="shortcut icon" href="http://s3.gazu.ru/favicon.ico" type="image/x-icon">

    <%--<link href="/css/bootstrap.css" rel="stylesheet">--%>
    <link href="/css/default.css" rel="stylesheet">
    <link href="/css/font-awesome.css" rel="stylesheet">
    <link href="/css/roadsigns.css" rel="stylesheet">

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="/js/bootstrap.js"></script>

</head>

<body>
<jsp:include page="../header.jsp"/>
<jsp:include page="../menu.jsp"/>

<div class="body">
    <div class="roadsigns">
        <div class="text-center"><h1 class="blackback">Дорожные знаки</h1></div>
        <hr/>
        <ul>
            <c:forEach var="roadsign" items="${roadsigns}">
                <li>
                    <a class="normal" href="#">
                        <img src="${roadsign.imageURL}" alt=""/>
                    </a>

                    <div class="info">
                        <h3><b>${roadsign.number} ${roadsign.name}</b></h3>
                        <br/>
                        <p><b>Категория:</b><br/>${roadsign.category}</p>
                    </div>
                </li>
            </c:forEach>
        </ul>
    </div>
</div>

<script src="/js/roadsigns.js"></script>
<jsp:include page="../footer.jsp"/>
</body>
</html>