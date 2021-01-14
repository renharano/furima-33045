Rails.application.routes.draw do
<<<<<<< Updated upstream
  devise_for :users
  
  root to: "items#index"
  resources :items, only: :new
  
=======
>>>>>>> Stashed changes
end
