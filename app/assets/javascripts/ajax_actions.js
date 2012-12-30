$(function() {
    $("#pacients th a, #pacients .pagination a").live("click", function() {
        $.getScript(this.href);
        return false;
    });
    $("#pacients_search input").keyup(function() {
        $.get($("#pacients_search").attr("action"), $("#pacients_search").serialize(), null, "script");
        return false;
    });
});

$('#advanced').on('hidden', function () {
    $(this).data('advanced').$element.cleanData();
});

$("#closeAddChar").click(function () {
           $("#addChar").modal("hide");
});
