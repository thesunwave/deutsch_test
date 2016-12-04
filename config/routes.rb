Rails.application.routes.draw do
  root 'main_page#index'

  get :search, to: 'main_page#search'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
