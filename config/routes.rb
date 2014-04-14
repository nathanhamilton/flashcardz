AngularRailsCards::Application.routes.draw do
  root to: "main#index"

  match 'decks_positions', to: 'decks_positions#update', via: :post
  resources :decks, only: [:index, :show, :create]
end
