Rails.application.routes.draw do
  resources :characters
  resources :books
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  post '/batch_get_characters_details', to: 'characters#characters_concurrently'
  post '/get_all_characters' , to: 'characters#get_all_characters'
  # Defines the root path route ("/")
  # root "articles#index"
end
