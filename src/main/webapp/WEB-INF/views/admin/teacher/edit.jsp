

<%@ page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>


<html>
<head>
    <title>Teacher</title>


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


<jsp:include page="../../header.jsp"/>
<jsp:include page="../menuAdmin.jsp"/>

<div class="body">
    <div class="container-fluid">
        <div class="row">
            <div class="col-xs-7 col-sm-3 col-md-2 col-lg-2  ">


                <form:form action="/admin/teacher/save" method="post" modelAttribute="teacher">

                    <form:hidden path="id" />

                    <p class="form-signin-heading" style="color: #ffffff">Teacher add</p>

                    <label for="firstname" class="sr-only">Name</label>
                    <form:input path="firstname" id="firstname" class="form-control" placeholder="${teacher.firstname==null?'Name':teacher.firstname}" required="firstname"/>

                    <label for="lastname" class="sr-only">Lastname</label>
                    <form:input path="lastname" id="lastname" class="form-control" placeholder="${teacher.lastname==null?'Last name':teacher.lastname}" required="lastname"/>

                    <label for="patronymic" class="sr-only">Patronymic</label>
                    <form:input path="patronymic" id="patronymic" class="form-control" placeholder="${teacher.patronymic==null?'Patronymic':teacher.patronymic}" required="patronymic"/>


                    <label for="passport" class="sr-only">Passport</label>
                    <form:input path="passport" id="passport" class="form-control" placeholder="${teacher.passport==null?'Passport code':teacher.passport}" type = "text" pattern ="[a-zA-Z]{2}[0-9]{6}" required = "passport" />

                    <label for="inn" class="sr-only">Inn</label>
                    <form:input path="inn" id="inn" class="form-control" placeholder="${teacher.inn==null?'INN':teacher.inn}" type = "text" pattern= "[0-9]{8}" required = "inn"/>


                    <label for="tel" class="sr-only">Telephone</label>
                    <form:input path="tel"  type="tel"   class="form-control" placeholder="${teacher.tel==null?'Telephone':teacher.tel}"  id = "tel" required = "tel" />

                    <%--<label for="birthday" class="sr-only">Birthday</label>--%>
                    <%--<form:input path="birthday" id="birthday" class="form-control"  type="date" placeholder="Birthday" required="birthday"/>--%>

                    <div>
                        <label class="radio-inline">
                            <form:radiobutton path="gender" value="MALE"/> <p style="color: #ffffff">Male</p>
                        </label>
                        <label class="radio-inline">
                            <form:radiobutton path="gender" value="FEMALE"/> <p style="color: #ffffff">Female</p>
                        </label>

                    </div>

                    <label for="inputEmail" class="sr-only">Email address</label>
                    <form:input path="email" type="email" id="inputEmail" class="form-control" placeholder="${teacher.email==null?'Email address':teacher.email}" required="email" autofocus=""/>

                    <label for="photoURI" class="sr-only">Photo url</label>
                    <form:input path="photoURI"  id="photoURI" class="form-control" type="url" placeholder="${teacher.photoURI==null?'Photo URI':teacher.photoURI}" required="photoURI" autofocus=""/>

                    <label for="description" class="sr-only">Description</label>
                    <form:textarea path="description"  id="description" class="form-control" cols= "20" rows= "3" placeholder="${teacher.description==null?'Description':teacher.description}" required="description" autofocus=""/>

                    <br>

                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-xs-10 col-sm-10 col-md-10 col-lg-10  col-xs-offset-1 col-sm-offset-1 col-md-offset-1 col-lg-offset-1">

                                <button class="btn btn-lg btn-primary btn-block btn-xs" type="submit">Add teacher</button>
                            </div>
                        </div>
                    </div>
                </form:form>
 </div>
            <div class="col-xs-5 col-sm-5 col-md-5 col-lg-5 ">

<form:form action="findTeacherByName" method="get" modelAttribute="teacherForm">



    <div class="container-fluid">
        <div class="row">
            <div class=" col-sm-push-4 col-md-4 col-lg-4 hidden-xs">

                <p style="color: #ffffff">Search: </p> <input class="awesomplete" list="mylist" placeholder="teacher name" />
    <datalist id="mylist">
    <option>Ada </option>
    <option>Java</option>
    <option>JavaScript</option>
    <option>Brainfuck</option>
    <option>LOLCODE</option>
    <option>Node.js</option>
    <option>Ruby on Rails</option>
    </datalist>
                <div class="list-group">
                    <a class="list-group-item" href="deleteStudent"><i class="fa fa-user-times fa-1x"></i>&nbsp;удалить</a>
                    <a class="list-group-item" href="changeStudent"><i class="fa fa-chain fa-1x"></i>&nbsp;изменить</a>
                </div>
    </div>
        </div>
</div>

</form:form>



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
