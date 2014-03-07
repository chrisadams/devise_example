DeviseExample::Application.routes.draw do

  # Setup Devise routes, adn tell Devise to use our registration controller
  devise_for :users, :controllers => { :registrations => "registrations" } 

end
