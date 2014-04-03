@DeckController = ($scope, $routeParams, cardData) ->

  $scope.data =
    cardData: cardData.data

  cardData.loadCards($routeParams.deckId)

  $scope.data.deckId = $routeParams.deckId

@DeckController.$inject = ['$scope', '$routeParams', 'cardData']
