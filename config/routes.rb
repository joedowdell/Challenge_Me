Rails.application.routes.draw do
  devise_for :users
  resources :events do
  	resource :posts
    resource :pledges

    resources :posts do
      resource :comments
    end
  end

 root 'welcome#index'

end
