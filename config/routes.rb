Rails.application.routes.draw do
	# Redirect invalid routes to root in production
	# match '*path' => redirect('/'), via: [:get, :post] unless Rails.env.development?
  
  # Public paths
	root to: 'pages#home'
	get 'blogs', to: 'pages#blogs'
	get "blogs/:id", to: 'pages#blog'
	get 'privacy-policy', to: 'pages#privacy'
	get 'terms-conditions', to: 'pages#terms'
	get 'page', to: 'pages#page'
	post 'signup_vxi', to: 'applicants#signup_vxi'

	# Admin paths
	devise_for :users, path: 'admin', skip: :registrations
	get 'admin', to: 'admin/blogs#index'
	namespace :admin do
		resources :posts
		resources :users
		resources :blogs
		resources :statuses
		resources :locations
		resources :source_infos
		resources :experiences
		resources :educations
		resources :positions
	end
end
