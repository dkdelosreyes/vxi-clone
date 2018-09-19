Rails.application.routes.draw do
  
	root to: 'pages#home'
	
	get 'blog', to: 'pages#blog'
	get 'privacy-policy', to: 'pages#privacy'

	resources :blogs
end
