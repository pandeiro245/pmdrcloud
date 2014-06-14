Rails.application.routes.draw do
  resources :workloads
  root 'welcome#index'
end
