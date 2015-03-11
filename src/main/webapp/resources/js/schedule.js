var nav = new DayPilot.Navigator("nav");
nav.showMonths = 1;
nav.selectMode = "week";

var dp = new DayPilot.Calendar("dp");
dp.viewType = "Week";
dp.heightSpec = "Full";
dp.ShowToolTip = true;
dp.eventMoveHandling = "Update";
dp.HeightSpec = "BusinessHoursNoScroll";
dp.theme = "my";
dp.cssOnly=false;
nav.init();
dp.init();

var currentAdmin = {};

var students = new Bloodhound({
    datumTokenizer: Bloodhound.tokenizers.obj.whitespace(),
    queryTokenizer: Bloodhound.tokenizers.whitespace,
    remote: '/scheduler/search/student/%QUERY',
    cache: false
});

var instructors = new Bloodhound({
    datumTokenizer: Bloodhound.tokenizers.obj.whitespace(),
    queryTokenizer: Bloodhound.tokenizers.whitespace,
    remote: '/scheduler/search/teacher/%QUERY',
    cache: false
});

students.initialize();
instructors.initialize();

$(document).ready(function () {
    nav.onTimeRangeSelected = function (args) {
        dp.startDate = args.start;
        dp.update();
    };

    if (typeof currentUser != undefined && currentUser != null && !currentUser.isadmin) {
        console.log(currentUser);
        getAllAppointments(currentUser.s.instructor["id"]);
    }
    dp.onTimeRangeSelected = function (args) {
        dp.clearSelection();

        if (currentUser.isadmin) {
            var form = document.getElementById("onCreateForm");
            var intervalType = form.elements["interval_type"].value;
            var i = currentAdmin.i;
            if (intervalType === "lesson") {
                var s = currentAdmin.s;
                if (typeof s == "undefined" || s == null) {
                    return;
                }
            } else {
                var s = null;
                if (typeof i == "undefined" || i == null) {
                    return;
                }
            }
        } else {
            var s = currentUser.s;
            if (typeof s == "undefined" || s == null) {
                return;
            }
            var i = s.instructor;
        }
        //  dp.preventDefault();
        var lesson = new Object({
            id: 0,
            start: args.start,
            end: args.end,
            instructor_id: i.id,
            student_id: typeof s == "undefined" || s == null ? -1 : s.id
        });
        console.log(lesson);
        var result = operateLesson(lesson, "take");
        if (result === -1) {
            alert("Ошибка соединения!");
            return;
        }
        if (result === 0) {
         //   args.e.preventDefault();
            alert("Время занято!");
            return;
        }
        var textTT = (s == null ? "Инструктор " + i.firstname + " " + i.lastname + " " + i.tel :
            "Студент " + s.firstname + " " + s.lastname + " " + s.tel);
        var textHint = (s == null ? i.firstname + " " + i.lastname:
            s.firstname + " " + s.lastname);
        var e = new DayPilot.Event({
            start: lesson.start,
            end: lesson.end,
            id: result,
            resource: {"instructor": i, "student": s},
            text: textHint,
            toolTip: textTT
        });
        dp.events.add(e);
        dp.update();
    };

    dp.onEventClicked = function (args) {
        if (!currentUser.isadmin && (args.e.data.resource.student == null ||
            args.e.data.resource.student.id != currentUser.s.id)) {
            alert("Не имеете права");
            args.e.preventDefault();
            return;
        }
        deleteInterval(args);
        dp.events.remove(args.e);
        dp.update();
    };

    dp.onEventMoved = function (args) {

    };

    dp.onEventResize = function (args) {
        if (!currentUser.isadmin && (args.e.data.resource.student == null ||
            args.e.data.resource.student.id != currentUser.s.id)) {
            alert("Не имеете права");
            args.e.preventDefault();
            return;
        }
        var sid = (args.e.data.resource.student == null ? -1 : args.e.data.resource.student["id"]);
        var lesson = new Object({
            id: args.e.id(),
            start: args.newStart,
            end: args.newEnd,
            instructor_id: args.e.data.resource.instructor["id"],
            student_id: sid
        });
        var result = operateLesson(lesson, "move");
        if (result === -1) {
            alert("Ошибка соединения!");
            return;
        }
        if (result === 0) {
            args.preventDefault();
            alert("Время занято!");
            return;
        }
    };

    dp.onEventMove = function (args) {
        if (!currentUser.isadmin && (args.e.data.resource.student == null ||
            args.e.data.resource.student.id != currentUser.s.id)) {
            alert("Не имеете права");
            args.e.preventDefault();
            return;
        }
        var sid = (args.e.data.resource.student == null ? -1 : args.e.data.resource.student["id"]);
        var lesson = new Object({
            id: args.e.id(),
            start: args.newStart,
            end: args.newEnd,
            instructor_id: args.e.data.resource.instructor["id"],
            student_id: sid
        });
        var result = operateLesson(lesson, "move");
        if (result === -1) {
            alert("Ошибка соединения!");
            return;
        }
        if (result === 0) {
            args.preventDefault();
            alert("Время занято!");
            return;
        }
    }

    $('#studentField .typeahead').typeahead(null, {
        displayKey: function (d) {
            return d['firstname'] + " " + d['lastname'] + " " + d.group['name']
        },
        source: students.ttAdapter()
    })

    $('#instructorField .typeahead').typeahead(null, {
        displayKey: function (d) {
            return d['lastname'] + " " + d['firstname'] + " " + d['patronymic']
        },
        source: instructors.ttAdapter()
    })

    $('#instructorField .typeahead').on('typeahead:selected', function (evt, data) {
        $('#studentField .typeahead').typeahead('val', "");
        currentAdmin.i = data;
        currentAdmin.s = null;
        dp.events.removeAll();
        dp.update();
        getAllAppointments(currentAdmin.i.id);
    })

    $('#studentField .typeahead').on('typeahead:selected', function (evt, data) {
        console.log(evt);
        console.log(data);
        $('#instructorField .typeahead').typeahead('val', data.instructor["lastname"] + " " + data.instructor["firstname"] + " " + data.instructor["patronymic"]);
        currentAdmin.s = data;
        currentAdmin.i = data.instructor;
        dp.events.removeAll();
        dp.update();
        getAllAppointments(currentAdmin.i.id);
    })

    $(function () {
        $('#onCreateForm input:radio').click(function () {
            $('#onCreateForm input:radio').each(function () {
                var sw = true;
                if (this.checked) {
                    if (this.value === "nolesson") {

                    }
                }
            });
        });
    });
})

