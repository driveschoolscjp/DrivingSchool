<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Contacts</title>


    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Home</title>

    <!-- css -->
    <link href="/css/bootstrap.css" rel="stylesheet">
    <link href="/css/default.css" rel="stylesheet">
    <link href="/css/font-awesome.css" rel="stylesheet">
    <link href="/css/google.css" rel="stylesheet">

    <!--js-->
    <script src="/js/bootstrap.js"></script>
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="/js/bootstrap.js"></script>


    <!--FOR Google-->
    <script type='text/javascript' src='http://ajax.googleapis.com/ajax/libs/jquery/1.4/jquery.min.js'></script>
    <script type='text/javascript' src='js/example.js'></script>
    <script type='text/javascript' src='http://maps.google.com/maps/api/js?sensor=true'></script>

</head>
<body>

<jsp:include page="/WEB-INF/views/header.jsp" />
<jsp:include page="/WEB-INF/views/menu.jsp" />

<div class="body">

    <div class="container-fluid">

        <div class="row">
            <div class="col-xs-4 col-sm-4 col-md-4 col-lg-4  ">

<div id="page-wrap">
 <ul id="locations">

        <li data-geo-lat="48.458085" data-geo-long="35.057470">
            <h3 style="color: #ffffff">Офис автошколы</h3>

            <p class="longdesc" style="color: #ffffff"><b>адрес:</b> ул.Школьная, 1. пгт.Кринички,
                Днепропетровская область, Украина</p>
        </li>

        <li data-geo-lat="48.376040" data-geo-long="34.462065">
            <h3 style="color: #ffffff">Автодром</h3>

            <p class="longdesc" style="color: #ffffff"><b>адрес:</b> ул. Гоголя, 1.
                Днепропетровск
                Днепропетровская область, Украина</p>
        </li>
    </ul>

</div>
</div>
            <div class="col-xs-7 col-sm-7 col-md-7 col-lg-7 col-xs-offset-1 col-sm-offset-1 col-md-offset-1 col-lg-offset-1">
                <div id="map_canvas"></div>
            </div>
</div>
</div>

    <script type="text/javascript">
        var locations = [
            ['Офис автошколы', 48.458085, 35.057470, 1],
            ['Автодром', 48.376040, 34.462065, 2]
        ];

        var map = new google.maps.Map(document.getElementById('map_canvas'), {
            zoom: 10,
            center: new google.maps.LatLng(48.458085, 35.057470),
            mapTypeId: google.maps.MapTypeId.ROADMAP
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

            $("#locations li").mouseenter(function() {

                $el = $(this);

                if (!$el.hasClass("hover")) {

                    //плавное изменение центра карты
                    // Move (pan) map to new location
                    pointToMoveTo = new google.maps.LatLng($el.attr("data-geo-lat"), $el.attr("data-geo-long"));
                    map.panTo(pointToMoveTo);

//                резкое изменение центра карты
//                map.setCenter(pointToMoveTo);

                    // Add new marker
                    curMarker = new google.maps.Marker({
                        position: pointToMoveTo,
                        map: map
                    });
                    // On click, zoom map
                    google.maps.event.addListener(curMarker, 'click', function() {
                        map.setZoom(14);
                    });
                    // No longer the first time through (re: marker clearing)
                    first = false;
                }

            });

            $("#locations li:first").trigger("mouseenter");


            google.maps.event.addListener(marker, 'click', (function(marker, i) {
                return function() {
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

    </script>

<jsp:include page="/WEB-INF/views/footer.jsp" />


</body>
</html>
