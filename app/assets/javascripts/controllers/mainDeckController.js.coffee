@DeckController = ($scope, $routeParams, cardData, $location) ->

  $scope.data =
    cardData: cardData.data

  cardData.loadCards($routeParams.deckId)

  $scope.data.deckId = $routeParams.deckId

  $scope.backToDecks = ->
    $location.url('/')

@DeckController.$inject = ['$scope', '$routeParams', 'cardData', '$location']
