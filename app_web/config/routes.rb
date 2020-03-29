Rails.application.routes.draw do
  get 'location/show'
  get 'character/show'
  get 'episode/index'
  get '/episode/:id' => 'episode#show', as: 'episode_show'
  get '/character/:id' => 'character#show', as: 'character_show_info'
  get '/location/:id' => 'location#show', as: 'location_show_info'
  get 'search/show' => 'search#show', as: 'search_show_info'
  root 'episode#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
