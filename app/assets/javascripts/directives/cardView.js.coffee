angular.module('FlashCardz').directive 'cardView', ->

  return (scope, element, attrs) ->

    moveForward = (activeCard, activeCardIndex, cards, element, direction) ->
      if activeCard.id is _.first(cards).id
        # forwardButtonToggle(index, cards, element, direction)
        activeCard = cards[activeCardIndex + 1]
        scope.$apply()

# As a note to self. I am trying to make this work based on the id of active
# card instead of relying on the index of the array. I have not changed much
# below this comment.

    moveBackward = (index, cards, element, direction) ->
      if index > 0
        # backButtonToggle(index, cards, element, direction)
        scope.data.cardData.activeCard = cards[index - 1]
        scope.$apply()

    # backButtonToggle = (index, cards, element, direction) ->
    #   if index <= 1
    #     element.toggle()

    # forwardButtonToggle = (index, cards, element, direction) ->
    #   if index >= cards.length-2
    #     element.toggle()

    buttonToggle = (activeCardIndex, cards) ->
      element.find('.move').show()
      if cards.indexOf(_.last(cards)-1) is activeCardIndex
        element.find('.next').hide()
      else if cards.indexOf(_.first(cards)-1) is activeCardIndex
        element.find('.back').hide()


    # buttonToggle = (index, cards, element, direction) ->
    #   if index > cards.length-2 and direction is 'next'
    #     element.hide()
    #   else
    #     element.show()
    #   if index < 2 and direction is 'back'
    #     element.hide()
    #   else
    #     element.show()

    element.find('.move').on 'click', (e) ->
      activeCard = scope.data.cardData.activeCard
      activeCardId = scope.data.cardData.activeCard.id
      cards = scope.data.cardData.cards
      activeCardIndex = cards.indexOf activeCard
      button = $(e.target)
      direction = button.data().direction
      if direction is 'back'
        moveBackward(activeCardIndex, cards, button, direction)
      else
        moveForward(activeCard, activeCardIndex, cards, button, direction)
      buttonToggle(activeCardIndex, cards)
