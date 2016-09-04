Rails.application.routes.draw do
  
  devise_for :users, controllers:{
  	#http://localhost:3000/users/auth/facebook/callback
  	omniauth_callbacks: "users/omniauth_callbacks"
  }

  post "/finish_sign_up", to: "users/omniauth_callbacks#finish_sign_up"

  root 'main#home'

end