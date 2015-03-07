var nav = new DayPilot.Navigator("nav");
nav.showMonths = 1;
nav.selectMode = "week";
nav.onTimeRangeSelected = function (args) {
    dp.startDate = args.start;
    dp.update();
};
nav.on

var dp = new DayPilot.Calendar("dp");
dp.viewType = "Week";
dp.heightSpec = "Full";
dp.ShowToolTip = true;
dp.eventMoveHandling = "Update";

dp.onTimeRangeSelected = function(args) {
    dp.clearSelection();
    var lesson = new Object ({
        id: 0,
        start: args.start,
        end: args.end,
        instructor_id: "1",
        student_id: "1"
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
    var e = new DayPilot.Event({
        start: lesson.start,
        end: lesson.end,
        id: result,
        text: "Vasya"
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
            alert(jqXHR.status + ' ' + jqXHR.responseText);
            id = -1;
        },
        dataType: 'json'
    })
    return id;
}

dp.onEventClicked = function (args) {
alert("clicked");
};

dp.onEventMoved = function (args) {

};

dp.onEventResize = function (args) {
    var lesson = new Object ({
        id: args.e.id(),
        start: args.newStart,
        end: args.newEnd,
        instructor_id: "1",
        student_id: "1"
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
    var lesson = new Object ({
        id: args.e.id(),
        start: args.newStart,
        end: args.newEnd,
        instructor_id: "1",
        student_id: "1"
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
        url: "/scheduler/getallappointments/" + instructorId,
        type: "POST",
        async: false,
        success: function (data, code, xhr) {
            dp.startDate = "2011-11-11";
            nav.init();
            dp.init();
            $.each(data, function (i, b) {
                var startMoment = b.startInterval.split('.')[0];
                var finishMoment = b.finishInterval.split('.')[0];
                var e = new DayPilot.Event({
                    start: new DayPilot.Date(startMoment),
                    end: new DayPilot.Date(finishMoment),
                    id: b.id,
                    text: b.student["firstname"] + " " + b.student["lastname"]
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

