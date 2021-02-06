Rails.application.routes.draw do
  #root 'items#index'
  resources :items do
    get :upvote , on: :member 
  end

end
