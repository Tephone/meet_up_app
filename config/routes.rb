Rails.application.routes.draw do
  devise_for :teachers, controllers: {registrations: 'teachers/registrations'}
  devise_for :students, controllers: {registrations: 'students/registrations'}
  root 'homes#index' 
  resources :homes, only: %i[index]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
