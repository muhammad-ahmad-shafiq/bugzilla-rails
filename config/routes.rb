Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # root to: 'projects#index'

  namespace :api, constraints: { format: 'json' } do
    resources :projects
    resources :developers
  end
end
