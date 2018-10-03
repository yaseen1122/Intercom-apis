Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # root "contacts#index"
  resources :contacts
  resources :users
  resources :conversations do
  	resources :replies
	end

end
