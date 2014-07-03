Rails.application.routes.draw do
  root 'site#index'

  get 'privacy' => 'site#privacy'
  get 'terms'   => 'site#terms'
  post 'profile' => 'profile#create' #if you come with POST request, go to create
  get 'profile' => 'profile#index' # if you come with GET request, go to index

end