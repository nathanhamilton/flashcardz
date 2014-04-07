angular.module('FlashCardz').directive 'cardView', ->

  return (scope, element, attrs) ->

    moveForward = (activeCard, activeCardIndex, cards) ->
      if activeCard.id is cards[activeCardIndex].id
        unless activeCard is _.last(cards)
          scope.data.cardData.activeCard = cards[activeCardIndex + 1]
        scope.$apply()

    moveBackward = (activeCard, activeCardIndex, cards) ->
      if activeCard.id is cards[activeCardIndex].id
        unless activeCard is _.first(cards)
          scope.data.cardData.activeCard = cards[activeCardIndex - 1]
        scope.$apply()

    buttonToggle = ->
      cards = scope.data.cardData.cards
      activeCard = scope.data.cardData.activeCard
      element.find('.move').show()
      if activeCard is (_.last(cards))
        element.find('.next').hide()
      else if activeCard is (_.first(cards))
        element.find('.back').hide()

    element.find('.move').on 'click', (e) ->
      activeCard = scope.data.cardData.activeCard
      cards = scope.data.cardData.cards
      activeCardIndex = cards.indexOf activeCard
      direction = $(e.target).data().direction
      if direction is 'back'
        moveBackward(activeCard, activeCardIndex, cards)
      else
        moveForward(activeCard, activeCardIndex, cards)
      buttonToggle()
