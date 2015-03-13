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
    <link href="/css/image.css" rel="stylesheet">
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

<jsp:include page="/WEB-INF/views/header.jsp"/>
<jsp:include page="/WEB-INF/views/menu.jsp"/>

<div class="body">

    <div class="container-fluid ">

        <div id="page-wrap">
            <ul id="locations">


                <div class="col-xs-10 zeropadding">
                    <div id="map_canvas"></div>
                    <br/>
                </div>


                <div class="col-xs-4 blackback">

                    <div data-geo-lat="48.458085" data-geo-long="35.057470">
                        <a href="#" onClick="showNext();">
                            <h3>Офис автошколы</h3>

                            <p>
                                Адрес:<br/>
                                ул. Гоголя, 1. Днепропетровск<br/>
                                Днепропетровская область, Украина<br/>
                                Телефон:(056) 770-04-57<br/>
                                e-mail: classes@ds.dp.ua</p>
                        </a></div>
                </div>

                <div class="col-xs-offset-2 col-xs-4 blackback">

                    <div data-geo-lat="48.376040" data-geo-long="34.462065">
                        <a href="#" onClick="show();">
                            <h3>Автодром</h3>

                            <p>
                                Адрес:<br/>
                                ул.Школьная, 1. пгт.Кринички,<br/>
                                Днепропетровская область, Украина<br/>
                                Телефон:(059) 740-54-17<br/>
                                e-mail: driving@ds.dp.ua</p>
                        </a></div>
                </div>


            <div class="col-xs-10">
                <br/>
                <br/>

                <div id="images">
                    <div class="container-fluid" id="3" style="display:none">
                        <div class="row">
                            <div class="col-xs-4"><img class="img-responsive"
                                                       src="/images/1188608278.jpg"/>
                            </div>
                            <div class="col-xs-4"><img class="img-responsive"
                                                       src="/images/Volkswagen-Track-Day1.jpg"/>
                            </div>
                            <div class="col-xs-4"><img class="img-responsive"
                                                       src="/images/michelin-pilot-super-sport-bmw-dubai.jpg"/>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-4"><img class="img-responsive"
                                                       src="/images/Lamborghini_Aventador_track_test_drive_01.jpg"/>
                            </div>
                            <div class="col-xs-4"><img class="img-responsive"
                                                       src="/images/corporate-fleet.jpg"/>
                            </div>
                            <div class="col-xs-4"><img class="img-responsive"
                                                       src="/images/lgv_02.jpg"/>
                            </div>
                        </div>

                    </div>

                    <div class="container-fluid" id="2" style="display:block">
                    </div>

                    <div class="container-fluid" id="4" style="display:none">
                        <div class="row">
                            <div class="col-xs-4"><img class="img-responsive"
                                                       src="/images/ClassroomSession-600x400.jpg"/>
                            </div>
                            <div class="col-xs-4"><img class="img-responsive"
                                                       src="/images/ddn051512a1Driving_1127652a_4.jpg"/>
                            </div>
                            <div class="col-xs-4"><img class="img-responsive"
                                                       src="/images/interior-rendering2.jpg"/>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-4"><img class="img-responsive"
                                                       src="/images/dsc_0142-large.jpg"/>
                            </div>
                            <div class="col-xs-4"><img class="img-responsive"
                                                       src="/images/classroom.jpg"/>
                            </div>
                            <div class="col-xs-4"><img class="img-responsive"
                                                       src="/images/Survive the Drive at GPNY C-1.jpg"/>
                            </div>
                        </div>

                        <div class="container-fluid" id="5" style="display:block">
                        </div>
                    </div>

                </div>
            </div>
            </ul>



        </div>
    </div>

</div>


<jsp:include page="/WEB-INF/views/footer.jsp"/>
<script src="/js/contact.js"></script>

</body>
</html>
