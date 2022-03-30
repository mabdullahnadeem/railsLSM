# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

  resources :user do
    resources :courses
  end

  resources :courses do
    # get all_courses, on: :collection, :member
    resources :exams
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'application#index'
  post 'user/:student_id/courses/new', to: 'courses#create'
  get '/all_courses', to: 'courses#all_courses', as: 'all_courses'
  put '/user/:student_id/courses/:id', to: 'courses#update', as: 'new_student_enrollment'
  post '/courses/:course_id/exams/new', to: 'exams#create'
  post '/courses/:course_id/exams/:exam_id&:question_id&:user_id', to: 'answers#new', as: 'answer'
end
