# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

@show_base_recipes = () ->
    console.log "show base recipes"
    $("#modded-recipes").css("visibility", "hidden")
    $("#base-recipes").css("visibility", "visible")
@show_modded_recipes = () ->
    console.log "show modded recipes"
    $("#base-recipes").css("visibility", "hidden")
    $("#modded-recipes").css("visibility", "visible")
filter_recipes = (filter) ->
    # Hide any recipe that does not have the filter in the name
    $(".recipe:not([data-name*='" + filter + "'])").not().parent().addClass("d-none")
    # Unhide any recipe with an ingredient that has the filter in the name
    $(".ingredient[data-name*='" + filter + "']").closest(".recipe-col").removeClass("d-none")

$(document).on "keyup change", "#filter", () ->
    console.log "keyup"
    filter = $(this).val()
    $(".recipe").parent().removeClass("d-none")
    if filter
        filter_recipes filter

$(document).on "turbolinks:load", () ->
    console.log "turbolinks:load"
    filter = $("#filter").val()
    if filter
        filter_recipes filter
