<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<html>

<head>


    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Home</title>

    <!-- Bootstrap -->
    <link href="/css/bootstrap.css" rel="stylesheet">
    <link href="/css/default.css" rel="stylesheet">
    <link href="/css/font-awesome.css" rel="stylesheet">

    <!--for VK-->
    <script src="http://vk.com/js/api/openapi.js" type="text/javascript"></script>
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="/js/bootstrap.js"></script>

</head>

<body>
<jsp:include page="header.jsp" />
<jsp:include page="menu.jsp" />

<div class="body">
    <br/>
    <br/>
    <br/>
    <div class="container-fluid">
        <div class="row">
            <div id="contentText" class="col-xs-11">
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
                            <a href="/cars">
                            <img src="/images/hat.png" alt="">
                            <!-- Описание слайда -->
                                <div class="carousel-caption">
                                <h3> Лучшие автомобили</h3>
                                <p>Самый большой выбор авто для обучения </p>
                            </div>
                            </a>
                        </div>

                        <div class="item" >
                            <a href="/testing/search?idExam=1">
                            <img src="/images/Porshe.png" alt="">
                            <!-- Описание слайда -->
                            <div class="carousel-caption">
                                <h3> Тесты онлайн</h3>
                                <p>Вопросы по всем категориям </p>
                            </div>
                            </a>
                        </div>

                        <div class="item" >
                            <a href="/futuregroups">
                            <img src="/images/hat_3.png" alt="">
                            <!-- Описание слайда -->
                                <div class="carousel-caption">
                                <h3> Наши преподаватели</h3>
                                <p>У нас работают только лучшие </p>
                            </div>
                            </a>
                        </div>

                    </div>


                </div>
                <br/>

                <div class="container-fluid blackback">
                <h2>Автошкола "Автофактор" обучение по новым программам</h2>
                <p>Автошкола "Автофактор" (Москва) предлагает пройти курс обучения вождению мотоцикла, автомобиля по программе подготовки водителей транспортных средств категории "А" и "В".
                Продуманный теоретический курс обучения в сочетании с уникальной методикой обучения практическому вождению автомобиля расчитаной на абитуриентов с различными начальными навыками вождения,
                способствует не только успешной сдаче экзамена в ГИБДД, но и получению стабильных навыков безопасного управления автомобилем.</p>
                </div>
            </div>

            <div class="col-xs-offset-1  col-xs-1 hidden-xs"></div>
        </div>
    </div>

</div>
<br/>
<br/>
<jsp:include page="footer.jsp" />

<script src="/js/home.js"></script>

</body>
</html>
