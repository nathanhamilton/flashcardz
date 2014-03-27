@IndexController = ($scope, $location, $http, deckData) ->

  $scope.data = deckData.data

  deckData.loadDecks()

  $scope.viewDeck = (deckId) ->
    $location.url('/decks/'+deckId)

@IndexController.$inject = ['$scope', '$location', '$http', 'deckData']
