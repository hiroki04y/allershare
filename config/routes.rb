Rails.application.routes.draw do
  get '/' => "home#top"
  get '/signup' => "users#signup"
end
