@DeckController = ($scope, $routeParams, deckData) ->

  $scope.data =
    deckData: deckData.data

  deckData.loadDecks()

  $scope.data.deckId = $routeParams.deckId

@DeckController.$inject = ['$scope', '$routeParams', 'deckData']
