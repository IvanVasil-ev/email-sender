Rails.application.routes.draw do
  root "subscriptions#index"

  post '/', to: 'subscriptions#subscribe'
  post '/unsubscribe', to: 'subscriptions#unsubscribe'
  get 'congratulations/:token', to: 'subscriptions#congratulations'
  get 'unsubscribe/:token', to: 'subscriptions#cancel'
  get 'canceled/:token', to: 'subscriptions#canceled', as: 'canceled'
  get 'verification', to: 'subscriptions#verification'
end
