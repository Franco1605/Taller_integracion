Rails.application.routes.draw do
  get 'episode/index'
  get '/episode/:id' => 'episode#show', as: 'episode_show'
  root 'episode#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
