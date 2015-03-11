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
                            <th> </th>
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
                <div class="price-box">

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
                        <h4 class="great">Максимальная мощьность двигателя</h4>
                    <img id="imgInLine3" class="img-responsive"
                                          src="/images/kpp.png"/>

                        <div class="col-xs-12">
                            <div id="slider"></div>
                        </div>
                    </div>
                    <div class="price-slider">
                        <h4 class="great">Максимальная цена/ час аренды</h4>
                    <img id="imgInLine4" class="img-responsive"
                                        src="/images/dollars.png"/>

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
                                <b id="total-label" style="font-size: 20"></b>
                            </div>

                            <div class="row">
                                <label>15 занятий: $</label>
                                <b id="total-label1" style="font-size: 20"></b>
                            </div>

                            <div class="row">
                                <label>20 занятий: $</label>
                                <b id="total-label2" style="font-size: 20"></b>
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


<script>
    $(document).ready(function () {

        function autoSelect(memberType, fundsType) {
            if (memberType.value == "AKPP") {
                fundsType[0].checked = true;
            }

            else {
                fundsType[1].checked = true;
            }
        }


        $("#slider").slider({
            animate: true,
            value: 0,
            min: 150,
            max: 1200,
            step: 1,

            slide: function (event, ui) {
                update(1, ui.value); //changed
            }
        });

        $("#slider2").slider({
            animate: true,
            value: 0,
            min: 1,
            max: 1000,
            step: 1,
            slide: function (event, ui) {
                update(2, ui.value); //changed
            }
        });

        //Added, set initial value.
//        $("#horse").val(0);
//        $("#cost").val(0);
//        $("#horse-label").text(0);
//        $("#cost-label").text(0);

        update();
    });


    //changed. now with parameter
    function update(slider, val) {


        //changed. Now, directly take value from ui.value. if not set (initial, will use current value.)
        var $horse = slider == 1 ? val : $("#horse").val();
        var $cost = slider == 2 ? val : $("#cost").val();


        $total = ( $cost * 10 * 2).toFixed(2);
        $total1 = ( $cost * 15 * 2).toFixed(2);
        $total2 = ($cost * 20 * 2).toFixed(2);

        $("#horse").val($horse);
        $("#horse-label").text($horse);
        $("#cost").val($cost);
        $("#cost-label").text($cost);

        $("#total").val($total);
        $("#total-label").text($total);

        $("#total1").val($total1);
        $("#total-label1").text($total1);

        $("#total2").val($total2);
        $("#total-label2").text($total2);

        $('#slider a').html('<label><span class="glyphicon glyphicon-chevron-left"></span> ' + $horse + ' <span class="glyphicon glyphicon-chevron-right"></span></label>');
        $('#slider2 a').html('<label><span class="glyphicon glyphicon-chevron-left"></span> ' + $cost + ' <span class="glyphicon glyphicon-chevron-right"></span></label>');
    }

</script>

<script src="https://code.jquery.com/ui/1.10.4/jquery-ui.min.js"></script>
</body>
</html>
