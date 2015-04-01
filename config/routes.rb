Rails.application.routes.draw do
  devise_for :admirers
  root to: "users#index"
end
