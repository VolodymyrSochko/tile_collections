Rails.application.routes.draw do
  devise_for :admins,
             controllers: {
               sessions: 'admins/sessions'
             }
  resources :collections
end
