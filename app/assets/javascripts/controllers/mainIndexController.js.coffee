@IndexController = ($scope, $location, deckData) ->

  $scope.data = deckData.data

  deckData.loadDecks()

@IndexController.$inject = ['$scope', '$location', 'deckData']
