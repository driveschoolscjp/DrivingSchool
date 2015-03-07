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

<div class="container-fluid">
<div class="row">
    <div class="col-xs-5 col-xs-offset-1">


    <div class="price-box">

    <form class="form-horizontal form-pricing" role="form" id = "myForm">

        <div class="price-slider">
            <h4 class="great">Трансмиссия</h4>
            <div class="col-xs-12">
                <div class="col-xs-6">
                    <input type="radio" name="gender" id="gender_Male" value="Male" checked onClick= "autoSelect(this,document.myForm.funds)" />МКПП &nbsp;&nbsp;
                    <input type="radio" name="gender" id="gender_Female" value="Female"  checked onClick= "autoSelect(this,document.myForm.funds)" />АКПП
                </div>
            </div>
        </div>

           <div class="price-slider">
                <h4 class="great">Мощьность двигателя</h4>
                <span>150 - 1200 л.с.</span>
                <div class="col-xs-12">
                    <div id="slider"></div>
                </div>
            </div>

                <div class="price-slider">
                        <h4 class="great">Цена/ час аренды авто</h4>
                    <span>10 - 10000 $</span>
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
            <button type="submit" class="btn btn-primary btn-md btn-block">Подать заявку</button>
        </div>




                <div class="form-group">
                    <input type="hidden" id="amount" class="form-control">
                </div>

                <div class="form-group">
                        <input type="hidden" id="duration" class="form-control">
                </div>




        </form>
    </div>

</div>
</div>
</div>
<script>




    $(document).ready(function() {

        function autoSelect(memberType, fundsType)
        {
       if(memberType.value=="Male")
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

        if(document.getElementById('gender_Male').checked) {
            $total = (($amount / 100) * $duration * 20 * 2) + " $";
        }else if(document.getElementById('gender_Female').checked) {
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
