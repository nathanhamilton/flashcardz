# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
#= require_self
#= require_tree ./controllers
#= require_tree ./filters
#= require_tree ./directives
#= require_tree ./services

FlashCardz = angular.module("FlashCardz", ['ngRoute'])

FlashCardz.config(['$routeProvider', ($routeProvider) ->
  $routeProvider.otherwise({ templateUrl: '../assets/mainIndex.html', controller: 'IndexController' })
])
