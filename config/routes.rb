Rails.application.routes.draw do
  
  resources :statuses
  devise_for :users
	root to: 'pages#home'
	
	get 'blog', to: 'pages#blog'
	get 'privacy-policy', to: 'pages#privacy'

	resources :blogs
end
