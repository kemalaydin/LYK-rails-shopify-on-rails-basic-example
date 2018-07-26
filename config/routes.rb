Rails.application.routes.draw do
  root "products#index"
  resources :products do
    get 'gift/:id', to: "products#gift_send", as: "gift_send"
  end
end
