Vox::Application.routes.draw do
  resources :emitted_votes

  devise_for :users, :path_prefix => 'my'

  #paginas estaticas
  get "paginas/home" 
  get "paginas/about"
  get "paginas/contact" 

  #para prueba de stress
  if Rails.env.production?
    get ENV["loaderio"].to_s => 'paginas#loaderio'
  end

  unauthenticated do
    get "paginas/home" 
    get "paginas/about"
    get "paginas/contact"
  end

  authenticated do
    get "paginas/dashboard" => 'paginas#dashboard'
    
    get "paginas/user_dashboard"
    get 'paginas/user_dashboard/:id' => 'paginas#user_dashboard'

    get "paginas/admin_dashboard"
    get 'paginas/admin_dashboard/:id' => 'paginas#admin_dashboard' 

    get "paginas/jury_dashboard"
    get 'paginas/jury_dashboard/:id' => 'paginas#jury_dashboard' 
  end


  #scope "/admin" do
  resources :users
  #end

  #Resources, crea los routes a 7 acciones por defecto.
  resources :organizers
  resources :selection_processes
  resources :categories
  resources :candidates
  # Esos serian los ruteo de back-end, individuales.


  #Estos ruteos extra son para usar las asociaciones.
  resources :users do 
    resources :organizers #, only: [:show, :edit] no me da las rutas con esto puesto.
  end

  resources :organizers do
    resources :selection_processes
  end

  resources :selection_processes do
    resources :categories
  end

  resources :selection_processes do
    post '/voter_lists/new'  => 'voter_lists#search_voter', as: :voter_list_add_seach_voter
    post '/selection_processes/:selection_process_id/voter_lists/add_voter'  => 'voter_lists#add_voter', as: :add_voter
    post '/voter_lists/:id' => 'voter_lists#admission_voter', as: :admission_voter
    resources :voter_lists
    get 'voter/vote' => 'voter#vote', as: :vote

    
  end

  resources :ballots #Registrar votos! ojo

  resources :categories do
    resources :candidates
  end

  get '/selection_processes/:selection_process_id/candidates' => 'candidates#index', as: :selection_processes_candidates 
  get '/selection_processes/:selection_process_id/candidates/new' => 'candidates#new', as: :new_selection_processes_candidates 
  
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'
  root to: "paginas#home"
  
  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'
  #   get 'oganizers' => 'organizers#index'
  #   get 'organizers/new' => 'organizers#new' 
  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
