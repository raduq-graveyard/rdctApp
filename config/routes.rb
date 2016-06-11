Rails.application.routes.draw do
  resources :filters
  get '/contacts/search/:filter_id' => 'contacts#search', as: :search
  resources :contacts
  root 'contacts#index'
end
