var nav = new DayPilot.Navigator("nav");
nav.showMonths = 1;
nav.selectMode = "week";
nav.onTimeRangeSelected = function(args) {
    dp.startDate = args.start;
    dp.update();
};

var dp = new DayPilot.Calendar("dp");
dp.viewType = "Week";
dp.ShowToolTip = true;
dp.eventDeleteHandling = "Update";
dp.events.list = [
    {
        start: "2013-03-25T00:00:00",
        end: "2013-03-25T12:00:00",
        id: "123",
        resource: "A",
        text: "Event",
        toolTip: "my tooltip",
        backColor: "#cccccc"
    }];

dp.onTimeRangeSelected = function (args) {
    var name = prompt("New event name:", "Event");
    dp.clearSelection();
    if (!name) return;
    var e = new DayPilot.Event({
        start: args.start,
        end: args.end,
        id: DayPilot.guid(),
        resource: args.resource,
        text: name
    });
    dp.events.add(e);
    dp.message("Created");
};

dp.eventClicked = function(args) {
    alert("dsd");
    var name = prompt("New event name:", "Event");
    if (!name) return;
    args.e.text(name);
    dp.events.update(args.e);
};

dp.onEventMoved = function (args) {
    alert("moved");
    dp.message("Moved: " + args.e.text());
};

function getAllAppointments(instructorId) {
    $.ajax({
        url: "/scheduler/getallappointments/" + instructorId,
        type: "GET",
        success: function(data, code, xhr) {
            dp.startDate = "2011-11-11";
            nav.init();
            dp.init();
            $.each(data, function(i, b) {
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
        error: function(jqXHR, textStatus, errorThrown) {
            alert(jqXHR.status + ' ' + jqXHR.responseText);
        },
        dataType: 'json'
    })
};

getAllAppointments(1);
