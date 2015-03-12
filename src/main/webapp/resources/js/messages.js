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
    });
})
