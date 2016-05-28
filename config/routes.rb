Rails.application.routes.draw do

  resources :players
  resources :sports
  resources :teams

  get 'welcome/index'
  get 'welcome/about'
  get 'welcome/contact'

  #root 'welcome#index'
  #I could have used the above code to declare the default page the app loads when I navigate to the home page URL
  #but for pratice, I use the code below which does the same.
  root({to: 'welcome#index'})
end
