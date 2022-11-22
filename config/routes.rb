Rails.application.routes.draw do
  devise_for :admins, skip: [:registrations, :passwords], controllers: {
  sessions: "admin/sessions"
  }
   namespace :admin do
    devise_scope :admin do
      get '/sign_in' => 'sessions#new'
      post '/sign_in' => 'sessions#create'
      delete '/sign_out' => 'sessions#destroy'
    end  
    get '' => 'homes#top'
   end  
  
  
  devise_for :users, skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
  }
  root to: 'public/homes#top'
  get 'about' => 'public/homes#about', as: '/about'
  resources :customers, only: [:edit, :update, :show] do
    collection do
     get 'unsubscribe'
     patch 'withdraw'
    end
  end  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
