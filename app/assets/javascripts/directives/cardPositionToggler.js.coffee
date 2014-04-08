angular.module('FlashCardz').directive 'cardPositionToggler', ->

  return (scope, element, attrs) ->

    $('.box').each (i, obj) ->
      console.log obj

    # element.find('.box').on 'mouseover', ->
    #   $('.box').hide()
