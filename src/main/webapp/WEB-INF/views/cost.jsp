<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="input" uri="http://www.springframework.org/tags/form" %>
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

<div class="container">

    <div class="price-box">

    <form class="form-horizontal form-pricing" role="form">

            <div class="price-slider">
                <h4 class="great">Обьем двигателя</h4>
                <span>1 - 15 литров</span>
                <div class="col-sm-12">
                    <div id="slider"></div>
                </div>
            </div>
            <div class="price-slider">
                <h4 class="great">KPP</h4>
                <div class="col-sm-12">

                        <span for="transmission">Transmission</span><br>


                        <div class="col-xs-6">
                            <input type="radio" name="genderS" id="r1" value="1" checked> MKP
                        </div>

                        <div class="col-xs-6">
                            <input type="radio" name="genderS" id = "r2" value="0" >AKP
                        </div>





                    <div class="price-slider">
                        <h4 class="great">Price/hour</h4>
                        <span>Minimum 1 day is required</span>
                        <div class="col-sm-12">
                            <div id="slider2"></div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="price-form">

                <div class="form-group">
                    <label for="amount" class="col-sm-6 control-label">Выбраный обьем: </label>
                    <div class="col-sm-6">
                        <input type="hidden" id="amount" class="form-control">
                        <p class="price lead" id="amount-label"></p>
                        <span class="price"> л.</span>
                    </div>
                </div>

                <div class="form-group">
                    <label for="duration" class="col-sm-6 control-label">Duration: </label>
                    <span class="help-text">Choose your commitment</span>
                    <div class="col-sm-6">
                        <input type="hidden" id="duration" class="form-control">
                        <p class="price lead" id="duration-label"></p>
                        <span class="price">days</span>
                    </div>
                </div>

                <hr class="style">
                <div class="form-group total">
                    <label for="total" class="col-sm-6 control-label"><strong>Стоимость обучения: </strong></label>
                    <div class="col-sm-6">
                        <input type="hidden" id="total" class="form-control">
                        <p class="price lead" id="total-label"></p>
                    </div>
                </div>

            </div>

            <div class="form-group">
                <div class="col-sm-12">
                    <button type="submit" class="btn btn-primary btn-lg btn-block">Подать заявку <span class="glyphicon glyphicon-chevron-right pull-right" style="padding-right: 10px;"></span></button>
                </div>
            </div>

        </form>


    </div>

</div>

<script>

    $(document).ready(function() {
        $("#slider").slider({
            animate: true,
            value:1,
            min: 1,
            max: 15,
            step: 0.1,
            slide: function(event, ui) {
                update(1,ui.value); //changed
            }
        });

        $("#slider2").slider({
            animate: true,
            value:10,
            min: 10,
            max: 10000,
            step: 1,
            slide: function(event, ui) {
                update(2,ui.value); //changed
            }
        });

        //Added, set initial value.
        $("#amount").val(0);
        $("#duration").val(0);
        $("#gendreS").val(0);
        $("#amount-label").text(0);
        $("#duration-label").text(0);

        update();
    });

    //changed. now with parameter
    function update(slider,val) {
        //changed. Now, directly take value from ui.value. if not set (initial, will use current value.)
        var $amount = slider == 1?val:$("#amount").val();
        var $duration = slider == 2?val:$("#duration").val();

        if (document.getElementById('r1').checked) {
          var kpp = document.getElementById('r1').value;
        }
        if (document.getElementById('r2').checked) {
        var  kpp2 = document.getElementById('r2').value;
        }
if (kpp !== 0) {
    $total = ($amount * $duration * 20 * 2) + " грн";
}
        else  if (kpp2 !== 0){
            $total = ($amount * $duration * 20 * 2 * 1.2) + " грн";
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
