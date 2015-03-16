<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>

<html>
<head>
    <title>Расписание занятий вождением</title>
    <link rel="shortcut icon" href="http://s3.gazu.ru/favicon.ico" type="image/x-icon">
    <script src="/js/jquery-1.11.2.min.js"></script>
    <script src="/js/daypilot-calendar.src.js"></script>
    <script src="/js/daypilot-navigator.src.js"></script>
    <script src="/js/daypilot-common.src.js"></script>
    <script src="/js/bootstrap.js"></script>
    <script src="/js/typeahead.bundle.js"></script>

    <link href="/css/bootstrap.css" rel="stylesheet">
    <link href="/css/default.css" rel="stylesheet">
    <link href="/css/font-awesome.css" rel="stylesheet">
    <link href="/css/schedule.css" rel="stylesheet">
    <link href="/css/my.css" rel="stylesheet">

</head>
<body>

<jsp:include page="header.jsp"/>
<jsp:include page="menu.jsp"/>

<div class="body container-fluid">
<div class="container-fluid">
    <div class="col-xs-3">

        <div id="nav"></div>
        <br>
        <script>
            var currentUser = {
                isadmin: false,
                s: {
                    "id": "${student.id}",
                    "firstname": "${student.firstname}",
                    "lastname": "${student.lastname}",
                    "tel": "${student.tel}",
                    "group": {"name": "${student.group.name}"},
                    "instructor": {
                        "id": "${student.instructor.id}",
                        "firstname": "${student.instructor.firstname}",
                        "lastname": "${student.instructor.lastname}",
                        "patronymic": "${student.instructor.patronymic}"
                    }
                }
            }
        </script>
        <sec:authorize ifAnyGranted="ROLE_ADMIN">
            <script>
                currentUser.isadmin = true;
            </script>


                    <div class="list-group">
                        <h4><span class="label label-primary"> Студент:</span></h4>
                    </div>
                    <div class="list-group">
                        <div id="studentField">
                            <input class="typeahead form-control" type="text" placeholder="Поиск">
                        </div>
                    </div>
                    <div class="list-group">
                        <h4><span class="label label-primary"> Инструктор:</span></h4>
                    </div>
                    <div class="list-group">
                        <div id="instructorField">
                            <input class="typeahead form-control" type="text" placeholder="Поиск">
                        </div>
                    </div>
                    <br>

                    <div class="list-group">
                        <form id="onCreateForm" name="onCreateForm" style="color: white">
                            <p><b>Создать:</b></p>

                            <div class="btn-group" data-toggle="buttons">
                                <label class="btn btn-primary active">
                                    <input type="radio" name="interval_type" value="nolesson" id="option1" autocomplete="off" checked> Нерабочее время
                                </label>
                                <label class="btn btn-primary">
                                    <input type="radio" name="interval_type" value="lesson" id="option2" autocomplete="off"> Занятие
                                </label>
                            </div>
                            <p><input type="checkbox" id="isemail"  checked="checked"> <b>E-mail</b></p>
                        </form>



            </div>
        </sec:authorize>
    </div>
    <div class="col-xs-9">
        <div id="dp">

        </div>
    </div>
</div>

</div>
<jsp:include page="footer.jsp"/></div>

<script src="/js/schedule.js"></script>
</body>
</html>
