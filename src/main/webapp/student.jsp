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
<jsp:include page="menuAdmin.jsp" />

<div class="body">
    <div class="container">
        <div class="row">
            <div class="col-xs-8 col-sm-2 col-md-2 col-lg-2  ">


                <form:form action="add" method="post" commandName="studentForm">


                    <p class="form-signin-heading" style="color: #ffffff">Student add</p>

                    <label for="inputLogit" class="sr-only">Login</label>
                    <form:input path="login"  class="form-control" type="text"  placeholder="Login" id = "inputLogit" required = "inputLogin"   />

                    <label for="inputPassword" class="sr-only">Password</label>
                    <form:password path="password" id="inputPassword" class="form-control" placeholder="Password" required="inputPassword"/>

                    <label for="inputGroupId" class="sr-only">Group Id</label>
                    <form:input path="group" id="inputGroupId" type="number" min="0" step="1" class="form-control" placeholder="Group Id" required="inputGroupId"/>

                    <label for="inputInstructorId" class="sr-only">Instructor Id</label>
                    <form:input path="instructor"  class="form-control" type="number" min="0" step="1"  placeholder="Instructor Id" id = "inputInstructorId" required = "inputInstructorId"   />

                    <label for="rideNumber" class="sr-only">Ride Number</label>
                    <form:input path="rideNumber"  class="form-control" type="number" min="0" step="1"  placeholder="ride Number" id = "rideNumber" required = "rideNumber"   />

                    <label for="firstname" class="sr-only">Name</label>
                    <form:input path="firstname" id="firstname" class="form-control" placeholder="Name" required="firstname"/>

                    <label for="lastname" class="sr-only">Lastname</label>
                    <form:input path="lastname" id="lastname" class="form-control" placeholder="Lastname" required="lastname"/>

                    <label for="patronymic" class="sr-only">Patronymic</label>
                    <form:input path="patronymic" id="patronymic" class="form-control" placeholder="Patronymic" required="patronymic"/>


                    <label for="passport" class="sr-only">Passport</label>
                    <form:input path="passport" id="passport" class="form-control" placeholder="Passport code" type = "text" pattern ="[a-zA-Z]{2}[0-9]{6}" required = "passport" />

                    <label for="inn" class="sr-only">Inn</label>
                    <form:input path="inn" id="inn" class="form-control" placeholder="INN" type = "text" pattern= "[0-9]{8}" required = "inn"/>

                    <label for="birthday" class="sr-only">Birthday</label>
                    <form:input path="birthday" id="birthday" type = "date" class="form-control"  placeholder="Birthday" required="birthday"/>

                    <div>
                        <label class="radio-inline">
                            <form:radiobutton path="gender" value="M"/> <p style="color: #ffffff">Male</p>
                        </label>
                        <label class="radio-inline">
                            <form:radiobutton path="gender" value="F"/> <p style="color: #ffffff">Female</p>
                        </label>

                    </div>


                    <label for="inputEmail" class="sr-only">Email address</label>
                    <form:input path="email" type="email" id="inputEmail" class="form-control" placeholder="Email address" required="email" autofocus=""/>

                    <label for="photoURI" class="sr-only">Photo url</label>
                    <form:input path="photoURI"  id="photoURI" class="form-control" type="url" placeholder="photo URI" required="photoURI" autofocus=""/>


                    <br>

                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-xs-10 col-sm-10 col-md-10 col-lg-10  col-xs-offset-1 col-sm-offset-1 col-md-offset-1 col-lg-offset-1">

                                <button class="btn btn-lg btn-primary btn-block btn-xs" type="submit">Add student</button>
                            </div>
                        </div>
                    </div>
                </form:form>

            </div>
        </div>
    </div>    <!-- /container -->

</div>



<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
<script src="../../assets/js/ie10-viewport-bug-workaround.js"></script>



</body>
</html>
