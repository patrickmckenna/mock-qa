Rails.application.routes.draw do

  root 'static_pages#home'
  get 'pull-requests'   => 'pull_requests#show'

end
