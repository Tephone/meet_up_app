Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: '/inbox' if Rails.env.development?
  devise_for :admins, controllers: {sessions: 'admins/sessions'}
  devise_for :teachers, controllers: {registrations: 'teachers/registrations', sessions: 'teachers/sessions'}
  devise_for :students, controllers: {registrations: 'students/registrations', sessions: 'students/sessions'}
  root 'tops#index' 
  resources :tops, only: %i[index]
  resources :student_homes, only: %i[index]
  resources :teacher_homes, only: %i[index]
  resources :students, only: %i[index show]
  resources :teachers
  resources :admins, only: %i[index] do
    member do
      get :login_as_teacher
    end
  end
  resources :lessons, only: %i[new create destroy]
  resources :lesson_resavations, only: %i[create destroy]
  resources :purchase_tickets, only: %i[new create]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
