Rails.application.routes.draw do
  devise_for :admirers
  root to: "admirers#index"
  resources :admirers, :except => [:index, :new, :create, :edit, :update, :destroy] do
    resources :messages, :except => [:edit, :update, :destroy]
    resources :friends
  end
end
