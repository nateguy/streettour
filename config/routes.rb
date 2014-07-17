Rails.application.routes.draw do
  #update registration controller
  #devise_for :users, :controllers => { registration: 'registration' }
  devise_for :users, :controllers => { registrations: 'registrations' }
  root 'site#index'

  get 'privacy' => 'site#privacy'
  get 'terms'   => 'site#terms'
  get 'about'   => 'site#about'


  #post 'profile' => 'profile#create' #if you come with POST request, go to create
  #get 'profile' => 'profile#show' # if you come with GET request, go to index

  get 'guides' => 'guides#index' #show list of guides
  get 'guides/new' => 'guides#new'
  post 'guides/comment/:user_id' => 'guides#comment'
  get 'guides/:id' => 'guides#show'
#  get 'guides/location/:location' => 'guides#location'
  get 'guides/location/:location' => 'guides#locations'
  post 'guides' => 'guides#create'
  post 'guides/language' => 'guides#language'
  post 'guides/newlocation' => 'guides#newlocation'

end