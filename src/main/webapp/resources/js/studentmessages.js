var rowsNumber = 10;
var curIdNext = {};
var curIdPrev = {};
var all = {};
var table = {};
var body = {};
var row = {};
var cell1 = {};
var cell2 = {};
var cell3 = {};
var page = {};
var curPages = {};
var checkboxes = [];

$(document).ready(function () {
    updateMenuItem();
    table = document.getElementById("messagesTable");
    body = table.appendChild(document.createElement('tbody'));
    $('#prev1').click(function () {
        if (page > 1) {
            page--;
            loadDataIntoTable(curIdPrev, rowsNumber, false);
        }
    })
    $('#next1').click(function () {
        if (page < curPages) {
            page++;
            loadDataIntoTable(curIdNext, rowsNumber, true);
        }
    })
    $('#delButton').click(function () {
        var array = new Array();
        $('.deletecheckbox .checkbox input:checkbox:checked').each(function () {
            array.push(this.parentNode.parentNode.parentNode.parentNode.getElementsByClassName("themeandmessage")[0]
                .getAttribute("message_id"));
        });
        var success = true;
        $.ajax({
            url: "/student/message/deletemessages",
            type: "POST",
            async: false,
            data: JSON.stringify(array),
            contentType: "application/json; charset=utf-8",
            success: function (data, code, xhr) {
                loadDataIntoTable(curIdPrev, rowsNumber, -1);

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
    });

    $('#messagesItem').click(function () {
        page = 1;
        curIdNext = 0;
        curIdPrev = 0;
        curPages = 2;
        $('#messageText').hide();
        $('#backButton').hide();
        loadDataIntoTable(curIdPrev, rowsNumber, -1);
        $('#pageList').show();
        $('#delButton').show();
        $('#messagesTable').show();
        loadDataIntoTable(0, rowsNumber, true);
        updatePagination();
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

function loadDataIntoTable(fromId, rowsNumber, isBack) {
    updateMenuItem();
    $("#messagesTable tr").remove();
    checkboxes.splice(0, checkboxes.length);
    var success = true;
    var obj = {message_id: fromId, rows: rowsNumber, back: isBack};
    $.ajax({
        url: fromId === 0 ? "/student/message/getstartmessages" : (isBack === -1 ? "/student/message/getmessagesequal"
            : "/student/message/getmessages"),
        type: "POST",
        async: false,
        data: JSON.stringify(obj),
        contentType: "application/json; charset=utf-8",
        success: function (data, code, xhr) {
            if (data.all == 0) {
                $('.pager').hide();
                row = body.insertRow(i);
                cell1 = row.insertCell(0);
                cell1.innerHTML = "У Вас нет ни одного сообщения!";
                return;
            }
            curPages = Math.ceil(data.all / rowsNumber);
            curIdPrev = data.messages[0].id;
            updatePagination();
            for (var i = 0; i < data.messages.length; i++) {
                row = body.insertRow(i);
                if (!data.messages[i].old) {
                    row.classList.add("newmessage");
                }
                cell1 = row.insertCell(0);
                cell1.width = '5%';
                cell1.classList.add("deletecheckbox");
                cell2 = row.insertCell(1);
                cell2.width = '70%';
                cell2.classList.add("themeandmessage");
                cell2.setAttribute('message_id', data.messages[i].id);
                var clickHandler =
                    function (c) {
                        return function () {
                            showMessage(c.getAttribute('message_id'));
                        };
                    };
                cell2.onclick = clickHandler(cell2);
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

                if (i == (data.messages.length - 1)) {
                    curIdNext = data.messages[i].id;
                }

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
            $('#pageList').hide();
            $('#delButton').hide();
            $('#themearea').html(data.theme);
            $('#messagearea').html(data.message);
            $('#messageText').
                removeClass('hide');
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
    loadDataIntoTable(curIdPrev, rowsNumber, -1);
    $('#pageList').show();
    $('#delButton').show();
    $('#messagesTable').show();
}

function updatePagination() {
    $('#current1').html(page + " из " + curPages);
}
