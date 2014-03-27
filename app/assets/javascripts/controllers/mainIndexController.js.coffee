@IndexController = ($scope, $location, $http, deckData) ->

  $scope.data = deckData.data

  deckData.loadDecks()

  $scope.viewDeck = (deckId) ->
    $location.url('/deck/'+deckId)

@IndexController.$inject = ['$scope', '$http', '$location', 'deckData']
