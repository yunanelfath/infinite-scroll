Rails.application.routes.draw do
  root 'adxs#index'
  get 'hotels', to: 'hotels#index'
  get 'feeds', to: 'feeds#index' #feed scroll view for js
end
