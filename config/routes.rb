Rails.application.routes.draw do

  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :fixpoints, except: [:destroy] do
    resources :fixpoint_attachments, except: [:index]
    member do
      patch :set_fixed
    end
    resources :votes, only: [:create, :destroy]
  end
end
