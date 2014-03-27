angular.module('FlashCardz').factory('deckData', ['$http', ($http) ->

  deckData =
    data:
      decks: [{name: 'Loading.....'}]
    isLoaded: false

  deckData.loadDecks = ->
    if !deckData.isLoaded
      $http.get('/decks.json').success( (data) ->
        deckData.data.decks = data
        console.log ('Successfully loaded decks')
      ).error( ->
        console.log ('Failed to load decks')
      )

  return deckData

])
