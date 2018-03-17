# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

@show_base_recipes = () ->
    $("#modded-recipes").addClass("d-none")
    $("#base-recipes").removeClass("d-none")

@show_modded_recipes = () ->
    $("#base-recipes").addClass("d-none")
    $("#modded-recipes").removeClass("d-none")

filter_recipes = (filter) ->
    $(".recipe").parent().removeClass("d-none")
    if filter
        # Hide any recipe that does not have the filter in the name
        $(".recipe").not("[data-name*='" + filter + "']").parent().addClass("d-none")
        # Unhide any recipe with an ingredient that has the filter in the name
        $(".ingredient[data-name*='" + filter + "'][data-type*='output']").closest(".recipe-col").removeClass("d-none")

recipe_calculator = (input_field) ->
    new_value = input_field.val()
    base_value = get_base_value(input_field)
    ratio = new_value / base_value
    update_fields(input_field, ratio)

update_fields = (field, ratio) ->
    inputs = $("input:number").not(field)
    outputs = $("[id^='output']")
    update_value(ratio, input) for input in inputs
    update_text(ratio, output) for output in outputs

update_value = (ratio, element) ->
    base_value = get_base_value(element)
    $(element).val(Math.ceil(base_value * ratio))

update_text = (ratio, element) ->
    base_value = get_base_value(element)
    $(element).text(Math.ceil(base_value * ratio))

get_base_value = (element) ->
    $(element).attr("data-base-value")

$(document).on "keyup change", "#filter", () ->
    filter = $(this).val()
    filter_recipes filter

$(document).on "keyup change", "input[type='number']", () ->
    recipe_calculator($(this))

$(document).on "turbolinks:load", () ->
    filter = $("#filter").val()
    filter_recipes filter

$(document).on "change", "#recipe_list", (e) ->
    $("#file_label").text(e.target.files[0].name)
    $("input:submit").removeAttr("disabled")

$(document).on "ajax:send", () ->
    console.log 'sent'
    $("#success_message").addClass("d-none")
    $("#error_message").addClass("d-none")
    $("#processing_message").removeClass("d-none")
    $(".message-display").removeClass("d-none")

$(document).on "ajax:success", () ->
    console.log 'success_message'
    $("#processing_message").addClass("d-none")
    $("#error_message").addClass("d-none")
    $("#success_message").removeClass("d-none")

$(document).on "ajax:error", () ->
    console.log 'error'
    $("#processing_message").addClass("d-none")
    $("#success_message").addClass("d-none")
    $("#error_message").removeClass("d-none")
