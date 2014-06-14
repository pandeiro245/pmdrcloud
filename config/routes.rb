Rails.application.routes.draw do
  resources :workloads
  get '/:id' => 'musics#show'
  root 'welcome#index'
end
