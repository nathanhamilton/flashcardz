angular.module('FlashCardz').directive 'cardView', ->

  return (scope, element, attrs) ->

    moveForward = (activeCard, activeCardIndex, cards) ->
      unless activeCard is _.last(cards)
        nextCard = cards[activeCardIndex + 1]
        scope.data.cardData.activeCard = nextCard
        scope.$apply()
      hideNext() if nextCard is _.last(cards)

    moveBackward = (activeCard, activeCardIndex, cards) ->
      unless activeCard is _.first(cards)
        nextCard = cards[activeCardIndex - 1]
        scope.data.cardData.activeCard = nextCard
        scope.$apply()
      hideBack() if nextCard is _.first(cards)

    hideNext = ->
      element.find('.next').hide()

    hideBack = ->
      element.find('.back').hide()

    element.find('.move').on 'click', (e) ->
      activeCard = scope.data.cardData.activeCard
      cards = scope.data.cardData.cards
      activeCardIndex = cards.indexOf activeCard
      direction = $(e.target).data().direction
      element.find('.move').show()
      if direction is 'back'
        moveBackward(activeCard, activeCardIndex, cards)
      else
        moveForward(activeCard, activeCardIndex, cards)
