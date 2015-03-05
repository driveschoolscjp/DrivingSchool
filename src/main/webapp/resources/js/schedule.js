

var nav = new DayPilot.Navigator("nav");
nav.showMonths = 1;
nav.selectMode = "week";
nav.onTimeRangeSelected = function(args) {
    dp.startDate = args.start;
    dp.update();
};
nav.init();

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
    }]
dp.init();
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
        url: "schedule/getallappointments/" + instructorId,
        type: "GET",
        success: function(data, code, xhr) {
            alert(data);
            jQuery.parseJSON(data);

            $.each(a, function(i, b) {

            });
        },
        error: function(jqXHR, textStatus, errorThrown) {
            alert(jqXHR.status + ' ' + jqXHR.responseText);
            alert("qwq");
        },
        dataType: 'json'
    })
};

getAllAppointments(1);
