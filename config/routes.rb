Rails.application.routes.draw do
  devise_for :users, skip: [:sessions]
  as :user do
    get "login", to: "devise/sessions#new", as: :new_user_session
    post "login", to: "devise/sessions#create", as: :user_session
    delete "logout", to: "devise/sessions#destroy", as: :destroy_user_session
  end

  resources :channels, except:  [:show, :destroy] do
    resources :videos, controller: 'channels/videos'
  end
  as :channel do
    get "my_channel", to: "channels#show", as: :my_channel
  end

  namespace :discover do
    resources :videos, only: [:index, :show] do
      member do
        post "add_view", to: "videos#add_view", as: :add_video_view
      end
    end
  end

  root "channels#show"
end
