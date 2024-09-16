# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

  resources :user do
    resources :courses
  end

  resources :courses do
    collection do
      get :all
    end
    resources :exams do
      get :post, on: :member
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'application#index'
  post '/courses/:course_id/exams/:exam_id&:question_id&:user_id', to: 'answers#new', as: 'answer'
end
