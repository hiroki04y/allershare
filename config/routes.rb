Rails.application.routes.draw do
  get '/' => "home#top"
  get '/signup' => "users#signup"
  get '/users/:id' => 'users#show'
  get '/login' => 'users#login'
  get '/blog' => 'blog#blog'
  post '/users/create' => 'users#create'
end
