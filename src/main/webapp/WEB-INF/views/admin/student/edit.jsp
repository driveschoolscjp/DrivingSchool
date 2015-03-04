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
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

</head>

<body>
<jsp:include page="../../header.jsp"/>
<jsp:include page="../menuAdmin.jsp"/>

<div class="body">


    <div class="container-fluid">
        <div class="row">
            <div class="col-xs-11 col-sm-11 col-md-11 col-lg-11">


                <div class="container-fluid">



                    <section class="container-fluid">
                     <form:form action="/admin/student/save" method="post" modelAttribute="student">

                                <form:hidden path="id" />

                         <fieldset>
                             <legend><h3 style="color: white;">Добавление студента</h3></legend>
                            <div class="form-group col-lg-6">

                                <label for="inputLogit" style="color: white;">Login:</label>
                                <form:input path="login"  class="form-control" type="text"  placeholder="${student.login==null?'Login':student.login}" id = "inputLogit" required = "inputLogin"   />
                            </div>

                            <div class="form-group col-lg-6">
                                <label for="inputPassword" style="color: white;">Password:</label>
                                <form:password path="password" id="inputPassword" class="form-control" placeholder="${student.password==null?'Password':student.password}" required="inputPassword"/>
                            </div>

                             </fieldset>

                         <fieldset>
                             <legend></legend>
                                <div class="form-group col-lg-6">
                                    <label style="color: white;">Группы:</label>
                                    <form:select path="group.id" class="selectpicker" >
                                        <c:forEach items="${groups}" var="group">
                                            <option value="${group.id}" ${student.group.id==group.id?"selected":""}>${group.name}</option>
                                        </c:forEach>
                                    </form:select>
                                </div>

                                <div class="form-group col-lg-6">
                                    <label style="color: white;">Преподаватели:</label>
                                    <form:select path="instructor.id" class="selectpicker" >
                                        <c:forEach items="${instructors}" var="instructor">
                                            <option value="${instructor.id}" ${student.instructor.id==instructor.id?"selected":""}> ${instructor.firstname} ${instructor.lastname}</option>
                                        </c:forEach>
                                    </form:select>
                                </div>

                         </fieldset>
                         <fieldset><legend></legend>
                            <div class="form-group col-lg-6">
                                <label for="rideNumber" style="color: white;">Ride Number:</label>
                                <form:input path="rideNumber"  class="form-control" type="number" min="0" step="1"  placeholder="${student.rideNumber==null?'Ride number':student.rideNumber}" id = "rideNumber" required = "rideNumber"   />

                            </div>

                            <div class="form-group col-lg-6">
                                <label for="inn" style="color: white;" >Inn:</label>
                                <form:input path="inn" id="inn" class="form-control" placeholder="${student.inn==0?'INN':student.inn}" type = "text" pattern= "[0-9]{8}" required = "inn"/>
                            </div>
                             </fieldset>

                         <fieldset><legend></legend>

                            <label>
                                <div class="col-sm-6">
                                    <label class="radio-inline">
                                        <form:radiobutton path="gender" value="MALE"/> <p style="color: #ffffff">Male</p>
                                    </label>
                                </div>

                                <div class="col-sm-6">
                                    <label class="radio-inline">
                                        <form:radiobutton path="gender" value="FEMALE"/> <p style="color: #ffffff">Female</p>
                                    </label>
                                </div>
                         </fieldset>

                         <fieldset><legend></legend>

                             <div class="form-group col-md-4">
                                    <label for="firstname" style="color: white;" >Name:</label>
                                    <form:input path="firstname" id="firstname" class="form-control" placeholder="${student.firstname==null?'Name':student.firstname}" required="firstname"/>
                                </div>

                         <div class="form-group col-md-4">
                                    <label for="lastname" style="color: white;">Lastname:</label>
                                    <form:input path="lastname" id="lastname" class="form-control" placeholder="${student.lastname==null?'Last name':student.lastname}" required="lastname"/>
                                </div>
                                <div class="form-group col-md-4">
                                    <label for="patronymic" style="color: white;">Patronymic:</label>
                                    <form:input path="patronymic" id="patronymic" class="form-control" placeholder="${student.patronymic==null?'Patronymic':student.patronymic}" required="patronymic"/>
                                </div>
                             </fieldset>

                         <fieldset><legend></legend>

                             <div class="form-group col-md-6">
                                    <label for="passport" style="color: white;">Passport:</label>
                                    <form:input path="passport" id="passport" class="form-control" placeholder="${student.passport==null?'Passport code':student.passport}" type = "text" pattern ="[a-zA-Z]{2}[0-9]{6}" required = "passport" />
                                </div>
                                <div class="form-group col-md-6">
                                    <label style="color: white;">Birthday: </label>
                                    <%--<input type="text"  placeholder="сйуда birthday">--%>
                                        <input  id="birthday" class="form-control"  type="date" placeholder="Birthday" required="birthday"/>
                                </div>
</fieldset>

                         <fieldset><legend></legend>

                                <div class="form-group col-lg-4">
                                    <label for="tel" style="color: white;">Telephone:</label>
                                    <form:input path="tel"  type="tel"   class="form-control" placeholder="${student.tel==null?'Telephone':student.tel}"  id = "tel" required = "tel" />
                                </div>

                                <div class="form-group col-lg-4">
                                    <label for="inputEmail" style="color: white;">Email address:</label>
                                    <form:input path="email" type="email" id="inputEmail" class="form-control" placeholder="${student.email==null?'Email address':student.email}" required="email" autofocus=""/>

                                </div>

                                <div class="form-group col-lg-4">
                                    <label for="photoURI" style="color: white;">Photo url:</label>
                                    <form:input path="photoURI"  id="photoURI" class="form-control" type="url" placeholder="${student.photoURI==null?'Photo URI':student.photoURI}" required="photoURI" autofocus=""/>
                                </div>
                             </fieldset>

                                <div class="col-xs-4 col-sm-2 col-md-2 col-lg-2 col-xs-offset-4 col-sm-offset-5 col-md-offset-5 col-lg-offset-5">
                                    <br>
                                    <button class="btn btn-lg btn-primary btn-block btn-xs" type="submit">Добавить клиента</button>
                                </div>
                                </form:form>
                    </section>
            </div>
        </div>
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
