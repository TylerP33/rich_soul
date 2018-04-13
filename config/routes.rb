Rails.application.routes.draw do
  resources :categories
  mount Ckeditor::Engine => '/ckeditor'
  root to: "posts#index"

  resources :posts, only: [:index, :edit, :new, :create, :show, :update, :destroy]
end
