Rails.application.routes.draw do
  get '/' => "home#top"
  get '/signup' => "users#signup"
  
  
  get '/blog' => 'blog#blog'

  #ユーザ関連
  get '/login' => 'users#login_form'
  post "/login" => "users#login"
  get '/logout' => "users#logout"
  get '/users/index' => "users#index"
  get 'users/:id/edit' => "users#edit"
  get '/users/:id' => 'users#show'
  post '/users/create' => 'users#create'
  post '/users/:id/change' => 'users#change'
  get 'users/:id/destroy' => "users#destroy"

  # チャット
  get '/chat' => "chat#chat"
end
