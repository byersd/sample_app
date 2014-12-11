Rails.application.routes.draw do

  root "application#hello"

  # get "static_pages/home"
  # get "static_pages/help"
  # get "static_pages/about"

  get "home"  => "static_pages#home"
  get "help"  => "static_pages#help"
  get "about" => "static_pages#about"

end
