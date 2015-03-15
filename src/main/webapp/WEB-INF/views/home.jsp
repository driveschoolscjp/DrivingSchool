<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<html>

<head>

    <title>Автошкола</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="shortcut icon" href="http://s3.gazu.ru/favicon.ico" type="image/x-icon">

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
<jsp:include page="header.jsp"/>
<jsp:include page="menu.jsp"/>

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
                        <li class="active" data-target="#carousel" data-slide-to="0"></li>
                        <li data-target="#carousel" data-slide-to="1"></li>
                        <li data-target="#carousel" data-slide-to="2"></li>
                    </ol>

                    <!--слайды-->
                    <div class="carousel-inner">

                        <div class="item active">
                            <a href="/cars">
                                <img src="/images/hat.png" alt="">
                                <!-- Описание слайда -->
                                <div class="carousel-caption">
                                    <h3> Лучшие автомобили</h3>

                                    <p>Самый большой выбор авто для обучения </p>
                                </div>
                            </a>
                        </div>

                        <div class="item">
                            <a href="/testing/search?idExam=1">
                                <img src="/images/Porshe.png" alt="">
                                <!-- Описание слайда -->
                                <div class="carousel-caption">
                                    <h3> Тесты онлайн</h3>

                                    <p>Вопросы по всем категориям </p>
                                </div>
                            </a>
                        </div>

                        <div class="item">
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

                    <p>Автошкола "Автофактор" предлагает пройти курс обучения вождению автомобиля по
                        программе подготовки водителей транспортных средств категории "B".
                        Продуманный теоретический курс обучения в сочетании с уникальной методикой обучения
                        практическому вождению автомобиля расчитаной на абитуриентов с различными начальными навыками
                        вождения, способствует не только успешной сдаче экзамена в ГИБДД,
                        но и получению стабильных навыков безопасного управления автомобилем.</p>

                    <p><b>Преподаватели по теории:</b> Опыт и стаж работы наших преподавателей по основам
                        законодательства в сфере дорожного движения заслужено оценили не только ученики автошколы
                        «Автофактор», но и представители МВД приглашая наших преподавателей для чтения лекций по
                        проблемам организации дорожного движения и разработки билетов для приема экзамена кандидатов в
                        водители.</p>

                    <p><b>Инструктора по вождению:</b> Это основа получения качественного обучения вождению. Все
                        инструктора автошколы имеют свидетельства подтверждающие статус мастера производственного
                        обучения вождения, проходят плановые переаттестации и находятся под пристальным вниманием
                        администрации автошколы. Опыт преподавания вождению инструкторов автошколы гарантирует
                        индивидуальный подход к каждому абитуриенту и получения необходимых навыков вождения.</p>

                    <p><b>Автомобили для обучения:</b> Все учебные автомобили оборудованы дополнительными педалями и
                        оформлены надлежащим образом в ГИБДД, все автомобили на которых проходит обучение абитуриентов
                        конкретной группы участвуют с ними при сдаче экзамена в ГИБДД.</p>

                    <p><b>Программы обучения:</b> Учебные программы автошколы разработаны с учетом начальных навыков
                        каждого абитуриента и отличаются по количеству часов вождения. Срок обучения независимо от
                        выбранной программы обучения 2 месяца. Занятия по теории проходят в современных учебных
                        аудиториях в удобное для Вас время: утро, день, вечер, группа выходного дня. Выбор времени для
                        занятий по практическому вождению осуществляются с учетом Ваших пожеланий. Возможно обучение
                        теоретическому и практическому вождению в индивидуальном порядке (обучение выстраивается с
                        учетом только Ваших пожеланий и возможностей) или минимальной группой (VIP обучение).</p>

                    <p><b>Цена обучения:</b> 100% Соответствие указанной суммы на сайте стоимости при реальном обучение
                        в Автошколе «Автофактор». Отсутствие скрытых платежей, дополнительных поборов. Вся информация в
                        открытом доступе и понятна для каждого, кто хочет начать обучение. В виде поощрения при выборе
                        нашей автошколы, существенные скидки при продолжении совершенствования навыков вождения на
                        курсах контраварийного вождения. Постоянно можно получать бонусы и уменьшать стоимость обучения,
                        также действует система получения скидок при групповом обучение, стабильно проводятся подарочные
                        акции.</p>

                    <p><b>Площадка для обучения вождения:</b> Площадка расположена равноудаленно от всех трех филиалов
                        Автошколы «Автофактор» на Ходынском поле. Размеры площадки соответствуют требованиям ГИБДД и
                        позволяют полноценно проводить занятия не только по вождению автомобиля, но и мотоцикла. Удачное
                        расположение учебной площадки автошколы на ходынке позволяют обучать безопасному вождению по
                        городу. Маршруты вождения автошколы по району Ходынского поля позволяют отрабатывать практически
                        все полученные знания по ПДД на практическом вождении. </p>

                    <p><b>Экзамен в ГИБДД: </b> Проводится организовано группой, с предоставлением учебных автомобилей
                        на которых осуществлялось практическое вождение данной группы. При желании сдавать экзамен в
                        ГИБДД можете самостоятельно, Вы получаете полный комплект документов об окончании автошколы с
                        печатями ГИБДД.</p></div>
            </div>

            <div class="col-xs-offset-1  col-xs-1 hidden-xs"></div>
        </div>
    </div>

</div>
<br/>
<br/>
<jsp:include page="footer.jsp"/>

<script src="/js/home.js"></script>

</body>
</html>
