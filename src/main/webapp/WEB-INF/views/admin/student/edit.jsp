<%@ page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<html>
<head>
    <title>Student</title>


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
            <div class="col-xs-11 col-sm-11 col-md-11 col-lg-11">

                <div class="container-fluid whiteback">

                        <form:form action="/admin/student/save" method="post" modelAttribute="student">
                            <form:hidden path="id"/>

                            <h3>Добавление студента</h3>
                            <hr>

                            <fieldset>
                                <div class="form-group col-md-4">
                                    <label for="firstname">Name:</label>
                                    <form:input path="firstname" class="form-control" placeholder="${student.firstname==null?'Jack':student.firstname}" required="firstname"/>
                                </div>

                                <div class="form-group col-md-4">
                                    <label for="lastname">Lastname:</label>
                                    <form:input path="lastname" class="form-control" placeholder="${student.lastname==null?'Black':student.lastname}" required="lastname"/>
                                </div>
                                <div class="form-group col-md-4">
                                    <label for="patronymic">Patronymic:</label>
                                    <form:input path="patronymic" class="form-control" placeholder="${student.patronymic==null?'Robertovich':student.patronymic}" required="patronymic"/>
                                </div>
                            </fieldset>
                            <hr>

                            <fieldset>
                                <div class="form-group col-md-6">
                                    <label for="passport">Passport:</label>
                                    <form:input path="passport" class="form-control" placeholder="${student.passport==null?'AA571175':student.passport}" pattern="[A-Za-z]{2}[0-9]{6}" required="passport"/>
                                </div>

                                <div class="form-group col-md-6">
                                    <label for="inn">INN:</label>
                                    <form:input path="inn" class="form-control" placeholder="${student.inn==0?'12345678':student.inn}" pattern="[0-9]{8}" required="inn"/>
                                </div>
                            </fieldset>
                            <hr>

                            <fieldset>
                                <div class="form-group col-md-6">
                                    <label for="birthday">Birthday: </label>
                                        <%--<input type="text"  placeholder="сйуда birthday">--%>
                                    <input id="birthday" class="form-control" type="date" placeholder="Birthday"
                                           required="birthday"/>
                                </div>

                                <div class="col-md-6">
                                    <label for="gender">Gender</label><br>
                                    <form:radiobuttons path="gender" class="radio-inline"/>
                                </div>

                            </fieldset>
                            <hr>


                            <%--<fieldset>--%>
                            <%--<label>--%>
                            <%--<div class="col-md-6">--%>
                            <%--<label class="radio-inline">--%>
                            <%--<form:radiobutton path="gender" value="MALE"/> <p style="color: #ffffff">--%>
                            <%--Male</p>--%>
                            <%--</label>--%>
                            <%--</div>--%>

                            <%--<div class="col-md-6">--%>
                            <%--<label class="radio-inline">--%>
                            <%--<form:radiobutton path="gender" value="FEMALE"/> <p style="color: #ffffff">--%>
                            <%--Female</p>--%>
                            <%--</label>--%>
                            <%--</div>--%>
                            <%--</fieldset>--%>
                            <%--<hr>--%>

                            <fieldset>
                                <div class="form-group col-md-4">
                                    <label for="tel">Telephone:</label>
                                    <form:input path="tel" type="tel" class="form-control" placeholder="${student.tel==null?'987-654-32-10':student.tel}" required="tel"/>
                                </div>

                                <div class="form-group col-md-4">
                                    <label for="email">Email address:</label>
                                    <form:input path="email" type="email" class="form-control" placeholder="${student.email==null?'nickname@mail.com':student.email}" required="email"/>

                                </div>

                                <div class="form-group col-md-4">
                                    <label for="photoURI">Photo URI:</label>
                                    <form:input path="photoURI" class="form-control" type="url" placeholder="${student.photoURI==null?'http//photo.com/student5.png':student.photoURI}" required="photoURI"/>
                                </div>
                            </fieldset>
                            <hr>

                            <fieldset>
                                <div class="form-group col-md-4">
                                    <label>Группа:</label><br/>
                                    <form:select path="group.id" class="selectpicker">
                                        <c:forEach items="${groups}" var="group">
                                            <option value="${group.id}" ${student.group.id==group.id?"selected":""}>${group.name}</option>
                                        </c:forEach>
                                    </form:select>
                                </div>

                                <div class="form-group col-md-4">
                                    <label>Инструктор:</label><br/>
                                    <form:select path="instructor.id" class="selectpicker">
                                        <c:forEach items="${instructors}" var="instructor">
                                            <option value="${instructor.id}" ${student.instructor.id==instructor.id?"selected":""}> ${instructor.firstname} ${instructor.lastname}</option>
                                        </c:forEach>
                                    </form:select>
                                </div>

                                <div class="form-group col-md-4">
                                    <label for="rideNumber">Количество занятий вожденем:</label>
                                    <form:input path="rideNumber" class="form-control" type="number" min="10" max="20" step="5" placeholder="${student.rideNumber==null?'10':student.rideNumber}" required="rideNumber"/>
                                </div>
                            </fieldset>
                            <hr>

                            <fieldset>
                                <div class="form-group col-md-6">
                                    <label for="login">Login:</label>
                                    <form:input path="login" class="form-control" placeholder="${student.login==null?'login':student.login}" required="login"/>
                                </div>

                                <div class="form-group col-md-6">
                                    <label for="password">Password:</label>
                                    <form:input path="password" class="form-control" placeholder="${student.password==null?'password':student.password}" required="password"/>
                                </div>
                            </fieldset>

                            <div class="col-xs-4 col-sm-2 col-md-2 col-lg-2 col-xs-offset-4 col-sm-offset-5 col-md-offset-5 col-lg-offset-5">
                                <br>
                                <button class="btn btn-lg btn-success btn-block btn-xs" type="submit">Добавить клиента</button>
                                <br>
                            </div>
                        </form:form>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
