Rails.application.routes.draw do
  devise_for :users
  root 'welcome#index'

  namespace :api do
    namespace :v1 do
      resources :users
      devise_scope :user do
        post '/authentication_tokens/create', to: "authentication_tokens#create"
      end
    end
  end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
