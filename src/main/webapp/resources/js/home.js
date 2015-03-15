<!--Вращение  слайдов-->

$(document).ready(function() {
    $('.carousel').carousel({
        interval: 5000
    })
});

// комментарии
    VK.init({apiId: 4799975, onlyWidgets: true});

    VK.Widgets.Comments("vk_comments", {limit: 10, width: "650", attach: "*"});