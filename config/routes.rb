Rails.application.routes.draw do
  root to: "invoices#index"

  resources :invoices, only: [:index, :show] do
    resource :download, only: [:show]
  end
end
