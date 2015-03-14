
//googleMap
var locations = [
['Офис автошколы', 48.458085, 35.057470, 1],
['Автодром', 48.376040, 34.462065, 2]
];

var map = new google.maps.Map(document.getElementById('map_canvas'), {
    zoom: 11,
    center: new google.maps.LatLng(48.458085, 35.057470),
    mapTypeId: google.maps.MapTypeId.ROADMAP
    });



var line = new google.maps.Polyline({
    path: [new google.maps.LatLng(48.458085, 35.057470), new google.maps.LatLng(48.376040, 34.462065)],
    strokeColor: "#33CCFF",
    strokeOpacity: 1.0,
    strokeWeight: 1,
    map: map
});


var infowindow = new google.maps.InfoWindow();

var marker, i;
var markers = new Array();

for (i = 0; i < locations.length; i++) {
    marker = new google.maps.Marker({
        position: new google.maps.LatLng(locations[i][1], locations[i][2]),
        map: map
    });

markers.push(marker);

$("#locations li").mouseenter(function () {

            $el = $(this);

            if (!$el.hasClass("hover")) {

                //плавное изменение центра карты
                // Move (pan) map to new location
                pointToMoveTo = new google.maps.LatLng($el.attr("data-geo-lat"), $el.attr("data-geo-long"));
                map.panTo(pointToMoveTo);
                map.setZoom(15);
//                резкое изменение центра карты
//                map.setCenter(pointToMoveTo);

                // Add new marker
                curMarker = new google.maps.Marker({
                    position: pointToMoveTo,
                    map: map
                });
                // On click, zoom map
                google.maps.event.addListener(curMarker, 'click', function () {
                    map.setZoom(15);
                });
                // No longer the first time through (re: marker clearing)
                first = false;
            }

        });

        $("#locations li:first").trigger("mouseenter");


        google.maps.event.addListener(marker, 'click', (function (marker, i) {
            return function () {
                infowindow.setContent(locations[i][0]);
                infowindow.open(map, marker);
            }
        })(marker, i));
    }

    function AutoCenter() {
        //  Create a new viewpoint bound
        var bounds = new google.maps.LatLngBounds();
        //  Go through each...
        $.each(markers, function (index, marker) {
            bounds.extend(marker.position);
        });
        //  Fit these bounds to the map
        map.fitBounds(bounds);


    }
    AutoCenter();


    //function show using to change images gallery

    show.hidden = '2';
    show.visible = '3';
    show.visible = '5';
    show.hidden = '4';

    function show() {

        show.hidden = show.visible;

        show.visible = (show.visible === '3') ? '2' : '3';

        document.getElementById(show.visible).style.display = 'block';

        document.getElementById(show.hidden).style.display = 'none';

    }

    function showNext() {

        show.hidden = show.visible;

        show.visible = (show.visible === '4') ? '5' : '4';

        document.getElementById(show.visible).style.display = 'block';

        document.getElementById(show.hidden).style.display = 'none';

    }

