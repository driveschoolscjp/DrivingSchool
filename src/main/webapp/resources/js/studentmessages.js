var rowsNumber = 10;
var table = {};
var header = {};
var row = {};
var cell1 = {};
var cell2 = {};
var cell3 = {};
var cell4 = {};

$(document).ready(function () {
    updateMenuItem();
    table = document.getElementById("messagesTable");
    header = table.createTHead();
    row = header.insertRow(0);
    cell1 = row.insertCell(0);
    cell2 = row.insertCell(1);
    cell3 = row.insertCell(2);
    cell4 = row.insertCell(3);
    cell1.innerHTML = "<b>Дата</b>";
    cell2.innerHTML = "<b>Время</b>";
    cell3.innerHTML = "<b>Тема</b>";
    cell4.innerHTML = "<b>Сообщение</b>";
    $('#messagesItem').click(function () {
        loadDataIntoTable(1, rowsNumber);
        $('#myModal1').modal('show');
    });
})

function updateMenuItem() {
    var success = true;
    var obj = {};
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

function loadDataIntoTable(fromId, rowsNumber) {
    var success = true;
    var obj = {message_id: fromId, rows: rowsNumber};
    $.ajax({
        url: "/student/message/getmessages",
        type: "POST",
        async: false,
        data: JSON.stringify(obj),
        contentType: "application/json; charset=utf-8",
        success: function (data, code, xhr) {
            for (var i = 0; i < data.length; i++) {
                row = table.insertRow(0);
                cell1 = row.insertCell(0);
                cell2 = row.insertCell(1);
                cell3 = row.insertCell(2);
                cell4 = row.insertCell(3);
                cell1.innerHTML = data[i].dateTime.split("T")[0];
                cell2.innerHTML = data[i].dateTime.split("T")[1].split(".")[0];
                cell3.innerHTML = data[i].theme;
                cell4.innerHTML = data[i].message;
            }
        },
        error: function (jqXHR, textStatus, errorThrown) {
            success = false;
            console.log(jqXHR);
            console.log(errorThrown);
        },
        dataType: 'json'
    })
}