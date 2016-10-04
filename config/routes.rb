Rails.application.routes.draw do
  root 'sales#index'

  get 'screens', to: 'adxs#screen'
  get 'learn-more', to: 'adxs#learn_more'
  get 'sign-up', to: 'adxs#signup'
  get 'sign-in', to: 'adxs#signin'
  get 'detail', to: 'adxs#detail'
  get 'hotels', to: 'hotels#index'
  get 'feeds', to: 'feeds#index' #feed scroll view for js
end
