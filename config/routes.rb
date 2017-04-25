Rails.application.routes.draw do
  # devise_for :users, controllers: { sessions: 'users/sessions' }
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :jobs do
    resources :resumes
  end
  namespace :admin do
    resources :jobs do
      member do
        post :publish
        post :hide
      end
      resources :resumes do
        member do
          post :favorite
          post :unfavorite
        end
      end
    end
  end
  resources :categories
  get '/admin/resumes/favos/', to: 'admin/resumes#favos'
  root 'welcome#index'
end
