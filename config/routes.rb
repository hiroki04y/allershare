Rails.application.routes.draw do
  root to: 'home#top'
  get '/use' => "home#use"
  get '/signup' => "users#signup"
  get '/report/:id' => "home#report"
  post '/addreport/:id' => "home#addreport"
  get '/addreport/:id' => "home#addreport"
  get '/test' => 'test#test'
  
  #ブログ関連
  get '/blog' => 'blog#blog'
  get 'blog_view/blog_new' => 'blog_view#blog_new'
  get 'blog/:id' => 'blog_view#blog_show'
  post 'blog_view/blog_create' => 'blog_view#blog_create'
  get 'blog_view/:id/blog_edit' => 'blog_view#blog_edit'
  post 'blog_view/:id/blog_update' => 'blog_view#blog_update'
  get 'blog_view/:id/blog_destroy' => 'blog_view#blog_destroy'
  get '/blog_view/:cat1' => 'blog_view#blog_view'
  post '/blog_view' => 'blog_view#blog_view'
  get '/blog_view' => 'blog_view#blog_view'
  get 'likes/:blog_id/create' => "likes#create"
  get 'likes/:blog_id/destroy' => "likes#destroy"

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
    resources :createchat2, only: :index, defaults: { format: :json }
  end
  

end
