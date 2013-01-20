$(function() {
    $("#pacients th a, #pacients .pagination a").live("click", function() {
        $.getScript(this.href);
        return false;
    });
    
    $("#pacients_search input").keyup(function() {
        $.get($("#pacients_search").attr("action"), $("#pacients_search").serialize(), null, "script");
        return false;
    });
    
    $("#surveys_search select").change(function() {
        $.get($("#surveys_search").attr("action"), $("#surveys_search").serialize(), null, "script");
        return false;
    });
    
    $("#interviews_search select").change(function() {
        $.get($("#interviews_search").attr("action"), $("#interviews_search").serialize(), null, "script");
        return false;
    });
});
