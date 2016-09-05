Rails.application.routes.draw do
  
  devise_for :users, controllers:{
  	#http://localhost:3000/users/auth/facebook/callback
  	omniauth_callbacks: "users/omniauth_callbacks"
  }

  post "/finish_sign_up", to: "users/omniauth_callbacks#finish_sign_up"

  authenticated :user do
  	root 'main#home'
  end

  unauthenticated :user do
  	root 'main#unregistered'
  end

end