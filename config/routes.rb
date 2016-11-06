Rails.application.routes.draw do

	root 'navigation#index'
	post 'student/attach_addhar', to: 'student#attach_addhar', as: 'attach_addhar'
	get 'student/authenticate', to: 'student#authenticate'
	post 'student/show', to: 'student#show'
	get 'student/:id', to: 'student#show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
