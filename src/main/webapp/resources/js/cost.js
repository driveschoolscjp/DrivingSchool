//работа калькулятора
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

