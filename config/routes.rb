Rails.application.routes.draw do
  get '/' => "home#top"
  get '/signup' => "users#signup"
  get '/show' => 'users#show'
  get '/login' => 'users#login'
  get '/blog' => 'users#blog'
end
