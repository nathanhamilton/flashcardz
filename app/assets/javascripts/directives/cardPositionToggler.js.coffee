angular.module('FlashCardz').directive 'cardPositionToggler', ->

  return (scope, element, attrs) ->

    $('#sortable').sortable
      update: (event, ui) ->
        idArray = $('#sortable').sortable('serialize')
        $.ajax '/decks_positions',
          type: 'POST'
          dataType: 'json'
          data: idArray

    $('.box')
      .mouseenter ->
        $(this).addClass('select')
      .mouseleave ->
        $(this).removeClass('select')

