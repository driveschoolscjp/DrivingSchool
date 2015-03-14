var rowsNumber = 10;
var table = {};
var body = {};
var row = {};
var cell1 = {};
var cell2 = {};
var cell3 = {};
var page = {};

$(document).ready(function () {
    page = 1;
    updateMenuItem();
    table = document.getElementById("messagesTable");
    body = table.appendChild(document.createElement('tbody'));
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
            if (data.amount == 0) {
                $('#amount').hide();
            } else {
                $('#amount').removeClass('hide');
                $('#amount').show();
            }
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
    updateMenuItem();
    $("#messagesTable tr").remove();
    var success = true;
    var obj = {message_id: fromId, rows: rowsNumber};
    $.ajax({
        url: "/student/message/getmessages",
        type: "POST",
        async: false,
        data: JSON.stringify(obj),
        contentType: "application/json; charset=utf-8",
        success: function (data, code, xhr) {
            createPagination(data.all);
            for (var i = 0; i < data.messages.length; i++) {
                row = body.insertRow(i);
                row.setAttribute('message_id', data.messages[i].id);
                if (!data.messages[i].old) {
                    row.classList.add("newmessage");
                }
                var clickHandler =
                    function(row)
                    {
                        return function() {
                            showMessage(row.getAttribute('message_id'));
                        };
                    };
                row.onclick = clickHandler(row);

                cell1 = row.insertCell(0);
                cell1.width = '5%';
                cell1.classList.add("deletecheckbox");
                cell2 = row.insertCell(1);
                cell2.width = '70%';
                cell2.classList.add("themeandmessage");
                cell3 = row.insertCell(2);
                cell3.width = '25%';
                cell3.classList.add("dateofmessage");
                cell1.innerHTML = "<div class='checkbox'><label><input type='checkbox'></label></div>";
                cell2.innerHTML = "<div class='theme'><span>" + data.messages[i].theme + " </span><span class='message'>"
                    + data.messages[i].message + "</span></div>";

                var now = new Date();
                var date = data.messages[i].dateTime.split('T')[0];
                var time = data.messages[i].dateTime.split('T')[1].split(':')[0] + ":" + data.messages[i].dateTime.split('T')[1].split(':')[1];

                var past = new Date();
                past.setFullYear(date.split('-')[0]);
                past.setMonth(date.split('-')[1] - 1);
                past.setDate(date.split('-')[2]);

                if (now.getFullYear() === past.getFullYear() && now.getMonth() === past.getMonth()) {
                    if (now.getDate() === past.getDate()) {
                        var inner = "Сегодня, " + time;

                    } else if (now.getDate() === past.getDate() + 1) {
                        var inner = "Вчера, " + time;
                    } else if (now.getDate() === past.getDate() + 2) {
                        var inner = "Позавчера, " + time;
                    } else {
                        var inner = date.split('-')[2] + "-" + date.split('-')[1] + "-" + date.split('-')[0] +
                            " " + time;
                    }
                } else {
                    var inner = date.split('-')[2] + "-" + date.split('-')[1] + "-" + date.split('-')[0] + " " + time;
                }
                cell3.innerHTML = inner;
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

function showMessage(id) {
    var obj = {message_id: id};
    $.ajax({
        url: "/student/message/getmessage",
        type: "POST",
        async: false,
        data: JSON.stringify(obj),
        contentType: "application/json; charset=utf-8",
        success: function (data, code, xhr) {
            $('#messagesTable').hide();
            $('#themearea').html(data.theme);
            $('#messagearea').html(data.message);
            $('#messageText').removeClass('hide');
            $('#messageText').show();
            markMessageAsOld(id);
            $('#backButton').removeClass('hide');
            $('#backButton').show();
        },
        error: function (jqXHR, textStatus, errorThrown) {
            success = false;
            console.log(jqXHR);
            console.log(errorThrown);
        },
        dataType: 'json'
    })
}

function markMessageAsOld(id) {
    var obj = {message_id: id};
    $.ajax({
        url: "/student/message/setold",
        type: "POST",
        async: false,
        data: JSON.stringify(obj),
        contentType: "application/json; charset=utf-8",
        success: function (data, code, xhr) {
            updateMenuItem();
        },
        error: function (jqXHR, textStatus, errorThrown) {
            console.log(jqXHR);
            console.log(errorThrown);
        },
        dataType: 'json'
    })
}

function backToTable() {
    $('#messageText').hide();
    $('#backButton').hide();
    loadDataIntoTable(1, rowsNumber);
    $('#messagesTable').show();
}

function getAllCount(id) {
    var success = true;
    var obj = {};
    $.ajax({
        url: "/student/message/allamount",
        type: "POST",
        async: false,
        data: JSON.stringify(obj),
        contentType: "application/json; charset=utf-8",
        success: function (data, code, xhr) {
            all = data.amount;
        },
        error: function (jqXHR, textStatus, errorThrown) {
            success = false;
            console.log(jqXHR);
            console.log(errorThrown);
        },
        dataType: 'json'
    })
}

function createPagination(amount) {
    pages = Math.ceil(amount / rowsNumber);
    if (pages < 11) {
        for (var i = 0; i < pages; i++) {
           // pagelist.
        }
    }
}