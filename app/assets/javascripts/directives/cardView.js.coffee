angular.module('FlashCardz').directive 'cardView', ->

  return (scope, element, attrs) ->

    moveForward = (index, cards) ->
      if index < cards.length
        scope.data.cardData.activeCard = cards[index + 1]
        scope.$apply()

    moveBackward = (index, cards) ->
      if index > 0
        scope.data.cardData.activeCard = cards[index - 1]
        scope.$apply()


    hideShowElement = (element, index) ->
      if element <= index
        element.hide()

        element.show()


    element.find('.move').on 'click', (e) ->
      activeCard = scope.data.cardData.activeCard
      cards = scope.data.cardData.cards
      activeCardIndex = cards.indexOf activeCard
      console.log hideShowElement($(e.target), activeCardIndex)
      if $(e.target).data().direction is 'back'
        moveBackward(activeCardIndex, cards)
      else
        moveForward(activeCardIndex, cards)
