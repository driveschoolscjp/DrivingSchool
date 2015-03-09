var nav = new DayPilot.Navigator("nav");
nav.showMonths = 1;
nav.selectMode = "week";
nav.startDate = "2011-11-11";
nav.onTimeRangeSelected = function (args) {
    dp.startDate = args.start;
    dp.update();
};

var dp = new DayPilot.Calendar("dp");
dp.viewType = "Week";
dp.heightSpec = "Full";
dp.ShowToolTip = true;
dp.eventMoveHandling = "Update";
//HeightSpec = "Full";
dp.theme = "my";
dp.startDate = "2011-11-11";
nav.init();
dp.init();

dp.onTimeRangeSelected = function(args) {
    var form = document.getElementById("onCreateForm");
    var intervalType = form.elements["interval_type"].value;
    var sid = (intervalType === "lesson" ? 1 : -1);
    dp.clearSelection();
  //  dp.preventDefault();
    var lesson = new Object ({
        id: 0,
        start: args.start,
        end: args.end,
        instructor_id: 1,
        student_id: sid
    });
    var result = operateLesson(lesson, "take");
    if (result === -1) {
        alert("Ошибка соединения!");
        return;
    }
    if (result === 0) {
        args.e.preventDefault();
        alert("Время занято!");
        return;
    }
    var student = (sid === -1 ? null : {id: sid});
    var textHint = (sid === -1 ? "" : "name");   // current student , not 1
    var instructor = {id: 1};
    var e = new DayPilot.Event({
        start: lesson.start,
        end: lesson.end,
        id: result,
        resource: {"instructor": instructor, "student": student},
        text: textHint
    });
    dp.events.add(e);
    dp.update();

  //  var name = prompt("Student name:", "");
};

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

dp.onEventClicked = function (args) {
    deleteInterval(args);
    dp.events.remove(args.e);
    dp.update();
};

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

dp.onEventMoved = function (args) {

};

dp.onEventResize = function (args) {
    var sid = (args.e.data.resource.student == null ? -1 : args.e.data.resource.student["id"]);
    var lesson = new Object ({
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
    var sid = (args.e.data.resource.student == null ? -1 : args.e.data.resource.student["id"]);
    var lesson = new Object ({
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

function getAllAppointments(instructorId) {
    $.ajax({
        url: "/scheduler/getallschedules/" + instructorId,
        type: "POST",
        async: false,
        success: function (data, code, xhr) {
            $.each(data, function (i, b) {
                var startMoment = b.startInterval.split('.')[0];
                var finishMoment = b.finishInterval.split('.')[0];
                var textHint = (b.student == null ? "" : b.student["firstname"] + " " + b.student["lastname"]);
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

getAllAppointments(1);
dp.update();
