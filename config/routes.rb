Rails.application.routes.draw do
  root 'messages#index'
  resources :messages do
    collection do
      get 'search'
    end
  end
end
