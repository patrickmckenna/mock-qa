Rails.application.routes.draw do
  root    'static_pages#home'
  get     'pull-requests'       => 'pull_requests#index'
  post    'hooks'               => 'pull_requests#process_hook'
end
