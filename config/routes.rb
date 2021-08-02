Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: '/inbox' if Rails.env.development?
  devise_for :teachers, controllers: {registrations: 'teachers/registrations'}
  devise_for :students, controllers: {registrations: 'students/registrations'}
  root 'homes#index' 
  resources :homes, only: %i[index]
  resources :students, only: %i[index show]
  resources :teachers, only: %i[show]
  resources :lessons, only: %i[new create]
  resources :lesson_resavations, only: %i[create destroy]
  resources :purchase_tickets, only: %i[new create]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