function operateLesson(lesson, operation) {
    var id;
    $.ajax({
        url: "/scheduler/lesson/action/" + operation,
        type: "POST",
        async: false,
        contentType: "application/json; charset=utf-8",
        data: JSON.stringify(lesson),
        success: function (data, code, xhr) {
            id = data.id;
        },
        error: function (jqXHR, textStatus, errorThrown) {
            id = -1;
        },
        dataType: 'json'
    })
    return id;
}

function deleteInterval(args) {
    $.ajax({
        url: "/scheduler/lesson/action/delete/" + args.e.data.id,
        type: "POST",
        async: false,
        contentType: "application/json; charset=utf-8",
        success: function (data, code, xhr) {
        },
        error: function (jqXHR, textStatus, errorThrown) {
            id = -1;
        },
        dataType: 'json'
    })
}

function getAllAppointments(instructorId) {
    $.ajax({
        url: "/scheduler/getallschedules/" + instructorId,
        type: "POST",
        async: false,
        success: function (data, code, xhr) {
            $.each(data, function (i, b) {
                var startMoment = b.startInterval.split('.')[0];
                var finishMoment = b.finishInterval.split('.')[0];
                var textHint = (b.student == null ? b.instructor["firstname"] + " " + b.instructor["lastname"] :
                b.student["firstname"] + " " + b.student["lastname"]);
                var e = new DayPilot.Event({
                    start: new DayPilot.Date(startMoment),
                    end: new DayPilot.Date(finishMoment),
                    id: b.id,
                    resource: {"instructor": b.instructor, "student": b.student},
                    text: textHint,
                    toolTip: "my tooltip"
                });
                dp.events.add(e);
            });
            dp.update();
        },
        error: function (jqXHR, textStatus, errorThrown) {
            alert(jqXHR.status + ' ' + jqXHR.responseText);
        },
        dataType: 'json'
    })
};

