Rails.application.routes.draw do
  devise_for :api_users, ::ActiveAdmin::Devise.config
  ::ActiveAdmin.routes(self)

  get 'v1/static_pages/map'

  # scope module: :v2, constraints: ApiVersion.new('v2') do

  # end
  
  scope module: :v1, constraints: ApiVersion.new('v1', true) do
  	resources :events
  	resources :locations
    resources :categories
    resources :tags
    resources :category_preferences
    resources :tag_preferences
    resources :strengths
  end

  post 'auth/login', to: 'v1/authentication#authenticate'
  post 'signup', to: 'v1/users#signup'
end
