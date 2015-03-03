<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<html>

<head>


    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Bootstrap 101 Template</title>

    <!-- Bootstrap -->
    <link href="/css/bootstrap.css" rel="stylesheet">
    <link href="/css/default.css" rel="stylesheet">
    <link href="/css/font-awesome.css" rel="stylesheet">
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->


    <!--for VK-->
    <script src="http://vk.com/js/api/openapi.js" type="text/javascript"></script>




</head>

<body>


<jsp:include page="header.jsp" />
<jsp:include page="menu.jsp" />





<div class="body">

    <div class="container-fluid">

        <div class="row">
            <div id="contentText" class="col-xs-11 col-sm-11 col-md-11 col-lg-11  ">
                <!--Карусель-->
                <div id="carousel" class="carousel slide">


                    <!--Индикаторы слайдов-->

                    <ol class="carousel-indicators">
                        <li class="active" data-target = "#carousel" data-slide-to = "0"></li>
                        <li data-target = "#carousel" data-slide-to = "1"></li>
                        <li data-target = "#carousel" data-slide-to = "2"></li>
                    </ol>

                    <!--слайды-->
                    <div class="carousel-inner">

                        <div class="item active" >
                            <img src="/images/hat.png" alt="">
                            <!-- Описание слайда -->
                            <a href="#"><div class="carousel-caption">
                                <h3> Лучшие автомобили</h3>
                                <p>Самый большой выбор авто для обучения </p>
                            </div>
                            </a>
                        </div>

                        <div class="item" >
                            <img src="/images/Porshe.png" alt="">
                            <!-- Описание слайда -->
                            <a href="#"><div class="carousel-caption">
                                <h3> Тесты онлайн</h3>
                                <p>Вопросы по всем категориям </p>
                            </div>
                            </a>
                        </div>

                        <div class="item" >
                            <img src="/images/hat_3.png" alt="">
                            <!-- Описание слайда -->
                            <a href="#"><div class="carousel-caption">
                                <h3> Наши преподаватели</h3>
                                <p>У нас работают только лучшие </p>
                            </div>
                            </a>
                        </div>

                    </div>

                    <!--Стрелки переклучения слайдов-->
                    <a href="#carousel" class="left carousel-control" data-slide = "prev" >
                        <span class="glyphicon glyphicon-chevron-left" ></span>
                    </a>

                    <a href="#carousel" class="right carousel-control" data-slide = "next" >
                        <span class="glyphicon glyphicon-chevron-right" ></span>
                    </a>
                </div>

                <h2>Автошкола "Автофактор" обучение по новым программам</h2>
                Автошкола "Автофактор" (Москва) предлагает пройти курс обучения вождению мотоцикла, автомобиля по программе подготовки водителей транспортных средств категории "А" и "В".
                Продуманный теоретический курс обучения в сочетании с уникальной методикой обучения практическому вождению автомобиля расчитаной на абитуриентов с различными начальными навыками вождения,
                способствует не только успешной сдаче экзамена в ГИБДД, но и получению стабильных навыков безопасного управления автомобилем.
                <br>
                <br>

            </div>



            <div  class="col-xs-offset-1  col-sm-1 col-md-1 col-lg-1 hidden-xs hidden-xs hidden-xs hidden-xs "></div>

        </div>
    </div>

</div>

<jsp:include page="footer.jsp" />
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="/js/bootstrap.js"></script>


<!--Вращение  слайдов-->

<script type='text/javascript'>
    $(document).ready(function() {
        $('.carousel').carousel({
            interval: 5000
        })
    });
</script>




</body>
</html>
