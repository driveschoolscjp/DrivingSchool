//при наводе на фото авто, появляеться кнопка "подать заявку"

$('.thumbnailhover').hover(
function(){
    $(this).find('.caption').fadeIn(250); //.slideDown(250)
    },
function(){
    $(this).find('.caption').fadeOut(250); //.slideUp(250)
    }
);


