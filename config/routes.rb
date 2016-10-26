Rails.application.routes.draw do
  root 'hotels#index'
  get 'feeds', to: 'feeds#index' #feed scroll view for js
end
