Cb2::Application.routes.draw do
  resources :three_d_objects
  root :to => "welcome#index"
  match ':controller(/:action(/:id))'
end
