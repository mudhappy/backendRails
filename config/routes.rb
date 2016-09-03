Rails.application.routes.draw do
  
  devise_for :users, controllers:{
  	#http://localhost:3000/users/auth/facebook/callback
  	omniauth_callbacks: "users/omniauth_callbacks"
  }

  root 'main#home'

end