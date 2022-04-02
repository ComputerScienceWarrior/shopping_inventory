Rails.application.routes.draw do
  resources :users, only: [:show, :new, :edit, :update, :create] do
    resources :shopping_lists
  end
end
