$(document).ready(function(){
    updateMenuItem();
})

function updateMenuItem() {
    var success = true;
    var obj = {id: 1};
    $.ajax({
        url: "/student/message/newamount",
        type: "POST",
        async: false,
        data: JSON.stringify(obj),
        contentType: "application/json; charset=utf-8",
        success: function (data, code, xhr) {
           $('#amount').html(data.amount);
        },
        error: function (jqXHR, textStatus, errorThrown) {
            success = false;
            console.log(jqXHR);
            console.log(errorThrown);
        },
        dataType: 'json'
    })


    if (!success) {
        alert("Ошибка соединения!")
    }
}