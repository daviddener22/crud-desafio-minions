Rails.application.routes.draw do
  get "minions/busca", to: "minions#busca", as: :busca_minion
  root to: "minions#index"
    resources :minions, only: [:new, :create, :destroy, :edit, :update] do
      member do
        get 'envio_email'
        end
    end
end
