Rails.application.routes.draw do
  resources :lectures do
    resources :tasks
  end
end
