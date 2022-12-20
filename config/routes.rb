Rails.application.routes.draw do
  get '/' => "home#top"
  get '/use' => "home#use"
  get '/top2' => "home#top2"
  get '/signup' => "users#signup"
  get '/test' => 'test#test'
  
  #ブログ関連
  get '/blog' => 'blog#blog'
  get '/blog_view' => 'blog_view#blog_view'
  get 'blog_view/blog_new' => 'blog_view#blog_new'
  get 'blog_view/:id' => 'blog_view#blog_show'
  post 'blog_view/blog_create' => 'blog_view#blog_create'
  get 'blog_view/:id/blog_edit' => 'blog_view#blog_edit'

  #ユーザ関連
  resources :users, only:[:edit, :update] do
    member do
      get :follows, :followers
    end
    resource :relationships, only: [:create]
    resource :deleterelationships, only: [:create]
  end
  get '/users/:user_id/relationships'=> 'relationship#create'
  get '/users/:user_id/deleterelationships' => 'relationship#destroy'

  get '/login' => 'users#login_form'
  post "/login" => "users#login"
  get '/logout' => "users#logout"
  get '/users/index' => "users#index"
  get 'users/:id/edit' => "users#edit"
  get '/users/:id' => 'users#show'
  post '/users/create' => 'users#create'
  post '/users/:id/change' => 'users#change'
  post '/users/:id/imagechange' => 'users#imagechange'
  post '/users/:id/passchange' => 'users#passchange'
  get 'users/:id/destroy' => "users#destroy"
  post 'users/:id/destroy' => "users#destroy"
  get 'follow' => "users#follow"
  post 'users/tagsnew' => "users#tagsnew"


  # チャット
  get '/chat' => "chat#chat"

  namespace :message do 
    resources :search, only: :index, defaults: { format: :json }
    resources :sendchat, only: :index, defaults: { format: :json }
    resources :createchat, only: :index, defaults: { format: :json }
  end

end
