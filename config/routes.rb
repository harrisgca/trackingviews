Trackingviews::Application.routes.draw do
  get "landings/index"
  root 'landings#index'
  resources :posts
end
