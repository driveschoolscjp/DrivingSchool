var students = new Bloodhound({
    datumTokenizer: Bloodhound.tokenizers.obj.whitespace(),
    queryTokenizer: Bloodhound.tokenizers.whitespace,
    remote: '/scheduler/search/student/%QUERY',
    cache: false
});

var groups = new Bloodhound({
    datumTokenizer: Bloodhound.tokenizers.obj.whitespace(),
    queryTokenizer: Bloodhound.tokenizers.whitespace,
    remote: '/scheduler/search/group/%QUERY',
    cache: false
});

students.initialize();
groups.initialize();

var currentId = 0;
var isGM = false;

$(document).ready(function () {
    $('#messageField .typeahead').typeahead(null, {
        displayKey: function(d) {
            return d['firstname'] + " " + d['lastname'] + " " + d.group['name']
        },
        source: students.ttAdapter()
    })

    $("#student1").click(function() {
        $('#messageField .typeahead').typeahead('val', "");
        $('#messageField .typeahead').typeahead('destroy');
        $('#messageField .typeahead').typeahead(null, {
            displayKey: function(d) {
                return d['firstname'] + " " + d['lastname'] + " " + d.group['name']
            },
            source: students.ttAdapter()
        })
        isGM = false;
    });

    $("#group1").click(function() {
        $('#messageField .typeahead').typeahead('val', "");
        $('#messageField .typeahead').typeahead('destroy');
        $('#messageField .typeahead').typeahead(null, {
            displayKey:  function(d) {
                return d['name']
            },
            source: groups.ttAdapter()
        })
        isGM = true;
    });

    $('#messageField .typeahead').click(function() {
        $('#messageField .typeahead').typeahead('val', "");
    });

    $('#messageField .typeahead').on('typeahead:selected', function (evt, data) {
        currentId = data.id;
    })

    $('#submitMF').click(function() {
        if (currentId == 0 ) {
            return;
        }
        if (($('#theme').val()).trim() === "") {
            return
        }
        if (($('#message1').val()).trim() === "") {
            return
        }
        var obj = { theme: $('#theme').val(),
                    message: $('#message1').val(),
                    isEmail: $('#isEmail').is(':checked'),
                    current_id: currentId,
                    isGroupMessage: isGM };
        console.log(obj);
        var success = true;
        console.log(JSON.stringify(obj));
        $.ajax({
            url: "/admin/message/send",
            type: "POST",
            async: false,
            contentType: "application/json; charset=utf-8",
            data: JSON.stringify(obj),
            error: function (jqXHR, textStatus, errorThrown) {
                success = false;
                console.log(jqXHR);
                console.log(errorThrown);
            },
            dataType: 'json'
        })
        $('#myModal2').modal('hide');
        $('#messageField .typeahead').typeahead('val', "");
        $('#theme').val('');
        $('#message1').val('');
        currentId = 0;
        if (!success) {
            alert("Ошибка. Сообщение не доставлено!")
        }
    });
})

function adminMessageFromStudents(id, fname, lname, gname) {
    currentId = id;
    isGM = false;
    $('#messageField .typeahead').typeahead('val', fname + " " + lname + " " + gname);
    $('#group1').removeClass('active');
    $('#student1').addClass('active');
    $('#myModal2').modal('show');
}

function adminMessageFromGroups(id, gname) {
    currentId = id;
    isGM = true;
    $('#messageField .typeahead').typeahead('val', gname);
    $('#student1').removeClass('active');
    $('#group1').addClass('active');
    $('#myModal2').modal('show');
}

function showModal2() {
    currentId = 0;
    isGM = false;
    $('#messageField .typeahead').typeahead('val', "");
    $('#messageField .typeahead').typeahead('destroy');
    $('#messageField .typeahead').typeahead(null, {
        displayKey: function(d) {
            return d['firstname'] + " " + d['lastname'] + " " + d.group['name']
        },
        source: students.ttAdapter()
    })
    $('#group1').removeClass('active');
    $('#student1').addClass('active');
    $('#theme').val('');
    $('#message1').val('');
    $('#myModal2').modal('show');
}
