Rails.application.routes.draw do

  root 'static_pages#home'
  get 'pull-requests'   => 'pull_requests#show'
  post 'pull-requests'  => 'pull_requests#create'
end
