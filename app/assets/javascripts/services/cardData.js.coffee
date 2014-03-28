angular.module('FlashCardz').factory('cardData', ['$http', ($http) ->

  cardData =
    data:
      cards: [{name: 'Loading.....'}]
    isLoaded: false

  cardData.loadCards = (deckId) ->
    if !cardData.isLoaded
      $http.get("/decks/#{deckId}.json").success( (data) ->
        cardData.data.cards = data
        isLoaded: true
        console.log ('Successfully loaded cards')
      ).error( ->
        console.log ('Failed to load cards')
      )

  return cardData

])
