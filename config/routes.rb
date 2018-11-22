Rails.application.routes.draw do
  devise_for :users, :controllers => {registrations:'registrations'}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


    resources :users do
      collection do
        get 'follow'
        post 'follow'
        get 'unfollow'
        post 'unfollow'
      end

      resources :plans do
        collection do
          get 'favorite'
          post 'favorite'
          get 'unfavorite'
          post 'unfavorite'
        end
        resources :comments
      end
  end

root "plans#index"

end