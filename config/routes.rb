Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root                  'application#index'
  get '/new'        =>  'application#new'
  get '/ask'        =>  'application#ask'
  get '/show'       =>  'application#show'
  get '/favorites'  =>  'application#favorites'
  get '/item/:item_id'      =>  'application#item'

end
