/**
 * Created by acer on 27.02.15.
 */

function checkForm() {

    var checkResult = true;
    var name=$("#nameLogin").val();
    var password=$("#passwordLogin").val();
    if (name.length<2) {
        $("#nameLoginError").html("пожалуйста, укажите имя");
        return false;
    }


    if (password.length<2) {
        $("#passwordLoginError").html("пожалуйста, укажите пароль");
        return false;
    }

    if (checkResult) {
        return true;
    } else {
        return false;
    }
}