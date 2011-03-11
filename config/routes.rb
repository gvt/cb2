Cb2::Application.routes.draw do
  root :to => "welcome#index"
  match ':controller(/:action(/:id))'
end
