AngularRailsCards::Application.routes.draw do
  root to: "main#index"

  resources :decks, only: [:index, :show]
end
