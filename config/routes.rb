AngularRailsCards::Application.routes.draw do
  root to: "main#index"

  resources :cards, only: :index
  resources :decks, only: [:index, :show]
end
