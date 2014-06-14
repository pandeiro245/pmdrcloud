Rails.application.routes.draw do
  resources :workloads
  resources :musics
  resources :tracks

  get '/:id' => 'musics#show'
  root 'welcome#index'
end
