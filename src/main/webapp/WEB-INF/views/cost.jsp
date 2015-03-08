<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<html>
<head>
    <title>Contacts</title>


    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Home</title>

    <!-- css -->
    <link href="/css/bootstrap.css" rel="stylesheet">
    <link href="/css/default.css" rel="stylesheet">
    <link href="/css/font-awesome.css" rel="stylesheet">
    <link href="/css/costs.css" rel="stylesheet">
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


<jsp:include page="header.jsp" />
<jsp:include page="menu.jsp" />

<div class="body">
<div class="container-fluid">
<div class="row">
    <div class="col-xs-4 col-xs-offset-1">

        <div class="price-box">

            <form class="form-horizontal form-pricing" role="form" id = "myForm" action="/searchCost" method="post" modelAttribute="car">

                <form:hidden path="car.id"/>
                <div class="price-slider">
                    <h4 class="great">Трансмиссия</h4>
                    <div class="col-xs-12">
                        <div class="row">
                            <form:radiobutton  path = "car.transmission"  name="transmission" id="AKPP" value="AUTO" checked="checked" onClick= "autoSelect(this,document.myForm.funds)"  />АКПП <img id="imgInLine2" class="img-responsive"
                                                                                                                                                                                                      src="/images/horse.png"/>
                            <form:radiobutton  path="car.transmission"  name="transmission" id="MKPP" value="MANUAL"   onClick= "autoSelect(this,document.myForm.funds)" />МКПП <img id="imgInLine" class="img-responsive"                                                                                                                                                                                   src="/images/horse.png"/>
                        </div>
                    </div>
                </div>

                <div class="price-slider">
                    <h4 class="great">Мощьность двигателя</h4>
                    <span>150 - 1200 <img id="imgInLine3" class="img-responsive"
                                          src="/images/kpp.png"/></span>
                    <div class="col-xs-12">
                        <div id="slider"></div>
                    </div>
                </div>

                <div class="price-slider">
                    <h4 class="great">Цена/ час аренды авто</h4>
                    <span>10 - 10000 <img id="imgInLine4" class="img-responsive"
                                          src="/images/dollars.png"/></span>
                    <div class="col-xs-12">
                        <div id="slider2"></div>
                        <br>
                        <label  class="col-xs-3 control-label col-xs-offset-1"><strong> Стоимость: </strong></label>
                        &nbsp;
                        <p class="price lead" id="total-label"></p>
                        <br>
                    </div>
                </div>

                <div class="col-sm-8 col-xs-offset-2">
                    <div class="btn-group-vertical" role="group">
                    <button type="submit" class="btn btn-primary btn-block">Подобрать авто</button>
                    <a href="#" type= "button" class="btn btn-primary btn-block">Подать заявку</a>
                </div>
                </div>


                    <div class="form-group">
                        <form:input path="car.engineSize" type="hidden" id="amount" class="form-control"/>
                    </div>

                    <div class="form-group">
                        <form:input  path="car.pricePerHour"   type="hidden" id="duration" class="form-control"/>
                    </div>

            </form>
        </div>

    </div>
    <div class = "col-xs-7">


        <table class="table-fill" id="table">
            <thead>
            <tr>
                <th  class="text-left">&nbsp;Марка&nbsp;</th>
                <th  class="text-left">&nbsp;Модель&nbsp;</th>
                <th  class="text-left">&nbsp;Usd/Час&nbsp;</th>
                <th  class="text-left">&nbsp;КПП&nbsp;</th>
                <th  class="text-left">&nbsp;Мощьность л.c.&nbsp;</th>
                <th  class="text-left">&nbsp;Инструктор&nbsp;</th>
                <th  class="text-left">&nbsp;/&nbsp;</th>
            </tr>
            </thead>
            <tbody class="table-hover">
            <c:forEach var="car" items="${cars}">
                <tr>
                    <td   class="text-left">&nbsp;${car.brand}&nbsp;</td>
                    <td   class="text-left">&nbsp;${car.model}&nbsp;</td>
                    <td   class="text-left">&nbsp;${car.pricePerHour}&nbsp;</td>
                    <td   class="text-left">&nbsp;${car.transmission}&nbsp;</td>
                    <td   class="text-left">&nbsp;${car.engineSize}&nbsp;</td>
                    <td   class="text-left">&nbsp;${car.instructor.firstname}&nbsp; ${car.instructor.lastname} &nbsp;</td>
                    <td   class="text-left">&nbsp;
                        <div class="btn-group-vertical pull-right">
                             <a href="#" type="button"
                               class="btn btn-primary btn-sm"><i class="fa fa-search fa-xs">
                                смотреть детали</i> </a>
                        </div>
                        &nbsp;
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>
</div>
    </div>
<jsp:include page="footer.jsp" />
<script>




    $(document).ready(function() {

        function autoSelect(memberType, fundsType)
        {
       if(memberType.value=="AKPP")
            {    fundsType[0].checked=true;
                  }

            else
            { fundsType[1].checked=true;
                 }
        }


        $("#slider").slider({
            animate: true,
            value:150,
            min: 150,
            max: 1200,
            step: 25,

            slide: function(event, ui) {
                update(1,ui.value); //changed
            }
        });

        $("#slider2").slider({
            animate: true,
            value:10,
            min: 10,
            max: 10000,
            step: 15,
            slide: function(event, ui) {
                update(2,ui.value); //changed
            }
        });

        //Added, set initial value.
        $("#amount").val(0);
        $("#duration").val(0);
        $("#amount-label").text(0);
        $("#duration-label").text(0);

        update();
    });



    //changed. now with parameter
    function update(slider,val) {


        //changed. Now, directly take value from ui.value. if not set (initial, will use current value.)
        var $amount = slider == 1?val:$("#amount").val();
        var $duration = slider == 2?val:$("#duration").val();

        if(document.getElementById('MKPP').checked) {
            $total = (($amount / 100) * $duration * 20 * 2) + " $";
        }else if(document.getElementById('AKPP').checked) {
            $total = (($amount/ 100) * $duration * 20 * 2 * 1.2) + " $";
        }


        $( "#amount" ).val($amount);
        $( "#amount-label" ).text($amount);
        $( "#duration" ).val($duration);
        $( "#duration-label" ).text($duration);
        $( "#total" ).val($total);
        $( "#total-label" ).text($total);

        $('#slider a').html('<label><span class="glyphicon glyphicon-chevron-left"></span> '+$amount+' <span class="glyphicon glyphicon-chevron-right"></span></label>');
        $('#slider2 a').html('<label><span class="glyphicon glyphicon-chevron-left"></span> '+$duration+' <span class="glyphicon glyphicon-chevron-right"></span></label>');
    }

</script>

<script src="https://code.jquery.com/ui/1.10.4/jquery-ui.min.js"></script>
</body>
</html>
