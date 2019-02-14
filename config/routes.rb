Rails.application.routes.draw do
  get "minions/busca", to: "minions#busca", as: :busca_minion
  resources :minions, only: [:new, :create, :destroy, :edit, :update]
  root to: "minions#index"
end
