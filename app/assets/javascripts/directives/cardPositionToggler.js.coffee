angular.module('FlashCardz').directive 'cardPositionToggler', ->

  return (scope, element, attrs) ->

    $('#sortable').sortable
      change: (event, ui) ->
        position = ui.item.index()
        scope.data.decks[position]
      deactivate: (event, ui) ->
        console.log ui.item.index()

    $('.box')
      .mouseenter ->
        $(this).addClass('select')
      .mouseleave ->
        $(this).removeClass( 'select' )

