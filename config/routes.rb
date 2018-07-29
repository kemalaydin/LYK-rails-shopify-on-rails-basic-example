Rails.application.routes.draw do
  devise_for :users
  root "products#index"
  
    ## multi lang desteği için 
    scope "/:locale" do
        resources :products do
            post 'gift/:id', to: "products#gift_send", as: "gift_send"
        end
    end

end
