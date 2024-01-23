$(document).ready(function () {
    $("#click button").click(function () {
        $(this).html("You Clicked Me!");
    });
    $("#hide button").click(function () {
        $("#hide p").hide();
    });
    $("#show button").click(function () {
        $("#show p").show();
    });
    $("#toggle button").click(function () {
        $("#toggle p").toggle();
    });
    $("#slideDown button").click(function () {
        $("#slideDown p").slideDown();
    });
    $("#slideUp button").click(function () {
        $("#slideUp p").slideUp();
    });
    $("#slideToggle button").click(function () {
        $("#slideToggle p").slideToggle();
    });
    $("#fadeIn button").click(function () {
        $("#fadeIn p").fadeIn();
    });
    $("#fadeOut button").click(function () {
        $("#fadeOut p").fadeOut();
    });
    $("#addClass button").click(function () {
        $("#addClass p").addClass("change_color");
    });
    $("#before button").click(function () {
        $("#before p").before("<p>Inserted before me.</p>");
    });
    $("#after button").click(function () {
        $("#after p").after("<p>Inserted after me.</p>");
    });
    $("#append button").click(function () {
        $("#append p").append("<p>I am your child!</p>");
    });
    $("#html button").click(function () {
        $("#html p").html("<h3>I am your new Html element</h3>");
    });
    $("#attr button").click(function () {
        $("#attr img").attr("src", "images/alien.png");
    });
    $("#val button").click(function () {
        let textValue = $("input:text").val();
        $("#val p").text(textValue);
    });
    $("#text button").click(function () {
        $("#text p").text("The Text has changed :P");
    });
});
