Rails.application.routes.draw do
  get 'lessons/new'
  devise_for :teachers, controllers: {registrations: 'teachers/registrations'}
  devise_for :students, controllers: {registrations: 'students/registrations'}
  root 'homes#index' 
  resources :homes, only: %i[index]
  resources :students, only: %i[show]
  resources :teachers, only: %i[show]
  resources :lessons, only: %i[new create]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
