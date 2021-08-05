Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: '/inbox' if Rails.env.development?
  devise_for :admins, controllers: { sessions: 'admins/sessions' }
  devise_for :students, controllers: { registrations: 'students/registrations', sessions: 'students/sessions' }
  # devise_for :teachers, controllers: { registrations: 'teachers/registrations', sessions: 'teachers/sessions' }
  devise_for :teachers, skip: 'registrations', controllers: { sessions: 'teachers/sessions' }
  devise_scope :teacher do
    get 'teachers/edit', to: 'teachers/registrations#edit', as: :edit_teacher_registration
    put 'teachers/(.:format)', to: 'teachers/registrations#update', as: :teacher_registration
  end
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
