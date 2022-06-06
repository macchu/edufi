Rails.application.routes.draw do
  root 'page#index'
  resources :curriculums
  resources :students do
    get 'transfer'
  end
  resources :cohorts
  resources :teachers
  resources :schools do
    resources :enrollments
  end
end
