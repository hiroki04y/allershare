Rails.application.routes.draw do
  get '/' => "home#top"
  get '/signup' => "users#signup"
  
  
  get '/blog' => 'blog#blog'

  #ユーザ関連
  get '/login' => 'users#login'
  get '/users/index' => "users#index"
  get '/users/:id' => 'users#show'
  post '/users/create' => 'users#create'
  get 'users/:id/destroy' => "users#destroy"

  # チャット
  get '/chat' => "chat#chat"
end
