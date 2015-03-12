<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<html>
<head>
    <title>Cost</title>


    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Home</title>

    <!-- css -->
    <link href="/css/bootstrap.css" rel="stylesheet">
    <link href="/css/default.css" rel="stylesheet">
    <link href="/css/font-awesome.css" rel="stylesheet">
    <link href="/css/cost.css" rel="stylesheet">
    <!--js-->
    <script src="/js/bootstrap.js"></script>
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="/js/bootstrap.js"></script>


    <!--FOR Google-->
    <script type='text/javascript' src='http://ajax.googleapis.com/ajax/libs/jquery/1.4/jquery.min.js'></script>
    <script type='text/javascript' src='js/example.js'></script>
    <script type='text/javascript' src='http://maps.google.com/maps/api/js?sensor=true'></script>
</head>
<body>


<jsp:include page="header.jsp"/>
<jsp:include page="menu.jsp"/>

<div class="body">
    <div class="container-fluid">
        <div class="row">
            <br/>
            <div class="col-xs-7 blackback">
                <div class="table-responsive">
                    <table id="table" class="table">
                        <thead>
                        <tr>
                            <th>Авто</th>
                            <th>$/час</th>
                            <th>КПП</th>
                            <th>л.c.</th>
                            <th>Инструктор</th>
                            <th></th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="car" items="${cars}">
                            <form:form action="/registration?id=${car.id}" method="post">
                                <tr>
                                    <td>${car.brand} ${car.model}</td>
                                    <td>${car.pricePerHour}</td>
                                    <td>${car.transmission}</td>
                                    <td>${car.horsePower}</td>
                                    <td>
                                       ${car.instructor.firstname} ${car.instructor.lastname}</td>
                                    <td>
                                        <div class="btn-group" role="group">
                                            <a href="/show?id=${car.id}" title="Посмотреть подробности" type="button"
                                               class="btn btn-primary"><i class="fa fa-search"></i></a>
                                            <button class="btn btn-primary" type="submit" title="Подать заявку"><i
                                                    class="fa fa-pencil-square-o"></i></button>
                                        </div>
                                    </td>
                                </tr>
                            </form:form>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>

            <div class="col-xs-4 col-xs-offset-1">
                <div class="price-box  blackback">

                    <form:form class="form-horizontal form-pricing" role="form" id="myForm" action="/cost"
                               method="post"
                               modelAttribute="car">

                    <form:hidden path="id"/>


                    <div class="price-slider">
                        <h4 class="great">Трансмиссия</h4>

                        <div class="col-xs-12">
                            <div class="row">
                                <form:radiobutton path="transmission" name="transmission" id="AKPP" value="AUTO"
                                                  checked="checked" onClick="autoSelect(this,document.myForm.funds)"/>АКПП
                                <img id="imgInLine2" class="img-responsive"
                                     src="/images/horse.png"/>
                                <form:radiobutton path="transmission" name="transmission" id="MKPP" value="MANUAL"
                                                  onClick="autoSelect(this,document.myForm.funds)"/>МКПП <img
                                    id="imgInLine"
                                    class="img-responsive"
                                    src="/images/horse.png"/>
                            </div>
                        </div>
                    </div>

                    <div class="price-slider">
                        Максимальная мощьность двигателя
                        <i class="fa fa-tachometer fa-1x"></i>

                        <div class="col-xs-12">
                            <div id="slider"></div>
                        </div>
                    </div>
                    <div class="price-slider">
                                    <p style="font-size: 12px">
                        Максимальная цена/ час аренды</p>
                        <i class="fa fa-money fa-2x"></i>
                        <br/>
                        <br/>
                         <div class="col-xs-12">

                            <div id="slider2"></div>
                            <br>
                        </div>
                    </div>


                    <div class="price-slider">
                        <h4 class="great">Стоимость курса</h4>

                        <div class="col-xs-12">
                            <div class="row">
                                <label>10 занятий: $</label>
                                <b id="total-label" style="font-size: 20px;"></b>
                            </div>

                            <div class="row">
                                <label>15 занятий: $</label>
                                <b id="total-label1" style="font-size: 20px;"></b>
                            </div>

                            <div class="row">
                                <label>20 занятий: $</label>
                                <b id="total-label2" style="font-size: 20px;"></b>
                            </div>
                            <br/>

                            <div class="col-xs-8 col-xs-offset-2">
                                <button type="submit" class="btn btn-primary">Подобрать авто</button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <form:input path="horsePower" type="hidden" id="horse" class="form-control"/>
                </div>

                <div class="form-group">
                    <form:input path="pricePerHour" type="hidden" id="cost" class="form-control"/>
                </div>

                </form:form>
            </div>


        </div>

    </div>

</div>

<jsp:include page="footer.jsp"/>



<script src="https://code.jquery.com/ui/1.10.4/jquery-ui.min.js"></script>
<script src="/js/cost.js"></script>
</body>
</html>
