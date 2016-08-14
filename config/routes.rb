Rails.application.routes.draw do
  root 'feeds#index'
  get 'feeds', to: 'feeds#index' #feed scroll view for js
end
