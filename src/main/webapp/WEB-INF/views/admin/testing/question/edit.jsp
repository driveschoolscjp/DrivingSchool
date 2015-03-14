<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<html>
<head>
    <title>Testing</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap -->
    <link href="/css/bootstrap.css" rel="stylesheet">
    <link href="/css/default.css" rel="stylesheet">
    <link href="/css/font-awesome.css" rel="stylesheet">
    <script src="../../../assets/js/ie10-viewport-bug-workaround.js"></script>

    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="/js/bootstrap.js"></script>

</head>

<body>
<jsp:include page="../../../header.jsp"/>
<jsp:include page="../../../menu.jsp"/>

<div class="body">
    <div class="container-fluid">
        <div class="row">
            <div class="col-xs-11">
                <br/>
                <div class="container-fluid whiteback">
                    <form:form action="/admin/testing/question/save" method="post" modelAttribute="question">
                        <form:hidden path="id" />
                        <form:hidden path="ticket.id" />
                        <h3 class="text-center">Редактор вопросов</h3>
                        <hr/>
                        <div class="row">
                            <div class="col-xs-4 col-xs-offset-1">
                                <h3>Билет номер ${question.ticket.number}</h3>
                            </div>

                            <div class="col-xs-5 col-xs-offset-2 pull-right">
                                <br/>
                                <div class="btn-group" role="group" aria-label="...">
                                    <a href="/admin/testing/exam/search" type="button" class="btn btn-primary"  title="Экзамены">
                                        <i class="fa fa-undo"> экзамены</i></a>

                                    <a href="/admin/testing/exam/search" type="button" class="btn btn-primary"  title="Выбранный экзамен">
                                        <i class="fa fa-undo"> ${ question.ticket.exam.name}</i></a>

                                    <a href="/admin/testing/question/search?id=${question.ticket.id}" type="button" class="btn btn-primary"   title="Выбранный билет">
                                        <i class="fa fa-undo"> ${question.ticket.number}</i></a>
                                </div>
                            </div>
                        </div>



                        <hr>

                        <fieldset>
                            <div class="form-group col-xs-1">
                                <label for="number">Вопрос:</label>
                                <form:input path="number" class="form-control" placeholder="Black"
                                            readonly="true"/>
                            </div>


                            <div class="form-group col-xs-3 col-xs-offset-1">
                                <label for="pathToPicture">Картинка:</label>
                                <form:input path="pathToPicture" class="form-control" placeholder="http://"
                                            />
                                <c:if test="${question.pathToPicture!=null}">
                                    <div class="text-center">
                                        <br/>
                                    <img src="${question.pathToPicture}">
                                    </div>
                                </c:if>
                            </div>

                            <div class="form-group col-xs-6 ">
                                <label>Тема:</label><br/>
                                <form:select path="theme.id" class="selectpicker form-control" required="required">
                                    <c:forEach items="${themes}" var="theme">
                                        <option value="${theme.id}" ${question.theme.id==theme.id?"selected":""}>${theme.name}</option>
                                    </c:forEach>
                                </form:select>
                            </div>

                        </fieldset>
                        <hr>

                        <fieldset>
                            <label>Текст вопроса:</label><br/>
                            <form:textarea path="ques" class="form-control" cols= "20" rows= "3"
                                           placeholder="Question" required="required" autofocus=""/>
                        </fieldset>
                        <hr/>
                        <fieldset>
                            <label>Текст обьяснения:</label><br/>
                            <form:textarea path="description" class="form-control" cols= "20" rows= "6"
                                           placeholder="Description" required="required" autofocus=""/>
                        </fieldset>

                    <hr/>
                    <c:forEach items="${answers}" var="answ">
                        <c:choose>
                    <c:when test="${answ.correct}">

                        <div class="form-group col-xs-3 col-xs-offset-1">
                            <label>Правильный ответ:</label><br/>
                            <textarea style="background-color: #00e019" class="form-control" cols="10" rows="3"
                                      readonly="true">${answ.ans}</textarea>

                            <div class="col-xs-10 col-xs-offset-1">
                                <br/>
                            <a href="/admin/testing/question/editAnswer?id=${answ.id}" type="button" class="btn btn-success">
                                Редактировать
                            </a>
                                </div>
                        </div>

                    </c:when>
                            <c:otherwise>
                        <div class="form-group col-xs-3 col-xs-offset-1">
                            <label>Неправильный ответ:</label><br/>
                            <textarea style="background-color: #ff1000" class="form-control" cols="10" rows="3"
                                      readonly="true">${answ.ans}</textarea>

                           <div class="col-xs-10 col-xs-offset-1">
                               <br/>
                            <a href="/admin/testing/question/editAnswer?id=${answ.id}" type="button" class="btn btn-primary btn-success">
                                Редактировать
                            </a>
                         </div>
                        </div>
                            </c:otherwise>
                        </c:choose>
                       </c:forEach>
                        <label><br/></label>
                        </fieldset>

                        <div class="text-center">
                            <div class="btn-group" role="group" aria-label="...">
                                <a href="/admin/testing/question/addAnswer?id=${question.id}" type="button" class="btn btn-primary">
                                    Добавить ответ
                                </a>
                            <button class="btn  btn-primary" type="submit">Сохранить вопрос</button>
                        </div>
                            </div>
                    </form:form>

                </div>
            </div>
        </div>
    </div>
</div>
<br/>
<jsp:include page="../../../footer.jsp"/>
</body>
</html>
