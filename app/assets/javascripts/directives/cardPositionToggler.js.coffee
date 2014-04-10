angular.module('FlashCardz').directive 'cardPositionToggler', ->

  return (scope, element, attrs) ->

    $('#sortable').sortable
      update: (event, ui) ->
        idArray = $('#sortable').sortable('serialize')
        $.ajax '/decks',
          type: 'POST'
          dataType: 'json'
          data: idArray
          success: (data) ->
            console.log 'AJAX Call was successful'
          scope.$apply()

    $('.box')
      .mouseenter ->
        $(this).addClass('select')
      .mouseleave ->
        $(this).removeClass('select')

